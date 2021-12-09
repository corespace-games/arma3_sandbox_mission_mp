_travelHeli = travel_heli;

_index = _this select 2;
_travelHeli removeAction _index;
_lockedTravel = true;

travel_heliD enableAI "MOVE";
travel_heli engineOn true;

for "_i" from count waypoints TravelHeli - 1 to 0 step -1 do
{
	deleteWaypoint [TravelHeli, _i];
};

// _trg_selakano = createTrigger ["EmptyDetector", getPos selakano_helipad];
// _trg_selakano setTriggerStatements ["this", "hint 'test';"];

_wp_pyrgos = TravelHeli addWaypoint [[16577.9,12730,35.0], 0];
_wp_pyrgos setWaypointType "MOVE";
_wp_pyrgos setWaypointSpeed "FULL";
_wp_pyrgos setWaypointStatements ["true", "travel_heli LAND 'LAND'; travel_heliD sideChat 'Arrived at Pyrgos'; _lockedTravel = false;"];

travel_heliD sideRadio "messageOne";
travel_heliD sideChat "Start moving to Pyrgos";

waitUntil {!isEngineOn travel_heli};

travel_heliD sideRadio "messageOne";
deleteWaypoint [TravelHeli, 0];

waitUntil {_lockedTravel};
travel_heli addAction ["Travel: to Pyrgos", "travel\pyrgos.sqf", name player];
// _trg_selakano synchronizeWaypoint [_wp_selakano];
// _trg_selakano synchronizeTrigger [_wp_selakano];