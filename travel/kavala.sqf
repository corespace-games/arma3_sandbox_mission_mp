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

_wp_kavala = TravelHeli addWaypoint [[3595.96,13074.9,100.0], 0];
_wp_kavala setWaypointType "MOVE";
_wp_kavala setWaypointSpeed "FULL";
_wp_kavala setWaypointStatements ["true", "travel_heli LAND 'LAND'; travel_heliD sideChat 'Arrived at Kavala'; _lockedTravel = false;"];

travel_heliD sideRadio "messageOne";
travel_heliD sideChat "Start moving to Kavala";

// [TravelHeli, 1] setWaypointStatements ["true", "travel_heliD sideChat 'Arrived at Kavala';"];
waitUntil {!isEngineOn travel_heli};

travel_heliD sideRadio "messageOne";
deleteWaypoint [TravelHeli, 0];

waitUntil {_lockedTravel};
travel_heli addAction ["Travel: to Kavala", "travel\kavala.sqf", name player];
// _trg_selakano synchronizeWaypoint [_wp_selakano];
// _trg_selakano synchronizeTrigger [_wp_selakano];