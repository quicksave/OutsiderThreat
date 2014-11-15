/*
STAVROS DOCUMENTS MOSCOW FILE RIPOFF

Create Land_Pliers_F objects near any buildings you want to be eligible as an objective site
Place an ANY trigger with a radius large enough to include all the Land_Pliers_F objects, name it trig1
Put the following lines in init.sqf, the sleep isn't needed if you already have one

sleep 1;
pliers = [];
{
	if (typeOf _x == "Land_Pliers_F") then {pliers = pliers + [_x];};	
}foreach list trig1;
deletevehicle trig1;
(position (pliers select floor random count pliers)) execVM "stavros.sqf";

Ensure all BLUFOR are grouped with the blueman unit

Not tracking unit that performed the addaction, their survival/escape isn't required. 
don't want to do it but i guess i will. the mpkilled EH with addaction will be placed on whoever used it last.
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
_group1= createGroup east; _group2 = createGroup east; _group3 = createGroup east;

groupblue = createGroup west;
unitsblue join groupblue;
waitUntil{!isNull player};

openmap true;
mapAnimAdd [0, .04, getMarkerPos "Targetarea"];
mapAnimCommit;

task1 = player createSimpleTask ["SecureIntel"];
task1 setSimpleTaskDescription ["Kill courier and take his shit.", "Find the intel", "Target area"];
player setCurrentTask task1;

_group1= [_spawnPos , east, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup;
_null = _group1 setCombatMode "RED";
{_x allowFleeing 0} forEach units _group1;
[_group1,position nearestBuilding _this,50, 2, true] call CBA_fnc_taskDefend; //Switch to BIS to remove CBA requirement.

_group2= [_spawnPos, east, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
_null = _group2 setSpeedMode "LIMITED";
_null = _group2 setFormation "STAG COLUMN";
_null = _group2 setBehaviour "SAFE";
[_group2,position nearestBuilding _this,200] call CBA_fnc_taskPatrol;

"O_officer_F" createUnit [_spawnPos, _group3, "ron = this; this allowFleeing 0;", 0.5, "PRIVATE"];
"O_Soldier_lite_F" createUnit [_spawnPos, _group3, "this allowFleeing 0;", 0.5, "PRIVATE"];
[_group3,position nearestBuilding _this,5, 2, false] call CBA_fnc_taskDefend;

if (isServer) then {
	ron addMPEventHandler
	["MPKilled", {
		[_this select 0] spawn {
			sleep 5;
			docs = createMarker["Targetpin", position (_this select 0)];
			docs setMarkerSize [3, 3];
			docs setMarkerShape "ELLIPSE";
			docs setMarkerBrush "SolidBorder";
			docs setMarkerColor "ColorRed";
			docs setMarkerAlpha .8;
		};
		_this select 0 addAction 
		["Upload Intel", {
			[[[getPos ron],{
				task1 setTaskState "Succeeded";
				task2 = player createSimpleTask ["Escape"];
				task2 setSimpleTaskDescription ["Leave the area.", "Exfiltrate", "Target area"];
				player setCurrentTask task2;
				["TaskSucceeded",["OBJECTIVE COMPLETE","Intel Uploaded<br/>now git out"]] call bis_fnc_showNotification;

				endtrg = createTrigger ["EmptyDetector", _this select 0];	// use trigger array to count units in groupblue and detect escape for mission end
				endtrg setTriggerArea [205, 205, 0, false];
				endtrg setTriggerActivation ["ANY","PRESENT",false];	// agm incap'd units don't count as dead, but aren't detected by a WEST trigger
				endtrg setTriggerStatements ["this", "", ""];
				
				waitUntil{sleep 5; ({group _x == groupblue}count list endtrg) < 1}; // no living units in groupblue are within 200m of ron's body, mission will end

				if (count (groupblue call CBA_fnc_getAlive) > 0) then {
					[[[],{["END1", true, true] call BIS_fnc_endMission;task2 setTaskState "Succeeded";}], "BIS_fnc_spawn", true, false, false] spawn BIS_fnc_MP;
				
				} else {
					[[[],{["LOSER", false, true] call BIS_fnc_endMission;}], "BIS_fnc_spawn", true, false, false] spawn BIS_fnc_MP;
				};

			}], "BIS_fnc_spawn", false, false, false] spawn BIS_fnc_MP;

			[[[ron],{
				ron removeAction 0; 
				ron removeAllMPEventHandlers "MPKilled";
			}], "BIS_fnc_spawn", true, false, false] spawn BIS_fnc_MP;
		}, nil, 5, false, true,"","((_target distance _this) < 2)"];
	}];
};


//-	teleport groupblue to a 'safe' position approx 600m away from the enemy spawn position in a random direction; copied from Moscow File Blue, slightly modified:
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

[[[_startPos, _startDir, groupblue],{ 
	_pos = (_this select 0);

	{
		_x setDir (_this select 1);
		_x setPos _pos;
		_pos = [(_pos select 0) + 2,(_pos select 1)];
	} forEach units (_this select 2);

}], "BIS_fnc_spawn", true, false, true] spawn BIS_fnc_MP;
