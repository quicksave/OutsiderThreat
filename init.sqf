sleep 1;

pliers = [];
{
	if (typeOf _x == "Land_Pliers_F") then { 
		pliers = pliers + [_x];
	};
	
}foreach list trig1;
deletevehicle trig1;

(position (pliers select floor random count pliers)) execVM "stavros.sqf";