opforside = createCenter east;
bluforside = createCenter west;
pliers = [];
unitsblue = [];

sleep 1;

{
	if (typeOf _x == "Land_Pliers_F") then { 
		pliers = pliers + [_x];
	};
	if (side _x == west) then { 
		unitsblue = unitsblue + [_x];
	};	
}foreach list trig1;

ran = floor random count pliers;

safe = false;
while {!safe} do {
	spawnPos = [(position (pliers select ran)), 0, 30, 1, 0, 1, 0, [], [[1,1,1],[1,1,1]]] call BIS_fnc_findSafePos;
	if ((spawnPos select 0) != 1) then {
		safe = true;
	};
};
	
target = createMarker ["Targetarea", position nearestBuilding (position (pliers select ran))];
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

pos = (startPos);
{
	_x setDir (startDir);
	_x setPos pos;
	pos = [(pos select 0) + 2,(pos select 1)];
} forEach (unitsblue);

start = createMarker["start", startPos];
start setMarkerType "mil_start";
start setMarkerShape "ICON";
start setMarkerColor "ColorBLUFOR";

if (paramsArray select 0 == 1) then {
	group1 = createGroup east; group2 = createGroup east; group3 = createGroup east;

	"O_Officer_F" createUnit [spawnPos, group3, "ron = this; publicvariable 'ron';"];
	"O_Soldier_lite_F" createUnit [spawnPos, group3, ""];
	[group3,(position (pliers select ran)),10, 2, false] call CBA_fnc_taskDefend;

	group1 = [spawnPos , east, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup;
	group1 setCombatMode "RED";
	{_x allowFleeing 0} forEach units group1;
	[group1,spawnPos,50, 3, true] call CBA_fnc_taskDefend; //Switch to BIS to remove CBA requirement.

	group2 = [spawnPos, east, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
	group2 setSpeedMode "LIMITED";
	group2 setFormation "FILE";
	group2 setBehaviour "SAFE";
	[group2,spawnPos,200] call CBA_fnc_taskPatrol;
};
if (paramsArray select 0 == 2) then {
	group1= createGroup east; group2 = createGroup east; group3 = createGroup east;

	group1= [spawnPos , east, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup;
	null = group1 setCombatMode "RED";
	{_x allowFleeing 0} forEach units group1;
	[group1,spawnPos,50, 2, true] call CBA_fnc_taskDefend; //Switch to BIS to remove CBA requirement.

	group2= [spawnPos, east, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
	"O_Soldier_AR_F" createUnit [spawnPos, group2];
	"O_Soldier_F" createUnit [spawnPos, group2];
	group2 setSpeedMode "LIMITED";
	group2 setFormation "FILE";
	group2 setBehaviour "SAFE";
	[group2,spawnPos,200] call CBA_fnc_taskPatrol;

	"O_officer_F" createUnit [spawnPos, group3, "ron = this; publicvariable 'ron'; this allowFleeing 0;"];
	"O_recon_medic_F" createUnit [spawnPos, group3, "this allowFleeing 0;"];
	"O_recon_JTAC_F" createUnit [spawnPos, group3, "this allowFleeing 0;"];
	"O_recon_F" createUnit [spawnPos, group3, "this allowFleeing 0;"];
	[group3,spawnPos,10, 2, false] call CBA_fnc_taskDefend;
};
if (paramsArray select 0 == 3) then {
	group1= createGroup east; group2 = createGroup east; group3 = createGroup east; group4 = creategroup east;

	group1= [spawnPos , east, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup;
	group1 setCombatMode "RED";
	{_x allowFleeing 0} forEach units group1;
	[group1,spawnPos,75, 2, true] call CBA_fnc_taskDefend;

	group2= [spawnPos, east, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
	null = group2 setSpeedMode "LIMITED";
	null = group2 setFormation "FILE";
	null = group2 setBehaviour "SAFE";
	[group2,spawnPos,250] call CBA_fnc_taskPatrol;

	group4= [spawnPos, east, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
	null = group4 setSpeedMode "LIMITED";
	null = group4 setFormation "FILE";
	null = group4 setBehaviour "SAFE";
	[group4,spawnPos,250] call CBA_fnc_taskPatrol;

	"O_officer_F" createUnit [spawnPos, group3, "ron = this; publicvariable 'ron'; this allowFleeing 0;"];
	"O_recon_medic_F" createUnit [spawnPos, group3, "this allowFleeing 0;"];
	"O_recon_JTAC_F" createUnit [spawnPos, group3, "this allowFleeing 0;"];
	"O_recon_F" createUnit [spawnPos, group3, "this allowFleeing 0;"];
	"O_recon_F" createUnit [spawnPos, group3, "this allowFleeing 0;"];
	[group3,spawnPos,10, 2, false] call CBA_fnc_taskDefend;
}; 
if (paramsArray select 0 == 4) then {
	group1= createGroup east; group2 = createGroup east; group3 = createGroup east; group4 = creategroup east; group5 = creategroup east;

	group1= [spawnPos , east, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
	"O_Soldier_AR_F" createUnit [spawnPos, group1];
	"O_Soldier_F" createUnit [spawnPos, group1];
	group1 setCombatMode "RED";
	{_x allowFleeing 0} forEach units group1;
	[group1,spawnPos,75, 2, true] call CBA_fnc_taskDefend;

	group2= [spawnPos, east, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup;
	group2 setSpeedMode "LIMITED";
	group2 setFormation "FILE";
	group2 setBehaviour "SAFE";
	[group2,spawnPos,300] call CBA_fnc_taskPatrol;

	group4= [spawnPos, east, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup;
	group4 setSpeedMode "LIMITED";
	group4 setFormation "FILE";
	group4 setBehaviour "SAFE";
	[group4,spawnPos,300] call CBA_fnc_taskPatrol;

	group5= [spawnPos, east, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup;
	group5 setSpeedMode "LIMITED";
	group5 setFormation "FILE";
	group5 setBehaviour "SAFE";
	[group5,spawnPos,300] call CBA_fnc_taskPatrol;

	"O_officer_F" createUnit [spawnPos, group3, "ron = this; publicvariable 'ron'; this allowFleeing 0;", 0.5, "LIEUTENANT"];
	"O_recon_medic_F" createUnit [spawnPos, group3, "this allowFleeing 0;"];
	"O_recon_JTAC_F" createUnit [spawnPos, group3, "this allowFleeing 0;"];
	"O_recon_F" createUnit [spawnPos, group3, "this allowFleeing 0;"];
	"O_recon_F" createUnit [spawnPos, group3, "this allowFleeing 0;"];
	"O_recon_F" createUnit [spawnPos, group3, "this allowFleeing 0;"];
	[group3,spawnPos,10, 3, false] call CBA_fnc_taskDefend;
};

roniskill = ron addeventhandler ["Killed", {
	[] spawn {
		docs = createMarker["Targetpin", position (ron)];
		docs setMarkerSize [3, 3];
		docs setMarkerShape "ELLIPSE";
		docs setMarkerBrush "SolidBorder";
		docs setMarkerColor "ColorRed";
		docs setMarkerAlpha .8;
	
		endtrg = createTrigger ["EmptyDetector", position ron];	// use trigger to count blufor units
		endtrg setTriggerArea [205, 205, 0, false];
		endtrg setTriggerActivation ["ANY","PRESENT",false];	// agm incap'd units don't count as dead, but aren't detected by a WEST trigger
		endtrg setTriggerStatements ["this", "", ""];
	
		waitUntil{sleep 5; ({_x in unitsblue}count list endtrg) < 1};	// no one in unitsblue is within 200m of ron's pos on death
		if (count (unitsblue call CBA_fnc_getAlive) > 0) then {			// at least one in units blue is alive
			[["END1", true, true], "BIS_fnc_endMission", true] spawn BIS_fnc_MP;
			task2 setTaskState "Succeeded";
		} else {
			[["LOSER", false, true], "BIS_fnc_endMission", true] spawn BIS_fnc_MP;
		};
	};
	
	[[[],{
		intelact = ron addAction ["Upload Intel", {
			[[[],{
				task1 setTaskState "Succeeded";
				task2 = player createSimpleTask ["Escape"];
				task2 setSimpleTaskDescription ["Leave the area.", "Exfiltrate", "Target area"];
				player setCurrentTask task2;
				["TaskSucceeded",["OBJECTIVE COMPLETE","Intel Uploaded<br/>now git out"]] call bis_fnc_showNotification;
				ron removeAction intelact;
			}], "BIS_fnc_spawn", true] spawn BIS_fnc_MP;
		}, nil, 5, false, true,"","((_target distance _this) < 2)"];
	}], "BIS_fnc_spawn", true] spawn BIS_fnc_MP;
}];
