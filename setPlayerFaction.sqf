
if ((_this == "us") then 
{
	{
		switch (typeof _x) do 
		{
			case "B_crew_F": {["uc",_x,1] call bg_fnc_initloadouts};
			case "B_engineer_F": {["ue",_x,1] call bg_fnc_initloadouts};
			case "B_helicrew_F": {["uhc",_x,1] call bg_fnc_initloadouts};
			case "B_Helipilot_F": {["uhp",_x,1] call bg_fnc_initloadouts};
			case "B_medic_F": {["um",_x,1] call bg_fnc_initloadouts};
			case "B_officer_F": {["uo",_x,1] call bg_fnc_initloadouts};
			case "B_Pilot_F": {["up",_x,1] call bg_fnc_initloadouts};
			case "B_Soldier_A_F": {["uam",_x,1] call bg_fnc_initloadouts};
			case "B_soldier_AA_F": {["uaa",_x,1] call bg_fnc_initloadouts};
			case "B_soldier_AR_F": {["uar",_x,1] call bg_fnc_initloadouts};
			case "B_soldier_AT_F": {["uat",_x,1] call bg_fnc_initloadouts};
			case "B_Soldier_F": {["ur",_x,1] call bg_fnc_initloadouts};
			case "B_Soldier_GL_F": {["ug",_x,1] call bg_fnc_initloadouts};
			case "B_soldier_LAT_F": {["ula",_x,1] call bg_fnc_initloadouts};
			case "B_Soldier_lite_F": {["url",_x,1] call bg_fnc_initloadouts};
			case "B_soldier_M_F": {["umm",_x,1] call bg_fnc_initloadouts};
			case "B_soldier_PG_F": {["upt",_x,1] call bg_fnc_initloadouts};
			case "B_Soldier_SL_F": {["usl",_x,1] call bg_fnc_initloadouts};
			case "B_Soldier_TL_F": {["utl",_x,1] call bg_fnc_initloadouts};
			case "B_soldier_UAV_F": {["uu",_x,1] call bg_fnc_initloadouts};
		};
	} foreach (unitsblue);
	
} else 
if (_this == "ru") then 
{
	{
		switch (typeof _x) do 
		{
			case "B_crew_F": {["rc",_x,1] call bg_fnc_initloadouts};
			case "B_engineer_F": {["re",_x,1] call bg_fnc_initloadouts};
			case "B_helicrew_F": {["rhc",_x,1] call bg_fnc_initloadouts};
			case "B_Helipilot_F": {["rhp",_x,1] call bg_fnc_initloadouts};
			case "B_medic_F": {["rm",_x,1] call bg_fnc_initloadouts};
			case "B_officer_F": {["ro",_x,1] call bg_fnc_initloadouts};
			case "B_Pilot_F": {["rp",_x,1] call bg_fnc_initloadouts};
			case "B_Soldier_A_F": {["ram",_x,1] call bg_fnc_initloadouts};
			case "B_soldier_AA_F": {["raa",_x,1] call bg_fnc_initloadouts};
			case "B_soldier_AR_F": {["rar",_x,1] call bg_fnc_initloadouts};
			case "B_soldier_AT_F": {["rat",_x,1] call bg_fnc_initloadouts};
			case "B_Soldier_F": {["rr",_x,1] call bg_fnc_initloadouts};
			case "B_Soldier_GL_F": {["rg",_x,1] call bg_fnc_initloadouts};
			case "B_soldier_LAT_F": {["rla",_x,1] call bg_fnc_initloadouts};
			case "B_Soldier_lite_F": {["rrl",_x,1] call bg_fnc_initloadouts};
			case "B_soldier_M_F": {["rmm",_x,1] call bg_fnc_initloadouts};
			case "B_soldier_PG_F": {["rpt",_x,1] call bg_fnc_initloadouts};
			case "B_Soldier_SL_F": {["rsl",_x,1] call bg_fnc_initloadouts};
			case "B_Soldier_TL_F": {["rtl",_x,1] call bg_fnc_initloadouts};
			case "B_soldier_UAV_F": {["ru",_x,1] call bg_fnc_initloadouts};
		};
	} foreach (unitsblue);
	
} else 
if (_this == "nk") then 
{
	{
		switch (typeof _x) do 
		{
			case "B_crew_F": {["nc",_x,1] call bg_fnc_initloadouts};
			case "B_engineer_F": {["ne",_x,1] call bg_fnc_initloadouts};
			case "B_helicrew_F": {["nhc",_x,1] call bg_fnc_initloadouts};
			case "B_Helipilot_F": {["nhp",_x,1] call bg_fnc_initloadouts};
			case "B_medic_F": {["nm",_x,1] call bg_fnc_initloadouts};
			case "B_officer_F": {["no",_x,1] call bg_fnc_initloadouts};
			case "B_Pilot_F": {["np",_x,1] call bg_fnc_initloadouts};
			case "B_Soldier_A_F": {["nam",_x,1] call bg_fnc_initloadouts};
			case "B_soldier_AA_F": {["naa",_x,1] call bg_fnc_initloadouts};
			case "B_soldier_AR_F": {["nar",_x,1] call bg_fnc_initloadouts};
			case "B_soldier_AT_F": {["nat",_x,1] call bg_fnc_initloadouts};
			case "B_Soldier_F": {["nr",_x,1] call bg_fnc_initloadouts};
			case "B_Soldier_GL_F": {["ng",_x,1] call bg_fnc_initloadouts};
			case "B_soldier_LAT_F": {["nla",_x,1] call bg_fnc_initloadouts};
			case "B_Soldier_lite_F": {["nrl",_x,1] call bg_fnc_initloadouts};
			case "B_soldier_M_F": {["nmm",_x,1] call bg_fnc_initloadouts};
			case "B_soldier_PG_F": {["npt",_x,1] call bg_fnc_initloadouts};
			case "B_Soldier_SL_F": {["nsl",_x,1] call bg_fnc_initloadouts};
			case "B_Soldier_TL_F": {["ntl",_x,1] call bg_fnc_initloadouts};
			case "B_soldier_UAV_F": {["nu",_x,1] call bg_fnc_initloadouts};
		};
	} foreach (unitsblue);
	
} else 
{
	{
		switch (typeof _x) do 
		{
			case "B_crew_F": {["ic",_x,1] call bg_fnc_initloadouts};
			case "B_engineer_F": {["ie",_x,1] call bg_fnc_initloadouts};
			case "B_helicrew_F": {["ihc",_x,1] call bg_fnc_initloadouts};
			case "B_Helipilot_F": {["ihp",_x,1] call bg_fnc_initloadouts};
			case "B_medic_F": {["im",_x,1] call bg_fnc_initloadouts};
			case "B_officer_F": {["io",_x,1] call bg_fnc_initloadouts};
			case "B_Pilot_F": {["ip",_x,1] call bg_fnc_initloadouts};
			case "B_Soldier_A_F": {["iam",_x,1] call bg_fnc_initloadouts};
			case "B_soldier_AA_F": {["iaa",_x,1] call bg_fnc_initloadouts};
			case "B_soldier_AR_F": {["iar",_x,1] call bg_fnc_initloadouts};
			case "B_soldier_AT_F": {["iat",_x,1] call bg_fnc_initloadouts};
			case "B_Soldier_F": {["ir",_x,1] call bg_fnc_initloadouts};
			case "B_Soldier_GL_F": {["ig",_x,1] call bg_fnc_initloadouts};
			case "B_soldier_LAT_F": {["ila",_x,1] call bg_fnc_initloadouts};
			case "B_Soldier_lite_F": {["irl",_x,1] call bg_fnc_initloadouts};
			case "B_soldier_M_F": {["imm",_x,1] call bg_fnc_initloadouts};
			case "B_soldier_PG_F": {["ipt",_x,1] call bg_fnc_initloadouts};
			case "B_Soldier_SL_F": {["isl",_x,1] call bg_fnc_initloadouts};
			case "B_Soldier_TL_F": {["itl",_x,1] call bg_fnc_initloadouts};
			case "B_soldier_UAV_F": {["iu",_x,1] call bg_fnc_initloadouts};
		};
	} foreach (unitsblue);
	
};
