waitUntil {!(isNil "AdminList")};
_isAdmin = player call pAx_fnc_isAdmin;

if (_isAdmin) then {
	
	// player addAction ["Admin Menu", "pAx_fnc_openMenu"];
	waitUntil {!(isNull (findDisplay 46))};

	(findDisplay 46) displayAddEventHandler ["KeyDown", {
		// _keyDD = (_this select 1);
		// hint format ["%1", _keyDD];
		switch (_this select 1) do {
			case 53: {
				[player] spawn pAx_fnc_openMenu;
			};
		};
		false
	}];

};