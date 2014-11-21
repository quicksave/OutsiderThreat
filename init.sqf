execVM "briefing.sqf";
sleep 1;

pliers = [];
unitsblue = [];
{
	if (typeOf _x == "Land_Pliers_F") then { 
		pliers = pliers + [_x];
	};
	if (side _x == west) then { 
		unitsblue = unitsblue + [_x];
	};	
}foreach list trig1;
deletevehicle trig1;

(position (pliers select floor random count pliers)) execVM "stavros.sqf";