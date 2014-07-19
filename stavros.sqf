/*
STAVROS DOCUMENTS MOSCOW FILE RIPOFF
Put 0 = (position this) execVM "stavros.sqf" in init of an object, I used a Logic, set placement radius to taste.
Ensure all BLUFOR are grouped with the player unit.
*/
if (!isServer) exitWith {};

_spawnPos = position nearestBuilding _this;
_target = createMarker["Target", _spawnPos];
_target setMarkerType "mil_destroy";
_target setMarkerShape "ICON";
_target setMarkerColor "ColorRed";

_side = createCenter east;
_bluforside = createCenter west;
_group1= createGroup east; _group2 = createGroup east;

//CBA AI script behavior seemed more proactive. Switch to BIS to remove CBA requirement.
_group1= [_spawnPos , east, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup;
[_group1,_spawnPos,75, 2] call CBA_fnc_taskDefend;
_null = _group1 setCombatMode "RED";
_group2= [_spawnPos, east, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
[_group2,_spawnPos,200] call CBA_fnc_taskPatrol;
_null = _group2 setSpeedMode "LIMITED";
_null = _group2 setFormation "STAG COLUMN";
_null = _group2 setBehaviour "SAFE";

_stavros = "O_officer_F" createUnit [_spawnPos, _group1, "Stavros = this;", 0.5, "PRIVATE"];

_groupblue = createGroup west;
units group player join _groupblue;

//copied from Moscow File Blue, slightly modified:
_safe = false; 
_startDir = 0; 
_startPos = _spawnPos;
while {!_safe} do
{
	_startDistance = 650 + random 70;
	_startDir = random 360;
	_startPos = [(_spawnPos select 0) + _startDistance * (sin (_startDir + 180)),(_spawnPos select 1) + _startdistance * (cos (_startDir + 180))];
	_startPos = [_startPos, 0, 70, 0, 0, 1, 0, [], [[1,1,1],[1,1,1]]] call BIS_fnc_findSafePos;
	if ((_startPos select 0) != 1) then
	{
		_safe=true;
	};	
};

{
	_x setDir _startDir;
	_x setPos _startPos;
	_startPos = [(_startPos select 0) + 2,(_startPos select 1)]; // places all units 2 meters east of each other, starting with player
} forEach units _groupblue;
//-

private ["_title","_text","_image"]; //randomize intel contents
_i = floor(random 5);

if (_i == 0) then {
	_title = "Radovan Karadzic";
	_text = "REMOVE KEBAB remove kebab you are worst turk. you are the turk idiot you are the turk smell. return to croatioa. to our croatia cousins you may come our contry. you may live in the zoo….ahahahaha ,bosnia we will never forgeve you. cetnik rascal FUck but fuck asshole turk stink bosnia sqhipere shqipare..turk genocide best day of my life. take a bath of dead turk..ahahahahahBOSNIA WE WILL GET YOU!! do not forget ww2 .albiania we kill the king , albania return to your precious mongolia….hahahahaha idiot turk and bosnian smell so bad..wow i can smell it. REMOVE KEBAB FROM THE PREMISES. you will get caught. russia+usa+croatia+slovak=kill bosnia…you will ww2/ tupac alive in serbia, tupac making album of serbia . fast rap tupac serbia. we are rich and have gold now hahahaha ha because of tupac… you are ppoor stink turk… you live in a hovel hahahaha, you live in a yurt tupac alive numbr one #1 in serbia ….fuck the croatia ,..FUCKk ashol turks no good i spit﻿ in the mouth eye of ur flag and contry. 2pac aliv and real strong wizard kill all the turk farm aminal with rap magic now we the serba rule .ape of the zoo presidant georg bush fukc the great satan and lay egg this egg hatch and bosnia wa;s born. stupid baby form the eggn give bak our clay we will crush u lik a skull of pig. serbia greattst countrey";
	_image = "photo.jpg";
};

if (_i == 1) then {
	_title ="REALLY QUITE SECRET";
	_text = "DO NOT RELASE UNDER FREEDOM OF INFORMATON ACT";
	_image = "vXGQeJ0.jpg";
};

if (_i == 2) then {
	_title = "OF MUCH SECRET";
	_text = "EYNAAAA,,CHEEKI BREEKI IYV DAMKYE";
	_image = "1405703814679.jpg";
};

if (_i == 3) then {
	_title = "Kinsoku Jikou Desu~";
	_text =  "";
	_image = "1405664733765.jpg";
};

if (_i == 4) then {
	_title = "nato official secrets";
	_text = "Get Nato Official Secrets Now Questions About Nato Official Secrets ? Talk To An Expert Now! free shipping for Nato Official Secrets document file files aziz top limited time secret biological only government blackbriar eyes freesample operation testing chemtrails population chemical condition military geoengineering black helicopter orb inoculation chemdog bow drones silver They aren't on vacation up here in the PNW. It seems that the bigger the holiday, the more intense the spraying So sorry to hear they're going even harder in your area, marklookingup!  Crying or Very sad I suppose there are some places they're determined to blast no matter the day or night. Please just stay safe and be well, everyday, and everyone!  Smile After a three day reprieve (while they pounded the Pacific Northwest), the chemtrail spray program has returned with a vengence today. The spray operation was already well underway by 9:00 this morning. I posted ten photos to my Webshots album Same here today. They were very busy laying in the trails in parallel lines, cross overs, spreading out into thin veils and feathers. I was finishing up shopping just after sunset and there were several fresh trails in the twilight sky. I would hate for some parent to tell their kids that's Santa up in the sky tonight seeing the trails.  Crying or Very sad The largest number of reports seems to be from the US, followed by Canada. Several other countries have some reports, often noted by western visitors. Since reports are coming from multiple countries, it seems to transcend individual governments. But with no obvious controlling body the answer remains to be seen.";
	_image = "JVK1CDi_edit2.jpg";
};

if (_i == 5) then {
	_title = "<<bismuth bronze documents>>";
	_text = "'For my wife (as in some books and important publications) that still doesn't understand why a man should place red boxes on green background for so much hours'";
	_image = "1405695782726.jpg";
};

waitUntil{sleep 1; !alive Stavros};
_intel = "Intel_File2_F" createVehicle (getPos Stavros);
_intel setvariable ["RscAttributeDiaryRecord_texture", format ["%1", _image]];
[_intel,"RscAttributeDiaryRecord",[format ["%1", _title],format ["%1", _text],""]] call bis_fnc_setServerVariable;

_trgpos = getPos _intel;
waitUntil{sleep 1; isNull _intel};

_endtrg = createTrigger["EmptyDetector", _trgpos];
_endtrg setTriggerArea [200,200,0,false];
_endtrg setTriggerActivation ["WEST","NOT PRESENT",false];
_endtrg setTriggerStatements ["this", "hint 'Exfil Complete'; notpresent = true", ""];

waitUntil{sleep 5; notpresent};
if (({alive _x} count(units _groupblue)) > 0) then {
	endMission "END1";
} else {
	["END1", false, true] call BIS_fnc_endMission;
};
