opforside = createCenter east;
bluforside = createCenter west;
pliers = [];
unitsblue = [];

endtrg = objnull;
inteluploaded = false;

//getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition")
pliers = nearestobjects [[15000,15000,0],["Land_Pliers_F"],20000];

unitsblue = [allunits, { side _x == west }] call BIS_fnc_conditionalSelect;

ran = floor random count pliers;

safe = false;
while {!safe} do {
	spawnPos = [(position (pliers select ran)), 0, 30, 1, 0, 1, 0, [], [[1,1,1],[1,1,1]]] call BIS_fnc_findSafePos;
	if ((spawnPos select 0) != 1) then {
		safe = true;
	};
};
	
target = createMarker ["Targetarea", position (pliers select ran)]; //majority of enterable bldgs on smd sahrani not recognized by nearestbuilding
target setMarkerSize [200, 200];
target setMarkerShape "ELLIPSE";
target setMarkerBrush "Border";
target setMarkerColor "ColorRed";
target setMarkerAlpha 1;

//-	teleport unitsblue to a 'safe' position approx 725m away from the enemy spawn position in a random direction
safe = false;
while {!safe} do {
	startDistance = 700 + random 50;
	startDir = random 360;
	startPos = [(spawnPos select 0) + startDistance * (sin (startDir + 180)),(spawnPos select 1) + startdistance * (cos (startDir + 180))];
	startPos = [startPos, 0, 50, 1, 0, 1, 0, [], [[1,1,1],[1,1,1]]] call BIS_fnc_findSafePos;
	
	if ((startPos select 0) != 1) then {
		safe=true;
	};
};

/*
pos = (startPos);
{
[-2, {
	(_this select 0) setDir (_this select 1);
	(_this select 0) setPos (_this select 2);
  }, [_x,startDir,pos]] call CBA_fnc_globalExecute;
	pos = [(pos select 0) + 2,(pos select 1)];
} forEach (unitsblue);
*/

pos = (startPos);
{
	[[[_x, startDir, pos],{
		(_this select 0) setDir (_this select 1);
		(_this select 0) setPos (_this select 2);
	}], "BIS_fnc_call", _x] call BIS_fnc_MP;
	
	pos = [(pos select 0) + 2,(pos select 1)];
	
	(_x) disableai "TARGET";
	(_x) disableai "AUTOTARGET";
	(_x) disableai "MOVE";
	
} forEach (unitsblue);

/*
pos = (startPos);
{
	_x setDir (startDir);
	_x setPos pos;
	pos = [(pos select 0) + 2,(pos select 1)];
} forEach (unitsblue);
*/

start = createMarker["start", startPos];
start setMarkerType "mil_start";
start setMarkerShape "ICON";
start setMarkerColor "ColorBLUFOR";
start setmarkerdir startDir;

if (paramsArray select 0 == 1) then {
	group1 = createGroup east; group2 = createGroup east; group3 = createGroup east;

	"O_Officer_F" createUnit [spawnPos, group3, "ron = this; publicvariable 'ron';"];
	"O_Soldier_lite_F" createUnit [spawnPos, group3, ""];
	[group3,(position (pliers select ran)),10, 2, false] call CBA_fnc_taskDefend;

	group1 = [spawnPos , east, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup;
	group1 setCombatMode "RED";
	{_x allowFleeing 0} forEach units group1;
	[group1,spawnPos,50, 3, true] call CBA_fnc_taskDefend; //Switch to BIS to remove CBA requirement.

	patrolDir = random 360;
	patrolDis = 100 + random 50;
	patrolPos = [(spawnPos select 0) + patrolDis * (sin (patrolDir + 180)),(spawnPos select 1) + patrolDis * (cos (patrolDir + 180))];
	
	group2 = [patrolPos, east, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
	group2 setSpeedMode "LIMITED";
	group2 setFormation "FILE";
	group2 setBehaviour "SAFE";
	
	[group2,spawnPos,200] call CBA_fnc_taskPatrol;
};
if (paramsArray select 0 == 2) then {
	group1= createGroup east; group2 = createGroup east; group3 = createGroup east;
	
	"O_officer_F" createUnit [spawnPos, group3, "ron = this; publicvariable 'ron'; this allowFleeing 0;"];
	"O_recon_medic_F" createUnit [spawnPos, group3, "this allowFleeing 0;"];
	"O_recon_JTAC_F" createUnit [spawnPos, group3, "this allowFleeing 0;"];
	"O_recon_F" createUnit [spawnPos, group3, "this allowFleeing 0;"];
	[group3,spawnPos,10, 2, false] call CBA_fnc_taskDefend;

	group1= [spawnPos , east, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup;
	null = group1 setCombatMode "RED";
	{_x allowFleeing 0} forEach units group1;
	[group1,spawnPos,50, 2, true] call CBA_fnc_taskDefend; //Switch to BIS to remove CBA requirement.

	patrolDir = random 360;
	patrolDis = 100 + random 50;
	patrolPos = [(spawnPos select 0) + patrolDis * (sin (patrolDir + 180)),(spawnPos select 1) + patrolDis * (cos (patrolDir + 180))];
	
	group2= [patrolPos, east, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
	"O_Soldier_AR_F" createUnit [spawnPos, group2];
	"O_Soldier_F" createUnit [spawnPos, group2];
	group2 setSpeedMode "LIMITED";
	group2 setFormation "FILE";
	group2 setBehaviour "SAFE";
	[group2,spawnPos,200] call CBA_fnc_taskPatrol;
};
if (paramsArray select 0 == 3) then {
	group1= createGroup east; group2 = createGroup east; group3 = createGroup east; group4 = creategroup east;
	
	"O_officer_F" createUnit [spawnPos, group3, "ron = this; publicvariable 'ron'; this allowFleeing 0;"];
	"O_recon_medic_F" createUnit [spawnPos, group3, "this allowFleeing 0;"];
	"O_recon_JTAC_F" createUnit [spawnPos, group3, "this allowFleeing 0;"];
	"O_recon_F" createUnit [spawnPos, group3, "this allowFleeing 0;"];
	"O_recon_F" createUnit [spawnPos, group3, "this allowFleeing 0;"];
	[group3,spawnPos,10, 2, false] call CBA_fnc_taskDefend;

	group1= [spawnPos , east, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup;
	group1 setCombatMode "RED";
	{_x allowFleeing 0} forEach units group1;
	[group1,spawnPos,75, 2, true] call CBA_fnc_taskDefend;
	
	patrolDir1 = random 180;
	patrolDis1 = 125 + random 125;
	patrolPos1 = [(spawnPos select 0) + patrolDis1 * (sin (patrolDir1 + 180)),(spawnPos select 1) + patrolDis1 * (cos (patrolDir1 + 180))];

	group2= [patrolPos1, east, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
	null = group2 setSpeedMode "LIMITED";
	null = group2 setFormation "FILE";
	null = group2 setBehaviour "SAFE";
	[group2,spawnPos,250] call CBA_fnc_taskPatrol;
	
	patrolDir2 = 180 + random 180;
	patrolDis2 = 125 + random 125;
	patrolPos2 = [(spawnPos select 0) + patrolDis2 * (sin (patrolDir2 + 180)),(spawnPos select 1) + patrolDis2 * (cos (patrolDir2 + 180))];

	group4= [patrolPos2, east, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
	null = group4 setSpeedMode "LIMITED";
	null = group4 setFormation "FILE";
	null = group4 setBehaviour "SAFE";
	[group4,spawnPos,250] call CBA_fnc_taskPatrol;
}; 
if (paramsArray select 0 == 4) then {
	group1= createGroup east; group2 = createGroup east; group3 = createGroup east; group4 = creategroup east; group5 = creategroup east;
	
	"O_officer_F" createUnit [spawnPos, group3, "ron = this; publicvariable 'ron'; this allowFleeing 0;", 0.5, "LIEUTENANT"];
	"O_recon_medic_F" createUnit [spawnPos, group3, "this allowFleeing 0;"];
	"O_recon_JTAC_F" createUnit [spawnPos, group3, "this allowFleeing 0;"];
	"O_recon_F" createUnit [spawnPos, group3, "this allowFleeing 0;"];
	"O_recon_F" createUnit [spawnPos, group3, "this allowFleeing 0;"];
	"O_recon_F" createUnit [spawnPos, group3, "this allowFleeing 0;"];
	[group3,spawnPos,10, 3, false] call CBA_fnc_taskDefend;

	group1= [spawnPos , east, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
	"O_Soldier_AR_F" createUnit [spawnPos, group1];
	"O_Soldier_F" createUnit [spawnPos, group1];
	group1 setCombatMode "RED";
	{_x allowFleeing 0} forEach units group1;
	[group1,spawnPos,75, 2, true] call CBA_fnc_taskDefend;
	
	patrolDir1 = random 120;
	patrolDis1 = 150 + random 150;
	patrolPos1 = [(spawnPos select 0) + patrolDis1 * (sin (patrolDir1 + 180)),(spawnPos select 1) + patrolDis1 * (cos (patrolDir1 + 180))];

	group2= [patrolPos1, east, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup;
	group2 setSpeedMode "LIMITED";
	group2 setFormation "FILE";
	group2 setBehaviour "SAFE";
	[group2,spawnPos,300] call CBA_fnc_taskPatrol;
	
	patrolDir2 = 120 + random 120;
	patrolDis2 = 150 + random 150;
	patrolPos2 = [(spawnPos select 0) + patrolDis2 * (sin (patrolDir2 + 180)),(spawnPos select 1) + patrolDis2 * (cos (patrolDir2 + 180))];

	group4= [patrolPos2, east, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup;
	group4 setSpeedMode "LIMITED";
	group4 setFormation "FILE";
	group4 setBehaviour "SAFE";
	[group4,spawnPos,300] call CBA_fnc_taskPatrol;
	
	patrolDir3 = 240 + random 120;
	patrolDis3 = 150 + random 150;
	patrolPos3 = [(spawnPos select 0) + patrolDis3 * (sin (patrolDir3 + 180)),(spawnPos select 1) + patrolDis3 * (cos (patrolDir3 + 180))];

	group5= [patrolPos3, east, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup;
	group5 setSpeedMode "LIMITED";
	group5 setFormation "FILE";
	group5 setBehaviour "SAFE";
	[group5,spawnPos,300] call CBA_fnc_taskPatrol;
};

roniskill = ron addeventhandler ["Killed",
{
	[] spawn {
		docs = createMarker["Targetpin", position (ron)];
		docs setMarkerSize [3, 3];
		docs setMarkerShape "ELLIPSE";
		docs setMarkerBrush "SolidBorder";
		docs setMarkerColor "ColorRed";
		docs setMarkerAlpha .8;
	
		endtrg = createTrigger ["EmptyDetector", position ron];	// use trigger to count blufor units
		endtrg setTriggerArea [205, 205, 0, false];
		endtrg setTriggerActivation ["ANY","PRESENT", false];	// agm incap'd units don't count as dead, but aren't detected by a WEST trigger
		endtrg setTriggerStatements ["this", "", ""];
		
		[[[endtrg, unitsblue],{
			intelact = ron addAction ["Upload Intel", {
				[[[_this select 0, _this select 1],{
					task1 setTaskState "Succeeded";
					task2 = player createSimpleTask ["Escape"];
					task2 setSimpleTaskDescription ["Leave the area.", "Exfiltrate", "Target area"];
					player setCurrentTask task2;
					["TaskSucceeded",["OBJECTIVE COMPLETE","Intel Uploaded<br/>now git out"]] call bis_fnc_showNotification;
					ron removeAction intelact;
					
					inteluploaded = true;
					
				}], "BIS_fnc_spawn", true] spawn BIS_fnc_MP;
			}, nil, 5, false, true,"","((_target distance _this) < 2)"];
		}], "BIS_fnc_spawn", true] call BIS_fnc_MP;
	};
}];

null = [] spawn 
{
	waitUntil{sleep 5; ({_x in unitsblue}count list endtrg) < 1 && inteluploaded};	// no one in unitsblue is within 200m of ron's pos on death
	if (count ((list endtrg) call CBA_fnc_getAlive) > 0) then // at least one in units blue is alive
	{
		task2 setTaskState "Succeeded";
		[[[],{
			["END1", true, true] call BIS_fnc_endMission;
		}], "BIS_fnc_spawn", true] spawn BIS_fnc_MP;
	}
	else
	{
		[[[],{
			["LOSER", false, true] call BIS_fnc_endMission;
		}], "BIS_fnc_spawn", true] spawn BIS_fnc_MP;
	};
};

NamdarIsKill = Namdar addeventhandler ["Killed", {
	[_this select 0, _this select 1] spawn {
		sleep 0.5;
		createvehicle ["HelicopterExploSmall",getpos (_this select 0), [],0,"CAN_COLLIDE"];
		(_this select 0) setpos [0,0,0];
	};
}];

sleep 1;
pos = (startPos);
{		
	[[[_x, startDir, pos],{
		(_this select 0) setDir (_this select 1);
		(_this select 0) setPos (_this select 2);		
	}], "BIS_fnc_call", _x] call BIS_fnc_MP;
	
	pos = [(pos select 0) + 2,(pos select 1)];
	
	(_x) disableai "ANIM";
	
} forEach (unitsblue);
