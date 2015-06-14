if (!isserver) exitwith {};

private
[
	"_tgtpos","_tgtspawnpos","_safepos","_tgtmark","_bluespawnpos","_playerdir","_roniskill","_docmark",
	"_group1","_group2","_group3","_group4","_group5",
	"_patroldir","_patroldis","_patrolpos"
];
_tgtpos = getmarkerpos (allmapmarkers call BIS_fnc_selectRandom);
_tgtspawnpos= [1,1,1];
inteluploaded = false;
_safepos = false;

if (count playableunits == 0) then
{
	blueunits = switchableunits; //playableunits;
}
else
{
	blueunits = playableunits;
};

// create target area marker
_tgtmark = createMarker ["Targetarea", _tgtpos]; //majority of enterable bldgs on smd sahrani not recognized by nearestbuilding
_tgtmark setMarkerSize [200, 200];
_tgtmark setMarkerShape "ELLIPSE";
_tgtmark setMarkerBrush "Border";
_tgtmark setMarkerColor "ColorRed";
_tgtmark setMarkerAlpha 1;

//get safe enemy spawn point
while {!_safepos} do {
	_tgtspawnpos =
	[
		_tgtpos,
		0, 30, 1, 0, 1, 0, [], [[1,1,1],[1,1,1]]
	] call BIS_fnc_findSafePos;
	if ((_tgtspawnpos select 0) != 1) then {
		_safepos = true;
	};
};

_safepos = false;

// get safe player spawn point ~725m away
while {!_safepos} do
{
	_playerdir = random 360;
	
	_bluespawnpos =
	[
		(_tgtspawnpos select 0) + (700 + random 50) * (sin (_playerdir + 180)),
		(_tgtspawnpos select 1) + (700 + random 50) * (cos (_playerdir + 180))
	];
	
	_bluespawnpos = [_bluespawnpos, 0, 50, 1, 0, 1, 0, [], [[1,1,1],[1,1,1]]] call BIS_fnc_findSafePos;
	
	if ((_bluespawnpos select 0) != 1) then
	{
		_safepos = true;
	};
};

// move players to start point
{_x setpos ([_bluespawnpos,10] call bg_fnc_ranpos); _x setdir _playerdir;} foreach blueunits;

//spawn enemy groups
_group1 = creategroup east;
_group2 = creategroup east;
_group3 = creategroup east;
_group4 = creategroup east;
_group5 = creategroup east;
"O_Officer_F" createUnit [_tgtspawnpos, _group1, "ron = this; publicvariable 'ron';"];

switch (bg_param_difficulty) do
{
	default {
		#include "spawnopfor4.sqf"
	};
	case "8": {
		#include "spawnopfor8.sqf"
	};
	case "12": {
		#include "spawnopfor12.sqf"
	};
	case "24": {
		#include "spawnopfor24.sqf"
	};
};

// target is killed
_roniskill = ron addeventhandler ["Killed",
{
	// marker on target's position at time of death
	_docmark = createMarker["Targetpin", position (ron)];
	_docmark setMarkerSize [3, 3];
	_docmark setMarkerShape "ELLIPSE";
	_docmark setMarkerBrush "SolidBorder";
	_docmark setMarkerColor "ColorRed";
	_docmark setMarkerAlpha .8;

	// trigger to detect escape or wipe
	endtrg = createTrigger ["EmptyDetector", position ron];
	endtrg setTriggerArea [205, 205, 0, false];
	endtrg setTriggerActivation ["ANY","PRESENT", false]; // agm incap'd units don't count as dead, but aren't detected by a WEST trigger
	endtrg setTriggerStatements ["this", "", ""];
	
	[[[],{
		if (!isnil "uploadact") exitwith {};
		uploadact = ron addAction ["Upload Intel", // objective action on target's body
		{
			[[[],{
				if (!taskcompleted task1) then {
					task1 setTaskState "Succeeded";
				};
				if (isnil "task2") then {
					task2 = player createSimpleTask ["Escape"];
					task2 setSimpleTaskDescription ["Leave the area.", "Exfiltrate", "Target area"];
				};
				
				player setCurrentTask task2;
				["TaskSucceeded",["       OBJECTIVE COMPLETE","Intel Uploaded<br/>now git out"]] call bis_fnc_showNotification;
				ron removeAction uploadact;
				
				inteluploaded = true;
				
			}], "BIS_fnc_spawn", true] spawn BIS_fnc_MP;
		}, nil, 5, false, true,"","((_target distance _this) < 2)"];
	}], "BIS_fnc_spawn", true] call BIS_fnc_MP;

	// detect end condition
	[] spawn 
	{
		waitUntil{sleep 5; ({_x in blueunits}count list (endtrg)) < 1 && inteluploaded;};	// no one in unitsblue is within 200m of ron's pos on death
		if (count ((list (endtrg)) call CBA_fnc_getAlive) > 0) then // at least one in units blue is alive
		{
			[[[],{
				task2 setTaskState "Succeeded";
				["TaskSucceeded",["      EXFILTRATION COMPLETE","you have 5 seconds to<br/>ensure ronnie's death."]] call bis_fnc_showNotification;
				sleep 5;
				["END1", true, true] call BIS_fnc_endMission;
			}], "BIS_fnc_spawn", true] spawn BIS_fnc_MP;
		}
		else
		{
			[[[],{
				["END2", false, true] call BIS_fnc_endMission;
			}], "BIS_fnc_spawn", true] spawn BIS_fnc_MP;
		};
	};
}];
