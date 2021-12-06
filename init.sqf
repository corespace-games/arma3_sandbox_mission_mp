// [] spawn {
//   if (!hasInterface) exitWith {};
//   waitUntil {!isNull player};
//   while {true} do {
//     {
//       _x setVariable ["addedAction",true];
//       _x setVariable ["oldGrp",if (group _x == group player) then [{grpNull},{group _x}]];
//       _x addAction [if (group player isEqualTo group _x) then [{"Leave my squad"},{"Join my squad"}], {
//         params ["_unit","_player","_id"];
//         _ActMenu = (_unit actionParams _id) select 0;
//          _unit setUserActionText [_id,_ActMenu];
//         if (_ActMenu isEqualTo "Join my squad") then {
//           _ActMenu = "Leave my squad";
//           [_unit] join group _player;
//         } else {
//           _ActMenu = "Join my squad";
//           [_unit] join (_unit getVariable ["oldGrp",grpNull]);
//         };
//         _unit setUserActionText [_id,_ActMenu];
//       },nil,0.8,false,true,"side _this isEqualTo side _target"];
//     } forEach (allunits select { !(_x getVariable ["addedAction",false]) && !isPlayer _x});
//     sleep 2;
//   };
// };

[] spawn {
  if (!hasInterface) exitWith {};
  waitUntil {!isNull player};
  while {true} do {
    {
      _x setVariable ["addedAction",true];
      _x setVariable ["oldGrp",if (group _x == group player) then [{grpNull},{group _x}]];
      _x addAction [if (group player isEqualTo group _x) then [{"Leave my squad"},{"Join my squad"}], {
        params ["_unit","_player","_id"];
        _ActMenu = (_unit actionParams _id) select 0;
         _unit setUserActionText [_id,_ActMenu];
        if (_ActMenu isEqualTo "Join my squad") then {
          _ActMenu = "Leave my squad";
          [_unit] join group _player;
        } else {
          _ActMenu = "Join my squad";
          [_unit] join (_unit getVariable ["oldGrp",grpNull]);
        };
        _unit setUserActionText [_id,_ActMenu];
      },nil,0.8,false,true,"west isEqualTo side _target"];
    } forEach (allunits select { !(_x getVariable ["addedAction",false]) && !isPlayer _x});
    sleep 2;
  };
};