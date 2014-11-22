_group1= createGroup east; _group2 = createGroup east; _group3 = createGroup east;

_group1= [_spawnPos , east, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup;
_null = _group1 setCombatMode "RED";
{_x allowFleeing 0} forEach units _group1;
[_group1,position nearestBuilding _this,50, 2, true] call CBA_fnc_taskDefend; //Switch to BIS to remove CBA requirement.

_group2= [_spawnPos, east, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
_null = _group2 setSpeedMode "LIMITED";
_null = _group2 setFormation "STAG COLUMN";
_null = _group2 setBehaviour "SAFE";
[_group2,position nearestBuilding _this,200] call CBA_fnc_taskPatrol;

"O_officer_F" createUnit [_spawnPos, _group3, "ron = this; publicvariable 'ron'; this allowFleeing 0;", 0.5, "PRIVATE"];
"O_Soldier_lite_F" createUnit [_spawnPos, _group3, "this allowFleeing 0;", 0.5, "PRIVATE"];
[_group3,position nearestBuilding _this,5, 2, false] call CBA_fnc_taskDefend;