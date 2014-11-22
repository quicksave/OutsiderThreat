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

ran = -1;
if (isserver) then {
	ran = floor random count pliers;
	waituntil{ran > -1};
	publicvariable "ran";
};

waituntil{ran > -1};
(position (pliers select ran)) execVM "stavros.sqf";