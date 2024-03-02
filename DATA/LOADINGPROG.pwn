#include <YSI\y_hooks>
new PlayerText:LenzBarProgres[MAX_PLAYERS][3];
new LoadingPlayerBar[MAX_PLAYERS];
new TimerLoading[MAX_PLAYERS];
// new ProgressTimer[MAX_PLAYERS][128];

HideProgressBar(playerid)
{
	for(new idx; idx < 3; idx++) PlayerTextDrawHide(playerid, LenzBarProgres[playerid][idx]);
	return 1;
}
/* Create TD */
CreateProgress(playerid)
{
	LenzBarProgres[playerid][0] = CreatePlayerTextDraw(playerid, 177.000000, 348.000000, "ld_bum:blkdot");
	PlayerTextDrawFont(playerid, LenzBarProgres[playerid][0], 4);
	PlayerTextDrawLetterSize(playerid, LenzBarProgres[playerid][0], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, LenzBarProgres[playerid][0], 85.500000, 17.000000);
	PlayerTextDrawSetOutline(playerid, LenzBarProgres[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, LenzBarProgres[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, LenzBarProgres[playerid][0], 1);
	PlayerTextDrawColor(playerid, LenzBarProgres[playerid][0], 1296911871);
	PlayerTextDrawBackgroundColor(playerid, LenzBarProgres[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, LenzBarProgres[playerid][0], 50);
	PlayerTextDrawUseBox(playerid, LenzBarProgres[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, LenzBarProgres[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, LenzBarProgres[playerid][0], 0);

	LenzBarProgres[playerid][1] = CreatePlayerTextDraw(playerid, 178.000000, 350.000000, "ld_bum:blkdot");
	PlayerTextDrawFont(playerid, LenzBarProgres[playerid][1], 4);
	PlayerTextDrawLetterSize(playerid, LenzBarProgres[playerid][1], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, LenzBarProgres[playerid][1], 83.000000, 13.000000);
	PlayerTextDrawSetOutline(playerid, LenzBarProgres[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, LenzBarProgres[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, LenzBarProgres[playerid][1], 1);
	PlayerTextDrawColor(playerid, LenzBarProgres[playerid][1], 11636991);
	PlayerTextDrawBackgroundColor(playerid, LenzBarProgres[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, LenzBarProgres[playerid][1], 50);
	PlayerTextDrawUseBox(playerid, LenzBarProgres[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, LenzBarProgres[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, LenzBarProgres[playerid][1], 0);

	LenzBarProgres[playerid][2] = CreatePlayerTextDraw(playerid, 219.000000, 352.000000, "Mengolah Air Kencing...");
	PlayerTextDrawFont(playerid, LenzBarProgres[playerid][2], 1);
	PlayerTextDrawLetterSize(playerid, LenzBarProgres[playerid][2], 0.154166, 0.850000);
	PlayerTextDrawTextSize(playerid, LenzBarProgres[playerid][2], 458.500000, 81.000000);
	PlayerTextDrawSetOutline(playerid, LenzBarProgres[playerid][2], 0);
	PlayerTextDrawSetShadow(playerid, LenzBarProgres[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, LenzBarProgres[playerid][2], 2);
	PlayerTextDrawColor(playerid, LenzBarProgres[playerid][2], 774778623);
	PlayerTextDrawBackgroundColor(playerid, LenzBarProgres[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, LenzBarProgres[playerid][2], 50);
	PlayerTextDrawUseBox(playerid, LenzBarProgres[playerid][2], 0);
	PlayerTextDrawSetProportional(playerid, LenzBarProgres[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, LenzBarProgres[playerid][2], 0);


	return 1;
}
/* Func */
ShowProgressbar(playerid, text[] = "", Times)
{
	if(pData[playerid][pProgress] > 0) return 1;
	LoadingPlayerBar[playerid] = 0;
	pData[playerid][pProgress] = 1;
	new Float:Value = LoadingPlayerBar[playerid] * 83.0/100;
	new Timer = Times*1000/100;
	PlayerTextDrawTextSize(playerid, LenzBarProgres[playerid][1], Value, 13.0);
	PlayerTextDrawSetString(playerid, LenzBarProgres[playerid][2], text);
	PlayerTextDrawShow(playerid, LenzBarProgres[playerid][0]);
	PlayerTextDrawShow(playerid, LenzBarProgres[playerid][1]);
	PlayerTextDrawShow(playerid, LenzBarProgres[playerid][2]);
	TogglePlayerControllable(playerid, 0);
	TimerLoading[playerid] = SetTimerEx("UpdtLoading", Timer, true, "d", playerid);
	return 1;
}

stock UpdateLoading(playerid)
{
	new Float:Value = LoadingPlayerBar[playerid] * 83.0/100;
	PlayerTextDrawTextSize(playerid,  LenzBarProgres[playerid][1], Value, 13.0);
	PlayerTextDrawShow(playerid, LenzBarProgres[playerid][1]);

	return 1;
}

forward UpdtLoading(playerid);
public UpdtLoading(playerid)
{
	LoadingPlayerBar[playerid] += 1;
	UpdateLoading(playerid);
	if(LoadingPlayerBar[playerid] >= 100)
	{
		KillTimer(TimerLoading[playerid]);
		LoadingPlayerBar[playerid] = 0;
		pData[playerid][pProgress] = 0;
		HideProgressBar(playerid);
		// SetTimerEx(ProgressTimer[playerid], 500, false, "d", playerid);
		TogglePlayerControllable(playerid, 1);
	}
	return 1;
}
CMD:testprog(playerid, params[])
{
   	if(pData[playerid][pProgress] == 1) return ErrorMsg(playerid, "You Still Have Activity Progress");
	ShowProgressbar(playerid, "Test aja", 5);
	return 1;
}
