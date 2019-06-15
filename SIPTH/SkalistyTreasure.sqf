private ["_positions","_num","_Monitor","_fCrate","_area","_dots"];
if (!isServer) exitWith {diag_log "Have fun!";};

//wait
sleep ST_waitTime;

//
//Create crate somewhere
//

//Monitor: add marker light and announce
_Monitor = {
	private ["_crate","_visited","_light","_marker","_pos"];
	_crate = _this;
	_visited = false;
	_pos = getPos _crate;

	//wait for players getting close
	while {!_visited} do {
		sleep 10;
		{
			if((isPlayer _x) && (_x distance _crate <= 25)) then {_visited = true;};
		} forEach playableUnits;
	};

	//Add sign
	if (ST_Light) then {
		_light = ST_Light_type createVehicle _pos;
		_light setVehiclePosition [(_crate modelToWorld [0,0,0]), [], 0];
		_light attachTo [_crate,[0,0,0],""];
	};

	//wait for players to clear
	while {_visited} do {
		sleep 1;
		{
			if((isPlayer _x) && (_x distance _crate <= 3)) then {
				_visited = false;
				diag_log format["[SIPTH]: %1 has cleard crate at %2",name _x,mapGridPosition _crate];
			};
		} forEach playableUnits;
	};

	//remove marker
	if (ST_Light) then {
		deleteVehicle _light;
	};
	_crate spawn {sleep ST_deleteTime;deleteVehicle _this;};
	ST_count = ST_count + 1;

	if (ST_radio) then {
		RemoteMessage = ["radio","Someone has found one of the treasures!"];
		publicVariable "RemoteMessage";
	};

	while {ST_clear_marker} do {
		_marker = createMarker [format ["visitMarker_%1", floor((_pos select 0)*(_pos select 1))], _pos];
		_marker setMarkerShape "ICON";
		_marker setMarkerType "hd_end";
		_marker setMarkerColor "ColorBlack";
		_marker setMarkerAlpha 1;
		_marker setMarkerText "Clear";
		_marker setMarkerSize [1, 1];
		sleep 100;
		deleteMarker _marker;
	};
};

//Fill crate
_fCrate = {
	private ["_sCount","_sSelect","_item","_ammo"];
	clearWeaponCargoGlobal _this;
	clearMagazineCargoGlobal _this;

	//load weapons
	_sCount = count ST_Weapons;
	for "_x" from 0 to ST_numWeapons do {
		_sSelect = floor(random _sCount);
		_item = ST_Weapons select _sSelect;
		_this addWeaponCargoGlobal [_item,1];
		_ammo = [] + getArray (configFile >> "cfgWeapons" >> _item >> "magazines");
		if (count _ammo > 0) then {
			_this addMagazineCargoGlobal [(_ammo select 0),(round(random 4))];
		};
	};

	//load items
	_sCount = count ST_Items;
	for "_x" from 0 to ST_numItems do {
		_sSelect = floor(random _sCount);
		_item = ST_Items select _sSelect;
		_this addMagazineCargoGlobal [_item,1];
	};

	//load a gem
	if (ST_addGem) then {
		_this addMagazineCargoGlobal [(ST_Gems call BIS_fnc_selectRandom),1];
	};

	diag_log format["[SIPTH]: Created Crate at %1 on Skalisty Island",mapGridPosition _this];
};

//Start

//Message
if (ST_radio) then {
	RemoteMessage = ["radio","Pirates have buried their treasures in the island! Time to search for it!"];
	publicVariable "RemoteMessage";
};

//Spawn crates
_num = ST_numCrate; //MAX NUMBER OF CRATES
ST_count = 0;
_positions = selectBestPlaces [[13578.3, 3105.64, 0], 700, "forest * 0.9 + meadow", 10, _num];
{
	private ["_crate","_objectID"];
	diag_log "[SIPTH]: Spawning a crate";

	//Spawn crate
	_crate = createVehicle [ST_crate_Type, (_x select 0), [], 0, "NONE"];
	_crate setDir (random 360);
	_crate setVectorUp surfaceNormal position _crate;
	_crate enableSimulation false;

	//Save crate
	_objectID = str(round(random 999999));
	_crate setVariable ["ObjectID", _objectID, true];
	_crate setVariable ["ObjectUID", _objectID, true];
	_crate setVariable ["permaLoot",true];
	_crate allowDammage false;
	_crate addEventHandler ["HandleDamage",{false}];

	//Add rewards
	_crate call _fCrate;

	//Spawn monitor
	_crate spawn _Monitor;
} forEach _positions;

//Spawn marker
while {ST_marker_island && (ST_count < _num)} do {
	_area = createMarker ["SkalistyCrate", [13578.3, 3105.64]];
	_area setMarkerColor "ColorBlue";
	_area setMarkerShape "RECTANGLE";
	_area setMarkerBrush "Horizontal";
	_area setMarkerSize [650, 450];
	_dots = createMarker ["SkalistyCrate_dot", [13578.3, 3105.64]];
	_dots setMarkerText ST_marker_title;
	_dots setMarkerType "hd_dot";
	_dots setMarkerColor "ColorBlack";
	sleep 100;
	deleteMarker _area;
	deleteMarker _dots;
};

while {!ST_marker_island && (ST_count < _num)} do { sleep 100; };

//Message
if (ST_radio) then {
	RemoteMessage = ["radio","All treasures are found!"];
	publicVariable "RemoteMessage";
};
diag_log "[SIPTH]: All crates are found";

ST_clear_marker = false;
