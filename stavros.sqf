/*
STAVROS DOCUMENTS MOSCOW FILE RIPOFF

Create default blufor units if any quantity
Place Land_Pliers_F objects near any buildings you want to be eligible as an objective site
Add an ANY trigger with a radius large enough to include all the Land_Pliers_F objects, name it trig1

Not tracking unit that performed the addaction, their survival/escape isn't required atm
*/

enableSaving [false, false];
enableSentences false;

_spawnPos = [position nearestBuilding _this, 0, 50, 1, 0, 1, 0] call BIS_fnc_findSafePos;
_target = createMarker["Targetarea", position nearestBuilding _this];
_target setMarkerSize [200, 200];
_target setMarkerShape "ELLIPSE";
_target setMarkerBrush "Border";
_target setMarkerColor "ColorRed";
_target setMarkerAlpha 1;

_side = createCenter east;
_bluforside = createCenter west;

waitUntil{!isNull player};

openmap true;
mapAnimAdd [0, .04, getMarkerPos "Targetarea"];
mapAnimCommit;

task1 = player createSimpleTask ["SecureIntel"];
task1 setSimpleTaskDescription ["Kill courier and take his shit.", "Find the intel", "Target area"];
player setCurrentTask task1;

#include "OPFOR4.sqf"


//-	teleport unitsblue to a 'safe' position approx 600m away from the enemy spawn position in a random direction; copied from Moscow File Blue, slightly modified:
_safe = false;
_startDir = 0;
_startPos = _spawnPos;
while {!_safe} do
{
	_startDistance = 575 + random 50;
	_startDir = random 360;
	_startPos = [(_spawnPos select 0) + _startDistance * (sin (_startDir + 180)),(_spawnPos select 1) + _startdistance * (cos (_startDir + 180))];
	_startPos = [_startPos, 0, 50, 1, 0, 1, 0, [], [[1,1,1],[1,1,1]]] call BIS_fnc_findSafePos;

	if ((_startPos select 0) != 1) then
	{
		_safe=true;
	};	
};

[[[_startPos, _startDir, unitsblue],{ 
	_pos = (_this select 0);

	{
		_x setDir (_this select 1);
		_x setPos _pos;
		_pos = [(_pos select 0) + 2,(_pos select 1)];
	} forEach (_this select 2);

}], "BIS_fnc_spawn", true, false, true] spawn BIS_fnc_MP;

waituntil (sleep 5; !alive ron);

["TaskSucceeded",["OBJECTIVE COMPLETE","waituntil<br/>hells yes"]] call bis_fnc_showNotification;
docs = createMarker["Targetpin", position (ron)];
docs setMarkerSize [3, 3];
docs setMarkerShape "ELLIPSE";
docs setMarkerBrush "SolidBorder";
docs setMarkerColor "ColorRed";
docs setMarkerAlpha .8;

ron addAction ["Upload Intel", {
	[[[],{
		endtrg = createTrigger ["EmptyDetector", position ron];	// use trigger array to count blufor units for determining escape
		endtrg setTriggerArea [205, 205, 0, false];
		endtrg setTriggerActivation ["ANY","PRESENT",false];	// agm incap'd units don't count as dead, but aren't detected by a WEST trigger
		endtrg setTriggerStatements ["this", "", ""];
	
		waitUntil{sleep 3; ({_x in unitsblue}count list endtrg) < 1}; // no living units in west are within 200m of ron's body, mission will end
		if (count (unitsblue call CBA_fnc_getAlive) > 0) then {
			["END1", true, true] call BIS_fnc_endMission;
			task2 setTaskState "Succeeded";
		} else {
			["LOSER", false, true] call BIS_fnc_endMission;
		};
	}], "BIS_fnc_spawn", false] spawn BIS_fnc_MP;
	[[[],{
		task1 setTaskState "Succeeded";
		task2 = player createSimpleTask ["Escape"];
		task2 setSimpleTaskDescription ["Leave the area.", "Exfiltrate", "Target area"];
		player setCurrentTask task2;
		["TaskSucceeded",["OBJECTIVE COMPLETE","Intel Uploaded<br/>now git out"]] call bis_fnc_showNotification;
		ron removeAction 0;
	}], "BIS_fnc_spawn", true] spawn BIS_fnc_MP;
}, nil, 5, false, true,"","((_target distance _this) < 2)"];
