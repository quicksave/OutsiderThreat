
[] execVM "T8_UnitsINIT.sqf";
[] execVM "T8_missionEXEC.sqf";

asr_ai3_main_joinlast = 0;

// gear & retard enabled blufor ai
// handle all players dying, f3 casualty cap uses mission success style endings
[] spawn
{
	waituntil {!isnil "f_var_men_blu" && !isnil "f_var_men_players"};
	{
		if !(_x in f_var_men_players) then 
		{
			_x disableai "TARGET";
			_x disableai "AUTOTARGET";
			_x disableai "MOVE";
			_x disableai "FSM";
			_x allowdamage false;
			
			_x spawn
			{
				sleep 5;
				_this disableai "ANIM";
				_this enablesimulation false;
			};
			
			_x call bg_fnc_assigngearglobal;
		};
	} foreach f_var_men_blu;
	
	waituntil{sleep 5; {alive _x} count (playableunits + switchableunits) < 1};
	[2,false] call f_fnc_mpend;
};


//handle faction parameter randomization
// "Random","NATO","US Army (M16) (UCP/digicam)","US Army (M4) (OCP/multicam)","FIA","AAF", "CSAT", "Russian (RHS)","Red Army","Wehrmacht",  "Viper", "Syndikat", "Gendarmerie", "CTRG"
_unitfactions = ["random","blu_t_f", "rhs_faction_usarmy_wd", "rhs_faction_usarmy_d", "blu_g_f", "ind_f", "opf_f", "rhs_faction_msv", "LIB_RKKA", "LIB_WEHRMACHT","opf_t_f","ind_c_f","blu_gen_f","blu_ctrg_f"];
_factionparamarray = [];
for "_i" from 0 to (count _unitfactions - 1) do {_factionparamarray set [count _factionparamarray, _i];};

if (_unitfactions select bg_param_westfaction == "random") then
{
	bg_param_westfaction = selectrandom (_factionparamarray - [bg_param_westfaction]);
	diag_log format ["| assigngear | west faction is %1", _unitfactions select bg_param_westfaction];
};

if (_unitfactions select bg_param_eastfaction == "random") then
{
	_wtc = [bg_param_eastfaction, bg_param_westfaction, 0];
	if (bg_param_westfaction in [1,2,3]) then { _wtc = _wtc + [1,2,3]};
	
	bg_param_eastfaction = selectrandom (_factionparamarray - _wtc);
	diag_log format ["| assigngear | east faction is %1", _unitfactions select bg_param_eastfaction];
};


_null = [] spawn { sleep 0.01; publicvariable "bg_param_westfaction"; };

publicvariable "bg_param_westfaction";

namdar call bg_fnc_assigngearglobal;

/*
//run assigngear on all units
[] spawn
{
	sleep 0.1;
	f_var_men_blu call bg_fnc_assigngearglobal;
};
*/

namdar addeventhandler ["Killed", {
	[_this select 0, _this select 1] spawn {
		sleep 1;
		createvehicle ["HelicopterExploSmall",getpos (_this select 0), [],0,"CAN_COLLIDE"];
		(_this select 0) setpos [0,0,0];
	};
}];


call bg_fnc_spawnMission;


[] spawn
{

	waituntil{!isnil "ron"};
	waituntil{!isnull ron};
	
	sleep 1;
	ron addheadgear "H_Cap_maga";
	
	waituntil{sleep 5; !alive ron};
	
	
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
	
	
	[[[],{
		if (!isnil "uploadact") exitwith {};
		uploadact = ron addAction ["Upload Intel", // objective action on target's body
		{
			[[[],{
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
	_endtrg spawn 
	{
		waitUntil{sleep 5; ({_x in (playableunits + switchableunits) && alive _x}count list _this) < 1 && inteluploaded};
		
		if ({alive _x} count (playableunits + switchableunits) > 0) then
		{
			//task2 setTaskState "Succeeded";
			[1] call f_fnc_mpend;
		};
	};
	
	
};
// target is killed



/* FUCK, ASS. 
waituntil{!isnil "ron"};
waituntil{!isnull ron};
_roniskill = ron addeventhandler ["Killed",
{
	
	systemchat "ron died?????";
	
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
	_endtrg spawn 
	{
		waitUntil{sleep 5; ({_x in (playableunits + switchableunits) && alive _x}count list _this) < 1 && inteluploaded};
		
		if ({alive _x} count (playableunits + switchableunits) > 0) then
		{
			//task2 setTaskState "Succeeded";
			[1] call f_fnc_mpend;
		};
	};
	
}];
*/

