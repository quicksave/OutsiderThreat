scopename "main";
if (!isserver) then {breakout "main";};
if (!isserver) exitwith {};

private
[
	"_tgtlist", "_tgtmark", "_tgtpos","_tgtspawnpos","_safepos","_tgtmark","_bluespawnpos","_playerdir","_diffdistance","_roniskill","_docmark",
	"_group1","_group2","_group3","_group4","_group5",
	"_patroldir","_patroldis","_patrolpos",
	"_blueunits", "_endtrg"
];


/*

//[-2, {startLoadingScreen [format ['Loading town %1',_this getvariable 'name'],'RscDisplayLoadMission'];	_this setvariable ['status',0,true];}, _logic] call CBA_fnc_globalExecute;

 if (isnil {_logic getvariable "noEnd"}) then {
[-2, {endloadingscreen;}] call CBA_fnc_globalExecute;
};

*/



[-2, {startloadingscreen [""];}] call CBA_fnc_globalExecute;

_worldCenter = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");

//filter markers for list of possible tgt locations
_tgtlist = [];
_t8_markers = [];
spawn_blacklist = [];
{
	if (["mark_", _x] call bis_fnc_instring) then
	{
		_tgtlist set [count _tgtlist, _x];
	};
	if (["t8_zone", _x] call bis_fnc_instring) then
	{
		_t8_markers set [count _t8_markers, _x];
	};
	if (["blacklist", _x] call bis_fnc_instring) then
	{
		spawn_blacklist set [count spawn_blacklist, _x];
	};
} foreach allmapmarkers;


//  blacklist markers into tl and br corner coords
{
	_marker = _x;
	_markerpos = markerpos _marker;
	_markersize = markersize _marker;
	
	_tl_corner = 
	[
		(_markerpos select 0) - (0.5 * (_markersize select 0)), 
		(_markerpos select 1) + (0.5 * (_markersize select 1)),
		1000
	];
	_br_corner = 
	[
		(_markerpos select 0) + (0.5 * (_markersize select 0)), 
		(_markerpos select 1) - (0.5 * (_markersize select 1)),
		-1000
	];
	
	spawn_blacklist set [_forEachIndex, [_tl_corner, _br_corner]];
	
} foreach spawn_blacklist; // [ [ [tl],[br] ], [ [tl],[br] ], ...  ]


_tgtmark = selectrandom _tgtlist;
diag_log format ["OutsiderThreat: location ""%1"" out of %2",_tgtmark, count _tgtlist];

_tgtpos = getmarkerpos _tgtmark;
_tgtspawnpos= [0,0,0];
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


//move t8 zone markers
{
	_x setMarkerAlpha 0;
	_x setmarkerpos _tgtpos;
} foreach _t8_markers;


//get safe enemy spawn point
// t8 handles spawning now
/*while {!_safepos} do 
{
	_tgtspawnpos =
	[
		_tgtpos,
		0, 
		30, 
		1, 
		0, 
		1, 
		0, 
		[[[-1,-1,-1],[0,0,0]]], 
		[_worldCenter,_worldCenter]
	] call BIS_fnc_findSafePos;
	
	diag_log format ["OutsiderThreat: Rolled OPF spawn point : %1",_tgtspawnpos];
	
	if ((_tgtspawnpos select 0) != 1) then 
	{
		_safepos = true;
	};
};*/

_tgtspawnpos = _tgtpos;


_safepos = false;
_spawn_angle_array = [];

for "_i" from 0 to 359 do
{
	_spawn_angle_array set [_i, _i];
};

// get safe player spawn point 700-850m away
waituntil{!isnil "bg_param_difficulty"};

while {!_safepos} do
{

	_playerdir = selectrandom _spawn_angle_array; // ensures no angle is tried twice
	_spawn_angle_array = _spawn_angle_array - [_playerdir];
	
	_diffdistance = 20 * bg_param_difficulty;
	
	_bluespawnpos =
	[
		(_tgtspawnpos select 0) + (650  + _diffdistance) * (sin (_playerdir + 180)),
		(_tgtspawnpos select 1) + (650  + _diffdistance) * (cos (_playerdir + 180))
	];

	_bluespawnpos = 
	[
		_bluespawnpos,		//center
		0, 					//min d from center
		50, 				//max d from center
		1, 					//min d from nearest object
		0, 					//water: 0 cannot be in water, 2 must be in, 1 either
		1, 					//max terrain gradient (average alt diff in m)
		0, 					//shore: 1 must be at shore
		spawn_blacklist, 	//opt blacklist, arrays of tl and br corners
		[_worldCenter,_worldCenter]	//opt default pos [def on land, def on water]
	] call BIS_fnc_findSafePos;

	diag_log format ["OutsiderThreat: Rolled BLU spawn point : %1",_bluespawnpos];

	if (!(_bluespawnpos isEqualTo _worldCenter) || count _spawn_angle_array == 0) then
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


/*
[_blueunits, _bluespawnpos, _playerdir] call //spawn
{
	//sleep 1;
	{
		_x setpos ([(_this select 1),5+(.4 * count (_this select 0))] call bg_fnc_ranpos);
		_x setdir (_this select 2);
	} foreach (_this select 0);
};
*/


switch (bg_param_difficulty) do
{
	default {
		//[ target_diff_4 ] spawn T8U_fnc_Spawn;
	};
	case 2: {
		//[ target_diff_8 ] spawn T8U_fnc_Spawn;
	};
	case 3: {
		_tgtmark setMarkerSize [250, 250];
		//[ target_diff_12 ] spawn T8U_fnc_Spawn;
	};
	case 4: {
		_tgtmark setMarkerSize [300, 300];
		//[ target_diff_24 ] spawn T8U_fnc_Spawn;
	};
	case 5: {
		_tgtmark setMarkerSize [325, 325];
		//[ target_diff_36 ] spawn T8U_fnc_Spawn;
	};
};

[-2, {endloadingscreen;}] call CBA_fnc_globalExecute;

/*
//enemy groups + target
_group1 = creategroup east;
_group2 = creategroup east;
_group3 = creategroup east;
_group4 = creategroup east;
_group5 = creategroup east;
"O_Officer_F" createUnit [_tgtspawnpos, _group1, "ron = this; publicvariable 'ron';"];
*/

//enemies based on difficulty
waituntil{!isnil "bg_param_difficulty" && !isnil "target_diff_4"};
switch (bg_param_difficulty) do
{
	default {
		[ target_diff_4 ] spawn T8U_fnc_Spawn;
	};
	case 2: {
		[ target_diff_8 ] spawn T8U_fnc_Spawn;
	};
	case 3: {
		//_tgtmark setMarkerSize [250, 250];
		[ target_diff_12 ] spawn T8U_fnc_Spawn;
	};
	case 4: {
		//_tgtmark setMarkerSize [300, 300];
		[ target_diff_24 ] spawn T8U_fnc_Spawn;
	};
	case 5: {
		//_tgtmark setMarkerSize [325, 325];
		[ target_diff_36 ] spawn T8U_fnc_Spawn;
	};
};

