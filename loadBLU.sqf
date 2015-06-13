_typeofUnit = toLower (_this select 0);
_unit = _this select 1;

// Remove all items
removeAllWeapons _unit; 

// Standard gear
for "_i" from 1 to 3 do {_unit addItem "FirstAidKit";}; // 6 bandages
_unit addMagazines ["rhs_mag_m67",3]; // 3 frags
_unit addMagazines ["rhs_mag_mk84",1]; // 1 stun
_unit addMagazines ["SmokeShell",2]; // 2 smokes

// Remove night vision
/*_nvg = ["NVGoggles","NVGoggles_OPFOR","NVGoggles_INDEP","rhsusf_ANPVS_14"];
{
	if(_x in (assignedItems _unit)) then
	{
		_unit unassignItem _x;
		_unit removeItem _x;
	};
} forEach _nvg;*/

switch (_typeofUnit) do
{
	// LOADOUT: USMC RIFLEMAN
		case "mr":
		{
			
			comment "Add containers";
			_unit forceAddUniform "Niko_USA_MARPAT";
			_unit addItemToUniform "AGM_Morphine";
			for "_i" from 1 to 6 do {_unit addItemToUniform "AGM_Bandage";};
			_unit addVest "V_PlateCarrier1_PMC_marpat";
			for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m67";};
			for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
			for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_mk84";};
			_unit addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";
			_unit addBackpack "B_Kitbag_rgr";
			for "_i" from 1 to 20 do {_unit addItemToBackpack "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
			_unit addHeadgear "Niko_MICH_MARPAT";

			comment "Add weapons";
			_unit addWeapon "rhs_weap_m16a4";
			_unit addPrimaryWeaponItem "RH_t1";
			_unit addItem "ACRE_PRC343";

		};
		
		// LOADOUT: USMC MEDIC
		case "mm":
		{
			comment "Add containers";
			_unit forceAddUniform "Niko_USA_MARPAT";
			_unit addItemToUniform "AGM_Morphine";
			for "_i" from 1 to 6 do {_unit addItemToUniform "AGM_Bandage";};
			_unit addVest "V_PlateCarrier1_PMC_marpat";
			for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m67";};
			for "_i" from 1 to 4 do {_unit addItemToVest "SmokeShell";};
			_unit addBackpack "B_Kitbag_rgr";
			for "_i" from 1 to 10 do {_unit addItemToBackpack "AGM_Epipen";};
			for "_i" from 1 to 20 do {_unit addItemToBackpack "AGM_Morphine";};
			for "_i" from 1 to 20 do {_unit addItemToBackpack "AGM_Bandage";};
			for "_i" from 1 to 2 do {_unit addItemToBackpack "AGM_Bloodbag";};
			for "_i" from 1 to 14 do {_unit addItemToBackpack "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
			_unit addHeadgear "Niko_MICH_MARPAT";

			comment "Add weapons";
			_unit addWeapon "rhs_weap_m16a4";
			_unit addPrimaryWeaponItem "RH_t1";
			_unit addItem "ACRE_PRC343";
		};
		
		// LOADOUT: USMC GRENADIER
		case "mg":
		{
			comment "Add containers";
			_unit forceAddUniform "Niko_USA_MARPAT";
			_unit addItemToUniform "AGM_Morphine";
			for "_i" from 1 to 6 do {_unit addItemToUniform "AGM_Bandage";};
			_unit addVest "V_PlateCarrier1_PMC_marpat";
			for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
			for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m67";};
			for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_mk84";};
			for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_M433_HEDP";};
			for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m714_White";};
			_unit addBackpack "B_Kitbag_rgr";
			for "_i" from 1 to 14 do {_unit addItemToBackpack "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
			_unit addHeadgear "Niko_MICH_MARPAT";
			
			comment "Add weapons";
			_unit addWeapon "rhs_weap_m16a4_carryhandle_M203";
			_unit addPrimaryWeaponItem "RH_t1";
			_unit addItem "ACRE_PRC343";
		};
		
		// LOADOUT: USMC SQUAD LEADER
		case "msl":
		{
			comment "Add containers";
			_unit forceAddUniform "Niko_USA_MARPAT";
			_unit addItemToUniform "AGM_Morphine";
			for "_i" from 1 to 6 do {_unit addItemToUniform "AGM_Bandage";};
			for "_i" from 1 to 3 do {_unit addItemToUniform "RH_15Rnd_9x19_M9";};
			_unit addVest "V_PlateCarrier1_PMC_marpat";
			for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_M433_HEDP";};
			for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m713_Red";};
			for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m715_Green";};
			for "_i" from 1 to 9 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
			for "_i" from 1 to 3 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";};
			_unit addBackpack "B_Kitbag_rgr";
			_unit addHeadgear "Niko_MICH_MARPAT";
			
			comment "Add weapons";
			_unit addWeapon "rhs_weap_m16a4_carryhandle_M203";
			_unit addPrimaryWeaponItem "RH_t1";
			_unit addWeapon "RH_m9";
			_unit addWeapon "Binocular";
			_unit addItem "ACRE_PRC148";
			for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m67";};
			_unit addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";
			_unit addItem "ACRE_PRC343";
			
		};
		
		// LOADOUT: USMC TEAM LEADER
		case "mtl":
		{
			comment "Add containers";
			_unit forceAddUniform "Niko_USA_MARPAT";
			_unit addItemToUniform "AGM_Morphine";
			for "_i" from 1 to 6 do {_unit addItemToUniform "AGM_Bandage";};
			for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
			_unit addVest "V_PlateCarrier1_PMC_marpat";
			for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_M433_HEDP";};
			for "_i" from 1 to 4 do {_unit addItemToVest "rhs_mag_m714_White";};
			for "_i" from 1 to 10 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
			for "_i" from 1 to 3 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";};
			_unit addBackpack "B_Kitbag_rgr";
			_unit addHeadgear "Niko_MICH_MARPAT";
			
			comment "Add weapons";
			_unit addWeapon "rhs_weap_m16a4_carryhandle_M203";
			_unit addPrimaryWeaponItem "RH_t1";
			_unit addWeapon "Binocular";
			_unit addItem "ACRE_PRC148";
			_unit addItem "ACRE_PRC343";

		};
		
		// LOADOUT: USMC MARKSMAN
		case "mmm":
		{
			comment "Add containers";
			_unit forceAddUniform "Niko_USA_MARPAT";
			_unit addItemToUniform "AGM_Morphine";
			for "_i" from 1 to 6 do {_unit addItemToUniform "AGM_Bandage";};
			_unit addVest "V_PlateCarrier1_PMC_marpat";
			for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m67";};
			for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
			for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_mk84";};
			_unit addBackpack "B_Kitbag_rgr";
			for "_i" from 1 to 14 do {_unit addItemToBackpack "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
			_unit addHeadgear "Niko_MICH_MARPAT";

			comment "Add weapons";
			_unit addWeapon "rhs_weap_m16a4_grip";
			_unit addPrimaryWeaponItem "RH_ta31rco";
			_unit addItem "ACRE_PRC343";
		};
		
		// LOADOUT: USMC AUTORIFLEMAN
		case "mar":
		{
			comment "Add containers";
			_unit forceAddUniform "Niko_USA_MARPAT";
			for "_i" from 1 to 6 do {_unit addItemToUniform "AGM_Bandage";};
			_unit addItemToUniform "AGM_Morphine";
			for "_i" from 1 to 3 do {_unit addItemToUniform "RH_15Rnd_9x19_M9";};
			_unit addVest "V_PlateCarrier1_PMC_marpat";
			for "_i" from 1 to 4 do {_unit addItemToVest "rhsusf_100Rnd_556x45_soft_pouch";};
			_unit addHeadgear "Niko_MICH_MARPAT";

			comment "Add weapons";
			_unit addWeapon "rhs_weap_m249_pip";
			_unit addWeapon "RH_m9";
			_unit addItem "ACRE_PRC343";

			_unit addItemToVest "rhsusf_100Rnd_556x45_soft_pouch";
		};
		
		// LOADOUT: USMC AUTORIFLEMAN ASSIST.
		case "mam":
		{
			comment "Add containers";
			_unit forceAddUniform "Niko_USA_MARPAT";
			for "_i" from 1 to 6 do {_unit addItemToUniform "AGM_Bandage";};
			_unit addItemToUniform "AGM_Morphine";
			for "_i" from 1 to 3 do {_unit addItemToUniform "RH_15Rnd_9x19_M9";};
			_unit addVest "V_PlateCarrier1_PMC_marpat";
			_unit addItemToVest "rhs_mag_m67";
			for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_mk84";};
			for "_i" from 1 to 12 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
			_unit addBackpack "B_Kitbag_rgr";
			for "_i" from 1 to 4 do {_unit addItemToBackpack "rhsusf_100Rnd_556x45_soft_pouch";};
			_unit addHeadgear "Niko_MICH_MARPAT";

			comment "Add weapons";
			_unit addWeapon "rhs_weap_m16a4";
			_unit addPrimaryWeaponItem "RH_t1";
			_unit addWeapon "RH_m9";
			_unit addItem "ACRE_PRC343";
		};
		
		// LOADOUT: USMC LAT
		case "mat":
		{
			
			comment "Add containers";
			_unit forceAddUniform "Niko_USA_MARPAT";
			for "_i" from 1 to 6 do {_unit addItemToUniform "AGM_Bandage";};
			_unit addItemToUniform "AGM_Morphine";
			for "_i" from 1 to 3 do {_unit addItemToUniform "RH_15Rnd_9x19_M9";};
			_unit addVest "V_PlateCarrier1_PMC_marpat";
			_unit addItemToVest "rhs_mag_m67";
			for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_mk84";};
			for "_i" from 1 to 12 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
			_unit addHeadgear "Niko_MICH_MARPAT";

			comment "Add weapons";
			_unit addWeapon "rhs_weap_m16a4";
			_unit addPrimaryWeaponItem "RH_t1";
			_unit addWeapon "av_at4";
			_unit addWeapon "RH_m9";
			_unit addItem "ACRE_PRC343";

		};
};
_unit selectweapon primaryWeapon _unit;
