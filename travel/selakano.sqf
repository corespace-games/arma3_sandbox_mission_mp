_travelHeli = travel_heli;

travel_heliD enableAI "MOVE";
travel_heli engineOn true;

// _trg_selakano = createTrigger ["EmptyDetector", getPos selakano_helipad];
// _trg_selakano setTriggerStatements ["this", "hint 'test';"];

_wp_selakano = TravelHeli addWaypoint [[20757,7242.43,30.9067], 0];
_wp_selakano setWaypointType "MOVE";
_wp_selakano setWaypointSpeed "FULL";
_wp_selakano setWaypointStatements ["true", "travel_heli LAND 'LAND';"];

travel_heliD sideRadio "messageOne";
travel_heliD sideChat "Start moving to Selackano";

waitUntil {!isEngineOn travel_heli};

travel_heliD sideRadio "messageOne";
travel_heliD sideChat "Arrived at Selackano";
deleteWaypoint [TravelHeli, 0];
// _trg_selakano synchronizeWaypoint [_wp_selakano];
// _trg_selakano synchronizeTrigger [_wp_selakano];