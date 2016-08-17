// 34 total, 10 defending 24 patrolling
"O_recon_medic_F" createUnit [_tgtspawnpos, _group1, "this allowFleeing 0;"];
"O_recon_JTAC_F" createUnit [_tgtspawnpos, _group1, "this allowFleeing 0;"];
"O_recon_F" createUnit [_tgtspawnpos, _group1, "this allowFleeing 0;"];
"O_recon_F" createUnit [_tgtspawnpos, _group1, "this allowFleeing 0;"];
"O_recon_F" createUnit [_tgtspawnpos, _group1, "this allowFleeing 0;"];
[_group1,_tgtpos,10, 2, false] call CBA_fnc_taskDefend;

// ============================================================================================
_group2 = [_tgtspawnpos , east, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
_group2 setCombatMode "RED";
{_x allowFleeing 0} forEach units _group2;
[_group2,_tgtpos,50, 3, true] call CBA_fnc_taskDefend; //Switch to BIS to remove CBA requirement.

// ============================================================================================
_patrolDir = random 120;
_patrolDis = 150 + random 150;
_patrolPos =
[
	(_tgtpos select 0) + _patroldis * (sin (_patroldir + 180)),
	(_tgtpos select 1) + _patroldis * (cos (_patroldir + 180))
];

_group3 = [_patrolpos, east, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup;
_group3 setSpeedMode "LIMITED";
_group3 setFormation "FILE";
_group3 setBehaviour "SAFE";
[_group3,_tgtpos,200] call CBA_fnc_taskPatrol;

// ============================================================================================
_patrolDir = 120 + random 120;
_patrolDis = 150 + random 150;
_patrolPos =
[
	(_tgtpos select 0) + _patroldis * (sin (_patroldir + 180)),
	(_tgtpos select 1) + _patroldis * (cos (_patroldir + 180))
];

_group4 = [_patrolpos, east, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup;
_group4 setSpeedMode "LIMITED";
_group4 setFormation "FILE";
_group4 setBehaviour "SAFE";
[_group4,_tgtpos,200] call CBA_fnc_taskPatrol;

// ============================================================================================
_patrolDir = 240 + random 120;
_patrolDis = 150 + random 150;
_patrolPos =
[
	(_tgtpos select 0) + _patroldis * (sin (_patroldir + 180)),
	(_tgtpos select 1) + _patroldis * (cos (_patroldir + 180))
];

_group5 = [_patrolpos, east, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup;
_group5 setSpeedMode "LIMITED";
_group5 setFormation "FILE";
_group5 setBehaviour "SAFE";
[_group5,_tgtpos,200] call CBA_fnc_taskPatrol;