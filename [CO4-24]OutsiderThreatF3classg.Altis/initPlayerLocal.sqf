waituntil{ player == player };

if (_this select 1) then
{
	player setpos [getmarkerpos "start", 5] call bg_fnc_ranpos;
}
else
{
	
	player setpos ([getmarkerpos "start",5+(.4 * count allplayers)] call bg_fnc_ranpos);
	player setdir (markerdir "start");
	
	/*[] spawn
	{
		0 fadeSound 0;
		0 fadeMusic 1;
		cutText ["", "BLACK FADED"];
		playmusic "missionstart";
		sleep 2.8;
		cutText ["OUTSIDER THREAT", "BLACK FADED"];
		6 fadeSound 1;
		sleep 3;
		titleCut ["", "BLACK IN", 3];
		15 fadeMusic 0;
		sleep 16;
		playmusic "";
		0 fadeMusic 1;
	};*/
};



//systemchat format ["didJIP = %1", _this select 1];

player allowdamage true;
player enablesimulation true;

waituntil{ !(isnil "bg_param_westfaction") };

//missionNamespace getVariable "bg_param_westfaction"; 

waituntil{ bg_param_westfaction != 0  };

//systemchat format["2: bg_param_westfaction = %1", bg_param_westfaction];

player call bg_fnc_assigngearglobal;