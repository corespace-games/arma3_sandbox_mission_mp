_unit = _this select 0;
_caller = _this select 1;
_action = _this select 2;


_group = creategroup [east, true];
_group setGroupId ["deathangels"];
_unit1 = "O_Soldier_SL_F" createUnit [[14434,17602.8,0], _group];
_unit2 = "O_Soldier_F" createUnit [[14427.4,17597.7,0], _group];
_unit3 = "O_Soldier_F" createUnit [[14430.5,17630.1,0], _group];
_unit4 = "O_Soldier_F" createUnit [[14434.6,17645.3,-0.000125885], _group];
_unit5 = "O_Soldier_F" createUnit [[14435.9,17620.9,3.70833], _group];
_unit6 = "O_Soldier_F" createUnit [[14436.7,17623.5,0.340532], _group];
_unit7 = "O_Soldier_F" createUnit [[14430.5,17618.1,0], _group];
_unit8 = "O_Soldier_F" createUnit [[14460.5,17629.1,0.172995], _group];
_unit9 = "O_Soldier_F" createUnit [[14468.8,17615,0], _group];
_unit10 = "O_Soldier_F" createUnit [[14404,17612.4,3.545], _group];
_unit10 = "O_Soldier_F" createUnit [[14427.4,17597.7,0], _group];

if (isServer) then
{	
	_missionComplete = createTrigger ["trigger_complete_kill_squad_deathangel", [14442.3,17604.7,0], false];
	_missionComplete setTriggerActivation ["ANYPLAYER", "PRESENT", true];
	// _missionComplete setTriggerArea [5, 25, getDir this, true];
	_missionComplete setTriggerStatements 
	[
		"{alive _x} count units deathangels == 0;", 
		"hint 'Mission completed';evac_heliD enableAI 'MOVE';evac_heli setVehicleLock 'UNLOCKED';", 
		""
	];
	_missionComplete synchronizeObjectsAdd [complete_task_kill_squad_deathangels]
} else {
	hint "no server";
};
// "test_task" call BIS_fnc_taskSetCurrent;
trigger_start_task_kill_squad_deathangels setTriggerActivation ["WEST", "NOT PRESENT", true];
// ["deathangels_sharpshooter", "deathangels_sharpshooter_marker"] execVM "scripts\createUnitDanger.sqf";
// _unit removeAction _action;