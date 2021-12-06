_unit = _this select 0;
_caller = _this select 1;
_action = _this select 2;

// "test_task" call BIS_fnc_taskSetCurrent;
hint "You are now travelling to Airport";
sleep 20;
TravelHeliD enableAI "MOVE";
// travel_selakano_airport setCurrentWaypoint [travel_selakano_airport, 1];
trigger_travel_selakano_airport setTriggerActivation ["WEST", "NOT PRESENT", true];
hint "Now traveling to selakano";
// playMusic "	Track_C_02";

// _unit removeAction _action;