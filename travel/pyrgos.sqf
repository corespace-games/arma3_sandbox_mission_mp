_travelHeli = travel_heli;

_index = _this select 2;
_travelHeli removeAction _index;
_lockedTravel = true;

travel_heliD enableAI "ALL";
travel_heli engineOn true;

for "_i" from count waypoints TravelHeli - 1 to 0 step -1 do
{
	deleteWaypoint [TravelHeli, _i];
};

_wp_pyrgos = TravelHeli addWaypoint [[16577.9,12730,35.0], 0];
_wp_pyrgos setWaypointType "MOVE";
_wp_pyrgos setWaypointSpeed "FULL";
_wp_pyrgos setWaypointStatements ["true", "travel_heli LAND 'LAND'; travel_heliD sideChat 'Arrived at Pyrgos'; _lockedTravel = false;"];

travel_heliD sideRadio "messageOne";
travel_heliD sideChat "Start moving to Pyrgos";

waitUntil {!isEngineOn travel_heli};
travel_heliD disableAI "ALL";

travel_heliD sideRadio "Refueling...";
sleep 5;
_travelHeli setFuel 1;
travel_heliD sideRadio "Refueling completed";

travel_heliD sideRadio "messageOne";
deleteWaypoint [TravelHeli, 0];

waitUntil {_lockedTravel};
travel_heli addAction ["Travel: to Pyrgos", "travel\pyrgos.sqf", name player];