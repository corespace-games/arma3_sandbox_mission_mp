params["_player"];

_uid = getPlayerUID player;

if (_uid in AdminList) exitWith { true };
false