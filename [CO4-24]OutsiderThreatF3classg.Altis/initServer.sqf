if (!isserver) exitwith {};

private
[
	"_tgtlist", "_tgtmark", "_tgtpos","_tgtspawnpos","_safepos","_tgtmark","_bluespawnpos","_playerdir","_roniskill","_docmark",
	"_group1","_group2","_group3","_group4","_group5",
	"_patroldir","_patroldis","_patrolpos",
	"_blueunits", "_endtrg"
];

//filter markers for list of possible tgt locations
_tgtlist = [];
{
	if (["mark_", _x] call bis_fnc_instring) then
	{
		_tgtlist set [count _tgtlist, _x];
	};
} foreach allmapmarkers;

_tgtmark = _tgtlist call BIS_fnc_selectRandom;
diag_log format ["OutsiderThreat: location ""%1"" out of %2 options",_tgtmark, count _tgtlist];

_tgtpos = getmarkerpos _tgtmark;
_tgtspawnpos= [1,1,1];
inteluploaded = false;
_safepos = false;
_blueunits = switchableunits + playableunits;


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

// mark start point and move players
_startmark = createMarker["start", _bluespawnpos];
_startmark setMarkerType "mil_start";
_startmark setMarkerShape "ICON";
_startmark setMarkerColor "ColorBLUFOR";
_startmark setmarkerdir _playerdir;
{_x setpos ([_bluespawnpos,5+(.4 * count _blueunits)] call bg_fnc_ranpos); _x setdir _playerdir;} foreach _blueunits;

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
	_endtrg = createTrigger ["EmptyDetector", position ron];
	_endtrg setTriggerArea [205, 205, 0, false];
	_endtrg setTriggerActivation ["ANY","PRESENT", false]; // agm incap'd units don't count as dead, but aren't detected by a WEST trigger
	_endtrg setTriggerStatements ["this", "", ""];
	
	[[[_endtrg, _blueunits],{
		if (!isnil "uploadact") exitwith {};
		uploadact = ron addAction ["Upload Intel", // objective action on target's body
		{
			[[[_this select 0, _this select 1],{
				task1 setTaskState "Succeeded";
				task2 = player createSimpleTask ["Escape"];
				task2 setSimpleTaskDescription ["Leave the area.", "Exfiltrate", "Target area"];
				player setCurrentTask task2;
				["TaskSucceeded",["       OBJECTIVE COMPLETE","Intel Uploaded<br/>now git out"]] call bis_fnc_showNotification;
				ron removeAction uploadact;
				
				inteluploaded = true;
				
			}], "BIS_fnc_spawn", true] spawn BIS_fnc_MP;
		}, nil, 5, false, true,"","((_target distance _this) < 2)"];
	}], "BIS_fnc_spawn", true] call BIS_fnc_MP;

	// detect end condition
	[_endtrg] spawn 
	{
		waitUntil{sleep 5; ({_x in (playableunits + switchableunits) && alive _x}count list (_this select 0)) < 1 && inteluploaded};
		
		if ({alive _x} count (playableunits + switchableunits) > 0) then
		{
			[1] call f_fnc_mpend;
		};
	};
}];

// handle all players dying because casualty cap only does mission success endings
//end if players die
[] spawn
{
	waituntil{sleep 5; {alive _x} count (playableunits + switchableunits) < 1};
	[2,false] call f_fnc_mpend;
};

Namdar addeventhandler ["Killed", {
	[_this select 0, _this select 1] spawn {
		sleep 0.5;
		createvehicle ["HelicopterExploSmall",getpos (_this select 0), [],0,"CAN_COLLIDE"];
		(_this select 0) setpos [0,0,0];
	};
}];
