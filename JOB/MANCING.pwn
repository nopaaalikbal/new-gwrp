FishSukses(playerid)
{
	if(IsPlayerConnected(playerid) && pData[playerid][pInFish] == 1)
	{
	    new rand = RandomEx(1,12);
	    if(rand == 1)
	    {
	        Info(playerid, "Anda Mendapatkan Sebuah Sampah dan Langsung Membuangnya.");
	        pData[playerid][pWorm] -= 1;
	        pData[playerid][pInFish] = 0;
	        pData[playerid][pUmpan] -= 1;
	        TogglePlayerControllable(playerid, 1);
	        RemovePlayerAttachedObject(playerid, 9);
			callcmd::astop(playerid, "");
			pData[playerid][pdelaymancing] = 0;
			return 1;
		}
		else if(rand == 2)
		{
		    InfoMsg(playerid, "Anda Mendapatkan Ikan Makarel!");
		    pData[playerid][pWorm] -= 1;
	        pData[playerid][pInFish] = 0;
            pData[playerid][pUmpan] -= 1;
	        TogglePlayerControllable(playerid, 1);
	        RemovePlayerAttachedObject(playerid, 9);
			callcmd::astop(playerid, "");
	        pData[playerid][pMakarel]++;
			pData[playerid][pdelaymancing] = 0;
	        ShowItemBox(playerid, "Ikan_Makarel", "Received_1x", 19630, 2);
			return 1;
		}
		else if(rand == 3)
		{
		    InfoMsg(playerid, "Anda Mendapatkan Ikan Nemo!");
		    pData[playerid][pWorm] -= 1;
	        pData[playerid][pInFish] = 0;
	        pData[playerid][pUmpan] -= 1;
	        TogglePlayerControllable(playerid, 1);
			pData[playerid][pdelaymancing] = 0;
	        RemovePlayerAttachedObject(playerid, 9);
			callcmd::astop(playerid, "");
	        pData[playerid][pNemo]++;
	        ShowItemBox(playerid, "Nemo", "Received_1x", 1599, 2);
			return 1;
		}
		else if(rand == 4)
		{
		    InfoMsg(playerid, "Anda Mendapatkan Penyu");
		    pData[playerid][pWorm] -= 1;
	        pData[playerid][pInFish] = 0;
	        pData[playerid][pUmpan] -= 1;
	        TogglePlayerControllable(playerid, 1);
	        RemovePlayerAttachedObject(playerid, 9);
			callcmd::astop(playerid, "");
	        pData[playerid][pPenyu]++;
			pData[playerid][pdelaymancing] = 0;
	        ShowItemBox(playerid, "Penyu", "Received_1x", 1609, 2);
			return 1;
		}
		else if(rand == 5)
		{
		    Info(playerid, "Anda Mendapatkan Blue Fish!");
		    pData[playerid][pWorm] -= 1;
	        pData[playerid][pInFish] = 0;
	        pData[playerid][pUmpan] -= 1;
	        TogglePlayerControllable(playerid, 1);
			pData[playerid][pdelaymancing] = 0;
	        RemovePlayerAttachedObject(playerid, 9);
			callcmd::astop(playerid, "");
	        pData[playerid][pBlueFish]++;
	        ShowItemBox(playerid, "Blue_Fish", "Received_1x", 1604, 2);
			return 1;
		}
		else if(rand == 6)
		{
		    InfoMsg(playerid, "Anda Mendapatkan Ikan Makarel!");
		    pData[playerid][pWorm] -= 1;
	        pData[playerid][pInFish] = 0;
	        pData[playerid][pUmpan] -= 1;
	        TogglePlayerControllable(playerid, 1);
	        RemovePlayerAttachedObject(playerid, 9);
			callcmd::astop(playerid, "");
			pData[playerid][pdelaymancing] = 0;
	        pData[playerid][pMakarel]++;
	        ShowItemBox(playerid, "Ikan_Makarel", "Received_1x", 19630, 2);
			return 1;
		}
		else if(rand == 7)
		{
		    InfoMsg(playerid, "Anda Mendapatkan Ikan Makarel!");
		    pData[playerid][pWorm] -= 1;
	        pData[playerid][pInFish] = 0;
	        pData[playerid][pUmpan] -= 1;
	        TogglePlayerControllable(playerid, 1);
	        RemovePlayerAttachedObject(playerid, 9);
			callcmd::astop(playerid, "");
			pData[playerid][pdelaymancing] = 0;
	        pData[playerid][pMakarel]++;
	        ShowItemBox(playerid, "Ikan_Makarel", "Received_1x", 19630, 2);
			return 1;
		}
		else if(rand == 8)
		{
		    InfoMsg(playerid, "Anda Mendapatkan Ikan Makarel!");
		    pData[playerid][pWorm] -= 1;
	        pData[playerid][pInFish] = 0;
	        pData[playerid][pUmpan] -= 1;
	        TogglePlayerControllable(playerid, 1);
	        RemovePlayerAttachedObject(playerid, 9);
			callcmd::astop(playerid, "");
	        pData[playerid][pMakarel]++;
			pData[playerid][pdelaymancing] = 0;
	        ShowItemBox(playerid, "Ikan_Makarel", "Received_1x", 19630, 2);
			return 1;
		}
		else if(rand == 9)
		{
		    InfoMsg(playerid, "Anda Mendapatkan Ikan Makarel!");
		    pData[playerid][pWorm] -= 1;
	        pData[playerid][pInFish] = 0;
	        pData[playerid][pUmpan] -= 1;
	        TogglePlayerControllable(playerid, 1);
	        RemovePlayerAttachedObject(playerid, 9);
			callcmd::astop(playerid, "");
	        pData[playerid][pMakarel]++;
			pData[playerid][pdelaymancing] = 0;
	        ShowItemBox(playerid, "Ikan_Makarel", "Received_1x", 19630, 2);
			return 1;
		}
		else if(rand == 10)
		{
		    Info(playerid, "Anda Mendapatkan Kaos Kaki Busuk dan Langsung Membuangnya.");
		    pData[playerid][pWorm] -= 1;
	        pData[playerid][pInFish] = 0;
	        pData[playerid][pUmpan] -= 1;
	        TogglePlayerControllable(playerid, 1);
	        RemovePlayerAttachedObject(playerid, 9);
			callcmd::astop(playerid, "");
			pData[playerid][pdelaymancing] = 0;
		    return 1;
		}
		else if(rand == 11)
		{
		    Info(playerid, "Ikan Yang Sangat Besar! Tetapi Pancingan Anda Terputus dan Rusak.");
		    pData[playerid][pWorm] -= 1;
	        pData[playerid][pInFish] = 0;
			pData[playerid][pPancingan]--;
			pData[playerid][pUmpan] -= 1;
	        TogglePlayerControllable(playerid, 1);
	        RemovePlayerAttachedObject(playerid, 9);
			callcmd::astop(playerid, "");
			pData[playerid][pdelaymancing] = 0;
		    return 1;
		}
		else
		{
		    Info(playerid, "Anda Mendapatkan Kaleng Rongsok dan Langsung Membuangnya.");
	        pData[playerid][pInFish] = 0;
	        pData[playerid][pUmpan] -= 1;
	        TogglePlayerControllable(playerid, 1);
	        RemovePlayerAttachedObject(playerid, 9);
			callcmd::astop(playerid, "");
			pData[playerid][pdelaymancing] = 0;
		    return 1;
		}
	}
	return 1;
}

function FishTime(playerid)
{
	if(IsPlayerConnected(playerid) && pData[playerid][pInFish] == 1)
	{
	    new rand = RandomEx(1,12);
	    if(rand == 1)
	    {
	        Info(playerid, "Anda Mendapatkan Sebuah Sampah dan Langsung Membuangnya.");
	        pData[playerid][pWorm] -= 1;
	        pData[playerid][pInFish] = 0;
	        pData[playerid][pUmpan] -= 1;
	        TogglePlayerControllable(playerid, 1);
	        RemovePlayerAttachedObject(playerid, 9);
			pData[playerid][pdelaymancing] = 0;
			return 1;
		}
		else if(rand == 2)
		{
		    InfoMsg(playerid, "Anda Mendapatkan Ikan Makarel!");
		    pData[playerid][pWorm] -= 1;
	        pData[playerid][pInFish] = 0;
            pData[playerid][pUmpan] -= 1;
	        TogglePlayerControllable(playerid, 1);
	        RemovePlayerAttachedObject(playerid, 9);
	        pData[playerid][pMakarel]++;
			pData[playerid][pdelaymancing] = 0;
	        ShowItemBox(playerid, "Ikan_Makarel", "Received_1x", 19630, 2);
			return 1;
		}
		else if(rand == 3)
		{
		    InfoMsg(playerid, "Anda Mendapatkan Ikan Nemo!");
		    pData[playerid][pWorm] -= 1;
	        pData[playerid][pInFish] = 0;
	        pData[playerid][pUmpan] -= 1;
	        TogglePlayerControllable(playerid, 1);
			pData[playerid][pdelaymancing] = 0;
	        RemovePlayerAttachedObject(playerid, 9);
	        pData[playerid][pNemo]++;
	        ShowItemBox(playerid, "Nemo", "Received_1x", 1599, 2);
			return 1;
		}
		else if(rand == 4)
		{
		    InfoMsg(playerid, "Anda Mendapatkan Penyu");
		    pData[playerid][pWorm] -= 1;
	        pData[playerid][pInFish] = 0;
	        pData[playerid][pUmpan] -= 1;
	        TogglePlayerControllable(playerid, 1);
	        RemovePlayerAttachedObject(playerid, 9);
	        pData[playerid][pPenyu]++;
			pData[playerid][pdelaymancing] = 0;
	        ShowItemBox(playerid, "Penyu", "Received_1x", 1609, 2);
			return 1;
		}
		else if(rand == 5)
		{
		    Info(playerid, "Anda Mendapatkan Blue Fish!");
		    pData[playerid][pWorm] -= 1;
	        pData[playerid][pInFish] = 0;
	        pData[playerid][pUmpan] -= 1;
	        TogglePlayerControllable(playerid, 1);
			pData[playerid][pdelaymancing] = 0;
	        RemovePlayerAttachedObject(playerid, 9);
	        pData[playerid][pBlueFish]++;
	        ShowItemBox(playerid, "Blue_Fish", "Received_1x", 1604, 2);
			return 1;
		}
		else if(rand == 6)
		{
		    InfoMsg(playerid, "Anda Mendapatkan Ikan Makarel!");
		    pData[playerid][pWorm] -= 1;
	        pData[playerid][pInFish] = 0;
	        pData[playerid][pUmpan] -= 1;
	        TogglePlayerControllable(playerid, 1);
	        RemovePlayerAttachedObject(playerid, 9);
			pData[playerid][pdelaymancing] = 0;
	        pData[playerid][pMakarel]++;
	        ShowItemBox(playerid, "Ikan_Makarel", "Received_1x", 19630, 2);
			return 1;
		}
		else if(rand == 7)
		{
		    InfoMsg(playerid, "Anda Mendapatkan Ikan Makarel!");
		    pData[playerid][pWorm] -= 1;
	        pData[playerid][pInFish] = 0;
	        pData[playerid][pUmpan] -= 1;
	        TogglePlayerControllable(playerid, 1);
	        RemovePlayerAttachedObject(playerid, 9);
			pData[playerid][pdelaymancing] = 0;
	        pData[playerid][pMakarel]++;
	        ShowItemBox(playerid, "Ikan_Makarel", "Received_1x", 19630, 2);
			return 1;
		}
		else if(rand == 8)
		{
		    InfoMsg(playerid, "Anda Mendapatkan Ikan Makarel!");
		    pData[playerid][pWorm] -= 1;
	        pData[playerid][pInFish] = 0;
	        pData[playerid][pUmpan] -= 1;
	        TogglePlayerControllable(playerid, 1);
	        RemovePlayerAttachedObject(playerid, 9);
	        pData[playerid][pMakarel]++;
			pData[playerid][pdelaymancing] = 0;
	        ShowItemBox(playerid, "Ikan_Makarel", "Received_1x", 19630, 2);
			return 1;
		}
		else if(rand == 9)
		{
		    InfoMsg(playerid, "Anda Mendapatkan Ikan Makarel!");
		    pData[playerid][pWorm] -= 1;
	        pData[playerid][pInFish] = 0;
	        pData[playerid][pUmpan] -= 1;
	        TogglePlayerControllable(playerid, 1);
	        RemovePlayerAttachedObject(playerid, 9);
	        pData[playerid][pMakarel]++;
			pData[playerid][pdelaymancing] = 0;
	        ShowItemBox(playerid, "Ikan_Makarel", "Received_1x", 19630, 2);
			return 1;
		}
		else if(rand == 10)
		{
		    Info(playerid, "Anda Mendapatkan Kaos Kaki Busuk dan Langsung Membuangnya.");
		    pData[playerid][pWorm] -= 1;
	        pData[playerid][pInFish] = 0;
	        pData[playerid][pUmpan] -= 1;
	        TogglePlayerControllable(playerid, 1);
	        RemovePlayerAttachedObject(playerid, 9);
			pData[playerid][pdelaymancing] = 0;
		    return 1;
		}
		else if(rand == 11)
		{
		    Info(playerid, "Ikan Yang Sangat Besar! Tetapi Pancingan Anda Terputus dan Rusak.");
		    pData[playerid][pWorm] -= 1;
	        pData[playerid][pInFish] = 0;
			pData[playerid][pPancingan]--;
			pData[playerid][pUmpan] -= 1;
	        TogglePlayerControllable(playerid, 1);
	        RemovePlayerAttachedObject(playerid, 9);
			pData[playerid][pdelaymancing] = 0;
		    return 1;
		}
		else
		{
		    Info(playerid, "Anda Mendapatkan Kaleng Rongsok dan Langsung Membuangnya.");
	        pData[playerid][pInFish] = 0;
	        pData[playerid][pUmpan] -= 1;
	        TogglePlayerControllable(playerid, 1);
	        RemovePlayerAttachedObject(playerid, 9);
			pData[playerid][pdelaymancing] = 0;
		    return 1;
		}
	}
	return 0;
}
CMD:mancingnopaaal(playerid,params[])
{
	for (new i = 0; i < 3;i++)
	{
		TextDrawShowForPlayer(playerid, FishTD[i]);
	}
	SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, "** %s swings fishing rod and starts to wait for fish", ReturnName(playerid));
	TogglePlayerControllable(playerid, 0);
	ApplyAnimation(playerid,"SWORD","sword_block",50.0 ,0,1,0,1,1);
	SetPlayerAttachedObject(playerid, 9,18632,6,0.079376,0.037070,0.007706,181.482910,0.000000,0.000000,1.000000,1.000000,1.000000);
	TextDrawTextSize(Fishbar, 16.000, 0);
	TextDrawShowForPlayer(playerid, Fishbar);
	value = 0;
}
CMD:mancingdentot(playerid,params[])
{
    if(pData[playerid][pPancingan] < 1)
       return InfoMsg(playerid, "Anda tidak memiliki pancingan!");
    if(pData[playerid][pUmpan] < 1)
       return InfoMsg(playerid, "Anda tidak memiliki umpan");
	if(pData[playerid][pdelaymancing] > 0) return ErrorMsg(playerid, "Anda sedang memancing!");
	new random2 = RandomEx(10000, 20000);
	pData[playerid][pInFish] = 1;
	SetTimerEx("FishTime", random2, 0, "i",playerid);
	SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, "** %s swings fishing rod and starts to wait for fish", ReturnName(playerid));
	TogglePlayerControllable(playerid, 0);
	ApplyAnimation(playerid,"SWORD","sword_block",50.0 ,0,1,0,1,1);
	SetPlayerAttachedObject(playerid, 9,18632,6,0.079376,0.037070,0.007706,181.482910,0.000000,0.000000,1.000000,1.000000,1.000000);
	InfoMsg(playerid, "Memancing Ikan..");
    pData[playerid][pdelaymancing] = 5;
	return 1;
}
CMD:jualpenyudentot(playerid, params[])
{
    new total = pData[playerid][pPenyu];
    if(pData[playerid][pProgress] == 1) return ErrorMsg(playerid, "Anda masih memiliki activity progress!");
    if(pData[playerid][pPenyu] < 1) return ErrorMsg(playerid, "Anda Tidak Memiliki 1 Penyu");
    ShowProgressbar(playerid, "Menjual Penyu..", 10);
	ApplyAnimation(playerid,"INT_HOUSE","wash_up",4.0, 1, 0, 0, 0, 0,1);
	new pay = pData[playerid][pPenyu] * 9;
	GivePlayerMoneyEx(playerid, pay);
	pData[playerid][pPenyu] -= total;
	new str[500];
	format(str, sizeof(str), "Received_%dx", pay);
	ShowItemBox(playerid, "Uang", str, 1212, 2);
	format(str, sizeof(str), "Removed_%dx", total);
	ShowItemBox(playerid, "Penyu", str, 1609, 2);
    Inventory_Update(playerid);
	return 1;
}
CMD:jualmarakeldentot(playerid, params[])
{
    new total = pData[playerid][pMakarel];
    if(pData[playerid][pProgress] == 1) return ErrorMsg(playerid, "Anda masih memiliki activity progress!");
    if(pData[playerid][pMakarel] < 1) return ErrorMsg(playerid, "Anda Tidak Memiliki 1 Makarel");
    ShowProgressbar(playerid, "Menjual Makarel..", 10);
	ApplyAnimation(playerid,"INT_HOUSE","wash_up",4.0, 1, 0, 0, 0, 0,1);
	new pay = pData[playerid][pMakarel] * 3;
	GivePlayerMoneyEx(playerid, pay);
	pData[playerid][pMakarel] -= total;
	new str[500];
	format(str, sizeof(str), "Received_%dx", pay);
	ShowItemBox(playerid, "Uang", str, 1212, 2);
	format(str, sizeof(str), "Removed_%dx", total);
	ShowItemBox(playerid, "Ikan_Makarel", str, 19630, 2);
    Inventory_Update(playerid);
	return 1;
}
CMD:jualnemodentot(playerid, params[])
{
    new total = pData[playerid][pNemo];
    if(pData[playerid][pProgress] == 1) return ErrorMsg(playerid, "Anda masih memiliki activity progress!");
    if(pData[playerid][pNemo] < 1) return ErrorMsg(playerid, "Anda Tidak Memiliki 1 Nemo");
    ShowProgressbar(playerid, "Menjual Nemo..", 10);
	ApplyAnimation(playerid,"INT_HOUSE","wash_up",4.0, 1, 0, 0, 0, 0,1);
	new pay = pData[playerid][pNemo] * 5;
	GivePlayerMoneyEx(playerid, pay);
	pData[playerid][pNemo] -= total;
	new str[500];
	format(str, sizeof(str), "Received_%dx", pay);
	ShowItemBox(playerid, "Uang", str, 1212, 2);
	format(str, sizeof(str), "Removed_%dx", total);
	ShowItemBox(playerid, "Nemo", str, 1599, 2);
    Inventory_Update(playerid);
	return 1;
}
CMD:jualbluefishdentot(playerid, params[])
{
    new total = pData[playerid][pBlueFish];
    if(pData[playerid][pProgress] == 1) return ErrorMsg(playerid, "Anda masih memiliki activity progress!");
    if(pData[playerid][pBlueFish] < 1) return ErrorMsg(playerid, "Anda Tidak Memiliki 1 Blue Fish");
    ShowProgressbar(playerid, "Menjual BlueFish..", 10);
	ApplyAnimation(playerid,"INT_HOUSE","wash_up",4.0, 1, 0, 0, 0, 0,1);
	new pay = pData[playerid][pBlueFish] * 6;
	GivePlayerMoneyEx(playerid, pay);
	pData[playerid][pBlueFish] -= total;
	new str[500];
	format(str, sizeof(str), "Received_%dx", pay);
	ShowItemBox(playerid, "Uang", str, 1212, 2);
	format(str, sizeof(str), "Removed_%dx", total);
	ShowItemBox(playerid, "Blue_Fish", str, 1604, 2);
    Inventory_Update(playerid);
	return 1;
}
