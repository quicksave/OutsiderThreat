// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// FACTION: AAF

// ====================================================================================

// TASKS
// The code below creates tasks. Two (commented-out) sample tasks are included.
// Note: tasks should be entered into this file in reverse order.

// _task2 = player createSimpleTask ["OBJ_2"];
// _task2 setSimpleTaskDescription ["IN DEPTH OBJECTIVE DESCRIPTION", "SHORT OBJECTIVE DESCRIPTION", "WAYPOINT TEXT"];
// _task2 setSimpleTaskDestination WAYPOINTLOCATION;
// _task2 setTaskState "Created";

// _task1 = player createSimpleTask ["OBJ_1"];
// _task1 setSimpleTaskDescription ["IN DEPTH OBJECTIVE DESCRIPTION", "SHORT OBJECTIVE DESCRIPTION", "WAYPOINT TEXT"];
// _task1 setSimpleTaskDestination WAYPOINTLOCATION;
// _task1 setTaskState "Created";

// ====================================================================================

// NOTES: CREDITS
// The code below creates the administration sub-section of notes.

_cre = player createDiaryRecord ["diary", ["Credits","
jorsh
<br/><br/>
i copied F3's briefing.sqf i guess (http://www.ferstaberinde.com/f3/en/)
"]];

// ====================================================================================

// NOTES: ADMINISTRATION
// The code below creates the administration sub-section of notes.

_adm = player createDiaryRecord ["diary", ["Administration","
Kill the courier and his location will be marked on the map.
<br/>
Use the default (scrollwheel) interaction menu to interact with the courier's corpse.
"]];

_exe = player createDiaryRecord ["diary", ["Execution","
COMMANDER'S INTENT
<br/>
Find the courier, upload the intel to wikileaks, and get out.
<br/>
The enemy is likely to both set patrols and dig into structures, be prepared to maneuver at range and clear urban terrain when close.
<br/><br/>
MOVEMENT PLAN
<br/>
On foot.
<br/><br/>
FIRE SUPPORT PLAN
<br/>
None.
<br/><br/>
SPECIAL TASKS
<br/>
None.
"]];

// ====================================================================================

// NOTES: MISSION
// The code below creates the mission sub-section of notes.

_mis = player createDiaryRecord ["diary", ["Mission","
Intercept whatever intelligence the courier is transporting.
"]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
One of Colonel Vahid Namdar's personal couriers is isolated nearby. He is regularly entrusted with sensitive digital information and his escort has assumed a defensive posture. Namdar's couriers keep their sensitive items on their person at all times, without exception they are armed and have never surrendered.
<br/><br/>
ENEMY FORCES
<br/>
Squad strength CSAT infantry with a small, lightly equipped guard attachment.
<br/><br/>
FRIENDLY FORCES
<br/>
None
"]];

// ====================================================================================