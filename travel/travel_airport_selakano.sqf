_unit = _this select 0;
_caller = _this select 1;
_action = _this select 2;

// "test_task" call BIS_fnc_taskSetCurrent;
hint "You are now travelling to selakano";
sleep 20;
TravelHeliD enableAI "MOVE";
// travel_selakano_airport setCurrentWaypoint [travel_selakano_airport, 3];
trigger_travel_airport_selakano setTriggerActivation ["WEST", "NOT PRESENT", true];
hint "Now traveling to selakano";
// playMusic "Track_C_01";

// _unit removeAction _action;