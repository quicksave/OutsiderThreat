//(position start) execVM "stavros.sqf";
//[(position start),"stavros.sqf",true,false,true] call BIS_fnc_MP;

sleep 1;

logics = list trig1;
deletevehicle trig1;
(position (logics select floor random count logics)) execVM "stavros.sqf";