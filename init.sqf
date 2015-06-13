execVM "briefing.sqf";
enableSaving [false, false];
enableSentences false;

if (!(isnil "Alpha1")) then {
	Alpha1 addGroupIcon ["b_inf",[0,0]];
	Alpha1 setGroupIconParams [[0,.25,1,1],"A1",1,true];
};
if (!(isnil "Alpha2")) then {
	Alpha2 addGroupIcon ["b_inf",[0,0]];
	Alpha2 setGroupIconParams [[0,.25,1,1],"A2",1,true];
};
if (!(isnil "Bravo1")) then {
	Bravo1 addGroupIcon ["b_inf",[0,0]];
	Bravo1 setGroupIconParams [[0,.25,1,1],"B1",1,true];
};
if (!(isnil "Bravo2")) then {
	Bravo2 addGroupIcon ["b_inf",[0,0]];
	Bravo2 setGroupIconParams [[0,.25,1,1],"B2",1,true];
};
if (!(isnil "Lead")) then {
	Lead addGroupIcon ["b_inf",[0,0]];
	Lead setGroupIconParams [[0,.25,1,1],"PL",1,true];
};

setGroupIconsVisible [true,false];

task1 = player createSimpleTask ["SecureIntel"];
task1 setSimpleTaskDescription ["Kill courier and take his shit.", "Find the intel", "Target area"];
player setCurrentTask task1;
