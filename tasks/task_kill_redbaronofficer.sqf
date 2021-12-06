_unit = _this select 0;
_caller = _this select 1;
_action = _this select 2;

// "test_task" call BIS_fnc_taskSetCurrent;
trigger_start_task_kill_redbaron_officer setTriggerActivation ["WEST", "NOT PRESENT", true];

_unit removeAction _action;