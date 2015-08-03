// 18 total, 12 defending 6 patrolling
"O_recon_medic_F" createUnit [_tgtspawnpos, _group1, "this allowFleeing 0;"];
"O_recon_JTAC_F" createUnit [_tgtspawnpos, _group1, "this allowFleeing 0;"];
"O_recon_F" createUnit [_tgtspawnpos, _group1, "this allowFleeing 0;"];
[_group1,_tgtpos,10, 2, false] call CBA_fnc_taskDefend;

// ============================================================================================
_group2 = [_tgtspawnpos , east, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup;
_group2 setCombatMode "RED";
{_x allowFleeing 0} forEach units _group2;
[_group2,_tgtpos,50, 3, true] call CBA_fnc_taskDefend; //Switch to BIS to remove CBA requirement.

// ============================================================================================
_patrolDir = random 360;
_patrolDis = 100 + random 50;
_patrolPos = [(_tgtpos select 0) + _patroldis * (sin (_patroldir + 180)),(_tgtpos select 1) + _patroldis * (cos (_patroldir + 180))];
	
_group3 = [_patrolpos, east, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
"O_Soldier_AR_F" createUnit [_patrolPos, _group3];
"O_Soldier_F" createUnit [_patrolPos, _group3];
_group3 setSpeedMode "LIMITED";
_group3 setFormation "FILE";
_group3 setBehaviour "SAFE";
	
[_group3,_tgtpos,200] call CBA_fnc_taskPatrol;