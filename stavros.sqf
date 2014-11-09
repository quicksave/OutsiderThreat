/*
STAVROS DOCUMENTS MOSCOW FILE RIPOFF

Create gamelogic objects near any buildings you want to be eligible as an objective site
Place a gamelogic trigger with a radius large enough to include all the gamelogic objects, name it trig1
Put the following lines in init.sqf, the sleep isn't needed if you already have one before the execVM:

sleep 1;
(position (list trig1 select floor random count list trig1)) execVM "stavros.sqf";

Ensure all BLUFOR are grouped with the player unit, there is no limit
*/
if (!isServer) exitWith {};

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

_group1= [_spawnPos , east, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup;
_null = _group1 setCombatMode "RED";
{_x allowFleeing 0} forEach units _group1;
[_group1,_spawnPos,30, 2, true] call CBA_fnc_taskDefend; //Switch to BIS to remove CBA requirement.

_stavros = "O_officer_F" createUnit [_spawnPos, _group3, "Stavros = this;", 0.5, "PRIVATE"];
[_group1,_spawnPos,5, 3, false] call CBA_fnc_taskDefend; 

_group2= [_spawnPos, east, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
_null = _group2 setSpeedMode "LIMITED";
_null = _group2 setFormation "STAG COLUMN";
_null = _group2 setBehaviour "SAFE";
[_group2,_spawnPos,200] call CBA_fnc_taskPatrol;

groupblue = createGroup west;
waitUntil{!isNull player};
units group player join groupblue;

//-	teleport groupblue to a 'safe' position approx 600m away from the objective in a random direction; copied from Moscow File Blue, slightly modified:
safe = false;
startDir = 0;
startPos = _spawnPos;
while {!safe} do
{
	_startDistance = 575 + random 50;
	startDir = random 360;
	startPos = [(_spawnPos select 0) + _startDistance * (sin (startDir + 180)),(_spawnPos select 1) + _startdistance * (cos (startDir + 180))];
	startPos = [startPos, 0, 70, 0, 0, 1, 0, [], [[1,1,1],[1,1,1]]] call BIS_fnc_findSafePos;

	if ((startPos select 0) != 1) then
	{
		safe=true;
	};	
};

[[[startPos, startDir, groupblue],{ 
	_pos = (_this select 0);

	{
		_x setDir (_this select 1);
		_x setPos _pos;
		_pos = [(_pos select 0) + 2,(_pos select 1)];
	} forEach units (_this select 2);

}], "BIS_fnc_spawn", true, false, true] spawn BIS_fnc_MP;
//-

waitUntil{sleep 1; !alive Stavros};

gotintel = false;
Stavros addAction ["Take Documents", {gotintel = true; Stavros removeAction 0;}, "", 5]; // use stavros' corpse to complete the objective

waitUntil{gotintel};

trgpos = getPos Stavros;
endtrg = createTrigger ["EmptyDetector", trgpos];	// used to count units in groupblue and detect escape for mission end
endtrg setTriggerArea [200, 200, 0, false];
endtrg setTriggerActivation ["ANY","NOT PRESENT",false];	// agm incap'd units don't count as dead, but aren't detected by a WEST trigger
endtrg setTriggerStatements ["this", "", ""];

waitUntil{sleep 1; ({group _x == groupblue}count list endtrg) < 1}; // no living units in groupblue are within 200m of stavros' body, mission will end

if (count (groupblue call CBA_fnc_getAlive) > 0) then {
	["", true, true] call BIS_fnc_endMission;
} else {
	["", false, true] call BIS_fnc_endMission;
};
