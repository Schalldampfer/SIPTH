private ["_center","_radius","_positions"];
if (!isServer) exitWith {diag_log "Have fun!";};

_center = _this;
_radius = 400;

//Spawn veins and mass graves
_positions = selectBestPlaces [_center, _radius, "forest * 0.9 + meadow + trees - houses", 10, ST_numVeins];
{
	private ["_pos","_veh"];
	_pos = _x select 0;
	if (isOnRoad _pos) exitWith {};
	_veh = (ST_Veins call BIS_fnc_selectRandom) createVehicle _pos;
	_veh setDir round(random 360);
	_veh enableSimulation false;
	_veh setVariable ["ObjectID","1",true];
	_veh setVectorUp surfaceNormal _pos;
	//diag_log format ["[NaPTH]: Spawning a vein at %1",_pos];
} forEach _positions;

//Spawn graves with cross
_positions = selectBestPlaces [_center, _radius, "trees - (sea + houses)", 10, ST_numGraves];
{
	private ["_pos","_grave","_cross","_crossclass"];
	_pos = _x select 0;
	_grave = createVehicle ["Grave",_pos,[],0,"CAN_COLLIDE"];
	_grave setPos [(_pos select 0) + 1, _pos select 1];
	_grave setVariable ["ObjectID","1",true];
	_grave enableSimulation false;
	_crossclass = ST_Graves call BIS_fnc_selectRandom;
	_cross = createVehicle [_crossclass,_pos,[],0,"CAN_COLLIDE"];
	_cross setPos [(_pos select 0) + 1, (_pos select 1) - 1.2];
	_cross setVariable ["ObjectID","1",true];
	_cross enableSimulation false;
	//diag_log format ["[NaPTH]: Spawning a grave at %1",_pos];
} forEach _positions;
