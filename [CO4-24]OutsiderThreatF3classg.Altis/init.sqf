//DO NOT REMOVE
#include "f3_init.sqf"
//DO NOT REMOVE
//EDIT BELOW THIS LINE

task1 = player createSimpleTask ["SecureIntel"];
task1 setSimpleTaskDescription ["Kill courier and take his shit.", "Find the intel", "Target area"];
player setCurrentTask task1;
