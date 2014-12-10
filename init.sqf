execVM "briefing.sqf";

enableSaving [false, false];
enableSentences false;
Lead addGroupIcon ["b_inf",[0,0]];
Lead setGroupIconParams [[0,.25,1,1],"SL",1,true];
Alpha addGroupIcon ["b_inf",[0,0]];
Alpha setGroupIconParams [[0,.25,1,1],"A",1,true];
Bravo addGroupIcon ["b_inf",[0,0]];
Bravo setGroupIconParams [[0,.25,1,1],"B",1,true];
setGroupIconsVisible [true,false];


task1 = player createSimpleTask ["SecureIntel"];
task1 setSimpleTaskDescription ["Kill courier and take his shit.", "Find the intel", "Target area"];
player setCurrentTask task1;

waitUntil{sleep 1; (str(getmarkerpos "Targetarea") != "[0,0,0]");};
openmap true;
mapAnimAdd [0, .04, getMarkerPos "Targetarea"];
mapAnimCommit;