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

_wp_kavala = TravelHeli addWaypoint [[3595.96,13074.9,100.0], 0];
_wp_kavala setWaypointType "MOVE";
_wp_kavala setWaypointSpeed "FULL";
_wp_kavala setWaypointStatements ["true", "travel_heli LAND 'LAND'; travel_heliD sideChat 'Arrived at Kavala'; _lockedTravel = false;"];

travel_heliD sideRadio "messageOne";
travel_heliD sideChat "Start moving to Kavala";

waitUntil {!isEngineOn travel_heli};
travel_heliD disableAI "ALL";

travel_heliD sideRadio "Refueling...";
sleep 5;
_travelHeli setFuel 1;
travel_heliD sideRadio "Refueling completed";

travel_heliD sideRadio "messageOne";
deleteWaypoint [TravelHeli, 0];

waitUntil {_lockedTravel};
travel_heli addAction ["Travel: to Kavala", "travel\kavala.sqf", name player];