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

_wp_selakano = TravelHeli addWaypoint [[20757,7242.43,30.9067], 0];
_wp_selakano setWaypointType "MOVE";
_wp_selakano setWaypointSpeed "FULL";
_wp_selakano setWaypointStatements ["true", "travel_heli LAND 'LAND'; travel_heliD sideChat 'Arrived at Selakano'; _lockedTravel = false;"];

travel_heliD sideRadio "messageOne";
travel_heliD sideChat "Start moving to Selackano";

waitUntil {!isEngineOn travel_heli};

travel_heliD sideRadio "messageOne";
deleteWaypoint [TravelHeli, 0];

waitUntil {_lockedTravel};
travel_heli addAction ["Travel: to Selakano", "travel\selakano.sqf", name player];
// _trg_selakano synchronizeWaypoint [_wp_selakano];
// _trg_selakano synchronizeTrigger [_wp_selakano];