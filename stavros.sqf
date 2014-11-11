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

Ensure all BLUFOR are grouped with the player unit
*/

enableSaving [false, false];
enableSentences false;

_spawnPos = position nearestBuilding _this;
_target = createMarker["Target", _spawnPos];
_target setMarkerType "mil_destroy";
_target setMarkerShape "ICON";
_target setMarkerColor "ColorRed";

_side = createCenter east;
_bluforside = createCenter west;
_group1= createGroup east; _group2 = createGroup east; _group3 = createGroup east;
_groupblue = createGroup west;
waitUntil{!isNull player};
units group player join _groupblue;

_group1= [_spawnPos , east, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup;
_null = _group1 setCombatMode "RED";
{_x allowFleeing 0} forEach units _group1;
[_group1,_spawnPos,30, 2, true] call CBA_fnc_taskDefend; //Switch to BIS to remove CBA requirement.

ron = "O_officer_F" createUnit [_spawnPos, _group3, "", 0.5, "PRIVATE"];

_endtrig = []; //needs to be defined before mission end waitUntil
if (isServer) then {
	_null = ron addMPEventHandler // arma keeps telling me ron is undefined here
	["MPKilled", {
		_null = _this addAction 
		["Take Documents", {	hint "taken";
			[[[(getPos _this)],{
			
				_endtrg = createTrigger ["EmptyDetector", _this select 0];	// use trigger array to count units in groupblue and detect escape for mission end
				_endtrg setTriggerArea [200, 200, 0, false];
				_endtrg setTriggerActivation ["ANY","PRESENT",true];	// agm incap'd units don't count as dead, but aren't detected by a WEST trigger
				_endtrg setTriggerStatements ["this", "sleep 10;", ""];

			}], "BIS_fnc_spawn", false, false, false] spawn BIS_fnc_MP;
			ron removeAction 0;
			ron removeAllMPEventHandlers "MPKilled";
		}, "", 5];
	}];
};

[_group1,_spawnPos,5, 3, false] call CBA_fnc_taskDefend;

_group2= [_spawnPos, east, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
_null = _group2 setSpeedMode "LIMITED";
_null = _group2 setFormation "STAG COLUMN";
_null = _group2 setBehaviour "SAFE";
[_group2,_spawnPos,200] call CBA_fnc_taskPatrol;

//-	teleport groupblue to a 'safe' position approx 600m away from the objective in a random direction; copied from Moscow File Blue, slightly modified:
_safe = false;
_startDir = 0;
_startPos = _spawnPos;
while {!_safe} do
{
	_startDistance = 575 + random 50;
	_startDir = random 360;
	_startPos = [(_spawnPos select 0) + _startDistance * (sin (_startDir + 180)),(_spawnPos select 1) + _startdistance * (cos (_startDir + 180))];
	_startPos = [_startPos, 0, 70, 0, 0, 1, 0, [], [[1,1,1],[1,1,1]]] call BIS_fnc_findSafePos;

	if ((_startPos select 0) != 1) then
	{
		_safe=true;
	};	
};

[[[_startPos, _startDir, _groupblue],{ 
	_pos = (_this select 0);

	{
		_x setDir (_this select 1);
		_x setPos _pos;
		_pos = [(_pos select 0) + 2,(_pos select 1)];
	} forEach units (_this select 2);

}], "BIS_fnc_spawn", true, false, true] spawn BIS_fnc_MP;
//-
														//arma also thinks _endtrig is undefined
waitUntil{sleep 1; ({group _x == _groupblue}count list _endtrg) < 1}; // no living units in groupblue are within 200m of ron's body, mission will end

if (count (_groupblue call CBA_fnc_getAlive) > 0) then {
	["", true, true] call BIS_fnc_endMission;
} else {
	["", false, true] call BIS_fnc_endMission;
};
