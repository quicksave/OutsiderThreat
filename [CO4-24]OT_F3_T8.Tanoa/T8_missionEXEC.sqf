/*
 =======================================================================================================================

	___ T8 Units _______________________________________________________________________________________________________

	File:		T8_missionEXEC.sqf
	Author:		T-800a
	E-Mail:		t-800a@gmx.net

	This file creates the Units, kind of
	

	This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
	To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-sa/4.0/ or send a letter to 
	Creative Commons, 444 Castro Street, Suite 900, Mountain View, California, 94041, USA.

 =======================================================================================================================
*/

// We dont want players here
waitUntil { !isNil "T8U_var_useHC" };
private [ "_exit" ]; _exit = false;
if ( T8U_var_useHC ) then { if ( isDedicated ) then { _exit = true; } else { waitUntil { !isNull player };	if ( hasInterface ) then { _exit = true; }; }; } else { if ( !isServer ) then { _exit = true; }; };
if ( _exit ) exitWith {};


// check if T8_Units is loaded
waitUntil { !isNil "T8U_var_InitDONE" };
sleep 5;

//////////////////////////////////////  CUSTOM FUNCTION  //////////////////////////////////////
//
//			This function is called for every unit in a group 
//			where it is defined in the groups definiton below
//

T8u_fnc_bg_gear = 
{
	_this spawn
	{
		_this call bg_fnc_assigngearglobal;
	};
	
	_this setVariable ["asr_ai_exclude", true];
};

T8u_fnc_bg_gear_target = 
{
	_this spawn
	{
		_this call bg_fnc_assigngearglobal;
	};
	
	//_this allowfleeing 0;
	
	if (_this iskindof "O_officer_F") then
	{
		ron = _this;
		publicvariable "ron";
		ron addheadgear "H_Cap_maga";
		_this setrank "PRIVATE"
	};
	
	_this setVariable ["asr_ai_exclude", true];
};


//////////////////////////////////////  UNIT SETUP  //////////////////////////////////////

// Pre-defined Arrays for Groups ( group setup )
// SOME WITH DEFAULT T8 NAMES ARE MODIFIED
_groupArrayTarget4 = [ "O_Officer_F", "O_soldier_TL_F", "O_Soldier_F" ];
_groupArrayTarget8 = [ "O_Officer_F", "O_medic_F", "O_Soldier_AR_F", "O_soldier_TL_F" ];
_groupArrayTarget36= [ "O_Officer_F", "O_medic_F", "O_Soldier_AR_F", "O_soldier_TL_F", "O_Soldier_AR_F", "O_Soldier_TL_F", "O_Soldier_AR_F", "O_Soldier_AR_F" ];

_groupArrayOverwatch = ["O_soldier_SL_F", "O_soldier_TL_F", "O_soldier_AR_F", "O_soldier_AR_F"];

_groupArrayFireTeam = [ "O_soldier_TL_F", "O_medic_F", "O_soldier_F", "O_soldier_AR_F" ];
_groupArrayFullTeam = [ "O_soldier_TL_F", "O_medic_F", "O_soldier_F", "O_soldier_AR_F", "O_soldier_TL_F", "O_soldier_F", "O_soldier_F", "O_soldier_AR_F" ];
_groupArrayMiniPat = [ "O_soldier_TL_F", "O_medic_F", "O_soldier_F" ];
_groupArrayFullPat = [ "O_soldier_SL_F", "O_medic_F", "O_soldier_F", "O_soldier_AR_F", "O_soldier_F", "O_soldier_AR_F" ];

_groupArrayCIV		= [ "C_man_1", "C_man_polo_1_F_asia", "C_man_1_1_F", "C_man_1_2_F", "C_man_1_3_F", "C_man_polo_1_F", "C_man_polo_2_F", "C_man_polo_3_F", "C_man_polo_4_F", "C_man_polo_5_F", "C_man_polo_6_F", "C_man_p_fugitive_F", "C_man_p_fugitive_F_afro", "C_man_p_fugitive_F_euro" ];


// this groups of units are spawned directly at mission start
/*
_SpawnThisUnits = 
[ 
	[ [ _groupArrayMiniPat, "Marker01", "T8u_fnc_rmNVG_TEST" ], [ "PATROL" ] ],
	[ [ _groupArrayMiniPat, "Marker08", "T8u_fnc_rmNVG_TEST" ], [ "PATROL" ]  ],
	[ [ _groupArrayFullPat, "Marker02" ], [ "PATROL_AROUND" ] ],
	[ [ _groupArrayFullPat, "Marker09" ], [ "PATROL_AROUND" ] ],
	[ [ _groupArrayFullTeam, "Marker03" ], [ "GARRISON" ] ],
	[ [ _groupArrayFullTeam, "Marker03_f" ], [ "GARRISON" ] ],
	[ [ _groupArrayFireTeam, "Marker04", "T8u_fnc_rmNVG_TEST" ], [ "DEFEND" ], [ true, false, false ] ],
	[ [ _groupArrayFullTeam, "Marker05" ], [ "LOITER" ] ],
	[ [ _groupArrayFullTeam, "Marker06" ], [ "PATROL_GARRISON" ] ],
	[ [ _groupArrayW_APC, "Marker07", false ], [ "PATROL_URBAN" ] ],
	[ [ _groupArrayFullTeam, "ip" ], [ "PATROL_MARKER", [ "ip1", "ip2", "ip3" ] ] ],
	[ [ _groupArrayIfritPat, "vp", false ], [ "PATROL_MARKER", [ "vp1", "vp2", "vp3" ], false ] ],
	[ [ _groupArraySniperTeam, "spawnSnipers" ], [ "OVERWATCH", "overwatchTHIS" ] ],
	[ [ _groupArrayFullTeam + _groupArrayFullTeam, "MarkerRED" ], [ "DEFEND_BASE" ] ],

	[ [ _groupArrayGurTeam, "MarkerGUR", "T8u_fnc_rmNVG_TEST", RESISTANCE ], [ "PATROL" ] ],
	[ [ _groupArrayGurTeam, "MarkerGUR", RESISTANCE, "T8u_fnc_rmNVG_TEST", true ], [ "PATROL" ] ],
	
	[ [ _groupArrayBluTeam, "MarkerBLU", WEST ], [ "PATROL" ] ],
	[ [ _groupArrayBluTeam, "MarkerBLU", WEST ], [ "PATROL" ] ],
	
	[ [ _groupArrayCIV, "MarkerCIV", CIVILIAN ], [ "GARRISON" ] ]	
];

[ _SpawnThisUnits ] spawn T8U_fnc_Spawn;
*/


// diff 4: 3+8+4=15. 3.75 enemies per player. 3 autoriflemen / 15 units = 20% AR
target_diff_4 = 
[
	[ [ _groupArrayTarget4, "t8_zone_30", "T8u_fnc_bg_gear_target" ], [ "GARRISON" ], [ true, false, true ] ],
	[ [ _groupArrayFullTeam, "t8_zone_30", "T8u_fnc_bg_gear" ], [ "GARRISON" ], [ true, true, true ] ],
	[ [ _groupArrayFireTeam, "t8_zone_150", "T8u_fnc_bg_gear" ], [ "PATROL_AROUND" ], [ false, true, true ] ]
];

// diff 8: 4+8+6=18. 2.25 e/p. +3 enemies / +4 players = .75 enemies added per player added. 22% AR
target_diff_8 = 
[
	[ [ _groupArrayTarget8, "t8_zone_30", "T8u_fnc_bg_gear_target" ], [ "GARRISON" ], [ true, false, true ] ],
	[ [ _groupArrayFullTeam, "t8_zone_90", "T8u_fnc_bg_gear" ], [ "GARRISON" ], [ true, true, true ] ],
	[ [ _groupArrayFullPat, "t8_zone_150", "T8u_fnc_bg_gear" ], [ "PATROL_AROUND" ], [ false, true, true ] ]
];

// diff 12: 5+8+6+6=25. 2.083 e/p. 1.75 ea/pa. 32% AR
target_diff_12 = 
[
	[ [ _groupArrayTarget8 + ["O_Soldier_AR_F"], "t8_zone_30", "T8u_fnc_bg_gear_target" ], [ "GARRISON" ], [ true, false, true ] ],
	[ [ _groupArrayFullTeam, "t8_zone_90", "T8u_fnc_bg_gear" ], [ "GARRISON" ], [ true, false, true ] ],
	[ [ _groupArrayFullPat, "t8_zone_150", "T8u_fnc_bg_gear" ], [ "PATROL_AROUND" ], [ true, true, true ] ],
	[ [ _groupArrayFullPat, "t8_zone_200", "T8u_fnc_bg_gear" ], [ "PATROL_AROUND" ], [ true, true, true ] ]
];

// diff 24: 6+6+8+8+8=36. 1.5 e/p. .916 ea/pa. 27.7% AR
target_diff_24 = 
[
	[ [ _groupArrayTarget8 + ["O_Soldier_AR_F", "O_Soldier_F"], "t8_zone_30", "T8u_fnc_bg_gear_target" ], [ "GARRISON" ], [ true, false, true ] ],
	[ [ _groupArrayFullPat, "t8_zone_90", "T8u_fnc_bg_gear" ], [ "GARRISON" ], [ true, false, true ] ],
	[ [ _groupArrayFullTeam, "t8_zone_200", "T8u_fnc_bg_gear" ], [ "PATROL_AROUND" ], [ true, true, true ] ],
	[ [ _groupArrayFullTeam, "t8_zone_250", "T8u_fnc_bg_gear" ], [ "PATROL_AROUND" ], [ true, true, true ] ],
	[ [ _groupArrayFullTeam, "t8_zone_250", "T8u_fnc_bg_gear" ], [ "PATROL_AROUND" ], [ true, true, true ] ]
];

// diff 36: 8+6+6+8+8+8+4=48. 1.3 e/p. 1.0 ea/pa.  4 2 2 2 2 2 2 = 33.3% AR
target_diff_36 = 
[
	[ [ _groupArrayTarget36, "t8_zone_30", "T8u_fnc_bg_gear_target" ], [ "GARRISON" ], [ true, false, true ] ],
	[ [ _groupArrayFullPat, "t8_zone_90", "T8u_fnc_bg_gear" ], [ "GARRISON" ], [ true, false, true ] ],
	[ [ _groupArrayFullPat, "t8_zone_90", "T8u_fnc_bg_gear" ], [ "GARRISON" ], [ true, false, true ] ],
	[ [ _groupArrayFullTeam, "t8_zone_200", "T8u_fnc_bg_gear" ], [ "PATROL_AROUND" ], [ true, true, true ] ],
	[ [ _groupArrayFullTeam, "t8_zone_250", "T8u_fnc_bg_gear" ], [ "PATROL_AROUND" ], [ true, true, true ] ],
	[ [ _groupArrayFullTeam, "t8_zone_250", "T8u_fnc_bg_gear" ], [ "PATROL_AROUND" ], [ true, true, true ] ],
	[ [ _groupArrayOverwatch, "t8_zone_250", "T8u_fnc_bg_gear" ], [ "OVERWATCH", "t8_zone_30", 150, 100 ], [ true, true, true ] ]
];



// this groups of units are spawned on demand with triggers created by a function -> T8U_fnc_Zone 
// they are spawned when a WEST unit is near and they will be cached when no WEST unit is near
/*
SpawnThisUnitsViaTrigger = 
[ 
	[ [ _groupArrayFullTeam, "MarkerByTrigger", "T8u_fnc_rmNVG_TEST" ], [ "DEFEND_BASE" ] ],
	[ [ _groupArrayFireTeam, "MarkerByTrigger", "T8u_fnc_rmNVG_TEST" ], [ "PATROL_AROUND" ] ]
];

// [ _unitsArray, _marker, _distance, _condition, _actSide, _actType, _actRepeat, _onAct, _onDeAct ] call T8U_fnc_TriggerSpawn;
[ "SpawnThisUnitsViaTrigger", "MarkerByTrigger", 800, "this", "WEST", "PRESENT", false, "", "" ] call T8U_fnc_TriggerSpawn;


// [ _unitsArray, _marker, _owner, _actSide, _distance, _condition, _onAct, _onDeAct ] call T8U_fnc_Zone
[ "SpawnZonePU", "MarkerZonePU", "EAST", "WEST" ] spawn T8U_fnc_Zone;
*/


// ------------------------------------------------ THE END ---------------------------------------------------