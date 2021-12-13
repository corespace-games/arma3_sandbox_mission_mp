_unit = _this select 0;
_markerName = _this select 1;

// hint (getPosVisual _unit);
// hint _markerName;

_unitPos = getPos _unit;
_liveMarker = createMarker [_markerName, _unitPos];
_liveMarker setMarkerShape "ELLIPSE";
_liveMarker setMarkerColor "RED";
_liveMarker setMarkerBrush "SOLID";
_liveMarker setMarkerSize [20, 20, 20];
// while {sleep 5; alive _unit} do {
// 	_liveMarker setMarkerPos (getPosVisual _unit);
// };

// if (!alive _unit) then {
// 	deleteMarker _liveMarker;
// };