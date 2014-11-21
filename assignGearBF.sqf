_typeofUnit = toLower (_this select 0);
_unit = _this select 1;
_typeBackpack = _this select 2;
removeheadgear _unit;
removegoggles _unit;
_glasses = [];
removeBackpack _unit;
removeallweapons _unit;

_unit addItem _firstaid;

_nvg = "NVGoggles";
if(_nvg in (assignedItems _unit)) then
{
    _unit unassignItem _nvg;
    _unit removeItem _nvg;
};

_backpack = {
	_typeofBackPack = _this select 0;
	switch (_typeofBackPack) do
	{
	case "ie":
		{
         if (_typeBackpack > 0) then {
            _backpack = ["B_Carryall_oli","B_Carryall_khk","B_FieldPack_khk"];
            _unit addBackpack (_backpack call BIS_fnc_selectRandom);
            clearMagazineCargoGlobal (unitBackpack _unit);
            (unitBackpack _unit) addMagazineCargoGlobal ["SmokeShell", 6];
            (unitBackpack _unit) addItemCargoGlobal ["Medikit", 1];
            (unitBackpack _unit) addItemCargoGlobal ["FirstAidKit", 12];
         };
		};
	case "ihc":
		{
         if (_typeBackpack > 0) then {
            _backpack = ["B_Carryall_oli","B_Carryall_khk","B_FieldPack_khk"];
            _unit addBackpack (_backpack call BIS_fnc_selectRandom);
            clearMagazineCargoGlobal (unitBackpack _unit);
            (unitBackpack _unit) addMagazineCargoGlobal ["SmokeShell", 3];
            (unitBackpack _unit) addItemCargoGlobal ["ToolKit", 1];
            (unitBackpack _unit) addItemCargoGlobal ["DemoCharge_Remote_Mag", 2];
         };
		};
	case "ihp":
		{
         if (_typeBackpack > 0) then {
            _backpack = ["B_Carryall_oli","B_Carryall_khk","B_FieldPack_khk"];
            _unit addBackpack (_backpack call BIS_fnc_selectRandom);
            clearMagazineCargoGlobal (unitBackpack _unit);
            (unitBackpack _unit) addMagazineCargoGlobal [_mags1, 4];
            (unitBackpack _unit) addMagazineCargoGlobal [_mags2, 4];
            (unitBackpack _unit) addMagazineCargoGlobal ["SmokeShell", 6];
            (unitBackpack _unit) addMagazineCargoGlobal ["SmokeShellGreen", 2];
         };
		};
	case "im":
		{
         if (_typeBackpack > 0) then {
            _backpack = ["B_Carryall_oli","B_Carryall_khk","B_FieldPack_khk"];
            _unit addBackpack (_backpack call BIS_fnc_selectRandom);
            clearMagazineCargoGlobal (unitBackpack _unit);
            (unitBackpack _unit) addMagazineCargoGlobal [_mags3, 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["SmokeShell", 1];
            (unitBackpack _unit) addItemCargoGlobal ["RPG7_OG7V", 1];
            (unitBackpack _unit) addItemCargoGlobal ["RPG7_TBG7V", 1];
         };
		};
	case "io":
		{
         if (_typeBackpack > 0) then {
            _backpack = ["B_Carryall_oli","B_Carryall_khk","B_FieldPack_khk"];
            _unit addBackpack (_backpack call BIS_fnc_selectRandom);
            clearMagazineCargoGlobal (unitBackpack _unit);
            (unitBackpack _unit) addMagazineCargoGlobal ["SmokeShell", 1];
            (unitBackpack _unit) addItemCargoGlobal ["RPG7_OG7V", 2];
            (unitBackpack _unit) addItemCargoGlobal ["RPG7_TBG7V", 2];
         };
		};
	case "ip":
		{
         if (_typeBackpack > 0) then {
            _backpack = ["B_Carryall_oli","B_Carryall_khk","B_FieldPack_khk"];
            _unit addBackpack (_backpack call BIS_fnc_selectRandom);
            clearMagazineCargoGlobal (unitBackpack _unit);
            (unitBackpack _unit) addMagazineCargoGlobal [_mags1, 2];
            (unitBackpack _unit) addMagazineCargoGlobal ["SmokeShell", 6];
         };
		};
	case "iam":
		{
         if (_typeBackpack > 0) then {
            _backpack = ["B_Carryall_oli","B_Carryall_khk","B_FieldPack_khk"];
            _unit addBackpack (_backpack call BIS_fnc_selectRandom);
            clearMagazineCargoGlobal (unitBackpack _unit);
            (unitBackpack _unit) addMagazineCargoGlobal ["SmokeShell", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["100Rnd_762x54_PK", 2];
            (unitBackpack _unit) addMagazineCargoGlobal ["hlc_100Rnd_762x51_B_M60E4", 2];
            (unitBackpack _unit) addItemCargoGlobal ["Medikit", 1];
            (unitBackpack _unit) addItemCargoGlobal ["FirstAidKit", 12];
         };
		};
	case "iar":
		{
         if (_typeBackpack > 0) then {
            _backpack = ["B_Carryall_oli","B_Carryall_khk","B_FieldPack_khk"];
            _unit addBackpack (_backpack call BIS_fnc_selectRandom);
            clearMagazineCargoGlobal (unitBackpack _unit);
            (unitBackpack _unit) addMagazineCargoGlobal ["SmokeShell", 3];
            (unitBackpack _unit) addMagazineCargoGlobal ["10rnd_762x54_SVU107", 7];
         };
		};
	case "iat":
		{
         if (_typeBackpack > 0) then {
            _backpack = ["B_Carryall_oli","B_Carryall_khk","B_FieldPack_khk"];
            _unit addBackpack (_backpack call BIS_fnc_selectRandom);
            clearMagazineCargoGlobal (unitBackpack _unit);
            (unitBackpack _unit) addMagazineCargoGlobal [_mags1, 2];
            (unitBackpack _unit) addMagazineCargoGlobal ["SmokeShell", 6];
         };
		};
	case "ir":
		{
         if (_typeBackpack > 0) then {
            _backpack = ["B_Carryall_oli","B_Carryall_khk","B_FieldPack_khk"];
            _unit addBackpack (_backpack call BIS_fnc_selectRandom);
            clearMagazineCargoGlobal (unitBackpack _unit);
            (unitBackpack _unit) addMagazineCargoGlobal [_mags1, 2];
            (unitBackpack _unit) addMagazineCargoGlobal ["SmokeShell", 6];
         };
		};
	case "ig":
		{
         if (_typeBackpack > 0) then {
            _backpack = ["B_Carryall_oli","B_Carryall_khk","B_FieldPack_khk"];
            _unit addBackpack (_backpack call BIS_fnc_selectRandom);
            clearMagazineCargoGlobal (unitBackpack _unit);
            (unitBackpack _unit) addMagazineCargoGlobal [_mags1, 2];
            (unitBackpack _unit) addMagazineCargoGlobal ["SmokeShell", 6];
         };
		};
	case "ila":
		{
         if (_typeBackpack > 0) then {
            _backpack = ["B_Carryall_oli","B_Carryall_khk","B_FieldPack_khk"];
            _unit addBackpack (_backpack call BIS_fnc_selectRandom);
            clearMagazineCargoGlobal (unitBackpack _unit);
            (unitBackpack _unit) addMagazineCargoGlobal [_mags1, 2];
            (unitBackpack _unit) addMagazineCargoGlobal ["SmokeShell", 6];
         };
		};
	case "irl":
		{
         if (_typeBackpack > 0) then {
            _backpack = ["B_Carryall_oli","B_Carryall_khk","B_FieldPack_khk"];
            _unit addBackpack (_backpack call BIS_fnc_selectRandom);
            clearMagazineCargoGlobal (unitBackpack _unit);
            (unitBackpack _unit) addMagazineCargoGlobal [_mags1, 2];
            (unitBackpack _unit) addMagazineCargoGlobal ["SmokeShell", 6];
         };
		};
	case "imm":
		{
         if (_typeBackpack > 0) then {
            _backpack = ["B_Carryall_oli","B_Carryall_khk","B_FieldPack_khk"];
            _unit addBackpack (_backpack call BIS_fnc_selectRandom);
            clearMagazineCargoGlobal (unitBackpack _unit);
            (unitBackpack _unit) addMagazineCargoGlobal [_mags1, 2];
            (unitBackpack _unit) addMagazineCargoGlobal ["SmokeShell", 6];
         };
		};
	case "ipt":
		{
         if (_typeBackpack > 0) then {
            _backpack = ["B_Carryall_oli","B_Carryall_khk","B_FieldPack_khk"];
            _unit addBackpack (_backpack call BIS_fnc_selectRandom);
            clearMagazineCargoGlobal (unitBackpack _unit);
            (unitBackpack _unit) addMagazineCargoGlobal [_mags1, 2];
            (unitBackpack _unit) addMagazineCargoGlobal ["SmokeShell", 6];
         };
		};
	case "isl":
		{
         if (_typeBackpack > 0) then {
            _backpack = ["B_Carryall_oli","B_Carryall_khk","B_FieldPack_khk"];
            _unit addBackpack (_backpack call BIS_fnc_selectRandom);
            clearMagazineCargoGlobal (unitBackpack _unit);
            (unitBackpack _unit) addMagazineCargoGlobal [_mags1, 2];
            (unitBackpack _unit) addMagazineCargoGlobal ["SmokeShell", 6];
         };
		};
	case "itl":
		{
         if (_typeBackpack > 0) then {
            _backpack = ["B_Carryall_oli","B_Carryall_khk","B_FieldPack_khk"];
            _unit addBackpack (_backpack call BIS_fnc_selectRandom);
            clearMagazineCargoGlobal (unitBackpack _unit);
            (unitBackpack _unit) addMagazineCargoGlobal [_mags1, 2];
            (unitBackpack _unit) addMagazineCargoGlobal ["SmokeShell", 6];
         };
		};
	case "iu":
		{
         if (_typeBackpack > 0) then {
            _backpack = ["B_Carryall_oli","B_Carryall_khk","B_FieldPack_khk"];
            _unit addBackpack (_backpack call BIS_fnc_selectRandom);
            clearMagazineCargoGlobal (unitBackpack _unit);
            (unitBackpack _unit) addMagazineCargoGlobal [_mags1, 2];
            (unitBackpack _unit) addMagazineCargoGlobal ["SmokeShell", 6];
         };
		};
	};
};

switch (_typeofUnit) do
{
	case "ic":
		{
            _uniform = ["U_BG_Guerilla1_1","U_BG_Guerilla2_1","U_BG_Guerilla2_2","U_BG_Guerilla2_3","U_BG_Guerilla3_1","U_BG_Guerilla3_2","MNP_CombatUniform_Militia_E","MNP_CombatUniform_Militia_DA","MNP_CombatUniform_Militia_DC","MNP_CombatUniform_Militia_DF","MNP_CombatUniform_Militia_DB","MNP_CombatUniform_Militia_F","MNP_CombatUniform_Militia_DE","U_C_Poloshirt_blue","U_C_Poloshirt_salmon"];
            _unit forceAddUniform (_uniform call BIS_fnc_selectRandom);
            _helmet = ["H_ShemagOpen_tan","H_Shemag_olive","H_ShemagOpen_khk","Tybeteika_boroda","Povyazka_boroda","Panama_boroda_ochki","Panama_boroda","H_ShemagOpen_tan","H_Shemag_olive","H_ShemagOpen_khk"];
            _unit addheadgear (_helmet call BIS_fnc_selectRandom);
            _vest = ["V_BandollierB_oli","V_HarnessO_blk","V_BandollierB_blk","V_BandollierB_khk","V_HarnessO_brn"];
            _unit addvest (_vest call BIS_fnc_selectRandom);
            _unit addMagazines ["HandGrenade", 1];
            _unit addMagazines ["MiniGrenade", 1];
            _unit addMagazines ["SmokeShell", 1];
            _mags1 = ["hlc_30Rnd_762x39_b_ak","hlc_30Rnd_545x39_B_AK","hlc_30Rnd_762x39_b_ak","hlc_10Rnd_303_B_enfield","hlc_20rnd_762x51_b_G3","hlc_20Rnd_762x51_B_M14","FH_SKS_10Rnd_762x39_Ball","hlc_20Rnd_762x51_B_fal"];
            _weapon = ["hlc_rifle_ak47","hlc_rifle_ak74","hlc_rifle_akm","hlc_rifle_smle","hlc_rifle_g3a3","hlc_rifle_M14","FH_rifle_SKS","hlc_rifle_L1A1SLR"];
            _nr = floor(random(count(_weapon)));
            _weapon = _weapon select _nr;
            _mags1 = _mags1 select _nr;
            _unit addMagazines [_mags1, 4];
            _unit addWeapon _weapon;
		};
	case "ie":
		{
            _unit addMagazines ["HandGrenade", 1];
            _unit addMagazines ["MiniGrenade", 1];
            _unit addMagazines ["SmokeShell", 2];
            _weapon = "Binoculars";
            _unit addWeapon _weapon;
            {_unit addItem "FirstAidKit"} forEach [];
            ["ie"] call _backpack;
		};
	case "ihc":
		{
            _unit addMagazines ["HandGrenade", 1];
            _unit addMagazines ["MiniGrenade", 1];
            _unit addMagazines ["SmokeShell", 2];
            {_unit addItem "MineDetector"} forEach [1];
            ["ihc"] call _backpack;
		};
	case "ihp":
		{
            _unit addItem "NVGoggles";
            _unit assignItem "NVGoggles";
            _unit addMagazines ["HandGrenade", 2];
            _unit addMagazines ["MiniGrenade", 2];
            _unit addMagazines ["SmokeShell", 2];
            _mags1 = ["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag"];
            _weapon = ["RH_m4","av_m4","av_m16a4","hlc_rifle_M16A4","hlc_rifle_m16","RH_M16A4","hlc_rifle_Colt727"];
            _nr = floor(random(count(_weapon)));
            _weapon = _weapon select _nr;
            _mags1 = _mags1 select _nr;
            _unit addMagazines [_mags1, 3];
            _unit addWeapon _weapon;
            _mags2 = ["RH_15Rnd_9x19_M9","RH_7Rnd_45cal_m1911","RH_8Rnd_9x18_Mak","RH_8Rnd_762_tt33"];
            _weapon = ["RH_m9","RH_m1911","RH_mak","RH_tt33"];
            _nr = floor(random(count(_weapon)));
            _weapon = _weapon select _nr;
            _mags2 = _mags2 select _nr;
            _unit addMagazines [_mags2, 2];
            _unit addWeapon _weapon;
            _weapon = "Binoculars";
            _unit addWeapon _weapon;
            _unit addItem "ItemGPS";
            _unit assignItem "ItemGPS";
            ["ihp"] call _backpack;
            _attach = ["optic_MRCO"];
            _wepItems = primaryWeaponItems _unit;
			{
                _unit removePrimaryWeaponItem  _x;
			} foreach _wepItems;
            {
                _unit addPrimaryWeaponItem _x;
            } foreach _attach;
		};
	case "im":
		{
            _unit addMagazines ["HandGrenade", 1];
            _unit addMagazines ["MiniGrenade", 1];
            _unit addMagazines ["SmokeShell", 2];
            ["im"] call _backpack;
            _mags3 = "RPG7_OG7V";
            _weapon = "launch_RPG7V";
            _unit addWeapon _weapon;
		};
	case "io":
		{
            _unit addMagazines ["HandGrenade", 1];
            _unit addMagazines ["MiniGrenade", 1];
            _unit addMagazines ["SmokeShell", 2];
            ["io"] call _backpack;
		};
	case "ip":
		{
            _unit addMagazines ["HandGrenade", 1];
            _unit addMagazines ["MiniGrenade", 1];
            _unit addMagazines ["SmokeShell", 2];
            _mags1 = ["100Rnd_762x54_PK","hlc_100Rnd_762x51_B_M60E4"];
            _weapon = ["LMG_SUD_Pecheneg_M","hlc_lmg_m60"];
            _nr = floor(random(count(_weapon)));
            _weapon = _weapon select _nr;
            _mags1 = _mags1 select _nr;
            _unit addMagazines [_mags1, 2];
            _unit addWeapon _weapon;
            ["ip"] call _backpack;
		};
	case "iam":
		{
            _unit addMagazines ["HandGrenade", 1];
            _unit addMagazines ["MiniGrenade", 1];
            _unit addMagazines ["SmokeShell", 2];
            ["iam"] call _backpack;
		};
	case "iaa":
		{
            _unit addMagazines ["10rnd_762x54_SVU107", 7];
            _unit addMagazines ["HandGrenade", 1];
            _unit addMagazines ["MiniGrenade", 1];
            _unit addMagazines ["SmokeShell", 2];
            _weapon = "srifle_SUD_SVD_PSO1";
            _unit addWeapon _weapon;
		};
	case "iar":
		{
            _unit addMagazines ["HandGrenade", 1];
            _unit addMagazines ["MiniGrenade", 1];
            _unit addMagazines ["SmokeShell", 2];
            _weapon = "Binoculars";
            _unit addWeapon _weapon;
            ["iar"] call _backpack;
		};
	case "iat":
		{
            _unit addMagazines ["HandGrenade", 1];
            _unit addMagazines ["MiniGrenade", 1];
            _unit addMagazines ["SmokeShell", 2];
            _mags1 = ["100Rnd_762x54_PK","hlc_100Rnd_762x51_B_M60E4"];
            _weapon = ["LMG_SUD_Pecheneg_M","hlc_lmg_m60"];
            _nr = floor(random(count(_weapon)));
            _weapon = _weapon select _nr;
            _mags1 = _mags1 select _nr;
            _unit addMagazines [_mags1, 2];
            _unit addWeapon _weapon;
            ["iat"] call _backpack;
		};
	case "ir":
		{
            _unit addMagazines ["HandGrenade", 1];
            _unit addMagazines ["MiniGrenade", 1];
            _unit addMagazines ["SmokeShell", 2];
            _mags1 = ["100Rnd_762x54_PK","hlc_100Rnd_762x51_B_M60E4"];
            _weapon = ["LMG_SUD_Pecheneg_M","hlc_lmg_m60"];
            _nr = floor(random(count(_weapon)));
            _weapon = _weapon select _nr;
            _mags1 = _mags1 select _nr;
            _unit addMagazines [_mags1, 2];
            _unit addWeapon _weapon;
            ["ir"] call _backpack;
		};
	case "ig":
		{
            _unit addMagazines ["HandGrenade", 1];
            _unit addMagazines ["MiniGrenade", 1];
            _unit addMagazines ["SmokeShell", 2];
            _mags1 = ["100Rnd_762x54_PK","hlc_100Rnd_762x51_B_M60E4"];
            _weapon = ["LMG_SUD_Pecheneg_M","hlc_lmg_m60"];
            _nr = floor(random(count(_weapon)));
            _weapon = _weapon select _nr;
            _mags1 = _mags1 select _nr;
            _unit addMagazines [_mags1, 2];
            _unit addWeapon _weapon;
            ["ig"] call _backpack;
		};
	case "ila":
		{
            _unit addMagazines ["HandGrenade", 1];
            _unit addMagazines ["MiniGrenade", 1];
            _unit addMagazines ["SmokeShell", 2];
            _mags1 = ["100Rnd_762x54_PK","hlc_100Rnd_762x51_B_M60E4"];
            _weapon = ["LMG_SUD_Pecheneg_M","hlc_lmg_m60"];
            _nr = floor(random(count(_weapon)));
            _weapon = _weapon select _nr;
            _mags1 = _mags1 select _nr;
            _unit addMagazines [_mags1, 2];
            _unit addWeapon _weapon;
            ["ila"] call _backpack;
		};
	case "irl":
		{
            _unit addMagazines ["HandGrenade", 1];
            _unit addMagazines ["MiniGrenade", 1];
            _unit addMagazines ["SmokeShell", 2];
            _mags1 = ["100Rnd_762x54_PK","hlc_100Rnd_762x51_B_M60E4"];
            _weapon = ["LMG_SUD_Pecheneg_M","hlc_lmg_m60"];
            _nr = floor(random(count(_weapon)));
            _weapon = _weapon select _nr;
            _mags1 = _mags1 select _nr;
            _unit addMagazines [_mags1, 2];
            _unit addWeapon _weapon;
            ["irl"] call _backpack;
		};
	case "imm":
		{
            _unit addMagazines ["HandGrenade", 1];
            _unit addMagazines ["MiniGrenade", 1];
            _unit addMagazines ["SmokeShell", 2];
            _mags1 = ["100Rnd_762x54_PK","hlc_100Rnd_762x51_B_M60E4"];
            _weapon = ["LMG_SUD_Pecheneg_M","hlc_lmg_m60"];
            _nr = floor(random(count(_weapon)));
            _weapon = _weapon select _nr;
            _mags1 = _mags1 select _nr;
            _unit addMagazines [_mags1, 2];
            _unit addWeapon _weapon;
            ["imm"] call _backpack;
		};
	case "ipt":
		{
            _unit addMagazines ["HandGrenade", 1];
            _unit addMagazines ["MiniGrenade", 1];
            _unit addMagazines ["SmokeShell", 2];
            _mags1 = ["100Rnd_762x54_PK","hlc_100Rnd_762x51_B_M60E4"];
            _weapon = ["LMG_SUD_Pecheneg_M","hlc_lmg_m60"];
            _nr = floor(random(count(_weapon)));
            _weapon = _weapon select _nr;
            _mags1 = _mags1 select _nr;
            _unit addMagazines [_mags1, 2];
            _unit addWeapon _weapon;
            ["ipt"] call _backpack;
		};
	case "isl":
		{
            _unit addMagazines ["HandGrenade", 1];
            _unit addMagazines ["MiniGrenade", 1];
            _unit addMagazines ["SmokeShell", 2];
            _mags1 = ["100Rnd_762x54_PK","hlc_100Rnd_762x51_B_M60E4"];
            _weapon = ["LMG_SUD_Pecheneg_M","hlc_lmg_m60"];
            _nr = floor(random(count(_weapon)));
            _weapon = _weapon select _nr;
            _mags1 = _mags1 select _nr;
            _unit addMagazines [_mags1, 2];
            _unit addWeapon _weapon;
            ["isl"] call _backpack;
		};
	case "itl":
		{
            _unit addMagazines ["HandGrenade", 1];
            _unit addMagazines ["MiniGrenade", 1];
            _unit addMagazines ["SmokeShell", 2];
            _mags1 = ["100Rnd_762x54_PK","hlc_100Rnd_762x51_B_M60E4"];
            _weapon = ["LMG_SUD_Pecheneg_M","hlc_lmg_m60"];
            _nr = floor(random(count(_weapon)));
            _weapon = _weapon select _nr;
            _mags1 = _mags1 select _nr;
            _unit addMagazines [_mags1, 2];
            _unit addWeapon _weapon;
            ["itl"] call _backpack;
		};
	case "iu":
		{
            _unit addMagazines ["HandGrenade", 1];
            _unit addMagazines ["MiniGrenade", 1];
            _unit addMagazines ["SmokeShell", 2];
            _mags1 = ["100Rnd_762x54_PK","hlc_100Rnd_762x51_B_M60E4"];
            _weapon = ["LMG_SUD_Pecheneg_M","hlc_lmg_m60"];
            _nr = floor(random(count(_weapon)));
            _weapon = _weapon select _nr;
            _mags1 = _mags1 select _nr;
            _unit addMagazines [_mags1, 2];
            _unit addWeapon _weapon;
            ["iu"] call _backpack;
		};
};
_unit selectweapon primaryWeapon _unit;
