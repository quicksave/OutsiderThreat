setterraingrid 50;
(_this select 0) allowdamage true;

if (_this select 1) then {
	[[[(_this select 0), startDir, startPos],{
		(_this select 0) setDir (_this select 1);
		(_this select 0) setPos (_this select 2);
	}], "BIS_fnc_call", (_this select 0)] call BIS_fnc_MP;

	[[(format["%1 JIP'd", name (_this select 0)])],"systemchat", true] call BIS_fnc_MP;
};
