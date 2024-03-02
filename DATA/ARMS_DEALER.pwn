CMD:creategun(playerid, params[])
{
	if(pData[playerid][pLevel] < 5) return ErrorMsg(playerid, "Kamu Tidak Cukup Level Minimal level 5");
	if(!IsPlayerInRangeOfPoint(playerid, 3.0, 2351.77,-653.31,128.05)) return ErrorMsg(playerid, "Anda sedang tidak berada di black market");
	
	new Dstring[512];
	format(Dstring, sizeof(Dstring), "Weapon (Ammo)\tbahan#1\tbahan#2\n\
	{ffffff}Silenced Pistol (ammo 70)\t20Kayu\t50Alumunium\n");
	format(Dstring, sizeof(Dstring), "{ffffff}%sDesert Eagle(ammo 70)\t40Kayu\t100Alumunium\n", Dstring);
	format(Dstring, sizeof(Dstring), "{ffffff}%sShotgun(ammo 50)\t30Kayu\t110Alumunium\n", Dstring);
	format(Dstring, sizeof(Dstring), "{ffffff}%sAK-47(ammo 100)\t50Kayu\t140Alumunium\n", Dstring);
	ShowPlayerDialog(playerid, DIALOG_ARMS_GUN, DIALOG_STYLE_TABLIST_HEADERS, "Create Gun", Dstring, "Create", "Cancel");
	return 1;
}

/*function CreateGun(playerid, gunid, ammo)
{
	if(!IsPlayerConnected(playerid)) return 0;
	if(pData[playerid][pArmsDealerStatus] != 1) return 0;
	if(gunid == 0 || ammo == 0) return 0;
	if(pData[playerid][pActivityTime] >= 100)
	{
		GivePlayerWeaponEx(playerid, gunid, ammo);
		
		Info(playerid, "Kamu telah berhasil membuat senjata ilegal.");
		TogglePlayerControllable(playerid, 1);
		InfoTD_MSG(playerid, 8000, "Weapon Created!");
		KillTimer(pData[playerid][pArmsDealer]);
		pData[playerid][pActivityTime] = 0;
		HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
		PlayerTextDrawHide(playerid, ActiveTD[playerid]);
		pData[playerid][pEnergy] -= 3;
		return 1;
	}
	else if(pData[playerid][pActivityTime] < 100)
	{
		pData[playerid][pActivityTime] += 5;
		SetPlayerProgressBarValue(playerid, pData[playerid][activitybar], pData[playerid][pActivityTime]);
		ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.1, 0, 0, 0, 0, 0, 1);
	}
	return 1;
}