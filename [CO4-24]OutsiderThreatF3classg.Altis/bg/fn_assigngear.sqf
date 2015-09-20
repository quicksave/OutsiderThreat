private ["_unit"];
_unit = (_this select 1);

// Depending on locality the script decides if it should run
if !(local _unit) exitWith {};

scopename "main";

//init vars
private
[
	"_faction","_typeofUnit", "_unitsidestring", "_sideexists", "_factionexists", "_typeexists",
	"_uniform", "_helmet", "_vest", "_pack", "_facewear", "_goggles", "_map", "_terminal", "_radio", "_compass", "_watch",
	"_mags", "_meditems", "_items", "_packitems", "_packmags",
	"_primary", "_primaryfinal","_primaryattach", "_secondary", "_secondaryfinal","_secondaryattach", "_handgun", "_handgunfinal","_handgunattach", "_binos", "_binosfinal",
	"_weapons1", "_weapons2", "_weapons3", "_mags1", "_mags2", "_mags3", "_items1", "_items2", "_items3", "_packs1", "_packs2", "_packs3",
	"_gearvalue", "_gearname", "_classtype", "_wtc", "_logstr",
	"_properties", "_classes"
];

_logstr = "";
_typeofUnit = toLower (_this select 0);
_faction = toLower (faction _unit);
_unitSidestring = tolower (str(side _unit));

//diag_log "___________________________________________";
//diag_log format["Gearing ""%1"": %2, %3", _unit, _unitsidestring, _faction];
_logstr = _logstr + format["Gearing <%1>: ", _unit];

// ============================================================================================

// A public variable is set on the unit, indicating their type. This is mostly relevant for the F3 respawn component
_unit setVariable ["f_var_assignGear",_typeofUnit,true];

// This variable simply tracks the progress of the gear assignation process, for other scripts to reference.
_unit setVariable ["f_var_assignGear_done",false,true];

// Prevent BIS Randomisation System
_unit setVariable ["BIS_enableRandomization", false];

// ============================================================================================

// optional third argument to set faction
if(count _this > 2) then
{
	_faction = toLower (_this select 2);
	
	// faction aliases because
	switch (_faction) do
	{
		default {};
		case ("breakout") : {breakout "main"};
		case ("nato") : {_faction = "blu_f"};
		case ("csat") : {_faction = "opf_f"};
		case ("fia") : {_faction = "blu_g_f"};
		case ("aaf") : {_faction = "ind_f"};
		case ("civ") : {_faction = "civ_f"};
		case ("usarmyocp") : {_faction = "rhs_faction_usarmy_d"};
		case ("usarmyucp") : {_faction = "rhs_faction_usarmy_wd"};
		case ("rus") : {_faction = "rhs_faction_msv"};
	};
};
// if third argument is given, unit gets that faction's gear regardless of side
// empty vehicles need this because they init as side CIV
// always include a faction when calling function on a crate. otherwise their faction is "Default"
if ( (count _this > 2) || (!(_unit iskindof "man") && (_unitsidestring == "civ" && _faction != "civ_f")) ) then
{
	if !(isclass (missionconfigfile >> "bg_loadout_define" >> _unitsidestring >> _faction)) then
	{
		{
			if (isclass (missionconfigfile >> "bg_loadout_define" >> _x >> _faction)) exitwith
			{
				_unitsidestring = _x;
			};
		} foreach ["west", "east", "guer", "civ"];
	};
};

// ============================================================================================

//defaulting
_sideexists = isclass (missionconfigfile >> "bg_loadout_define" >> _unitSidestring);
_factionexists = isclass (missionconfigfile >> "bg_loadout_define" >> _unitSidestring >> _faction);
_typeexists = isclass (missionconfigfile >> "bg_loadout_define" >> _unitSidestring >> _faction >> _typeofunit);

//diag_log format ["%1: %2 >> %3 >> %4 requested", _unit, _unitsidestring, _faction, _typeofunit];
_logstr = _logstr + format ["%2 >> %3 >> %4 req, ", _unit, _unitsidestring, _faction, _typeofunit];

if !(_sideexists) then
{
	_unitsidestring = "side";
};
if !(_factionexists) then
{
	_faction = configname ((missionconfigfile >> "bg_loadout_define" >> _unitsidestring) select 0);
};
if !(_typeexists) then
{
	_typeofunit = configname ((missionconfigfile >> "bg_loadout_define" >> _unitsidestring >> _faction) select 0);
};

//diag_log format ["%1: %2 >> %3 >> %4 final", _unit, _unitsidestring, _faction, _typeofunit];
_logstr = _logstr + format ["%2 >> %3 >> %4 fin. ", _unit, _unitsidestring, _faction, _typeofunit];

// ============================================================================================

//vars

// generates vars from description.ext

_gearvalue = "";
_gearname = "";
_properties = [];
_classes = [];

// for the selected lodaout, collect property names in one array, class names in another
{
	_properties pushback _x;
} foreach configproperties [missionconfigfile >> "bg_loadout_define" >> _unitsidestring >> _faction >> _typeofunit, "!isclass _x"];

{
	_classes pushback _x;
} foreach configproperties [missionconfigfile >> "bg_loadout_define" >> _unitsidestring >> _faction >> _typeofunit, "isclass _x"];

// use the collected property names to define variables of the same name
{
	if (isarray (_x)) then
	{
		_gearValue = str getarray _x;
	};
	if (istext (_x)) then
	{
		_gearValue = str gettext _x;
	};
	_code = format ["_%1 = %2", configname _x, _gearValue];
	call compile _code;
} foreach _properties;


// sort weapon classes
_primary = [];
_handgun = [];
_secondary = [];
{
	switch (getNumber (configFile >> "cfgWeapons" >> gettext (_x >> "wepname") >> "type")) do
	{
		default {diag_log format ["bgassigngear: class %1 not primary, handgun, or secondary", configname _x];};
		case (1) : {_primary pushback _x};
		case (2) : {_handgun pushback _x};
		case (4) : {_secondary pushback _x};
	};
} foreach _classes;
{
	if (str _x == "[]") then
	{
		_wtc = _x;
		_wtc set [0, (missionconfigfile >> "bg_loadout_define" >> "weapon")];
	};
} foreach [_primary,_handgun,_secondary];

// ============================================================================================

//commands

//crates and vehicles
if !(_unit iskindof "man") then
{
	//clear crate/vehicle
	clearWeaponCargoGlobal _unit;
	clearMagazineCargoGlobal _unit;
	clearItemCargoGlobal _unit;
	clearBackpackCargoGlobal _unit;
	
	// add weapons
	{
		{
			_unit addweaponcargoglobal _x;
		} foreach _x;
	} foreach [_weapons1, _weapons2, _weapons3];
	
	// add mags
	{
		{
			_unit addmagazinecargoglobal _x;
		} foreach _x;
	} foreach [_mags1, _mags2, _mags3];
	
	// add items
	{
		{
			_unit additemcargoglobal _x;
		} foreach _x;
	} foreach [_items1, _items2, _items3];
	
	// add packs
	{
		{
			_unit addbackpackcargoglobal _x;
		} foreach _x;
	} foreach [_packs1, _packs2, _packs3];
	
	//diag_log format ["crate/veh inventory: %1", _weapons1 + _weapons2 + _weapons3 +_mags1 + _mags2 + _mags3 + _items1 + _items2 + _items3 + _packs1 + _packs2 + _packs3 - ["",0]];
	//_logstr = _logstr + format ["crate/veh inventory: %1", _weapons1 + _weapons2 + _weapons3 +_mags1 + _mags2 + _mags3 + _items1 + _items2 + _items3 + _packs1 + _packs2 + _packs3 - ["",0]];
}

//men
else
{
	//few randomization needfuls
	//bis fnc selectrandom doesnt work on arrays of config paths???
	_primaryfinal = _primary select floor(random (count _primary));
	_secondaryfinal = _secondary select floor(random (count _secondary));
	_handgunfinal = _handgun select floor(random (count _handgun));
	_binosfinal = _binos call bis_fnc_selectrandom;
	diag_log format [" %1, %2, %3 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ %4, %5, %6",_primary,_secondary,_handgun,_primaryfinal,_secondaryfinal,_handgunfinal];
	
	//diag_log format ["weapons: <%1>, <%2>, <%3>, <%4>",	(_primaryfinal select 0), (_secondaryfinal select 0),(_handgunfinal select 0), _binosfinal];
	//_logstr = _logstr + format ["weapons: %1, %2, %3, %4. ",	(_primaryfinal select 0), (_secondaryfinal select 0),(_handgunfinal select 0), _binosfinal];
	
	//attachments
	// -attach properties override attachments set in weapon property
	// to override to no attachments, define -attach property as {{""}}
	// property must be {{"none"}} for weapon property attachments to apply
	// attachment element in weapon property is optional
	/*
	{
		if ((gettext (_x >> "wepname") == "[[""none""]]" && count([_primaryfinal, _secondaryfinal, _handgunfinal] select _foreachindex) > 2) then
		{
			//_x = +([_primaryfinal, _secondaryfinal, _handgunfinal] select _foreachindex select 2);
			//[_primaryattach, _secondaryattach, _handgunattach] set [_foreachindex, +([_primaryfinal, _secondaryfinal, _handgunfinal] select _foreachindex select 2)];
			//neither of those  work but this does??
			_wtc = _x;
			{
				(_wtc) set [_foreachindex, (_x)];
			} foreach (([_primaryfinal, _secondaryfinal, _handgunfinal] select _foreachindex) select 2);
		};
	} foreach [_primaryattach, _secondaryattach, _handgunattach];
	*/
	
	//diag_log format ["Pattach %1, Sattach %2, Hattach %3",_primaryattach, _secondaryattach, _handgunattach];
	//_logstr = _logstr + format ["Pattach %1, Sattach %2, Hattach %3",_primaryattach, _secondaryattach, _handgunattach];
	
	//clear unit
	removeBackpack _unit;
	removeAllWeapons _unit;
	removeAllItemsWithMagazines _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeHeadgear _unit;
	removegoggles _unit;
	removeVest _unit;

	//add containers
	_unit forceadduniform (_uniform call bis_fnc_selectrandom);
	_unit addheadgear (_helmet call bis_fnc_selectrandom);
	_unit addvest (_vest call bis_fnc_selectrandom);
	_unit addgoggles (_facewear call bis_fnc_selectrandom);
	_unit addbackpack (_pack call bis_fnc_selectrandom);
	clearMagazineCargoGlobal (unitBackpack _unit);

	//linkables
	{_unit linkitem _x} foreach [_map, _compass, _watch, _radio, _terminal, (_goggles call bis_fnc_selectrandom)];

	//items in backpack
	{
		(unitBackpack _unit) addItemCargoGlobal _x;
	} foreach _packitems;

	//medical items
	{
		for "_i" from 1 to (_x select 1) do
		{
			_unit additem (_x select 0);
		};
	} foreach _meditems;

	//general items
	{
		for "_i" from 1 to (_x select 1) do
		{
			_unit additem (_x select 0);
		};
	} foreach _items;
	
	//binos
	_unit addweapon _binosfinal;
	
	//default mag + weapon
	{
		_unit addmagazine (gettext (_x >> "defmag"));
		_unit addmagazine (gettext (_x >> "defglmag"));
		_unit addweapon (gettext (_x >> "wepname"));
	} foreach [_primaryfinal,_secondaryfinal,_handgunfinal];
	
	//additional mags
	{
		_unit addmagazines [gettext (_x >> "defmag"),getnumber (_x >> "extradefmags")];
		_unit addmagazines [gettext (_x >> "defglmag"),getnumber (_x >> "extradefglmags")];
		{
			_unit addmagazines _x;
		} foreach getarray (_x >> "addmags");
	} foreach [_primaryfinal,_secondaryfinal,_handgunfinal];
	{
		_unit addmagazines _x;
	} foreach _mags;
	
	/*
	//weapons
	{
		_unit addweapon (gettext (_x >> "wepname"));
	} foreach [_primaryfinal,_secondaryfinal,_handgunfinal];
	

	//attachments
	{
		_unit addprimaryweaponitem _x;
	} foreach (_primaryattach call bis_fnc_selectrandom);
	{
		_unit addsecondaryweaponitem _x;
	} foreach (_secondaryattach call bis_fnc_selectrandom);
	{
		_unit addhandgunitem _x;
	} foreach (_handgunattach call bis_fnc_selectrandom);
	//diag_log format ["attachments: %1", primaryweaponitems _unit + secondaryweaponitems _unit + handgunitems _unit - [""]];
	//_logstr = _logstr + format ["attachments: %1", primaryweaponitems _unit + secondaryweaponitems _unit + handgunitems _unit - [""]];
	*/
	
	//attachments
	{
		_unit addprimaryweaponitem _x;
	} foreach [gettext (_primaryfinal >> "optic"),gettext (_primaryfinal >> "rail"),gettext (_primaryfinal >> "bipod"),gettext (_primaryfinal >> "muzzle")];
	{
		_unit addsecondaryweaponitem _x;
	} foreach [gettext (_secondaryfinal >> "optic"),gettext (_secondaryfinal >> "rail"),gettext (_secondaryfinal >> "bipod"),gettext (_secondaryfinal >> "muzzle")];
	{
		_unit addhandgunitem _x;
	} foreach [gettext (_handgunfinal >> "optic"),gettext (_handgunfinal >> "rail"),gettext (_handgunfinal >> "bipod"),gettext (_handgunfinal >> "muzzle")];
	
		
	//mags in backpack
	//added last to account for large mags that only fit in packs (AT,AA) such that one mag needs to be loaded in launcher to carry another
		{
		(unitBackpack _unit) addMagazineCargoGlobal _x;
	} foreach _packmags;
};
//diag_log "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^";

diag_log _logstr;

// This variable simply tracks the progress of the gear assignation process, for other scripts to reference.
_unit setVariable ["f_var_assignGear_done",true,true];
