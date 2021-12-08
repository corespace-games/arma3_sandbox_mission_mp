_travelHeli = travel_heli;

_index = _this select 2;
_travelHeli removeAction _index;

travel_heliD enableAI "MOVE";
travel_heli engineOn true;

// _trg_selakano = createTrigger ["EmptyDetector", getPos selakano_helipad];
// _trg_selakano setTriggerStatements ["this", "hint 'test';"];

_wp_airport = TravelHeli addWaypoint [[14739.5,16809.3,30.5], 0];
_wp_airport setWaypointType "MOVE";
_wp_airport setWaypointSpeed "FULL";
_wp_airport setWaypointStatements ["true", "travel_heli land 'LAND';"];

travel_heliD sideRadio "messageOne";
travel_heliD sideChat "Start moving to Airport";

waitUntil {!isEngineOn travel_heli};

travel_heliD sideRadio "messageOne";
travel_heliD sideChat "Arrived at Airport";
deleteWaypoint [TravelHeli, 0];

travel_heli addAction ["Travel: to Airport", "travel\airport.sqf", name player];
// _trg_selakano synchronizeWaypoint [_wp_selakano];
// _trg_selakano synchronizeTrigger [_wp_selakano];