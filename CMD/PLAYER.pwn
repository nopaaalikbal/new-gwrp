//-------------[ Player Commands ]-------------//
CMD:kencing(playerid, params[])
{
    if(IsPlayerInAnyVehicle(playerid))
		return ErrorMsg(playerid, "Anda harus berada di luar kendaraan.");
	if(pData[playerid][pProgress] == 1) return ErrorMsg(playerid, "Anda harus menunggu progress selesai!");
	if(pData[playerid][pKencing] < 25) return ErrorMsg(playerid, "Anda sedang tidak ingin kencing!");
	ShowProgressbar(playerid, "Kencing..", 10);
	SetPlayerSpecialAction(playerid, 68);
	SetTimerEx("SedangKencing", 10000, false, "d", playerid);
	return 1;
}

CMD:h(playerid, params[])
{
    if(pData[playerid][pPhone] == 0) return ErrorMsg(playerid, "Anda tidak memiliki ponsel");
	if(pData[playerid][pProgress] == 1) return ErrorMsg(playerid, "Anda masih memiliki activity progress!");
	hidehbelenz(playerid);
	PlayerTextDrawShow(playerid, LenzTD[playerid][0]);
	PlayerTextDrawShow(playerid, LenzTD[playerid][1]);
	PlayerTextDrawShow(playerid, LenzTD[playerid][2]);
	PlayerTextDrawShow(playerid, LenzTD[playerid][3]);
	PlayerTextDrawShow(playerid, LenzTD[playerid][4]);
	PlayerTextDrawShow(playerid, LenzTD[playerid][5]);
	PlayerTextDrawShow(playerid, LenzTD[playerid][6]);
	PlayerTextDrawShow(playerid, LenzTD[playerid][7]);
	PlayerTextDrawShow(playerid, LenzTD[playerid][8]);
	PlayerTextDrawShow(playerid, LenzTD[playerid][9]);
	PlayerTextDrawShow(playerid, LenzTD[playerid][10]);
	PlayerTextDrawShow(playerid, LenzTD[playerid][11]);
	PlayerTextDrawShow(playerid, LenzTD[playerid][12]);
	PlayerTextDrawShow(playerid, LenzTD[playerid][13]);
	PlayerTextDrawShow(playerid, LenzTD[playerid][14]);
	PlayerTextDrawShow(playerid, LenzTD[playerid][15]);
	PlayerTextDrawShow(playerid, LenzTD[playerid][16]);
	PlayerTextDrawShow(playerid, jam[playerid]);
	PlayerTextDrawShow(playerid, tanggal[playerid]);
	PlayerTextDrawShow(playerid, LenzTD[playerid][17]);
	PlayerTextDrawShow(playerid, LenzTD[playerid][18]);
	PlayerTextDrawShow(playerid, LenzTD[playerid][19]);
	PlayerTextDrawShow(playerid, LenzTD[playerid][20]);
	PlayerTextDrawShow(playerid, LenzTD[playerid][21]);
	PlayerTextDrawShow(playerid, LenzTD[playerid][22]);
	PlayerTextDrawShow(playerid, bukakunci[playerid]);
	new day, month, year;
    getdate(year,month,day);
   	new string[256];
	format(string, sizeof string, "%02d %s %02d", day, GetMonthName(month), year);
	// PlayerTextDrawSetString(tanggal[playerid], string);
	PlayerTextDrawSetString(playerid, tanggal[playerid], string);
	PlayerTextDrawShow(playerid, tanggal[playerid]);
	SelectTextDraw(playerid, COLOR_BLUE);
	PlayerPlaySound(playerid, 3600, 0,0,0);
	return 1;
}
CMD:resetcd(playerid, params[])
{
    delaydealer = false;
    SuccesMsg(playerid, "Anda berhasil reset coldown dealer!");
    return 1;
}


CMD:usesmoke(playerid, params[])
{
	if(IsPlayerConnected(playerid))
	{
		if(pData[playerid][pRokok] < 1)
			return InfoMsg(playerid, "You Don't Have Cigarette");

		SetPlayerSpecialAction(playerid,SPECIAL_ACTION_SMOKE_CIGGY);
		pData[playerid][pRokok]--;
		pData[playerid][pBladder] -= 5;
	}
	return 1;
}
CMD:stopsmoke(playerid, params[])
{
	if(IsPlayerConnected(playerid))
	{
	    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
	}
	return 1;
}

CMD:shareloc(playerid, params[])
{
	new otherid;
	if(sscanf(params, "u", otherid))
        return SyntaxMsg(playerid, "/shareloc [playerid/PartOfName]");

    if(pData[playerid][pPhone] < 1)
    	return ErrorMsg(playerid, "You Don't Have a Phone");

    if(pData[otherid][pPhone] < 1)
    	return ErrorMsg(playerid, "Your Friend Don't Have Phone!");

    if(otherid == playerid)
        return ErrorMsg(playerid, "You Don't Share Location To Your Self");

    pData[otherid][pLocOffer] = playerid;

    new Float:sX, Float:sY, Float:sZ;
	GetPlayerPos(playerid, sX, sY, sZ);
	SetPlayerCheckpoint(otherid, sX, sY, sZ, 5.0);
	SuccesMsg(playerid, "Berhasil mengirimkan lokasi");
	new lstr[500];
	format(lstr,sizeof(lstr), "Anda telah dikirimkan Lokasi oleh ~y~%s.", pData[playerid][pName]);
	InfoMsg(otherid, lstr);
	return 1;
}

CMD:flist(playerid, params[])
{
	new lstr[1024];
	format(lstr, sizeof(lstr), "Faction Name\tAmount\nGreenwich Paramedic \t%d\nGreenwich Police Department\t%d\nMechanic Greenwich\t%d\nGreenwich News Agency\t%d\nGwJek Driver\t%d\nGreenwich Food Vendors\t%d", emsdikota, polisidikota, bengkeldikota, reporterdikota, gojekdikota, pedagangdikota);
	ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_TABLIST_HEADERS, "Greenwich - Faction Onine", lstr, "{e31d1d}Close", "");
	return 1;
}

CMD:listjail(playerid, params[])
{
	new count = 0;
	new location[4080], lstr[596];
    foreach (new i : Player) if (pData[i][pJail] > 0 && !PlayerData[i][pAhide])
	{
		strcat(location,"Nama\tAdminname\tJail time\n",sizeof(location));

		if(count)
		{
			format(lstr,sizeof(lstr), "%s\t%s\t%d", pData[i][pName], pData[i][pAdminname], pData[i][pJailTime], i);
		}
		else format(lstr,sizeof(lstr), "%s\t%s\t%d", pData[i][pName], pData[i][pAdminname], pData[i][pJailTime], i);
		strcat(location,lstr,sizeof(location));
	}
	ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_TABLIST_HEADERS,"List jail | Greenwich City",location,"{e31d1d}Close","");
	return 1;
}

/*CMD:sid(playerid, params[])
{
	if(!pData[playerid][pTogName])
	{
		pData[playerid][pTogName] = 1;
		foreach(new pid : Player)
		{
			new nametag[500];
			format(nametag, sizeof(nametag), "{BABABA}[%i] {BABABA}%s\n{FFFFFF}%s", pid, pData[pid][pUCP]);
			cNameTag[playerid] = CreateDynamic3DTextLabel(nametag, 0xFFFFFFFF, 0.0, 0.0, 0.1, NT_DISTANCE, .attachedplayer = pid, .testlos = 1);
			pData[playerid][pTogName] = 1;
		}
		SuccesMsg(playerid, "Anda telah mengaktifkan nama ucp player");
	}
	else
	{
		pData[playerid][pTogName] = 0;
		SuccesMsg(playerid, "Anda telah menonaktifkan nama ucp player");
		if(IsValidDynamic3DTextLabel(cNameTag[playerid]))
  		DestroyDynamic3DTextLabel(cNameTag[playerid]);
	}
	return 1;
}*/
CMD:cursor(playerid, params[])
{
	SelectTextDraw(playerid, COLOR_BLUE);
	SuccesMsg(playerid, "Use Cursor Command");
	return 1;
}
CMD:fixvisu(playerid, params[])
{
   SetPlayerInterior(playerid, 0);
   SetPlayerVirtualWorld(playerid, 0);
   InfoMsg(playerid, "You Visual Is Success Normal");
   return 1;
}
CMD:pernikahan(playerid, params[])
{
	if(Nikahan == false) return ErrorMsg(playerid, "Sedang tidak ada pernikahan disini!");
    if(pData[playerid][pDelaypernikahan] > 0) return Error(playerid, "Kamu masih cooldown %d detik", pData[playerid][pDelaypernikahan]);
    ShowProgressbar(playerid, "Mengambil Makanan gratis..", 10);
	ApplyAnimation(playerid,"INT_HOUSE","wash_up",4.0, 1, 0, 0, 0, 0,1);
	ShowItemBox(playerid, "Ayam Goreng", "Received_1x", 19847, 4);
	ShowItemBox(playerid, "Mineral", "Received_1x", 2958, 4);
	SuccesMsg(playerid, "Kamu berhasil mendapatkan Makanan!");
	pData[playerid][pMineral] ++;
	pData[playerid][pChiken] ++;
    pData[playerid][pDelaypernikahan] = 100;
	return 1;
}
CMD:map(playerid)
{
	new
 	han2[MAX_DEALERSHIP * 32];

	han2 = "ID\tName\tType\tLocation\n";

    new type[128];
   	foreach(new bid : Dealer)
	{
		if(DealerData[bid][dealerType] == 1)
		{
			type = "Motorcycle";
		}
		else if(DealerData[bid][dealerType] == 2)
		{
			type = "Cars";
		}
		else if(DealerData[bid][dealerType] == 3)
		{
			type = "Unique Cars";
		}
		else if(DealerData[bid][dealerType] == 4)
		{
			type = "Job Cars";
		}
		else if(DealerData[bid][dealerType] == 5)
		{
			type = "Truck";
		}
		else
		{
			type = "Unknow";
		}

	    format(han2, sizeof(han2), "%s%d\t%s\t%s\t"RED_E"%.1f m\n", han2,
	    bid, DealerData[bid][dealerName], type, GetPlayerDistanceFromPoint(playerid, DealerData[bid][dealerPosX], DealerData[bid][dealerPosY], DealerData[bid][dealerPosZ]));
	}
	ShowPlayerDialog(playerid, DIALOG_FIND_DEALER, DIALOG_STYLE_TABLIST_HEADERS, "Dealership Location", han2, "Select", "Close");
	return 1;
}



CMD:hbemode(playerid, params[])
{
    ShowPlayerDialog(playerid, DIALOG_HBEMODE, DIALOG_STYLE_LIST, "Greenwich - HBE Mode", ""LG_E"Simple > Android only\n"LG_E"Modern > pc only [beta]", "Pilih", "Tutup");
    return 1;
}
CMD:belijerigen(playerid, params[])
{
    if(pData[playerid][pGas] > 5) return ErrorMsg(playerid, "You Cannot Bring More Than 5");
    pData[playerid][pGas]++;
    InfoMsg(playerid, "You Are Buying Gasoline, Please Wait!");
	GivePlayerMoneyEx(playerid, -50);
	ShowProgressbar(playerid, "Refueling Proced", 8);
	ApplyAnimation(playerid,"BD_FIRE","wash_up",4.0, 1, 0, 0, 0, 0, 1);
	ShowItemBox(playerid, "Money", "Removed_$50", 1212, 4);
	ShowItemBox(playerid, "Jerigen", "Received_1x", 1650, 4);
    Inventory_Update(playerid);
	return 1;
}
stock Jembut(playerid, string[], time)//Time in Sec.
{
	new validtime = time*1000;

	if (PlayerInfo[playerid][Kontol])
	{
	    KillTimer(PlayerInfo[playerid][Memek]);
	}
	PlayerTextDrawSetString(playerid, AltTD[playerid][3], string);
	PlayerTextDrawShow(playerid, AltTD[playerid][0]);
	PlayerTextDrawShow(playerid, AltTD[playerid][1]);
	PlayerTextDrawShow(playerid, AltTD[playerid][2]);
	PlayerTextDrawShow(playerid, AltTD[playerid][3]);
	PlayerPlaySound(playerid, 1057 , 0.0, 0.0, 0.0);
	PlayerInfo[playerid][Kontol] = true;
	PlayerInfo[playerid][Memek] = SetTimerEx("HideMessageAje", validtime, false, "d", playerid);
	return 1;
}
function HideMessageAje(playerid)
{
	if (!PlayerInfo[playerid][Kontol])
	    return 0;

	PlayerInfo[playerid][Kontol] = false;
	return HideSemua(playerid);
}

stock HideSemua(playerid)
{
    PlayerTextDrawHide(playerid, AltTD[playerid][0]);
	PlayerTextDrawHide(playerid, AltTD[playerid][1]);
	PlayerTextDrawHide(playerid, AltTD[playerid][2]);
	PlayerTextDrawHide(playerid, AltTD[playerid][3]);
	return 1;
}
CMD:setrobwarung(playerid, params[])
{
    Warung = false;
    SuccesMsg(playerid, "Mereset Coldown Rob warung");
    return 1;
}

CMD:savepos(playerid, params[])
{
	if(!strlen(params))
		return SendClientMessage(playerid, 0xCECECEFF, "Gunakan: /savepos [judul]");

    extract params -> new string:message[1000]; else return SendClientMessage(playerid, 0xCECECEFF, "Gunakan: /savepos [judul]");

   	GetPlayerVehicleID(playerid);
	new msg[500];
	new Float:PPos[5];

	GetPlayerPos(playerid, PPos[0], PPos[1], PPos[2]);
	GetPlayerFacingAngle(playerid, PPos[3]);
	format(msg, sizeof(msg), "\nSetPlayerPos(playerid, %f,%f,%f);\nSetPlayerFacingAngle(playerid, %f);\nJudul : %s", PPos[0], PPos[1], PPos[2], PPos[3], message);
/*	DCC_SendChannelMessage(g_discord_savepos, msg);*/
    new File:fhandle;
    fhandle = fopen("coordinates.txt",io_append);
    fwrite(fhandle, msg);
    fclose(fhandle);
	SuccesMsg(playerid, "Coordinat Posisi Kamu Berhasil Di Save!");

    return 1;
}
CMD:eatkebab(playerid, params[])
{
    if(pData[playerid][pKebab] < 1) return ErrorMsg(playerid,"Anda tidak memiliki kebab!.");
	if(pData[playerid][pProgress] == 1) return ErrorMsg(playerid, "Tunggu Sebentar");
	if(pData[playerid][sampahsaya] == 10) return ErrorMsg(playerid, "Buang sampah anda terlebih dahulu");
    {
	    pData[playerid][pKebab]--;
	    pData[playerid][sampahsaya]++;
	    Inventory_Update(playerid);
        Inventory_Close(playerid);
        ShowItemBox(playerid, "Kebab", "Removed_1x", 2769, 2);
		ShowItemBox(playerid, "Sampah", "Received_1x", 1265, 2);
	    SetPlayerChatBubble(playerid,"> Makan Kebab..",COLOR_PURPLE,30.0,10000);
	    ShowProgressbar(playerid, "Makan Kebab..", 1);
		ApplyAnimation(playerid, "FOOD", "EAT_Burger", 4.0, 0, 0, 0, 0, 0,1);
		pData[playerid][pHunger] += 60;
	    return 1;
    }
}
CMD:eatroti(playerid, params[])
{
    if(pData[playerid][pRoti] < 1) return ErrorMsg(playerid,"Anda tidak memiliki roti!.");
	if(pData[playerid][pProgress] == 1) return ErrorMsg(playerid, "Tunggu Sebentar");
	if(pData[playerid][sampahsaya] == 10) return ErrorMsg(playerid, "Buang sampah anda terlebih dahulu");
    {
	    pData[playerid][pRoti]--;
	    pData[playerid][sampahsaya]++;
	    Inventory_Update(playerid);
        Inventory_Close(playerid);
        ShowItemBox(playerid, "Roti", "Removed_1x", 19883, 2);
		ShowItemBox(playerid, "Sampah", "Received_1x", 1265, 2);
	    SetPlayerChatBubble(playerid,"> Makan Roti..",COLOR_PURPLE,30.0,10000);
	    ShowProgressbar(playerid, "Makan Roti..", 1);
		ApplyAnimation(playerid, "FOOD", "EAT_Burger", 4.0, 0, 0, 0, 0, 0,1);
		pData[playerid][pHunger] += 25;
	    return 1;
    }
}
CMD:eatsnack(playerid, params[])
{
    if(pData[playerid][pSnack] < 1) return ErrorMsg(playerid,"Anda tidak memiliki snack!.");
	if(pData[playerid][pProgress] == 1) return ErrorMsg(playerid, "Tunggu Sebentar");
	if(pData[playerid][sampahsaya] == 10) return ErrorMsg(playerid, "Buang sampah anda terlebih dahulu");
    {
	    pData[playerid][pSnack]--;
	    pData[playerid][sampahsaya]++;
	    Inventory_Update(playerid);
        Inventory_Close(playerid);
        ShowItemBox(playerid, "Snack", "Removed_1x", 2821, 2);
		ShowItemBox(playerid, "Sampah", "Received_1x", 1265, 2);
	    SetPlayerChatBubble(playerid,"> Makan Snack..",COLOR_PURPLE,30.0,10000);
	    ShowProgressbar(playerid, "Makan..", 1);
		ApplyAnimation(playerid, "FOOD", "EAT_Burger", 4.0, 0, 0, 0, 0, 0,1);
		pData[playerid][pHunger] += 40;
	    return 1;
    }
}
CMD:chiken(playerid, params[])
{
    if(pData[playerid][pChiken] < 1) return ErrorMsg(playerid,"You Not Have Chicken!.");
	if(pData[playerid][pProgress] == 1) return ErrorMsg(playerid, "Wait For It");
	if(pData[playerid][sampahsaya] == 10) return ErrorMsg(playerid, "Throw Away The Trash First!");
    {
	    pData[playerid][pChiken]--;
	    pData[playerid][sampahsaya]++;
	    Inventory_Update(playerid);
        Inventory_Close(playerid);
        ShowItemBox(playerid, "Chiken", "Removed_1x", 19847, 2);
		ShowItemBox(playerid, "Trash", "Received_1x", 1265, 2);
	    SetPlayerChatBubble(playerid,"> Eating Chicken",COLOR_PURPLE,30.0,10000);
	    ShowProgressbar(playerid, "Eating Chicken", 1);
		ApplyAnimation(playerid, "FOOD", "EAT_Burger", 4.0, 0, 0, 0, 0, 0,1);
		pData[playerid][pHunger] += 10;
	    return 1;
    }
}
CMD:steak(playerid, params[])
{
    if(pData[playerid][pSteak] < 1) return ErrorMsg(playerid,"You Not Have Steak!.");
	if(pData[playerid][pProgress] == 1) return ErrorMsg(playerid, "Wait For It");
	if(pData[playerid][sampahsaya] == 10) return ErrorMsg(playerid, "Throw Away The Trash First!");
    {
	    pData[playerid][pSteak]--;
	    pData[playerid][sampahsaya]++;
	    Inventory_Update(playerid);
        Inventory_Close(playerid);
        ShowItemBox(playerid, "Steak", "Removed_1x", 19811, 2);
		ShowItemBox(playerid, "Trash", "Received_1x", 1265, 2);
	    SetPlayerChatBubble(playerid,"> Eating Steak",COLOR_PURPLE,30.0,10000);
	    ShowProgressbar(playerid, "Eating Steak", 1);
		ApplyAnimation(playerid, "FOOD", "EAT_Burger", 4.0, 0, 0, 0, 0, 0,1);
		pData[playerid][pHunger] += 40;
	    return 1;
    }
}
CMD:drinkcappucino(playerid, params[])
{
    if(pData[playerid][pCappucino] < 1) return ErrorMsg(playerid,"You Not Have Cappucino!.");
	if(pData[playerid][pProgress] == 1) return ErrorMsg(playerid, "Wait For It");
	if(pData[playerid][sampahsaya] == 10) return ErrorMsg(playerid, "Throw Away The Trash First!");
    {
	    pData[playerid][pCappucino]--;
	    pData[playerid][sampahsaya]++;
	    Inventory_Update(playerid);
        Inventory_Close(playerid);
        ShowItemBox(playerid, "Cappucino", "Removed_1x", 19835, 2);
		ShowItemBox(playerid, "Trash", "Received_1x", 1265, 2);
	    SetPlayerChatBubble(playerid,"> Drink Cappucino",COLOR_PURPLE,30.0,10000);
	    ShowProgressbar(playerid, "Drink Cappucino", 1);
		ApplyAnimation(playerid, "FOOD", "EAT_Burger", 4.0, 0, 0, 0, 0, 0,1);
		pData[playerid][pEnergy] += 40;
	    return 1;
    }
}
CMD:drinkwater(playerid, params[])
{
    if(pData[playerid][pSprunk] < 1) return ErrorMsg(playerid,"You Not Have Water!.");
    if(PlayerInfo[playerid][pProgress] == 1) return ErrorMsg(playerid, "Wait For It");
    if(pData[playerid][sampahsaya] == 10) return ErrorMsg(playerid, "Throw Away The Trash First!");
    {
		pData[playerid][sampahsaya]++;
    	pData[playerid][pSprunk]--;
        Inventory_Close(playerid);
        ShowItemBox(playerid, "Water", "Removed_1x", 2958, 2);
		ShowItemBox(playerid, "Trash", "Received_1x", 1265, 2);
		Inventory_Update(playerid);
	    SetPlayerChatBubble(playerid,"> Drink Water",COLOR_PURPLE,30.0,10000);
	    ShowProgressbar(playerid, "Drink Water", 1);
		ApplyAnimation(playerid, "FOOD", "EAT_Burger", 4.0, 0, 0, 0, 0, 0,1);
		pData[playerid][pEnergy] += 35;
	    return 1;
    }
}
CMD:drinkstarling(playerid, params[])
{
    if(pData[playerid][pStarling] < 1) return ErrorMsg(playerid,"Anda tidak memiliki starling!.");
    if(PlayerInfo[playerid][pProgress] == 1) return ErrorMsg(playerid, "Tunggu Sebentar");
    if(pData[playerid][sampahsaya] == 10) return ErrorMsg(playerid, "Buang sampah anda terlebih dahulu");
    {
		pData[playerid][sampahsaya]++;
    	pData[playerid][pStarling]--;
        Inventory_Close(playerid);
        ShowItemBox(playerid, "Starling", "Removed_1x", 1455, 2);
		ShowItemBox(playerid, "Sampah", "Received_1x", 1265, 2);
		Inventory_Update(playerid);
	    SetPlayerChatBubble(playerid,"> Minum Starling..",COLOR_PURPLE,30.0,10000);
	    ShowProgressbar(playerid, "Minum Starling..", 1);
		ApplyAnimation(playerid, "FOOD", "EAT_Burger", 4.0, 0, 0, 0, 0, 0,1);
		pData[playerid][pEnergy] += 30;
	    return 1;
    }
}
CMD:drinkmilk(playerid, params[])
{
    if(pData[playerid][pMilxMax] < 1) return ErrorMsg(playerid,"Anda tidak memiliki milk!.");
    if(PlayerInfo[playerid][pProgress] == 1) return ErrorMsg(playerid, "Tunggu Sebentar");
    if(pData[playerid][sampahsaya] == 10) return ErrorMsg(playerid, "Buang sampah anda terlebih dahulu");
    {
		pData[playerid][sampahsaya]++;
    	pData[playerid][pMilxMax]--;
        Inventory_Close(playerid);
        ShowItemBox(playerid, "Milk_Max", "Removed_1x", 19570, 2);
		ShowItemBox(playerid, "Sampah", "Received_1x", 1265, 2);
		Inventory_Update(playerid);
	    SetPlayerChatBubble(playerid,"> Minum Susu..",COLOR_PURPLE,30.0,10000);
	    ShowProgressbar(playerid, "Minum MilxMax..", 1);
		ApplyAnimation(playerid, "FOOD", "EAT_Burger", 4.0, 0, 0, 0, 0, 0,1);
	    SetPlayerAttachedObject(playerid, 3, 19570, 6, 0.000000, -0.025000, 0.066000, 0.000000, 0.000000, 0.000000, 1.000000, 1.000000, 1.000000);
		pData[playerid][pEnergy] += 30;
	    return 1;
    }
}
CMD:i(playerid, params[])
{
    if(pData[playerid][pInjured] == 1) return ErrorMsg(playerid, "Anda sedang pingsan!");
    if(pData[playerid][pProgress] == 1) return ErrorMsg(playerid, "Anda masih memiliki activity progress!");
    Info(playerid, "Gunakan '/cursor'Jika mouse hilang Dari Layar/teksdraw tidak bisa ditekan!");
	Inventory_Show(playerid);
	return 1;
}
CMD:hold(playerid, params[])
{
    if(pData[playerid][pInjured] == 1) return ErrorMsg(playerid, "Anda sedang pingsan!");
    if(pData[playerid][pPhone] == 0) return ErrorMsg(playerid, "Anda tidak memiliki ponsel");
    if(pData[playerid][pProgress] == 1) return ErrorMsg(playerid, "Anda masih memiliki activity progress!");
    SetPlayerChatBubble(playerid,"> Membuka hpnya..",COLOR_PURPLE,30.0,10000);
    SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, ""WHITE_E"ACTION: "PURPLE_E"%s Telah membuka HPMiliknya", pData[playerid][pName]);
    Info(playerid, "Gunakan '/cursor'Jika mouse hilang Dari Layar/teksdraw tidak bisa ditekan!");
    for(new i = 0; i < 28; i++)
    {
		TextDrawShowForPlayer(playerid, PHONESCREEN[i]);
	}
	SelectTextDraw(playerid, COLOR_BLUE);
	PlayerPlaySound(playerid, 3600, 0,0,0);
	SetPlayerAttachedObject(playerid, 9, 18871, 5, 0.056, 0.039, -0.015, -18.100, -108.600, 93.000, 1,1,1);
	ApplyAnimation(playerid,"ped","Jetpack_Idle",4.0, 1, 0, 0, 0, 0, 1); // Not looping
	return 1;
}


CMD:hcard(playerid, params[])
{
	for(new txd; txd < 24; txd++)
	{
		PlayerTextDrawHide(playerid, ktpwarga[playerid][txd]);
	}
	ClearAnimations(playerid);
	StopLoopingAnim(playerid);
	return 1;
}
/*CMD:showskck(playerid, params[])
{
    if(pData[playerid][pSkck] != 1) return ErrorMsg(playerid, "You Not Have skck!");
    new mstr[512];
    format(mstr, sizeof(mstr), "Name : %s \nDate Of Birth : %s \nGender : %s \nNo HP : %s \nStatus : %s.", pData[playerid][pName], pData[playerid][pAge], pData[playerid][pGender], pData[playerid][pPhone], ReturnTimelapse(gettime(), pData[playerid][pIDCardTime]));
    ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, "{007A1E}Greenwich {ffffff}/{007A1E}/ {ffffff}SKCK", mstr, "{e31d1d}Close", "");
    return 1;
}*/

CMD:showidcard(playerid, params[])
{
	if(pData[playerid][pIDCard] == 0) return ErrorMsg(playerid, "Anda tidak memiliki id card!");

    new strings[256];
	// Set name player
	format(strings, sizeof(strings), "%s", pData[playerid][pName]);
	PlayerTextDrawSetString(playerid, ktpwarga[playerid][12], strings);
	// Set birtdate
	// format(strings, sizeof(strings), "%s", pData[playerid][pTinggi]);
	// PlayerTextDrawSetString(playerid, ktpwarga[playerid][18], strings);
	

	format(strings, sizeof(strings), "%s", pData[playerid][pAge]);
	PlayerTextDrawSetString(playerid, ktpwarga[playerid][16], strings);
   
	format(strings, sizeof(strings), "%s", pData[playerid][pGender]);
	PlayerTextDrawSetString(playerid, ktpwarga[playerid][17], strings);


	for(new txd; txd < 24; txd++)
	{
		PlayerTextDrawShow(playerid, ktpwarga[playerid][txd]);
	}
	SetTimerEx("ktp",9000, false, "d", playerid);
	Inventory_Close(playerid);
	return 1;
}

function ktp(playerid)
{
	PlayerTextDrawHide(playerid, ktpwarga[playerid][0]);
	PlayerTextDrawHide(playerid, ktpwarga[playerid][1]);
	PlayerTextDrawHide(playerid, ktpwarga[playerid][2]);
	PlayerTextDrawHide(playerid, ktpwarga[playerid][3]);
	PlayerTextDrawHide(playerid, ktpwarga[playerid][4]);
	PlayerTextDrawHide(playerid, ktpwarga[playerid][5]);
	PlayerTextDrawHide(playerid, ktpwarga[playerid][6]);
	PlayerTextDrawHide(playerid, ktpwarga[playerid][7]);
	PlayerTextDrawHide(playerid, ktpwarga[playerid][8]);
	PlayerTextDrawHide(playerid, ktpwarga[playerid][9]);
	PlayerTextDrawHide(playerid, ktpwarga[playerid][10]);
	PlayerTextDrawHide(playerid, ktpwarga[playerid][11]);
	PlayerTextDrawHide(playerid, ktpwarga[playerid][12]);
	PlayerTextDrawHide(playerid, ktpwarga[playerid][13]);
	PlayerTextDrawHide(playerid, ktpwarga[playerid][14]);
	PlayerTextDrawHide(playerid, ktpwarga[playerid][15]);
	PlayerTextDrawHide(playerid, ktpwarga[playerid][16]);
    PlayerTextDrawHide(playerid, ktpwarga[playerid][17]);
    PlayerTextDrawHide(playerid, ktpwarga[playerid][18]);
	PlayerTextDrawHide(playerid, ktpwarga[playerid][19]);
	PlayerTextDrawHide(playerid, ktpwarga[playerid][20]);
	PlayerTextDrawHide(playerid, ktpwarga[playerid][21]);
    PlayerTextDrawHide(playerid, ktpwarga[playerid][22]);
    PlayerTextDrawHide(playerid, ktpwarga[playerid][23]);
	return 1;
}

CMD:hidelicensecard(playerid, params[])
{
	for(new txd; txd < 26; txd++)
	{
		PlayerTextDrawHide(playerid, LICCard[playerid][txd]);
	}
	return 1;
}

CMD:showlicensecard(playerid, params[])
{
	if(pData[playerid][pDriveLic] == 0) return ErrorMsg(playerid, "Anda tidak memiliki Driving License/SIM!");

	new strings[256], fac[24];
	if(pData[playerid][pFaction] == 1)
	{
		fac = "Police";
	}
	else if(pData[playerid][pFaction] == 2)
	{
		fac = "Goverment";
	}
	else if(pData[playerid][pFaction] == 3)
	{
		fac = "Medic";
	}
	else if(pData[playerid][pFaction] == 4)
	{
		fac = "News";
	}
	else if(pData[playerid][pFaction] == 5)
	{
		fac = "Burger Shoot";
	}
	else
	{
		fac = "Pengangguran";
	}

	// Set name player
	format(strings, sizeof(strings), "%s", pData[playerid][pName]);
	PlayerTextDrawSetString(playerid, LICCard[playerid][19], strings);

	// Set birtdate
	format(strings, sizeof(strings), "%s", pData[playerid][pAge]);
	PlayerTextDrawSetString(playerid, LICCard[playerid][20], strings);

	// Set Expired
	format(strings, sizeof(strings), "%s", ReturnTimelapse(gettime(), pData[playerid][pDriveLicTime]));
	PlayerTextDrawSetString(playerid, LICCard[playerid][12], strings);

	// Set Skin Player
	if(GetPlayerSkin(playerid) != GetPVarInt(playerid, "sim_skin"))
	{
		PlayerTextDrawSetPreviewModel(playerid, LICCard[playerid][25], GetPlayerSkin(playerid));
		PlayerTextDrawShow(playerid, LICCard[playerid][25]);
		SetPVarInt(playerid, "sim_skin", GetPlayerSkin(playerid));
	}


	for(new txd; txd < 26; txd++)
	{
		PlayerTextDrawShow(playerid, LICCard[playerid][txd]);
		SelectTextDraw(playerid, 0xFF0000FF);
	}
	return 1;
}

CMD:bshop(playerid, params[])
{
	if(!IsPlayerInRangeOfPoint(playerid, 3.0, 291.35, -106.30, 1001.51)) return ErrorMsg(playerid, "Anda sedang tidak berada di black market");
	ShowPlayerDialog(playerid, DIALOG_BSHOP, DIALOG_STYLE_TABLIST_HEADERS, "BlackShop", "Barang\tHarga\nPanel Hacking\t{7fff00}$200", "Beli", "Keluar");
	return 1;
}



CMD:creatematext(playerid, params[])
{
	static
	    id,
		text[128];

	if(!pData[playerid][pAdmin])
	    return SendClientMessage(playerid, COLOR_WHITE, "ERROR: {FFFFFF}You don't have permission to use this Command!");

	if (sscanf(params, "s[128]", text))
	    return SendClientMessage(playerid, COLOR_WHITE, "SYNTAX: {FFFFFF}/creatematext [text]");

	id = Matext_Create(playerid, text);

	if (id == -1)
	    return SendClientMessage(playerid, COLOR_WHITE, "ERROR: {FFFFFF}The server has reached the limit for Material Text");

	SendClientMessageEx(playerid, COLOR_BLUE, "OBJECT: {FFFFFF}You have successfully Creating Material Text ID: %d.", id);
	EditDynamicObject(playerid, MatextData[id][mtCreate]);

	EditingMatext[playerid] = id;
	return 1;
}

CMD:createobject(playerid, params[])
{
	static
	    id,
		modelid;

	if(!pData[playerid][pAdmin])
	    return ErrorMsg(playerid, "You don't have permission to use this Command!");

	if (sscanf(params, "d", modelid))
	    return SendClientMessage(playerid, COLOR_WHITE, "SYNTAX: {FFFFFF}/createobject [modelid]");

	id = Object_Create(playerid, modelid);

	// if (id == -1)
	//     return SendClientMessage(playerid, COLOR_WHITE, "ERROR: {FFFFFF}The server has reached the limit for Created Object's");

	SendClientMessageEx(playerid, COLOR_WHITE, "OBJECT: {FFFFFF}You have successfully created Object ID: %d.", id);
	EditDynamicObject(playerid, ObjectData[id][objCreate]);

	EditingObject[playerid] = id;
	return 1;
}

CMD:editobject(playerid, params[])
{
	static
	    id,
	    type[24],
		string[128];

	if(!pData[playerid][pAdmin])
	    return SendClientMessage(playerid, COLOR_WHITE, "ERROR: {FFFFFF}You don't have permission to use this Command!");

	if (sscanf(params, "ds[24]S()[128]", id, type, string))
 	{
	 	SendClientMessage(playerid, COLOR_WHITE, "SYNTAX: {FFFFFF}/editobject [id] [option]");
	    SendClientMessage(playerid, COLOR_WHITE, "OPTION:{FFFFFF} position, model");
		return 1;
	}

	if ((id < 0 || id >= MAX_COBJECT) || !ObjectData[id][objExists])
	    return SendClientMessage(playerid, COLOR_WHITE, "ERROR: {FFFFFF} You have specified an invalid Created Object ID.");

	if (!strcmp(type, "position", true))
	{
		EditingObject[playerid] = id;
		ShowPlayerDialog(playerid, DIALOG_EDIT, DIALOG_STYLE_LIST, "Object Editing", "Edit with Move Object\nWith Coordinate", "Select", "Cancel");
	}
	else if(!strcmp(type, "model", true))
	{
	    new
	        mod;

	    if (sscanf(string, "d", mod))
	        return SendClientMessage(playerid, COLOR_WHITE, "SYNTAX: {FFFFFF}/editobject [id] [model] [modelid]");

		ObjectData[id][objModel] = mod;
		SendClientMessageEx(playerid, COLOR_WHITE, "OBJECT: {FFFFFF}Successfully Changed Model of Created Object ID %d", id);

		Object_Refresh(id);

		Object_Save(id);
	}
	return 1;
}

CMD:editmatext(playerid, params[])
{
	static
	    id,
	    type[24],
		string[128];

	if(!pData[playerid][pAdmin])
	    return SendClientMessage(playerid, COLOR_WHITE, "ERROR: {FFFFFF}You don't have permission to use this Command!");

	if (sscanf(params, "ds[24]S()[128]", id, type, string))
 	{
	 	SendClientMessage(playerid, COLOR_WHITE, "SYNTAX: {FFFFFF}/editmatext [id] [OPTION]");
	    SendClientMessage(playerid, COLOR_WHITE, "OPTION:{FFFFFF} bold, color, position, size");
		return 1;
	}
	if ((id < 0 || id >= MAX_MT) || !MatextData[id][mtExists])
	    return SendClientMessage(playerid, COLOR_WHITE, "ERROR: {FFFFFF}You have specified an invalid Material Text ID.");

	if (!strcmp(type, "size", true))
	{
	    new
	        ukuran;

	    if (sscanf(string, "d", ukuran))
	        return SendClientMessage(playerid, COLOR_WHITE, "SYNTAX: {FFFFFF}/editmatext [id] [size] [text size]");

		MatextData[id][mtSize] = ukuran;

		Matext_Refresh(id);
		Matext_Save(id);
		SendClientMessageEx(playerid, COLOR_WHITE, "MATEXT: {FFFFFF}Font Size changed to %d", ukuran);
	}
	else if (!strcmp(type, "color", true))
	{
	    new
	        col;

	    if (sscanf(string, "d", col))
	    {
			SendClientMessage(playerid, COLOR_WHITE, "SYNTAX: {FFFFFF}/editmatext [id] [color] [option]");
			SendClientMessage(playerid, COLOR_WHITE, "OPTION: {FFFFFF}1: White | 2: Blue | 3: Red | 4: Yellow");
		}

		if (col < 1 || col > 4)
		    return SendClientMessage(playerid, COLOR_WHITE, "ERROR: {FFFFFF}You have specified an invalid Color Option!");

		MatextData[id][mtColor] = col;

		Matext_Refresh(id);
		Matext_Save(id);
		SendClientMessageEx(playerid, COLOR_WHITE, "MATEXT: {FFFFFF}Material Text Color changed to Option %d", col);
	}
	else if (!strcmp(type, "position", true))
	{
	    EditingMatext[playerid] = id;

		ShowPlayerDialog(playerid, DIALOG_MTEDIT, DIALOG_STYLE_LIST, "Material Text", "With Move Object\nWith Coordinate", "Select", "Cancel");
	}
	else if (!strcmp(type, "bold", true))
	{
	    new
	        bold;

	    if (sscanf(string, "d", bold))
	    {
			SendClientMessage(playerid, COLOR_WHITE, "SYNTAX: {FFFFFF}/editmatext [id] [bold] [option]");
			SendClientMessage(playerid, COLOR_WHITE, "OPTION: {FFFFFF}0: No | 1: Yes");
		}

		if (bold < 1 || bold > 4)
		    return SendClientMessage(playerid, COLOR_WHITE, "ERROR: {FFFFFF}You have specified an invalid Bold Option!");

		MatextData[id][mtBold] = bold;

		Matext_Refresh(id);
		Matext_Save(id);
		SendClientMessageEx(playerid, COLOR_WHITE, "MATEXT: {FFFFFF}Material Text Bold changed to Option %d", bold);
	}
	return 1;
}

CMD:destroymatext(playerid, params[])
{
	static
	    id = 0;

	if(!pData[playerid][pAdmin])
	    return SendClientMessage(playerid, COLOR_WHITE, "ERROR: {FFFFFF}You don't have permission to use this Command!");

	if (sscanf(params, "d", id))
	    return SendClientMessage(playerid, COLOR_WHITE, "SYNTAX: {FFFFFF}/destroymatext [matextid]");

	if ((id < 0 || id >= MAX_MT) || !MatextData[id][mtExists])
	    return SendClientMessage(playerid, COLOR_WHITE, "ERROR: {FFFFFF} You have specified an invalid Material Text ID.");

	Matext_Delete(id);
	SendClientMessageEx(playerid, COLOR_WHITE, "OBJECT: {FFFFFF}You have successfully destroyed Material Text ID: %d.", id);
	return 1;
}

CMD:destroyobject(playerid, params[])
{
	static
	    id = 0;

	if(!pData[playerid][pAdmin])
	    return SendClientMessage(playerid, COLOR_WHITE, "ERROR: {FFFFFF}You don't have permission to use this Command!");

	if (sscanf(params, "d", id))
	    return SendClientMessage(playerid, COLOR_WHITE, "SYNTAX: {FFFFFF}/destroyobject [object id]");

	if ((id < 0 || id >= MAX_COBJECT) || !ObjectData[id][objExists])
	    return SendClientMessage(playerid, COLOR_WHITE, "ERROR: {FFFFFF} You have specified an invalid Created Object ID.");

	Object_Delete(id);
	SendClientMessageEx(playerid, COLOR_WHITE, "OBJECT: {FFFFFF}You have successfully destroyed Created Object ID: %d.", id);
	return 1;
}
CMD:usebb(playerid, params[])
{
    if(pData[playerid][pBoombox] < 1)
		return Error(playerid, "You dont have boombox");

	new string[128], Float:BBCoord[4], pNames[MAX_PLAYER_NAME];
	GetPlayerPos(playerid, BBCoord[0], BBCoord[1], BBCoord[2]);
	GetPlayerFacingAngle(playerid, BBCoord[3]);
	SetPVarFloat(playerid, "BBX", BBCoord[0]);
	SetPVarFloat(playerid, "BBY", BBCoord[1]);
	SetPVarFloat(playerid, "BBZ", BBCoord[2]);
	GetPlayerName(playerid, pNames, sizeof(pNames));
	BBCoord[0] += (2 * floatsin(-BBCoord[3], degrees));
	BBCoord[1] += (2 * floatcos(-BBCoord[3], degrees));
	BBCoord[2] -= 1.0;
	if(GetPVarInt(playerid, "PlacedBB")) return SCM(playerid, -1, "Kamu Sudah Memasang Boombox");
	foreach(new i : Player)
	{
		if(GetPVarType(i, "PlacedBB"))
		{
			if(IsPlayerInRangeOfPoint(playerid, 30.0, GetPVarFloat(i, "BBX"), GetPVarFloat(i, "BBY"), GetPVarFloat(i, "BBZ")))
			{
				SendClientMessage(playerid, COLOR_WHITE, "Kamu Tidak Dapat Memasang Boombox Disini, Karena Orang Sudah Lain Sudah Memasang Boombox Disini");
				return 1;
			}
		}
	}
	new string2[128];
	format(string2, sizeof(string2), "%s Telah Memasang Boombox!", pNames);
	SendNearbyMessage(playerid, 15, COLOR_PURPLE, string2);
	SetPVarInt(playerid, "PlacedBB", CreateDynamicObject(2102, BBCoord[0], BBCoord[1], BBCoord[2], 0.0, 0.0, 0.0, .worldid = GetPlayerVirtualWorld(playerid), .interiorid = GetPlayerInterior(playerid)));
	format(string, sizeof(string), "Creator "WHITE_E"%s\n["RED_E"/bbhelp for info"WHITE_E"]", pNames);
	SetPVarInt(playerid, "BBLabel", _:CreateDynamic3DTextLabel(string, COLOR_YELLOW, BBCoord[0], BBCoord[1], BBCoord[2]+0.6, 5, .worldid = GetPlayerVirtualWorld(playerid), .interiorid = GetPlayerInterior(playerid)));
	SetPVarInt(playerid, "BBArea", CreateDynamicSphere(BBCoord[0], BBCoord[1], BBCoord[2], 30.0, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid)));
	SetPVarInt(playerid, "BBInt", GetPlayerInterior(playerid));
	SetPVarInt(playerid, "BBVW", GetPlayerVirtualWorld(playerid));
	ApplyAnimation(playerid,"BOMBER","BOM_Plant",4.0,0,0,0,0,0);
	ApplyAnimation(playerid,"BOMBER","BOM_Plant",4.0,0,0,0,0,0);
	return 1;
}

CMD:bbhelp(playerid, params[])
{
	SyntaxMsg(playerid, "/usebb /setbb /pickupbb");
	return 1;
}

CMD:setbb(playerid, params[])
{
    if(pData[playerid][pBoombox] == 0)
	    return SendClientMessage(playerid, 0xCECECEFF, "you dont have boombox");

	if(GetPVarType(playerid, "PlacedBB"))
	{
		if(IsPlayerInRangeOfPoint(playerid, 3.0, GetPVarFloat(playerid, "BBX"), GetPVarFloat(playerid, "BBY"), GetPVarFloat(playerid, "BBZ")))
		{
			ShowPlayerDialog(playerid,DIALOG_BOOMBOX,DIALOG_STYLE_LIST,"Boombox","Turn Off Boombox\nInput URL","Select", "Cancel");
		}
		else
		{
   			return SendClientMessage(playerid, -1, "You're not near from your boombox");
		}
    }
    else
    {
        SendClientMessage(playerid, -1, "you didnt place boombox before");
	}
	return 1;
}

CMD:pickupbb(playerid, params [])
{
    if(pData[playerid][pBoombox] == 0)
	    return SendClientMessage(playerid, 0xCECECEFF, "you dont have boombox");

	if(!GetPVarInt(playerid, "PlacedBB"))
    {
        SendClientMessage(playerid, -1, "you dont have placedboombox to take");
    }
	if(IsPlayerInRangeOfPoint(playerid, 3.0, GetPVarFloat(playerid, "BBX"), GetPVarFloat(playerid, "BBY"), GetPVarFloat(playerid, "BBZ")))
    {
        PickUpBoombox(playerid);
        SendClientMessage(playerid, -1, "boombox pickup");
    }
    return 1;
}
stock StopStream(playerid)
{
	DeletePVar(playerid, "pAudioStream");
    StopAudioStreamForPlayer(playerid);
}

stock PlayStream(playerid, url[], Float:posX = 0.0, Float:posY = 0.0, Float:posZ = 0.0, Float:distance = 50.0, usepos = 0)
{
	if(GetPVarType(playerid, "pAudioStream")) StopAudioStreamForPlayer(playerid);
	else SetPVarInt(playerid, "pAudioStream", 1);
    PlayAudioStreamForPlayer(playerid, url, posX, posY, posZ, distance, usepos);
}

stock PickUpBoombox(playerid)
{
    foreach(new i : Player)
	{
 		if(IsPlayerInDynamicArea(i, GetPVarInt(playerid, "BBArea")))
   		{
     		StopStream(i);
		}
	}
	DeletePVar(playerid, "BBArea");
	DestroyDynamicObject(GetPVarInt(playerid, "PlacedBB"));
	DestroyDynamic3DTextLabel(Text3D:GetPVarInt(playerid, "BBLabel"));
	DeletePVar(playerid, "PlacedBB"); DeletePVar(playerid, "BBLabel");
 	DeletePVar(playerid, "BBX"); DeletePVar(playerid, "BBY"); DeletePVar(playerid, "BBZ");
	DeletePVar(playerid, "BBInt");
	DeletePVar(playerid, "BBVW");
	DeletePVar(playerid, "BBStation");
	return 1;
}

CMD:help(playerid, params[])
{
	new str[512], info[512];
	format(str, sizeof(str), "Tentang\tPenjelasan\nHotKeys\t-> Berisi mengenai fungsi masing - masing tombol\nNeeds\t-> Petunjuk untuk Hbe System\nPerintah Dasar\t-> Berisi tentang petintah dasar\nPerintah Kendaraan\t-> Berisi tentang perintah kendaraan\nPerintah Organisasi\t-> Berisi tentang perintah organisasi\nPerintah Rumah\t-> Berisi tentang perintah rumah\nPerintah Bisnis\t-> Berisi tentang perintah bisnis");
	strcat(info, str);
	if(pData[playerid][pRobLeader] > 1 || pData[playerid][pMemberRob] > 1)
	{
		format(str, sizeof(str), "Robbery Help");
		strcat(info, str);	
	}
	ShowPlayerDialog(playerid, DIALOG_HELP, DIALOG_STYLE_TABLIST_HEADERS, "Greenwich - Bantuan", info, "Pilih", "Tutup");
	return 1;
}

CMD:dcp(playerid)
{
    if(pData[playerid][pSideJob] > 1 || pData[playerid][pCP] > 1)
		return ErrorMsg(playerid, "Harap selesaikan Pekerjaan mu terlebih dahulu");
		
	DisablePlayerCheckpoint(playerid);
	DisablePlayerRaceCheckpoint(playerid);
	Servers(playerid, "Menghapus Checkpoint Sukses");
	return 1;
}
CMD:credits(playerid)
{
	new line1[1200], line2[300], line3[500];
	strcat(line3, ""GREEN_E"Coder: "WHITE_E"Exyle a.k.a Lenz\n");
	strcat(line3, ""GREEN_E"Developer: "WHITE_E"Exyle a.k.a Lenz\n");
	strcat(line3, ""GREEN_E"Website: "WHITE_E"-\n");
	format(line2, sizeof(line2), ""GREEN_E"Server Support: "WHITE_E"%s & All SA-MP Team\n\n\
	"GREEN_E"Terima kasih telah bergabung dengan kami! Copyright © 2023 | Greenwich.", pData[playerid][pName]);
	format(line1, sizeof(line1), "%s%s", line3, line2);
   	ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, ""GREEN_E"GWRP: "WHITE_E"Server Credits", line1, "OK", "");
	return 1;
}

CMD:vip(playerid)
{
	new longstr2[3500];
	strcat(longstr2, ""YELLOW_E"Looking for bonus features and commands? Get premium status today!\n\n"RED_E"Premium features:\n\
	"dot""GREEN_E"VIP Regular(1) "PINK_E"Rp.30.000/month"RED_E"|| "PINK_E"Features:\n\
	"YELLOW_E"1) "WHITE_E"Gratis "LB_E"20 "WHITE_E"VIP Gold.\n");
	strcat(longstr2, ""YELLOW_E"2) "WHITE_E"Mendapat "GREEN_E"2 "WHITE_E"slot job.\n");

	strcat(longstr2, ""YELLOW_E"3) "WHITE_E"Akses custom VIP room dan VIP locker.\n\
	"YELLOW_E"4) "WHITE_E"Mempunya "LB_E"4 "WHITE_E"slot untuk kendaraan pribadi.\n\
	"YELLOW_E"5) "WHITE_E"Mempunya "LB_E"2 "WHITE_E"Slot untuk rumah.\n");
	strcat(longstr2, ""YELLOW_E"6) "WHITE_E"Mempunyai "LB_E"2 "WHITE_E"slot untuk bisnis.\n\
	"YELLOW_E"7) "WHITE_E"Akses VIP chat dan VIP status "LB_E"/vips"WHITE_E".\n");
	strcat(longstr2, ""YELLOW_E"8) "WHITE_E"Waktu Paycheck/Payday "LB_E"5% "WHITE_E"lebih cepat.\n\
	"YELLOW_E"9) "WHITE_E"Mendapatkan "LB_E"10% "WHITE_E"bunga bank setiap kali paycheck.");


	strcat(longstr2, "\n\n"dot""YELLOW_E"Premium(2) "PINK_E"Rp.50,000/month "RED_E"|| "PINK_E"Features:\n\
	"YELLOW_E"1) "WHITE_E"Gratis "LB_E"30"WHITE_E" VIP Gold.\n\
	"YELLOW_E"2) "WHITE_E"Mendapat "GREEN_E"2 "WHITE_E"slot job.\n");
	strcat(longstr2, ""YELLOW_E"3) "WHITE_E"Akses custom VIP room dan VIP locker.\n\
	"YELLOW_E"4) "WHITE_E"Mempunyai "LB_E"5 "WHITE_E"slot untuk kendaraan pribadi.");

	strcat(longstr2, "\n"YELLOW_E"5) "WHITE_E"Mempunyai "LB_E"3 "WHITE_E"Slot untuk rumah.\n\
	"YELLOW_E"6) "WHITE_E"Mempunyai "LB_E"3 "WHITE_E"slot untuk bisnis.\n\
	"YELLOW_E"7) "WHITE_E"Akses VIP chat dan VIP status "LB_E"/vips"WHITE_E".\n");
	strcat(longstr2, ""YELLOW_E"8) "WHITE_E"Waktu Paycheck/Payday "LB_E"10% "WHITE_E"lebih cepat\n\
	"YELLOW_E"9) "WHITE_E"Mendapatkan "LB_E"15% "WHITE_E"bunga bank setiap kali paycheck.");

	strcat(longstr2, "\n\n"dot""PURPLE_E"VIP Diamond(3) "PINK_E"Rp.80,000/month "RED_E"|| "PINK_E"Features:\n\
	"YELLOW_E"1) "WHITE_E"Gratis "LB_E"40 "WHITE_E"VIP Gold.\n\
	"YELLOW_E"2) "WHITE_E"Mendapat "GREEN_E"2 "WHITE_E"slot job.\n\
	"YELLOW_E"3) "WHITE_E"Akses custom VIP room dan VIP locker.");
	strcat(longstr2, "\n"YELLOW_E"4) "WHITE_E"Mempunyai "LB_E"6 "WHITE_E"slot untuk kendaraan pribadi.\n\
	"YELLOW_E"5) "WHITE_E"Mempunyai "LB_E"4 "WHITE_E"Slot untuk rumah.\n\
	"YELLOW_E"6) "WHITE_E"Mempunyai "LB_E"4 "WHITE_E"slot untuk bisnis.\n\
	"YELLOW_E"7) "WHITE_E"Akses VIP chat dan VIP status "LB_E"/vips"WHITE_E".");
	strcat(longstr2, "\n"YELLOW_E"8) "WHITE_E"Waktu Paycheck/Payday "LB_E"15% "WHITE_E"lebih cepat.\n\
	"YELLOW_E"9) "WHITE_E"Mendapatkan "LB_E"20% "WHITE_E"bunga bank setiap kali paycheck.");

	strcat(longstr2, "\n\n"LB_E"Pembayaran Dana/Gopay/Bank BCA. "LB2_E"Harga VIP Gold "LB_E"Rp.5,000/Per Hari.\n\
	"YELLOW_E"Untuk informasi selengkapnya hubungi Guluu (Server Owner & Founder)!");
	ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, ""ORANGE_E"Greenwich:RP "PINK_E"VIP SYSTEM", longstr2, "Close", "");
	return 1;
}

CMD:email(playerid)
{
    if(pData[playerid][IsLoggedIn] == false)
		return ErrorMsg(playerid, "Kamu harus login!");

	ShowPlayerDialog(playerid, DIALOG_EMAIL, DIALOG_STYLE_INPUT, ""WHITE_E"Set Email", ""WHITE_E"Masukkan Email.\nIni akan digunakan sebagai ganti kata sandi.\n\n"RED_E"* "WHITE_E"Email mu tidak akan termunculkan untuk Publik\n"RED_E"* "WHITE_E"Email hanya berguna untuk verifikasi Password yang terlupakan dan berita lainnya\n\
	"RED_E"* "WHITE_E"Be sure to double-check and enter a valid email address!", "Enter", "Exit");
	return 1;
}

CMD:changepass(playerid)
{
    if(pData[playerid][IsLoggedIn] == false)
		return ErrorMsg(playerid, "Kamu harus login sebelum menggantinya!");

	ShowPlayerDialog(playerid, DIALOG_PASSWORD, DIALOG_STYLE_INPUT, ""WHITE_E"Change your password", "Masukkan Password untuk menggantinya!", "Change", "Exit");
	InfoTD_MSG(playerid, 3000, "~g~~h~Masukkan password yang sebelum nya anda pakai!");
	return 1;
}

CMD:gshop(playerid, params[])
{
	if(IsAtEvent[playerid] == 1)
		return ErrorMsg(playerid, "Anda sedang mengikuti event & tidak bisa melakukan ini");

	new Dstring[512];
	format(Dstring, sizeof(Dstring), "Gold Shop\tPrice\n\
	Instant Change Name\t500 Gold\n");
	format(Dstring, sizeof(Dstring), "%sClear Warning\t1000 Gold\n", Dstring);
	format(Dstring, sizeof(Dstring), "%sVIP Level 1(7 Days)\t150 Gold\n", Dstring);
	format(Dstring, sizeof(Dstring), "%sVIP Level 2(7 Days)\t250 Gold\n", Dstring);
	format(Dstring, sizeof(Dstring), "%sVIP Level 3(7 Days)\t500 Gold\n", Dstring);
	ShowPlayerDialog(playerid, DIALOG_GOLDSHOP, DIALOG_STYLE_TABLIST_HEADERS, "Gold Shop", Dstring, "Buy", "Cancel");
	return 1;
}

CMD:getcord(playerid, params[])
{
	new int, Float:px,Float:py,Float:pz, Float:a;
	GetPlayerPos(playerid, px, py, pz);
	GetPlayerFacingAngle(playerid, a);
	int = GetPlayerInterior(playerid);
	new zone[MAX_ZONE_NAME];
	GetPlayer3DZone(playerid, zone, sizeof(zone));
	SendClientMessageEx(playerid, COLOR_WHITE, "Lokasi Anda Saat Ini: %s (%0.2f, %0.2f, %0.2f, %0.2f) Int = %d", zone, px, py, pz, a, int);
	return 1;
}

CMD:death(playerid, params[])
{
    if(pData[playerid][pInjured] == 0)
        return 1;
        
	if(emsdikota > 5) 
		return ErrorMsg(playerid, "Anda tidak dapat menggunakan ini!, dikarenakan ada 5 ems lebih dikota");
    if(pData[playerid][pJail] > 0)
        return ErrorMsg(playerid, "You can't do this when in jail!");
        
    if(pData[playerid][pArrest] > 0)
        return ErrorMsg(playerid, "You can't do this when in arrest sapd!");

    if((gettime()-GetPVarInt(playerid, "GiveUptime")) < 100)
        return ErrorMsg(playerid, "You must waiting 3 minutes for spawn to hospital");

    Servers(playerid, "You have given up and accepted your death.");
    pData[playerid][pHospitalTime] = 0;
    pData[playerid][pHospital] = 1;
    ResetPlayerWeaponsEx(playerid);

    HideTdDeath(playerid);
    return 1;
}

CMD:sleep(playerid, params[])
{
	if(IsAtEvent[playerid] == 1)
		return ErrorMsg(playerid, "Anda sedang mengikuti event & tidak bisa melakukan ini");

	if(pData[playerid][pInjured] == 1)
        return ErrorMsg(playerid, "Kamu tidak bisa melakukan ini disaat yang tidak tepat!");
	
	if(pData[playerid][pInHouse] == -1)
		return ErrorMsg(playerid, "Kamu tidak berada didalam rumah.");
	
	InfoTD_MSG(playerid, 10000, "Sleeping... Harap Tunggu");
	TogglePlayerControllable(playerid, 0);
	new time = (100 - pData[playerid][pEnergy]) * (400);
    SetTimerEx("UnfreezeSleep", time, 0, "i", playerid);
	switch(random(6))
	{
		case 0: ApplyAnimation(playerid, "INT_HOUSE", "BED_In_L",4.1,0,0,0,1,1);
		case 1: ApplyAnimation(playerid, "INT_HOUSE", "BED_In_R",4.1,0,0,0,1,1);
		case 2: ApplyAnimation(playerid, "INT_HOUSE", "BED_Loop_L",4.1,1,0,0,1,1);
		case 3: ApplyAnimation(playerid, "INT_HOUSE", "BED_Loop_R",4.1,1,0,0,1,1);
		case 4: ApplyAnimation(playerid, "INT_HOUSE", "BED_Out_L",4.1,0,1,1,0,0);
		case 5: ApplyAnimation(playerid, "INT_HOUSE", "BED_Out_R",4.1,0,1,1,0,0);
	}
	return 1;
}

CMD:idcard(playerid, params[])
{
	if(pData[playerid][pIDCard] == 0) return ErrorMsg(playerid, "You Not Have ID Card!");
	new sext[40];
	if(pData[playerid][pGender] == 1) { sext = "Male"; } else { sext = "Female"; }
	SendNearbyMessage(playerid, 20.0, COLOR_GREEN, "[ID-Card] "GREY3_E"Name: %s | Gender: %s | Brithday: %s | Expire: %s.", pData[playerid][pName], sext, pData[playerid][pAge], ReturnTimelapse(gettime(), pData[playerid][pIDCardTime]));
	return 1;
}

CMD:bpjs(playerid, params[])
{
	if(pData[playerid][pBpjs] == 0) return ErrorMsg(playerid, "You Not Have bpjs card!");
	new sext[40];
	if(pData[playerid][pGender] == 1) { sext = "Male"; } else { sext = "Female"; }
	SendNearbyMessage(playerid, 20.0, COLOR_GREEN, "[BPJS-Card] "GREY3_E"Name: %s | Gender: %s | Brithday: %s | Expire: %s.", pData[playerid][pName], sext, pData[playerid][pAge], ReturnTimelapse(gettime(), pData[playerid][pIDCardTime]));
	return 1;
}

CMD:drivelic(playerid, params[])
{
	if(pData[playerid][pDriveLic] == 0) return ErrorMsg(playerid, "You Not Have Driving License/SIM!");
	new sext[40];
	if(pData[playerid][pGender] == 1) { sext = "Male"; } else { sext = "Female"; }
	SendNearbyMessage(playerid, 20.0, COLOR_GREEN, "[Drive-Lic] "GREY3_E"Name: %s | Gender: %s | Brithday: %s | Expire: %s.", pData[playerid][pName], sext, pData[playerid][pAge], ReturnTimelapse(gettime(), pData[playerid][pDriveLicTime]));
	return 1;
}

CMD:buatktp(playerid, params[])
{
	if(!IsPlayerInRangeOfPoint(playerid, 3.0, 1376.164062,1573.931030,17.000314)) return ErrorMsg(playerid, "You Must At Greenwich City Hall!");
	if(pData[playerid][pIDCard] != 0) return ErrorMsg(playerid, "You Already Have a ID Card!");
	new sext[40], mstr[128];
	if(pData[playerid][pGender] == 1) { sext = "Male"; } else { sext = "Female"; }
	format(mstr, sizeof(mstr), "{FFFFFF}Name: %s\nRegion: American\nDate Of Birth: %s\nGender: %s\nExpire For Up To 30 Days!", pData[playerid][pName], pData[playerid][pAge], sext);
	ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, "{007a1e}ID-Card", mstr, "{e31d1d}Close", "");
	pData[playerid][pIDCard] = 1;
	pData[playerid][pIDCardTime] = gettime() + (30 * 86400);
	Server_AddMoney(25);
	ShowItemBox(playerid, "ID Card", "Received_1x", 1581, 4);
	return 1;
}

CMD:newbpjs(playerid, params[])
{
	if(!IsPlayerInRangeOfPoint(playerid, 3.0, 1254.43, -1287.64, 1061.24)) return ErrorMsg(playerid, "You Must In Greenwich Hospital!");
	if(pData[playerid][pBpjs] != 0) return ErrorMsg(playerid, "You Already Has Bpjs Card!");
	if(GetPlayerMoney(playerid) < 100) return ErrorMsg(playerid, "You Need $100 Money For New Bpjs Card");
	new sext[40], mstr[128];
	if(pData[playerid][pGender] == 1) { sext = "Male"; } else { sext = "Female"; }
	format(mstr, sizeof(mstr), "{FFFFFF}Name: %s\nRegion: American\nDate Of Birth: %s\nGender: %s\nBerlaku hingga 30 hari!", pData[playerid][pName], pData[playerid][pAge], sext);
	ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, "{007a1e}BPJS Card", mstr, "{e31d1d}Close", "");
	pData[playerid][pBpjs] = 1;
	pData[playerid][pBpjsTime] = gettime() + (30 * 86400);
	GivePlayerMoneyEx(playerid, -100);
	Server_AddMoney(25);
	return 1;
}

CMD:payticket(playerid, params[])
{
	if(!IsPlayerInRangeOfPoint(playerid, 3.0, 113.47, 1164.85, 10019.16) && !IsPlayerInRangeOfPoint(playerid, 3.0, 113.47, 1164.85, 10019.16)) return ErrorMsg(playerid, "You Must In Police Department Office!");
	
	new vehid;
	if(sscanf(params, "d", vehid))
		return SyntaxMsg(playerid, "/payticket [vehid] | /myv - for find vehid");
		
	if(vehid == INVALID_VEHICLE_ID || !IsValidVehicle(vehid))
		return ErrorMsg(playerid, "Invalid id");
		
	foreach(new i : PVehicles)
	{
		if(vehid == pvData[i][cVeh])
		{
			if(pvData[i][cOwner] == pData[playerid][pID])
			{
				new ticket = pvData[i][cTicket];
				
				if(ticket > GetPlayerMoney(playerid))
					return ErrorMsg(playerid, "Not enough money! check your ticket in /v insu.");
					
				if(ticket > 0)
				{
					GivePlayerMoneyEx(playerid, -ticket);
					pvData[i][cTicket] = 0;
					Info(playerid, "You have successfully paid your vehicle ticket %s(id: %d) for "RED_E"%s", GetVehicleName(vehid), vehid, FormatMoney(ticket));
					return 1;
				}
			}
			else return ErrorMsg(playerid, "This Vehicle Is Not Your Own! /myv - for find vehid");
		}
	}
	return 1;
}

CMD:buyplate(playerid, params[])
{
	if(!IsPlayerInRangeOfPoint(playerid, 56,116.03,1165.16,10019.16)) return ErrorMsg(playerid, "You Must In Police Department Office!");
		
	new vehid;
	if(sscanf(params, "d", vehid)) return SyntaxMsg(playerid, "/buyplate [vehid] | /myv - for find vehid");
	
	if(vehid == INVALID_VEHICLE_ID || !IsValidVehicle(vehid))
		return ErrorMsg(playerid, "Invalid id");
			
	foreach(new i : PVehicles)
	{
		if(vehid == pvData[i][cVeh])
		{
			if(pvData[i][cOwner] == pData[playerid][pID])
			{
				if(GetPlayerMoney(playerid) < 500) return ErrorMsg(playerid, "You Need $500 To Buy A NEW Plate!.");
				GivePlayerMoneyEx(playerid, -500);
				new rand = RandomEx(1111, 9999);
				format(pvData[i][cPlate], 32, "GI-%d", rand);
				SetVehicleNumberPlate(pvData[i][cVeh], pvData[i][cPlate]);
				pvData[i][cPlateTime] = gettime() + (15 * 86400);
				ShowItemBox(playerid, "Uang", "REMOVED_$500", 1212, 4);
				Info(playerid, "Model: %s || New plate: %s || Plate Time: %s || Plate Price: $500", GetVehicleModelName(pvData[i][cModel]), pvData[i][cPlate], ReturnTimelapse(gettime(), pvData[i][cPlateTime]));
			}
			else return ErrorMsg(playerid, "This Vehicles ID Is Invalid! Use /myv To Find Vehicles ID.");
		}
	}
	return 1;
}

CMD:sellpv(playerid, params[])
{
	if(!IsPlayerInRangeOfPoint(playerid, 3.0, 1545.033935,-2177.635498,13.582808)) return ErrorMsg(playerid, "You Must In Insurance!");
	
	new vehid;
	if(sscanf(params, "d", vehid)) return SyntaxMsg(playerid, "/sellpv [vehid] | /myv - for find vehid");
	if(vehid == INVALID_VEHICLE_ID) return ErrorMsg(playerid, "Invalid id");
			
	foreach(new i : PVehicles)
	{
		if(vehid == pvData[i][cVeh])
		{
			if(pvData[i][cOwner] == pData[playerid][pID])
			{
				if(!IsValidVehicle(pvData[i][cVeh])) return ErrorMsg(playerid, "Your vehicle is not spanwed!");
				if(pvData[i][cRent] != 0) return ErrorMsg(playerid, "You can't sell Rent Vehicle!");
				new pay = pvData[i][cPrice] / 2;
				GivePlayerMoneyEx(playerid, pay);
				
				Info(playerid, "Anda menjual kendaraan model %s(%d) dengan seharga "LG_E"%s", GetVehicleName(vehid), GetVehicleModel(vehid), FormatMoney(pay));
				new str[150];
				format(str,sizeof(str),"[VEH]: %s menjual kendaraan %s seharga %s!", GetRPName(playerid), GetVehicleName(vehid), FormatMoney(pay));
				LogServer("Property", str);
				new query[128];
				mysql_format(g_SQL, query, sizeof(query), "DELETE FROM vehicle WHERE id = '%d'", pvData[i][cID]);
				mysql_tquery(g_SQL, query);
				if(IsValidVehicle(pvData[i][cVeh])) DestroyVehicle(pvData[i][cVeh]);
				pvData[i][cVeh] = INVALID_VEHICLE_ID;
				Iter_SafeRemove(PVehicles, i, i);
			}
			else return ErrorMsg(playerid, "ID kendaraan ini bukan punya mu! gunakan /myv untuk mencari ID.");
		}
	}
	return 1;
}

CMD:newrek(playerid, params[])
{
	if(!IsPlayerInRangeOfPoint(playerid, 3.0, 1977.40, -2055.13, 13.59)) return ErrorMsg(playerid, "You Must At Bank!");
	if(GetPlayerMoney(playerid) < 50) return ErrorMsg(playerid, "Not enough money!");
	new query[128], rand = RandomEx(111111, 999999);
	new rek = rand+pData[playerid][pID];
	mysql_format(g_SQL, query, sizeof(query), "SELECT brek FROM players WHERE brek='%d'", rek);
	mysql_tquery(g_SQL, query, "BankRek", "id", playerid, rek);
	Info(playerid, "New Rekening Bank!");
	GivePlayerMoneyEx(playerid, -50);
	Server_AddMoney(50);
	return 1;
}

CMD:bank(playerid, params[])
{
	if(!IsPlayerInRangeOfPoint(playerid, 3.0, 1977.40, -2055.13, 13.59)) return ErrorMsg(playerid, "You Must At Bank Point!");
	new tstr[128];
	format(tstr, sizeof(tstr), ""GWRP_E"No Rek: "LB_E"%d", pData[playerid][pBankRek]);
	ShowPlayerDialog(playerid, DIALOG_BANK, DIALOG_STYLE_LIST, tstr, "Deposit Money\nWithdraw Money\nCheck Balance\nTransfer Money\nSign Paycheck", "{27d23d}Enter", "{e31d1d}Cancel");
	return 1;
}

CMD:handsup(playerid, params[])
{
    SetPlayerSpecialAction(playerid,SPECIAL_ACTION_HANDSUP);
    return 1;
}

CMD:getjobd(playerid, params[]) {
    if(!IsPlayerInRangeOfPoint(playerid, 6.0, 2355.0962, -658.8605, 128.0284))  return 1;
    if(JOB[playerid] != 0)  return SendClientMessage(playerid, ATENTIE, "Error: You already have a job. Type in [/quitjob]");
 
    JOB[playerid] = 1;
    inJOB[playerid] = 0;
    SendClientMessage(playerid, -1, "{1E90FF} You got a job at Hunter. To start work type[/work]. ");
 
    return 1;
}
 
CMD:workd(playerid, params[]) {
	if(!IsPlayerInRangeOfPoint(playerid, 1.0, 2194.09, -999.94, 62.93)) {
		if(inJOB[playerid] == 1) return 1;
		else {
			SendClientMessage(playerid, ATENTIE, "* You have to be at the WORK place. Follow the CP on the map! ");
			SetPlayerCheckpoint(playerid, 2194.09, -999.94, 62.93, 3.5); 
		}
	} else {
		if(inJOB[playerid] == 1)
			SendClientMessage(playerid, ATENTIE, "Eroare: Deja muncesti! ");
		else {
			inJOB[playerid] = 1;
			new rand = random(3);
			switch(rand) {
				case 1: {
					Car_Job[playerid] = CreateVehicle(505, 2406.32, -383.63, 67.75, -180.5998, 225, 142, 100);
				}
				case 2: {
					Car_Job[playerid] = CreateVehicle(505, 2406.32, -383.63, 67.75, 1.5600, 120, 131, 100);
				}
				default: Car_Job[playerid] = CreateVehicle(505, 2406.32, -383.63, 67.75, 1.5600, 162, 215, 100);
			}
			GivePlayerWeapon(playerid, 33, 99999);
			PutPlayerInVehicle(playerid, Car_Job[playerid], 0);
			Deep_Deer[playerid] = 0;
			Shoot_Deer[playerid] = 0;

			SetTimerEx("Next_Deer", 1000, false, "i", playerid);
        }
    }
 
    return 1;
}
 
CMD:jobd(playerid, params[]) {
    SetPlayerPos(playerid, 2194.09, -999.94, 62.93);
 
    return 1;
}

CMD:stats(playerid, params[])
{
	if(pData[playerid][IsLoggedIn] == false)
	{
	    ErrorMsg(playerid, "You must be logged in to check statistics!");
	    return 1;
	}
	
	DisplayStats(playerid, playerid);
	return 1;
}

CMD:settings(playerid)
{
	if(pData[playerid][IsLoggedIn] == false)
	{
	    ErrorMsg(playerid, "You must be logged in to check statistics!");
	    return 1;
	}
	
	new str[1024], hbemode[64], togpm[64], toglog[64], togads[64], togwt[64];
	if(pData[playerid][pHBEMode] == 1)
	{
		hbemode = ""LG_E"Enable (1)";
	}
 	else if(pData[playerid][pHBEMode] == 2)
	{
		hbemode = ""LG_E"Enable (2)";
	}
	else if(pData[playerid][pHBEMode] == 3)
	{
		hbemode = ""LG_E"Enable (3)";
	}
	else
	{
		hbemode = ""RED_E"Disable";
	}
	
	if(pData[playerid][pTogPM] == 0)
	{
		togpm = ""RED_E"Disable";
	}
	else
	{
		togpm = ""LG_E"Enable";
	}
	
	if(pData[playerid][pTogLog] == 0)
	{
		toglog = ""RED_E"Disable";
	}
	else
	{
		toglog = ""LG_E"Enable";
	}
	
	if(pData[playerid][pTogAds] == 0)
	{
		togads = ""RED_E"Disable";
	}
	else
	{
		togads = ""LG_E"Enable";
	}
	
	if(pData[playerid][pTogWT] == 0)
	{
		togwt = ""RED_E"Disable";
	}
	else
	{
		togwt = ""LG_E"Enable";
	}
	
	format(str, sizeof(str), "Settings\tStatus\n"WHITEP_E"Email:\t"GREY3_E"%s\n"WHITEP_E"Change Password\n"WHITEP_E"HUD HBE Mode:\t%s\n"WHITEP_E"Toggle PM:\t%s\n"WHITEP_E"Toggle Log Server:\t%s\n"WHITEP_E"Toggle Ads:\t%s\n"WHITEP_E"Toggle WT:\t%s",
	pData[playerid][pEmail], 
	hbemode, 
	togpm,
	toglog,
	togads,
	togwt
	);
	
	ShowPlayerDialog(playerid, DIALOG_SETTINGS, DIALOG_STYLE_TABLIST_HEADERS, "Settings", str, "Set", "Close");
	return 1;
}

CMD:frisk(playerid, params[])
{
	if(IsAtEvent[playerid] == 1)
		return Error(playerid, "Anda sedang mengikuti event & tidak bisa melakukan ini");

	new otherid;
	if(sscanf(params, "u", otherid))
        return SyntaxMsg(playerid, "/frisk [playerid/PartOfName]");

    if(otherid == INVALID_PLAYER_ID || !NearPlayer(playerid, otherid, 5.0))
        return Error(playerid, "Player tidak berada didekat mu.");

    if(otherid == playerid)
        return Error(playerid, "Kamu tidak bisa memeriksa dirimu sendiri.");

    pData[otherid][pFriskOffer] = playerid;

    Info(otherid, "%s has offered to frisk you (type \"/accept frisk or /deny frisk\").", ReturnName(playerid));
    Info(playerid, "You have offered to frisk %s.", ReturnName(otherid));
	return 1;
}

CMD:cancelinspect(playerid, params[])
{
       if(pData[playerid][pInsOffer] == INVALID_PLAYER_ID || !IsPlayerConnected(pData[playerid][pInsOffer]))
				return ErrorMsg(playerid, "Player tersebut belum masuk!");

       Info(playerid, "Anda telah menolak tawaran Inspect kepada %s.", ReturnName(pData[playerid][pInsOffer]));
       pData[playerid][pInsOffer] = INVALID_PLAYER_ID;
       return 1;
}

CMD:acceptinspect(playerid, params[])
{
    if(pData[playerid][pInsOffer] == INVALID_PLAYER_ID || !IsPlayerConnected(pData[playerid][pFriskOffer]))
		return ErrorMsg(playerid, "Player tersebut belum masuk!");

	if(!NearPlayer(playerid, pData[playerid][pInsOffer], 5.0))
		return ErrorMsg(playerid, "Kamu harus didekat Player.");

	new hstring[512], info[512];
	new hh = pData[playerid][pHead];
	new hp = pData[playerid][pPerut];
	new htk = pData[playerid][pRHand];
	new htka = pData[playerid][pLHand];
	new hkk = pData[playerid][pRFoot];
	new hkka = pData[playerid][pLFoot];
	format(hstring, sizeof(hstring),"Bagian Tubuh\tKondisi\n{ffffff}Kepala\t{7fffd4}%d.0%\n{ffffff}Perut\t{7fffd4}%d.0%\n{ffffff}Tangan Kanan\t{7fffd4}%d.0%\n{ffffff}Tangan Kiri\t{7fffd4}%d.0%\n",hh,hp,htk,htka);
	strcat(info, hstring);
	format(hstring, sizeof(hstring),"{ffffff}Kaki Kanan\t{7fffd4}%d.0%\n{ffffff}Kaki Kiri\t{7fffd4}%d.0%\n",hkk,hkka);
	strcat(info, hstring);
	ShowPlayerDialog(pData[playerid][pInsOffer],DIALOG_HEALTH,DIALOG_STYLE_TABLIST_HEADERS,"Health Condition",info,"Oke","");
	Servers(playerid, "Anda telah berhasil menaccept tawaran Inspect kepada %s.", ReturnName(pData[playerid][pInsOffer]));
	pData[playerid][pInsOffer] = INVALID_PLAYER_ID;
	return 1;
}

CMD:inspect(playerid, params[])
{
	if(IsAtEvent[playerid] == 1)
		return Error(playerid, "Anda sedang mengikuti event & tidak bisa melakukan ini");

	new otherid;
	if(sscanf(params, "u", otherid))
        return SyntaxMsg(playerid, "/inspect [playerid/PartOfName]");

    if(otherid == INVALID_PLAYER_ID || !NearPlayer(playerid, otherid, 5.0))
        return Error(playerid, "Player tidak berada didekat mu.");

    if(otherid == playerid)
        return Error(playerid, "Kamu tidak bisa memeriksa dirimu sendiri.");

    pData[otherid][pInsOffer] = playerid;

    Info(otherid, "%s has offered to inspect you (type \"/acceptinspect or /cancelinspect \").", ReturnName(playerid));
    Info(playerid, "You have offered to inspect %s.", ReturnName(otherid));
	return 1;
}



CMD:accept(playerid, params[])
{
	if(IsAtEvent[playerid] == 1)
		return Error(playerid, "Anda sedang mengikuti event & tidak bisa melakukan ini");

	if(IsPlayerConnected(playerid)) 
	{
        if(isnull(params)) 
		{
            SyntaxMsg(playerid, "SyntaxMsg: /accept [name]");
            Info(playerid, "Names: faction, family, drag, frisk, inspect, job, rob");
            return 1;
        }
		if(strcmp(params,"faction",true) == 0) 
		{
            if(IsPlayerConnected(pData[playerid][pFacOffer])) 
			{
                if(pData[playerid][pFacInvite] > 0) 
				{
                    pData[playerid][pFaction] = pData[playerid][pFacInvite];
					pData[playerid][pFactionRank] = 1;
					Info(playerid, "Anda telah menerima invite faction dari %s", pData[pData[playerid][pFacOffer]][pName]);
					Info(pData[playerid][pFacOffer], "%s telah menerima invite faction yang anda tawari", pData[playerid][pName]);
					pData[playerid][pFacInvite] = 0;
					pData[playerid][pFacOffer] = -1;
				}
				else
				{
					Error(playerid, "Invalid faction id!");
					return 1;
				}
            }
            else 
			{
                Error(playerid, "Tidak ada player yang menawari anda!");
                return 1;
            }
        }
		if(strcmp(params,"family",true) == 0) 
		{
            if(IsPlayerConnected(pData[playerid][pFamOffer])) 
			{
                if(pData[playerid][pFamInvite] > -1) 
				{
                    pData[playerid][pFamily] = pData[playerid][pFamInvite];
					pData[playerid][pFamilyRank] = 1;
					Info(playerid, "Anda telah menerima invite family dari %s", pData[pData[playerid][pFamOffer]][pName]);
					Info(pData[playerid][pFamOffer], "%s telah menerima invite family yang anda tawari", pData[playerid][pName]);
					pData[playerid][pFamInvite] = 0;
					pData[playerid][pFamOffer] = -1;
				}
				else
				{
					Error(playerid, "Invalid family id!");
					return 1;
				}
            }
            else 
			{
                Error(playerid, "Tidak ada player yang menawari anda!");
                return 1;
            }
        }
		else if(strcmp(params,"carry",true) == 0)
		{
			new dragby = GetPVarInt(playerid, "DragBy");
			if(dragby == INVALID_PLAYER_ID || dragby == playerid)
				return Error(playerid, "Player itu Disconnect.");
        
			if(!NearPlayer(playerid, dragby, 5.0))
				return Error(playerid, "Kamu harus didekat Player.");
        
			pData[playerid][pDragged] = 1;
			pData[playerid][pDraggedBy] = dragby;

			pData[playerid][pDragTimer] = SetTimerEx("DragUpdate", 1000, true, "ii", dragby, playerid);
			SendNearbyMessage(dragby, 30.0, COLOR_PURPLE, "* %s grabs %s and starts dragging them, (/uncarry).", ReturnName(dragby), ReturnName(playerid));
			return true;
		}
		else if(strcmp(params,"frisk",true) == 0)
		{
			if(pData[playerid][pFriskOffer] == INVALID_PLAYER_ID || !IsPlayerConnected(pData[playerid][pFriskOffer]))
				return Error(playerid, "Player tersebut belum masuk!");
			
			if(!NearPlayer(playerid, pData[playerid][pFriskOffer], 5.0))
				return Error(playerid, "Kamu harus didekat Player.");
				
			DisplayItems(pData[playerid][pFriskOffer], playerid);
			Servers(playerid, "Anda telah berhasil menaccept tawaran frisk kepada %s.", ReturnName(pData[playerid][pFriskOffer]));
			pData[playerid][pFriskOffer] = INVALID_PLAYER_ID;
		}
		else if(strcmp(params,"inspect",true) == 0)
		{
			if(pData[playerid][pInsOffer] == INVALID_PLAYER_ID || !IsPlayerConnected(pData[playerid][pFriskOffer]))
				return Error(playerid, "Player tersebut belum masuk!");
			
			if(!NearPlayer(playerid, pData[playerid][pInsOffer], 5.0))
				return Error(playerid, "Kamu harus didekat Player.");
				
			new hstring[512], info[512];
			new hh = pData[playerid][pHead];
			new hp = pData[playerid][pPerut];
			new htk = pData[playerid][pRHand];
			new htka = pData[playerid][pLHand];
			new hkk = pData[playerid][pRFoot];
			new hkka = pData[playerid][pLFoot];
			format(hstring, sizeof(hstring),"Bagian Tubuh\tKondisi\n{ffffff}Kepala\t{7fffd4}%d.0%\n{ffffff}Perut\t{7fffd4}%d.0%\n{ffffff}Tangan Kanan\t{7fffd4}%d.0%\n{ffffff}Tangan Kiri\t{7fffd4}%d.0%\n",hh,hp,htk,htka);
			strcat(info, hstring);
			format(hstring, sizeof(hstring),"{ffffff}Kaki Kanan\t{7fffd4}%d.0%\n{ffffff}Kaki Kiri\t{7fffd4}%d.0%\n",hkk,hkka);
			strcat(info, hstring);
			ShowPlayerDialog(pData[playerid][pInsOffer],DIALOG_HEALTH,DIALOG_STYLE_TABLIST_HEADERS,"Health Condition",info,"Oke","");
			Servers(playerid, "Anda telah berhasil menaccept tawaran Inspect kepada %s.", ReturnName(pData[playerid][pInsOffer]));
			pData[playerid][pInsOffer] = INVALID_PLAYER_ID;
		}
		else if(strcmp(params,"job",true) == 0) 
		{
			if(pData[playerid][pGetJob] > 0)
			{
				pData[playerid][pJob] = pData[playerid][pGetJob];
				Info(playerid, "Anda telah berhasil mendapatkan pekerjaan baru. gunakan /help untuk informasi.");
				pData[playerid][pGetJob] = 0;
				pData[playerid][pExitJob] = gettime() + (1 * 21600);
			}
			else if(pData[playerid][pGetJob2] > 0)
			{
				pData[playerid][pJob2] = pData[playerid][pGetJob2];
				Info(playerid, "Anda telah berhasil mendapatkan pekerjaan baru. gunakan /help untuk informasi.");
				pData[playerid][pGetJob2] = 0;
				pData[playerid][pExitJob] = gettime() + (1 * 21600);
			}
		}
		else if(strcmp(params,"rob",true) == 0)
		{
			if(pData[playerid][pRobOffer] == INVALID_PLAYER_ID || !IsPlayerConnected(pData[playerid][pRobOffer]))
				return Error(playerid, "Player tersebut belum masuk!");
			
			Servers(playerid, "Anda telah berhasil menaccept tawaran bergabung kedalam Robbery %s.", ReturnName(pData[playerid][pRobOffer]));
			Servers(pData[playerid][pRobOffer], "%s Menerima ajakan Robbing anda.", ReturnName(playerid));
			pData[playerid][pRobOffer] = INVALID_PLAYER_ID;
			pData[playerid][pMemberRob] = 1;
			pData[pData[playerid][pRobOffer]][pRobMember] += 1;
			RobMember += 1;
		}
	}
	return 1;
}

CMD:deny(playerid, params[])
{
	if(IsAtEvent[playerid] == 1)
		return Error(playerid, "Anda sedang mengikuti event & tidak bisa melakukan ini");

	if(IsPlayerConnected(playerid)) 
	{
        if(isnull(params)) 
		{
            SyntaxMsg(playerid, "/deny [name]");
            Info(playerid, "Names: drag, faction, frisk, inspect, reqloc, rob");
            return 1;
        }
		if(strcmp(params,"faction",true) == 0) 
		{
            if(pData[playerid][pFacOffer] > -1) 
			{
                if(pData[playerid][pFacInvite] > 0) 
				{
					Info(playerid, "Anda telah menolak faction dari %s", ReturnName(pData[playerid][pFacOffer]));
					Info(pData[playerid][pFacOffer], "%s telah menolak invite faction yang anda tawari", ReturnName(playerid));
					pData[playerid][pFacInvite] = 0;
					pData[playerid][pFacOffer] = -1;
				}
				else
				{
					Error(playerid, "Invalid faction id!");
					return 1;
				}
            }
            else 
			{
                Error(playerid, "Tidak ada player yang menawari anda!");
                return 1;
            }
        }
		else if(strcmp(params,"drag",true) == 0)
		{
			new dragby = GetPVarInt(playerid, "DragBy");
			if(dragby == INVALID_PLAYER_ID || dragby == playerid)
				return Error(playerid, "Player itu Disconnect.");

			Info(playerid, "Anda telah menolak drag.");
			Info(dragby, "Player telah menolak drag yang anda tawari.");
			
			DeletePVar(playerid, "DragBy");
			pData[playerid][pDragged] = 0;
			pData[playerid][pDraggedBy] = INVALID_PLAYER_ID;
			return 1;
		}
		else if(strcmp(params,"frisk",true) == 0)
		{
			if(pData[playerid][pFriskOffer] == INVALID_PLAYER_ID || !IsPlayerConnected(pData[playerid][pFriskOffer]))
				return Error(playerid, "Player tersebut belum masuk!");
			
			Info(playerid, "Anda telah menolak tawaran frisk kepada %s.", ReturnName(pData[playerid][pFriskOffer]));
			pData[playerid][pFriskOffer] = INVALID_PLAYER_ID;
			return 1;
		}
		else if(strcmp(params,"inspect",true) == 0)
		{
			if(pData[playerid][pInsOffer] == INVALID_PLAYER_ID || !IsPlayerConnected(pData[playerid][pInsOffer]))
				return Error(playerid, "Player tersebut belum masuk!");
			
			Info(playerid, "Anda telah menolak tawaran Inspect kepada %s.", ReturnName(pData[playerid][pInsOffer]));
			pData[playerid][pInsOffer] = INVALID_PLAYER_ID;
			return 1;
		}
		else if(strcmp(params,"reqloc",true) == 0) 
		{
			if(pData[playerid][pLocOffer] == INVALID_PLAYER_ID || !IsPlayerConnected(pData[playerid][pLocOffer]))
				return Error(playerid, "Player tersebut belum masuk!");
			
			Info(playerid, "Anda telah menolak tawaran Share Lokasi kepada %s.", ReturnName(pData[playerid][pLocOffer]));
			pData[playerid][pLocOffer] = INVALID_PLAYER_ID;
		}
		else if(strcmp(params,"rob",true) == 0) 
		{
			if(pData[playerid][pRobOffer] == INVALID_PLAYER_ID || !IsPlayerConnected(pData[playerid][pRobOffer]))
				return Error(playerid, "Player tersebut belum masuk!");
			
			Info(playerid, "Anda telah menolak tawaran Rob kepada %s.", ReturnName(pData[playerid][pRobOffer]));
			pData[playerid][pRobOffer] = INVALID_PLAYER_ID;
		}
	}
	return 1;
}

CMD:give(playerid, params[])
{
	if(IsAtEvent[playerid] == 1)
		return Error(playerid, "Anda sedang mengikuti event & tidak bisa melakukan ini");

	if(IsPlayerConnected(playerid)) 
	{
		new name[24], ammount, otherid;
        if(sscanf(params, "us[24]d", otherid, name, ammount))
		{
			SyntaxMsg(playerid, "/give [playerid] [name] [ammount]");
			Info(playerid, "Names: bandage, ayamfillet, cigarette, redmoney, potato, food, pizza, burger, chiken");
			Info(playerid, "Names: cola, mineral, medicine, snack, sprunk, material, component, marijuana, obat, gps");
			Info(playerid, "Names: borak, kecubung");
			return 1;
		}
		if(otherid == INVALID_PLAYER_ID || otherid == playerid || !NearPlayer(playerid, otherid, 3.0))
			return Error(playerid, "Invalid playerid!");
			
		if(strcmp(name,"bandage",true) == 0) 
		{
			if(pData[playerid][pBandage] < ammount)
				return Error(playerid, "Item anda tidak cukup.");

			if(ammount < 1) return Error(playerid, "Can't Give below 1");
			
			pData[playerid][pBandage] -= ammount;
			pData[otherid][pBandage] += ammount;
			Info(playerid, "Anda telah berhasil memberikan perban kepada %s sejumlah %d.", ReturnName(otherid), ammount);
			Info(otherid, "%s telah berhasil memberikan perban kepada anda sejumlah %d.", ReturnName(playerid), ammount);
			ApplyAnimation(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
			ApplyAnimation(otherid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
		}
		else if(strcmp(name,"medicine",true) == 0) 
		{
			if(pData[playerid][pMedicine] < ammount)
				return Error(playerid, "Item anda tidak cukup.");

			if(ammount < 1) return Error(playerid, "Can't Give below 1");
			
			pData[playerid][pMedicine] -= ammount;
			pData[otherid][pMedicine] += ammount;
			Info(playerid, "Anda telah berhasil memberikan medicine kepada %s sejumlah %d.", ReturnName(otherid), ammount);
			Info(otherid, "%s telah berhasil memberikan medicine kepada anda sejumlah %d.", ReturnName(playerid), ammount);
			ApplyAnimation(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
			ApplyAnimation(otherid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
		}
		else if(strcmp(name,"cigarette",true) == 0)
		{
			if(pData[playerid][pCig] < ammount)
				return Error(playerid, "Item anda tidak cukup.");

			if(ammount < 1) return Error(playerid, "Can't Give below 1");

			pData[playerid][pCig] -= ammount;
			pData[otherid][pCig] += ammount;
			Info(playerid, "Anda telah berhasil memberikan cigarette kepada %s sejumlah %d.", ReturnName(otherid), ammount);
			Info(otherid, "%s telah berhasil memberikan cigarette kepada anda sejumlah %d.", ReturnName(playerid), ammount);
			ApplyAnimation(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
			ApplyAnimation(otherid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
		}
		else if(strcmp(name,"snack",true) == 0) 
		{
			if(pData[playerid][pSnack] < ammount)
				return Error(playerid, "Item anda tidak cukup.");

			if(ammount < 1) return Error(playerid, "Can't Give below 1");
			
			pData[playerid][pSnack] -= ammount;
			pData[otherid][pSnack] += ammount;
			Info(playerid, "Anda telah berhasil memberikan snack kepada %s sejumlah %d.", ReturnName(otherid), ammount);
			Info(otherid, "%s telah berhasil memberikan snack kepada anda sejumlah %d.", ReturnName(playerid), ammount);
			ApplyAnimation(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
			ApplyAnimation(otherid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
		}
		else if(strcmp(name,"pizza",true) == 0)
		{
			if(pData[playerid][pPizza] < ammount)
				return Error(playerid, "Item anda tidak cukup.");

			if(ammount < 1) return Error(playerid, "Can't Give below 1");

			pData[playerid][pPizza] -= ammount;
			pData[otherid][pPizza] += ammount;
			Info(playerid, "Anda telah berhasil memberikan pizza kepada %s sejumlah %d.", ReturnName(otherid), ammount);
			Info(otherid, "%s telah berhasil memberikan pizza kepada anda sejumlah %d.", ReturnName(playerid), ammount);
			ApplyAnimation(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
			ApplyAnimation(otherid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
		}
		else if(strcmp(name,"ayamfillet",true) == 0)
		{
			if(pData[playerid][AyamFillet] < ammount)
				return Error(playerid, "Item anda tidak cukup.");

			if(ammount < 1) return Error(playerid, "Can't Give below 1");

			pData[playerid][AyamFillet] -= ammount;
			pData[otherid][AyamFillet] += ammount;
			Info(playerid, "Anda telah berhasil memberikan ayam fillet kepada %s sejumlah %d.", ReturnName(otherid), ammount);
			Info(otherid, "%s telah berhasil memberikan ayam fillet kepada anda sejumlah %d.", ReturnName(playerid), ammount);
			ApplyAnimation(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
			ApplyAnimation(otherid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
		}
		else if(strcmp(name,"burger",true) == 0)
		{
			if(pData[playerid][pBurger] < ammount)
				return Error(playerid, "Item anda tidak cukup.");

			if(ammount < 1) return Error(playerid, "Can't Give below 1");

			pData[playerid][pBurger] -= ammount;
			pData[otherid][pBurger] += ammount;
			Info(playerid, "Anda telah berhasil memberikan burger kepada %s sejumlah %d.", ReturnName(otherid), ammount);
			Info(otherid, "%s telah berhasil memberikan burger kepada anda sejumlah %d.", ReturnName(playerid), ammount);
			ApplyAnimation(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
			ApplyAnimation(otherid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
		}
		else if(strcmp(name,"chiken",true) == 0)
		{
			if(pData[playerid][pSnack] < ammount)
				return Error(playerid, "Item anda tidak cukup.");

			if(ammount < 1) return Error(playerid, "Can't Give below 1");

			pData[playerid][pChiken] -= ammount;
			pData[otherid][pChiken] += ammount;
			Info(playerid, "Anda telah berhasil memberikan fried chiken kepada %s sejumlah %d.", ReturnName(otherid), ammount);
			Info(otherid, "%s telah berhasil memberikan fried chiken kepada anda sejumlah %d.", ReturnName(playerid), ammount);
			ApplyAnimation(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
			ApplyAnimation(otherid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
		}
		else if(strcmp(name,"mineral",true) == 0)
		{
			if(pData[playerid][pMineral] < ammount)
				return Error(playerid, "Item anda tidak cukup.");

			if(ammount < 1) return Error(playerid, "Can't Give below 1");

			pData[playerid][pMineral] -= ammount;
			pData[otherid][pMineral] += ammount;
			Info(playerid, "Anda telah berhasil memberikan air mineral kepada %s sejumlah %d.", ReturnName(otherid), ammount);
			Info(otherid, "%s telah berhasil memberikan air mineral kepada anda sejumlah %d.", ReturnName(playerid), ammount);
			ApplyAnimation(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
			ApplyAnimation(otherid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
		}
		else if(strcmp(name,"potato",true) == 0)
		{
			if(pData[playerid][pPotato] < ammount)
				return Error(playerid, "Item anda tidak cukup.");

			if(ammount < 1) return Error(playerid, "Can't Give below 1");

			pData[playerid][pPotato] -= ammount;
			pData[otherid][pPotato] += ammount;
			Info(playerid, "Anda telah berhasil memberikan potato kepada %s sejumlah %d.", ReturnName(otherid), ammount);
			Info(otherid, "%s telah berhasil memberikan potato kepada anda sejumlah %d.", ReturnName(playerid), ammount);
			ApplyAnimation(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
			ApplyAnimation(otherid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
		}
		else if(strcmp(name,"food",true) == 0)
		{
			if(pData[playerid][pFood] < ammount)
				return Error(playerid, "Item anda tidak cukup.");

			if(ammount < 1) return Error(playerid, "Can't Give below 1");

			pData[playerid][pFood] -= ammount;
			pData[otherid][pFood] += ammount;
			Info(playerid, "Anda telah berhasil memberikan food kepada %s sejumlah %d.", ReturnName(otherid), ammount);
			Info(otherid, "%s telah berhasil memberikan food kepada anda sejumlah %d.", ReturnName(playerid), ammount);
			ApplyAnimation(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
			ApplyAnimation(otherid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
		}
		else if(strcmp(name,"cola",true) == 0)
		{
			if(pData[playerid][pCola] < ammount)
				return Error(playerid, "Item anda tidak cukup.");

			if(ammount < 1) return Error(playerid, "Can't Give below 1");

			pData[playerid][pCola] -= ammount;
			pData[otherid][pCola] += ammount;
			Info(playerid, "Anda telah berhasil memberikan coca cola kepada %s sejumlah %d.", ReturnName(otherid), ammount);
			Info(otherid, "%s telah berhasil memberikan coca cola kepada anda sejumlah %d.", ReturnName(playerid), ammount);
			ApplyAnimation(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
			ApplyAnimation(otherid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
		}
		else if(strcmp(name,"redmoney",true) == 0) 
		{
			if(pData[playerid][pRedMoney] < ammount)
				return Error(playerid, "Item anda tidak cukup.");

			if(ammount < 1) return Error(playerid, "Can't Give below 1");
			
			pData[playerid][pRedMoney] -= ammount;
			pData[otherid][pRedMoney] += ammount;
			Info(playerid, "Anda telah berhasil memberikan redmoney kepada %s sejumlah %s.", ReturnName(otherid), FormatMoney(ammount));
			Info(otherid, "%s telah berhasil memberikan redmoney kepada anda sejumlah %s.", ReturnName(playerid), FormatMoney(ammount));
			ApplyAnimation(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
			ApplyAnimation(otherid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
		}
		else if(strcmp(name,"sprunk",true) == 0) 
		{
			if(pData[playerid][pSprunk] < ammount)
				return Error(playerid, "Item anda tidak cukup.");

			if(ammount < 1) return Error(playerid, "Can't Give below 1");
			
			pData[playerid][pSprunk] -= ammount;
			pData[otherid][pSprunk] += ammount;
			Info(playerid, "Anda telah berhasil memberikan Sprunk kepada %s sejumlah %d.", ReturnName(otherid), ammount);
			Info(otherid, "%s telah berhasil memberikan Sprunk kepada anda sejumlah %d.", ReturnName(playerid), ammount);
			ApplyAnimation(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
			ApplyAnimation(otherid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
		}
		else if(strcmp(name,"material",true) == 0) 
		{
			if(pData[playerid][pMaterial] < ammount)
				return Error(playerid, "Item anda tidak cukup.");
			
			if(ammount > 500)
				return Error(playerid, "Invalid ammount 1 - 500");
			
			new maxmat = pData[otherid][pMaterial] + ammount;
			
			if(maxmat > 500)
				return Error(playerid, "That player already have maximum material!");

			if(ammount < 1) return Error(playerid, "Can't Give below 1");
			
			pData[playerid][pMaterial] -= ammount;
			pData[otherid][pMaterial] += ammount;
			Info(playerid, "Anda telah berhasil memberikan Material kepada %s sejumlah %d.", ReturnName(otherid), ammount);
			Info(otherid, "%s telah berhasil memberikan Material kepada anda sejumlah %d.", ReturnName(playerid), ammount);
			ApplyAnimation(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
			ApplyAnimation(otherid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
		}
		else if(strcmp(name,"component",true) == 0) 
		{
			if(pData[playerid][pComponent] < ammount)
				return Error(playerid, "Item anda tidak cukup.");
			
			if(ammount > 500)
				return Error(playerid, "Invalid ammount 1 - 500");
			
			new maxcomp = pData[otherid][pComponent] + ammount;
			
			if(maxcomp > 500)
				return Error(playerid, "That player already have maximum component!");

			if(ammount < 1) return Error(playerid, "Can't Give below 1");
			
			pData[playerid][pComponent] -= ammount;
			pData[otherid][pComponent] += ammount;
			Info(playerid, "Anda telah berhasil memberikan Component kepada %s sejumlah %d.", ReturnName(otherid), ammount);
			Info(otherid, "%s telah berhasil memberikan Component kepada anda sejumlah %d.", ReturnName(playerid), ammount);
			ApplyAnimation(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
			ApplyAnimation(otherid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
		}
		else if(strcmp(name,"marijuana",true) == 0) 
		{
			if(pData[playerid][pMarijuana] < ammount)
				return Error(playerid, "Item anda tidak cukup.");

			if(ammount < 1) return Error(playerid, "Can't Give below 1");
			
			pData[playerid][pMarijuana] -= ammount;
			pData[otherid][pMarijuana] += ammount;
			Info(playerid, "Anda telah berhasil memberikan Marijuana kepada %s sejumlah %d.", ReturnName(otherid), ammount);
			Info(otherid, "%s telah berhasil memberikan Marijuana kepada anda sejumlah %d.", ReturnName(playerid), ammount);
			ApplyAnimation(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
			ApplyAnimation(otherid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
		}
		else if(strcmp(name,"obat",true) == 0) 
		{
			if(pData[playerid][pObat] < ammount)
				return Error(playerid, "Item anda tidak cukup.");

			if(ammount < 1) return Error(playerid, "Can't Give below 1");
			
			pData[playerid][pObat] -= ammount;
			pData[otherid][pObat] += ammount;
			Info(playerid, "Anda telah berhasil memberikan Obat kepada %s sejumlah %d.", ReturnName(otherid), ammount);
			Info(otherid, "%s telah berhasil memberikan Obat kepada anda sejumlah %d.", ReturnName(playerid), ammount);
			ApplyAnimation(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
			ApplyAnimation(otherid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
		}
		else if(strcmp(name,"gps",true) == 0) 
		{
			if(pData[playerid][pGPS] < ammount)
				return Error(playerid, "Item anda tidak cukup.");

			if(ammount < 1) return Error(playerid, "Can't Give below 1");
			
			pData[playerid][pGPS] -= ammount;
			pData[otherid][pGPS] += ammount;
			Info(playerid, "Anda telah berhasil memberikan GPS kepada %s sejumlah %d.", ReturnName(otherid), ammount);
			Info(otherid, "%s telah berhasil memberikan GPS kepada anda sejumlah %d.", ReturnName(playerid), ammount);
			ApplyAnimation(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
			ApplyAnimation(otherid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
		}
		else if(strcmp(name,"borax",true) == 0) 
		{
			if(pData[playerid][pBorax] < ammount)
				return Error(playerid, "Item anda tidak cukup.");

			if(ammount < 1) return Error(playerid, "Can't Give below 1");
			
			pData[playerid][pBorax] -= ammount;
			pData[otherid][pBorax] += ammount;
			Info(playerid, "Anda telah berhasil memberikan BORAX kepada %s sejumlah %d.", ReturnName(otherid), ammount);
			Info(otherid, "%s telah berhasil memberikan BORAX kepada anda sejumlah %d.", ReturnName(playerid), ammount);
			ApplyAnimation(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
			ApplyAnimation(otherid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
		}
		else if(strcmp(name,"kecubung",true) == 0) 
		{
			if(pData[playerid][pKecubung] < ammount)
				return Error(playerid, "Item anda tidak cukup.");

			if(ammount < 1) return Error(playerid, "Can't Give below 1");
			
			pData[playerid][pKecubung] -= ammount;
			pData[otherid][pKecubung] += ammount;
			Info(playerid, "Anda telah berhasil memberikan KECUBUNG kepada %s sejumlah %d.", ReturnName(otherid), ammount);
			Info(otherid, "%s telah berhasil memberikan KECUBUNG kepada anda sejumlah %d.", ReturnName(playerid), ammount);
			ApplyAnimation(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
			ApplyAnimation(otherid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
		}
		else if(strcmp(name,"paketkecubung",true) == 0) 
		{
			if(pData[playerid][pPaketkecubung] < ammount)
				return Error(playerid, "Item anda tidak cukup.");

			if(ammount < 1) return Error(playerid, "Can't Give below 1");
			
			pData[playerid][pPaketkecubung] -= ammount;
			pData[otherid][pPaketkecubung] += ammount;
			Info(playerid, "Anda telah berhasil memberikan PAKET KECUBUNG kepada %s sejumlah %d.", ReturnName(otherid), ammount);
			Info(otherid, "%s telah berhasil memberikan PAKET KECUBUNG kepada anda sejumlah %d.", ReturnName(playerid), ammount);
			ApplyAnimation(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
			ApplyAnimation(otherid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
		}
		else if(strcmp(name,"paketborax",true) == 0) 
		{
			if(pData[playerid][pPaketborax] < ammount)
				return Error(playerid, "Item anda tidak cukup.");

			if(ammount < 1) return Error(playerid, "Can't Give below 1");
			
			pData[playerid][pPaketborax] -= ammount;
			pData[otherid][pPaketborax] += ammount;
			Info(playerid, "Anda telah berhasil memberikan PAKET BORAX kepada %s sejumlah %d.", ReturnName(otherid), ammount);
			Info(otherid, "%s telah berhasil memberikan PAKET BORAX kepada anda sejumlah %d.", ReturnName(playerid), ammount);
			ApplyAnimation(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
			ApplyAnimation(otherid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
		}
	}
	return 1;
}

CMD:carry(playerid, params[])
{
	new otherid;
    if(sscanf(params, "u", otherid))
        return SyntaxMsg(playerid, "/uncarry [playerid/PartOfName] || /undrag [playerid]");

    if(otherid == INVALID_PLAYER_ID)
        return Error(playerid, "Player itu Disconnect.");

    if(otherid == playerid)
        return Error(playerid, "Kamu tidak bisa menarik diri mu sendiri.");

    if(!NearPlayer(playerid, otherid, 5.0))
        return Error(playerid, "Kamu harus didekat Player.");

    if(!pData[otherid][pInjured])
        return Error(playerid, "kamu tidak bisa drag orang yang tidak mati.");

    SetPVarInt(otherid, "DragBy", playerid);
    SuccesMsg(playerid, "Anda berhasil menawari drag");
	Info(playerid, "Anda berhasil menawari drag kepada player %s", ReturnName(otherid));
    return 1;
}

CMD:uncarry(playerid, params[])
{
	new otherid;
    if(sscanf(params, "u", otherid)) return SyntaxMsg(playerid, "/uncarry [playerid]");
	if(pData[otherid][pDragged])
    {
        DeletePVar(playerid, "DragBy");
        DeletePVar(otherid, "DragBy");
        pData[otherid][pDragged] = 0;
        pData[otherid][pDraggedBy] = INVALID_PLAYER_ID;

        KillTimer(pData[otherid][pDragTimer]);
        SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s releases %s from their grip.", ReturnName(playerid), ReturnName(otherid));
    }
    return 1;
}

CMD:mask(playerid, params[])
{
	if(pData[playerid][pMask] <= 0)
		return Error(playerid, "Anda tidak memiliki topeng!");

	switch (pData[playerid][pMaskOn])
    {
        case 0:
        {
            SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "* %s takes out a mask and puts it on.", ReturnName(playerid));
            pData[playerid][pMaskOn] = 1;
            new string[35];
            GetPlayerName(playerid, string, sizeof(string));
            format(string,sizeof(string), "Mask_%d", pData[playerid][pMaskID]);
      	 	SetPlayerName(playerid, string);
			for(new i = GetPlayerPoolSize(); i != -1; --i)
			{
				ShowPlayerNameTagForPlayer(i, playerid, 0);
			}
			//SetPlayerAttachedObject(playerid, 9, 18911, 2,0.078534, 0.041857, -0.001727, 268.970458, 1.533374, 269.223754);
        }
        case 1:
        {
            pData[playerid][pMaskOn] = 0;
            SetPlayerName(playerid, pData[playerid][pName]);
            SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "* %s takes their mask off and puts it away.", ReturnName(playerid));
			for(new i = GetPlayerPoolSize(); i != -1; --i)
			{
				ShowPlayerNameTagForPlayer(i, playerid, 1);
			}
			//RemovePlayerAttachedObject(playerid, 9);
        }
    }
	return 1;
}
/*
CMD:mask(playerid, params[])
{
	if(pData[playerid][pMask] <= 0)
		return Error(playerid, "Anda tidak memiliki topeng!");
		
	switch (pData[playerid][pMaskOn])
    {
        case 0:
        {
			for(new i = GetPlayerPoolSize(); i != -1; --i)
			{
				new sstring[64];
				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "* %s takes out a mask and puts it on.", ReturnName(playerid));
				pData[playerid][pMaskOn] = 1;
				format(sstring, sizeof(sstring), "%s", ReturnName(playerid));
				pData[playerid][pMaskLabel] = CreateDynamic3DTextLabel(sstring, -1, 0, 0, -10, 10.0, playerid);
				Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, pData[playerid][pMaskLabel] , E_STREAMER_ATTACH_OFFSET_Z, 0.30);
				SendClientMessage(playerid, COLOR_ORANGE, "[MASKINFO]: {FFFFFF}Mask {00D900}ON!");
				ShowPlayerNameTagForPlayer(i, playerid, 0);
				return 1;
			}	
        }
        case 1:
        {
			for(new i = GetPlayerPoolSize(); i != -1; --i)
			{
				DestroyDynamic3DTextLabel(pData[playerid][pMaskLabel]);
				pData[playerid][pMaskOn] = 0;
				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "* %s takes their mask off and puts it away.", ReturnName(playerid));
				SendClientMessage(playerid, COLOR_ORANGE, "[MASKINFO]: {FFFFFF}Mask {FF0000}OFF!");
				ShowPlayerNameTagForPlayer(i, playerid, 1);
				return 1;
			}	
        }
    }
	return 1;
}
*/
CMD:fixme(playerid)
{
	if(pData[playerid][pFreeze] == 1)
		return Error(playerid, "Anda sedang di Freeze oleh staff, tidak dapat menggunakan ini");

	if(IsPlayerInRangeOfPoint(playerid, 50, 2184.32, -1023.32, 1018.68))
		return Error(playerid, "Anda tidak dapat melakukan ini jika sedang berada di OOC Zone");

	ShowPlayerDialog(playerid, DIALOG_STUCK, DIALOG_STYLE_LIST,"Stuck Options","Charakter stuck\nTersangkut di dalam object\ncharakter tiba tiba mati\nTersangkut diKendaraan","Pilih","Batal");
	return 1;
}
//Text and Chat Commands
CMD:try(playerid, params[])
{
	if(IsPlayerInRangeOfPoint(playerid, 50, 2184.32, -1023.32, 1018.68))
		return Error(playerid, "Anda tidak dapat melakukan ini jika sedang berada di OOC Zone");

    if(isnull(params))
        return SyntaxMsg(playerid, "/try [action]");

	if(GetPVarType(playerid, "Caps")) UpperToLower(params);
    if(strlen(params) > 64) 
	{
        SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, "* %s %.64s ..", ReturnName(playerid), params);
        SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, ".. %s, %s", params[64], (random(2) == 0) ? ("and success") : ("but fail"));
    }
    else {
        SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, "* %s %s, %s", ReturnName(playerid), params, (random(2) == 0) ? ("and success") : ("but fail"));
    }
	printf("[TRY] %s(%d) : %s", pData[playerid][pName], playerid, params);
    return 1;
}

CMD:ado(playerid, params[])
{
	if(IsPlayerInRangeOfPoint(playerid, 50, 2184.32, -1023.32, 1018.68))
		return Error(playerid, "Anda tidak dapat melakukan ini jika sedang berada di OOC Zone");

    new flyingtext[164], Float:x, Float:y, Float:z;

    if(isnull(params))
	{
        SyntaxMsg(playerid, "/ado [text]");
		Info(playerid, "Use /ado off to disable or delete the ado tag.");
		return 1;
	}
    if(strlen(params) > 128)
        return Error(playerid, "Max text can only maximmum 128 characters.");

    if (!strcmp(params, "off", true))
    {
        if (!pData[playerid][pAdoActive])
            return Error(playerid, "You're not actived your 'ado' text.");

        if (IsValidDynamic3DTextLabel(pData[playerid][pAdoTag]))
            DestroyDynamic3DTextLabel(pData[playerid][pAdoTag]);

        Servers(playerid, "You're removed your ado text.");
        pData[playerid][pAdoActive] = false;
        return 1;
    }

    FixText(params);
    format(flyingtext, sizeof(flyingtext), "* %s *\n(( %s ))", ReturnName(playerid), params);

	if(GetPVarType(playerid, "Caps")) UpperToLower(params);
    if(strlen(params) > 64) 
	{
        SendNearbyMessage(playerid, 20.0, COLOR_LGWRP, "* [ADO]: %.64s ..", params);
        SendNearbyMessage(playerid, 20.0, COLOR_LGWRP, ".. %s", params[64]);
    }
    else 
	{
        SendNearbyMessage(playerid, 20.0, COLOR_LGWRP, "* [ADO]: %s", params);
    }

    GetPlayerPos(playerid, x, y, z);
    if(pData[playerid][pAdoActive])
    {
        if (IsValidDynamic3DTextLabel(pData[playerid][pAdoTag]))
            UpdateDynamic3DTextLabelText(pData[playerid][pAdoTag], COLOR_LGWRP, flyingtext);
        else
            pData[playerid][pAdoTag] = CreateDynamic3DTextLabel(flyingtext, COLOR_LGWRP, x, y, z, 15, _, _, 1, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
    }
    else
    {
        pData[playerid][pAdoActive] = true;
        pData[playerid][pAdoTag] = CreateDynamic3DTextLabel(flyingtext, COLOR_LGWRP, x, y, z, 15, _, _, 1, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
    }
	printf("[ADO] %s(%d) : %s", pData[playerid][pName], playerid, params);
    return 1;
}

CMD:ab(playerid, params[])
{
	if(IsPlayerInRangeOfPoint(playerid, 50, 2184.32, -1023.32, 1018.68))
		return Error(playerid, "Anda tidak dapat melakukan ini jika sedang berada di OOC Zone");

    new flyingtext[164], Float:x, Float:y, Float:z;

    if(isnull(params))
	{
        SyntaxMsg(playerid, "/ab [text]");
		Info(playerid, "Use /ab off to disable or delete the ado tag.");
		return 1;
	}
    if(strlen(params) > 128)
        return Error(playerid, "Max text can only maximmum 128 characters.");

    if (!strcmp(params, "off", true))
    {
        if (!pData[playerid][pBActive])
            return Error(playerid, "You're not actived your 'ab' text.");

        if (IsValidDynamic3DTextLabel(pData[playerid][pBTag]))
            DestroyDynamic3DTextLabel(pData[playerid][pBTag]);

        Servers(playerid, "You're removed your ab text.");
        pData[playerid][pBActive] = false;
        return 1;
    }

    FixText(params);
    format(flyingtext, sizeof(flyingtext), "* %s *\n(( OOC : %s ))", ReturnName(playerid), params);

	if(GetPVarType(playerid, "Caps")) UpperToLower(params);
    if(strlen(params) > 64) 
	{
        SendNearbyMessage(playerid, 20.0, COLOR_LGWRP, "* [AB]: %.64s ..", params);
        SendNearbyMessage(playerid, 20.0, COLOR_LGWRP, ".. %s", params[64]);
    }
    else 
	{
        SendNearbyMessage(playerid, 20.0, COLOR_LGWRP, "* [AB]: %s", params);
    }

    GetPlayerPos(playerid, x, y, z);
    if(pData[playerid][pBActive])
    {
        if (IsValidDynamic3DTextLabel(pData[playerid][pBTag]))
            UpdateDynamic3DTextLabelText(pData[playerid][pBTag], COLOR_LGWRP, flyingtext);
        else
            pData[playerid][pBTag] = CreateDynamic3DTextLabel(flyingtext, COLOR_LGWRP, x, y, z, 15, _, _, 1, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
    }
    else
    {
        pData[playerid][pBActive] = true;
        pData[playerid][pBTag] = CreateDynamic3DTextLabel(flyingtext, COLOR_LGWRP, x, y, z, 15, _, _, 1, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
    }
	printf("[AB] %s(%d) : %s", pData[playerid][pName], playerid, params);
    return 1;
}

CMD:ame(playerid, params[])
{
	if(IsPlayerInRangeOfPoint(playerid, 50, 2184.32, -1023.32, 1018.68))
		return Error(playerid, "Anda tidak dapat melakukan ini jika sedang berada di OOC Zone");

    new flyingtext[164];

    if(isnull(params))
        return SyntaxMsg(playerid, "/ame [action]");

    if(strlen(params) > 128)
        return Error(playerid, "Max action can only maximmum 128 characters.");

	if(GetPVarType(playerid, "Caps")) UpperToLower(params);
    format(flyingtext, sizeof(flyingtext), "* %s %s*", ReturnName(playerid), params);
    SetPlayerChatBubble(playerid, flyingtext, COLOR_LGWRP, 10.0, 10000);
	printf("[AME] %s(%d) : %s", pData[playerid][pName], playerid, params);
    return 1;
}

CMD:me(playerid, params[])
{
	if(IsPlayerInRangeOfPoint(playerid, 50, 2184.32, -1023.32, 1018.68))
		return Error(playerid, "Anda tidak dapat melakukan ini jika sedang berada di OOC Zone");

    if(isnull(params))
        return SyntaxMsg(playerid, "/me [action]");
	
	if(GetPVarType(playerid, "Caps")) UpperToLower(params);
    if(strlen(params) > 64) 
	{
        SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, "* %s %.64s ..", ReturnName(playerid), params);
        SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, ".. %s", params[64]);
    }
    else 
	{
        SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, "* %s %s", ReturnName(playerid), params);
    }
	printf("[ME] %s(%d) : %s", pData[playerid][pName], playerid, params);
    return 1;
}

CMD:do(playerid, params[])
{
	if(IsPlayerInRangeOfPoint(playerid, 50, 2184.32, -1023.32, 1018.68))
		return Error(playerid, "Anda tidak dapat melakukan ini jika sedang berada di OOC Zone");

    if(isnull(params))
        return SyntaxMsg(playerid, "/do [description]");

	if(GetPVarType(playerid, "Caps")) UpperToLower(params);
    if(strlen(params) > 64) 
	{
        SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, "* %.64s ..", params);
        SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, ".. %s (( %s ))", params[64], ReturnName(playerid));
    }
    else 
	{
        SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, "* %s (( %s ))", params, ReturnName(playerid));
    }
	printf("[DO] %s(%d) : %s", pData[playerid][pName], playerid, params);
    return 1;
}

CMD:toglog(playerid)
{
	if(!pData[playerid][pTogLog])
	{
		pData[playerid][pTogLog] = 1;
		Info(playerid, "Anda telah menonaktifkan log server.");
	}
	else
	{
		pData[playerid][pTogLog] = 0;
		Info(playerid, "Anda telah mengaktifkan log server.");
	}
	return 1;
}

CMD:togpm(playerid)
{
	if(!pData[playerid][pTogPM])
	{
		pData[playerid][pTogPM] = 1;
		Info(playerid, "Anda telah menonaktifkan PM");
	}
	else
	{
		pData[playerid][pTogPM] = 0;
		Info(playerid, "Anda telah mengaktifkan PM");
	}
	return 1;
}

CMD:togads(playerid)
{
	if(!pData[playerid][pTogAds])
	{
		pData[playerid][pTogAds] = 1;
		Info(playerid, "Anda telah menonaktifkan Ads/Iklan.");
	}
	else
	{
		pData[playerid][pTogAds] = 0;
		Info(playerid, "Anda telah mengaktifkan Ads/Iklan.");
	}
	return 1;
}

CMD:togwt(playerid)
{
	if(!pData[playerid][pTogWT])
	{
		pData[playerid][pTogWT] = 1;
		Info(playerid, "Anda telah menonaktifkan Walkie Talkie.");
	}
	else
	{
		pData[playerid][pTogWT] = 0;
		Info(playerid, "Anda telah mengaktifkan Walkie Talkie.");
	}
	return 1;
}

CMD:whisper(playerid, params[])
{
    static text[128], otherid;
    if(sscanf(params, "us[128]", otherid, text))
        return SyntaxMsg(playerid, "/whisper [playerid/PartOfName] [message]");

    if(pData[playerid][pTogPM])
        return Error(playerid, "You must enable private messaging first.");

    if(pData[otherid][pAdminDuty])
        return Error(playerid, "You can't pm'ing admin duty now!");
		
	if(otherid == INVALID_PLAYER_ID)
        return Error(playerid, "Player yang anda tuju tidak valid.");

    if(otherid == playerid)
        return Error(playerid, "Tidak dapan PM diri sendiri.");

    if(pData[otherid][pTogPM] && pData[playerid][pAdmin] < 1)
        return Error(playerid, "Player tersebut menonaktifkan pm.");

    if(IsPlayerInRangeOfPoint(otherid, 50, 2184.32, -1023.32, 1018.68))
				return Error(playerid, "Anda tidak dapat melakukan ini, orang yang dituju sedang berada di OOC Zone");

    //GameTextForPlayer(otherid, "~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~y~New message!", 3000, 3);
    PlayerPlaySound(otherid, 1085, 0.0, 0.0, 0.0);

    SendClientMessageEx(otherid, COLOR_YELLOW, "(( PM from %s (%d): %s ))", pData[playerid][pName], playerid, text);
    SendClientMessageEx(playerid, COLOR_YELLOW, "(( PM to %s (%d): %s ))", pData[otherid][pName], otherid, text);
	//Info(otherid, "/togpm for tog enable/disable PM");

    foreach(new i : Player) if((pData[i][pAdmin]) && pData[playerid][pSPY] > 0)
    {
        SendClientMessageEx(i, COLOR_LIGHTGREEN, "[SPY PM] %s (%d) to %s (%d): %s", pData[playerid][pName], playerid, pData[otherid][pName], otherid, text);
    }
    return 1;
}

//USE ITEMS
CMD:use(playerid, params[])
{
	if(IsAtEvent[playerid] == 1)
		return Error(playerid, "Anda sedang mengikuti event & tidak bisa melakukan ini");

	if(IsPlayerConnected(playerid)) 
	{
        if(isnull(params)) 
		{
            Usage(playerid, "Usage: /use [name]");
            Info(playerid, "Names: bandage, cigarette, snack, pizza, burger, chiken, cola, mineral, , sprunk, gas, medicine, marijuana, obat, boombox");
            return 1;
        }
		if(strcmp(params,"bandage",true) == 0) 
		{
			if(pData[playerid][pBandage] < 1)
				return ErrorMsg(playerid, "Anda tidak memiliki perban.");
			
			new Float:darah;
			GetPlayerHealth(playerid, darah);
			pData[playerid][pBandage]--;
			SetPlayerHealthEx(playerid, darah+15);
			InfoMsg(playerid, "Anda telah berhasil menggunakan perban.");
			InfoTD_MSG(playerid, 3000, "Restore +15 Health");
		}
		else if(strcmp(params,"ObatStress",true) == 0)
		{
			if(pData[playerid][pObatStress] < 1)
				return ErrorMsg(playerid, "Anda tidak memiliki Obat Stress.");

			pData[playerid][pObatStress]--;
			pData[playerid][pBladder] -= 50;
			InfoMsg(playerid, "Anda telah berhasil menggunakan Obat Stress.");
			InfoTD_MSG(playerid, 3000, "Stress Anda Hilang 50%");
			ApplyAnimation(playerid,"SMOKING","M_smkstnd_loop",2.1,0,0,0,0,0);
		}
		else if(strcmp(params,"snack",true) == 0) 
		{
			if(pData[playerid][pSnack] < 1)
				return ErrorMsg(playerid, "Anda tidak memiliki snack.");
			
			pData[playerid][pSnack]--;
			pData[playerid][pHunger] += 10;
			Info(playerid, "Anda telah berhasil menggunakan snack.");
			InfoTD_MSG(playerid, 3000, "Restore +10 Hunger");
			ApplyAnimation(playerid,"SMOKING","M_smkstnd_loop",2.1,0,0,0,0,0);
		}
		else if(strcmp(params,"pizza",true) == 0)
		{
			if(pData[playerid][pPizza] < 1)
				return ErrorMsg(playerid, "Anda tidak memiliki pizza.");

			pData[playerid][pPizza]--;
			pData[playerid][pHunger] += 25;
			Info(playerid, "Anda telah berhasil menggunakan pizza.");
			InfoTD_MSG(playerid, 3000, "Restore +25 Hunger");
			ApplyAnimation(playerid,"SMOKING","M_smkstnd_loop",2.1,0,0,0,0,0);
		}
		else if(strcmp(params,"burger",true) == 0)
		{
			if(pData[playerid][pBurger] < 1)
				return ErrorMsg(playerid, "Anda tidak memiliki burger.");

			pData[playerid][pBurger]--;
			pData[playerid][pHunger] += 20;
			Info(playerid, "Anda telah berhasil menggunakan burger.");
			InfoTD_MSG(playerid, 3000, "Restore +20 Hunger");
			ApplyAnimation(playerid,"SMOKING","M_smkstnd_loop",2.1,0,0,0,0,0);
		}
		else if(strcmp(params,"chiken",true) == 0)
		{
			if(pData[playerid][pChiken] < 1)
				return ErrorMsg(playerid, "Anda tidak memiliki fried chiken.");

			pData[playerid][pChiken]--;
			pData[playerid][pHunger] += 23;
			Info(playerid, "Anda telah berhasil menggunakan fried chiken.");
			InfoTD_MSG(playerid, 3000, "Restore +23 Hunger");
			ApplyAnimation(playerid,"SMOKING","M_smkstnd_loop",2.1,0,0,0,0,0);
		}
		else if(strcmp(params,"cigarette",true) == 0)
		{
			if(pData[playerid][pCig] < 1)
				return ErrorMsg(playerid, "Anda tidak memiliki rokok.");

			pData[playerid][pCig]--;
			Info(playerid, "Anda menyalakan rokok.");
			ApplyAnimation(playerid,"SMOKING","M_smkstnd_loop",2.1,0,0,0,0,0);
		}
		else if(strcmp(params,"cola",true) == 0)
		{
			if(pData[playerid][pCola] < 1)
				return ErrorMsg(playerid, "Anda tidak memiliki coca cola.");

			pData[playerid][pCola]--;
			pData[playerid][pEnergy] += 20;
			Info(playerid, "Anda telah berhasil meminum coca cola.");
			InfoTD_MSG(playerid, 3000, "Restore +20 Energy");
			ApplyAnimation(playerid,"SMOKING","M_smkstnd_loop",2.1,0,0,0,0,0);
		}
		else if(strcmp(params,"mineral",true) == 0)
		{
			if(pData[playerid][pMineral] < 1)
				return ErrorMsg(playerid, "Anda tidak memiliki air mineral.");

			pData[playerid][pSprunk]--;
			pData[playerid][pEnergy] += 8;
			Info(playerid, "Anda telah berhasil meminum air mineral.");
			InfoTD_MSG(playerid, 3000, "Restore +8 Energy");
			ApplyAnimation(playerid,"SMOKING","M_smkstnd_loop",2.1,0,0,0,0,0);
		}
		else if(strcmp(params,"sprunk",true) == 0) 
		{
			if(pData[playerid][pSprunk] < 1)
				return ErrorMsg(playerid, "Anda tidak memiliki sprunk.");
			
			pData[playerid][pSprunk]--;
			pData[playerid][pEnergy] += 10;
			Info(playerid, "Anda telah berhasil meminum sprunk.");
			InfoTD_MSG(playerid, 3000, "Restore +10 Energy");
			ApplyAnimation(playerid,"SMOKING","M_smkstnd_loop",2.1,0,0,0,0,0);
		}
		/*else if(strcmp(params,"sprunk",true) == 0) 
		{
			if(pData[playerid][pSprunk] < 1)
				return ErrorMsg(playerid, "Anda tidak memiliki snack.");
			
			SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DRINK_SPRUNK);
			//SendNearbyMessage(playerid, 10.0, COLOR_PURPLE,"* %s opens a can of sprunk.", ReturnName(playerid));
			SetPVarInt(playerid, "UsingSprunk", 1);
			pData[playerid][pSprunk]--;
		}*/
		else if(strcmp(params,"gas",true) == 0) 
		{
			if(pData[playerid][pGas] < 1)
				return ErrorMsg(playerid, "Anda tidak memiliki gas.");
				
			if(IsPlayerInAnyVehicle(playerid))
				return ErrorMsg(playerid, "Anda harus berada diluar kendaraan!");
			
			if(pData[playerid][pActivityTime] > 5) return ErrorMsg(playerid, "Anda masih memiliki activity progress!");
			
			new vehicleid = GetNearestVehicleToPlayer(playerid, 3.5, false);
			if(IsValidVehicle(vehicleid))
			{
				new fuel = GetVehicleFuel(vehicleid);
			
				if(GetEngineStatus(vehicleid))
					return ErrorMsg(playerid, "Turn off vehicle engine.");
			
				if(fuel >= 999.0)
					return ErrorMsg(playerid, "This vehicle gas is full.");
			
				if(!IsEngineVehicle(vehicleid))
					return ErrorMsg(playerid, "This vehicle can't be refull.");

				if(!GetHoodStatus(vehicleid))
					return ErrorMsg(playerid, "The hood must be opened before refull the vehicle.");

				pData[playerid][pGas]--;
				Info(playerid, "Don't move from your position or you will failed to refulling this vehicle.");
				ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.1, 0, 0, 0, 0, 0, 1);
				pData[playerid][pActivityStatus] = 1;
				pData[playerid][pActivity] = SetTimerEx("RefullCar", 1000, true, "id", playerid, vehicleid);
				PlayerTextDrawSetString(playerid, ActiveTD[playerid], "Refulling...");
				PlayerTextDrawShow(playerid, ActiveTD[playerid]);
				ShowPlayerProgressBar(playerid, pData[playerid][activitybar]);
				/*InfoTD_MSG(playerid, 10000, "Refulling...");
				//SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s starts to refulling the vehicle.", ReturnName(playerid));*/
				return 1;
			}
		}
		else if(strcmp(params,"medicine",true) == 0) 
		{
			if(pData[playerid][pMedicine] < 1)
				return Error(playerid, "Anda tidak memiliki medicine.");
			
			pData[playerid][pMedicine]--;
			pData[playerid][pSick] = 0;
			pData[playerid][pSickTime] = 0;
			SetPlayerDrunkLevel(playerid, 0);
			Info(playerid, "Anda menggunakan medicine.");
			
			//InfoTD_MSG(playerid, 3000, "Restore +15 Hunger");
			ApplyAnimation(playerid,"SMOKING","M_smkstnd_loop",2.1,0,0,0,0,0);
		}
		else if(strcmp(params,"obat",true) == 0) 
		{
			if(pData[playerid][pObat] < 1)
				return Error(playerid, "Anda tidak memiliki Obat Myricous.");
			
			pData[playerid][pObat]--;
			pData[playerid][pSick] = 0;
			pData[playerid][pSickTime] = 0;
			pData[playerid][pHead] = 100;
			pData[playerid][pPerut] = 100;
			pData[playerid][pRHand] = 100;
			pData[playerid][pLHand] = 100;
			pData[playerid][pRFoot] = 100;
			pData[playerid][pLFoot] = 100;
			SetPlayerDrunkLevel(playerid, 0);
			Info(playerid, "Anda menggunakan Obat Myricous.");
			
			//InfoTD_MSG(playerid, 3000, "Restore +15 Hunger");
			ApplyAnimation(playerid,"SMOKING","M_smkstnd_loop",2.1,0,0,0,0,0);
		}
		else if(strcmp(params,"marijuana",true) == 0) 
		{
			if(pData[playerid][pMarijuana] < 1)
				return Error(playerid, "You dont have marijuana.");
			
			new Float:armor;
			GetPlayerArmour(playerid, armor);
			if(armor+10 > 90) return Error(playerid, "Over dosis!");
			
			pData[playerid][pMarijuana]--;
			SetPlayerArmourEx(playerid, armor+10);
			SetPlayerDrunkLevel(playerid, 4000);
			ApplyAnimation(playerid,"SMOKING","M_smkstnd_loop",2.1,0,0,0,0,0);
		}
	}
	return 1;
}

CMD:b(playerid, params[])
{
	if(IsPlayerInRangeOfPoint(playerid, 50, 2184.32, -1023.32, 1018.68))
		return Error(playerid, "OOC Zone, Ketik biasa saja");

    if(isnull(params))
        return SyntaxMsg(playerid, "/b [local OOC]");

    new jembut[40];
	if(pData[playerid][pLevel] > 0)
	{
		jembut = "Newbie";
	}
	if(pData[playerid][pLevel] > 5)
	{
		jembut = "Trainee";
	}
	if(pData[playerid][pLevel] > 10)
	{
		jembut = "Novice";
	}
	if(pData[playerid][pLevel] > 15)
	{
		jembut = "Elilte";
	}
	if(pData[playerid][pLevel] > 20)
	{
		jembut = "Honor";
	}
	if(pData[playerid][pLevel] > 25)
	{
		jembut = "Epical";
	}
	if(pData[playerid][pLevel] > 30)
	{
		jembut = "Vanguard";
	}
	if(pData[playerid][pLevel] > 35)
	{
		jembut = "Master";
	}
	if(pData[playerid][pLevel] > 40)
	{
		jembut = "Legendary";
	}
	if(pData[playerid][pLevel] > 45)
	{
		jembut = "Nolife";
	}
	if(pData[playerid][pLevel] > 50)
	{
		jembut = "Supreme";
	}
	if(pData[playerid][pAdminDuty] == 1)
    {
		if(strlen(params) > 64)
		{
			SendNearbyMessage(playerid, 20.0, COLOR_RED, "%s:"WHITE_E" (( %.64s ..", GetRPName(playerid), params);
            SendNearbyMessage(playerid, 20.0, COLOR_WHITE, ".. %s ))", params[64]);
		}
		else
        {
            SendNearbyMessage(playerid, 20.0, COLOR_RED, "%s:"WHITE_E" "BLUE_E"(("WHITE_E"%s"BLUE_E"))", GetRPName(playerid), params);
            return 1;
        }
	}
	else
	{
		if(strlen(params) > 64)
		{
			SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "%s: (( %.64s ..", GetRPName(playerid), params);
            SendNearbyMessage(playerid, 20.0, COLOR_WHITE, ".. %s ))", params[64]);
		}
		else
        {
            SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "[L] %s {ffffff}%s [%d]: "BLUE_E"(("WHITE_E" %s "BLUE_E"))", jembut, pData[playerid][pUCP], playerid, params);
            return 1;
        }
	}
	//printf("[OOC] %s(%d) : %s", pData[playerid][pName], playerid, params);
	new str[150];
	format(str,sizeof(str),"[OOC] %s: %s", GetRPName(playerid), params);
	LogServer("Chat", str);
	SendDiscordMessage(2, str);
    return 1;
}

CMD:t(playerid, params[])
{
	if(IsPlayerInRangeOfPoint(playerid, 50, 2184.32, -1023.32, 1018.68))
		return Error(playerid, "Anda tidak dapat melakukan ini jika sedang berada di OOC Zone");

	if(isnull(params))
		return SyntaxMsg(playerid, "/t [typo text]");

	if(strlen(params) < 10)
	{
		SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "%s : %.10s*", ReturnName(playerid), params);
	}
	//printf("[OOC] %s(%d) : %s", pData[playerid][pName], playerid, params);
    return 1;
}
CMD:calldentot(playerid, params[])
{
	if(IsPlayerInRangeOfPoint(playerid, 50, 2184.32, -1023.32, 1018.68))
		return Error(playerid, "Anda tidak dapat melakukan ini jika sedang berada di OOC Zone");

	new ph;
	if(pData[playerid][pPhone] == 0) return Error(playerid, "Anda tidak memiliki Ponsel!");

	if(sscanf(params, "d", ph))
	{
		SyntaxMsg(playerid, "/call [phone number] 933 - Taxi Call | 911 - SAPD Crime Call | 922 - SAMD Medic Call");
		foreach(new ii : Player)
		{	
			if(pData[ii][pMechDuty] == 1)
			{
				SendClientMessageEx(playerid, COLOR_GREEN, "Mekanik Duty: %s | PH: [%d]", ReturnName(ii), pData[ii][pPhone]);
			}
		}
		return 1;
	}
	if(ph == 911)
	{
		if(pData[playerid][pCallTime] >= gettime())
			return Error(playerid, "You must wait %d seconds before sending another call.", pData[playerid][pCallTime] - gettime());
		
		new Float:x, Float:y, Float:z;
		GetPlayerPos(playerid, x, y, z);
		Info(playerid, "Warning: This number for emergency crime only! please wait for SAPD respon!");
		SendFactionMessage(1, COLOR_BLUE, "[EMERGENCY CALL] "WHITE_E"%s calling the emergency crime! Ph: ["GREEN_E"%d"WHITE_E"] | Location: %s", ReturnName(playerid), pData[playerid][pPhone], GetLocation(x, y, z));
	
		pData[playerid][pCallTime] = gettime() + 60;
	}
	if(ph == 922)
	{
		if(pData[playerid][pCallTime] >= gettime())
			return Error(playerid, "You must wait %d seconds before sending another call.", pData[playerid][pCallTime] - gettime());
		
		new Float:x, Float:y, Float:z;
		GetPlayerPos(playerid, x, y, z);
		Info(playerid, "Warning: This number for emergency medical only! please wait for SAMD respon!");
		SendFactionMessage(3, COLOR_YELLOW2, "[EMERGENCY CALL] "WHITE_E"%s calling the emergency medical! Ph: ["GREEN_E"%d"WHITE_E"] | Location: %s", ReturnName(playerid), pData[playerid][pPhone], GetLocation(x, y, z));
	
		pData[playerid][pCallTime] = gettime() + 60;
	}
	if(ph == 933)
	{
		if(pData[playerid][pCallTime] >= gettime())
			return Error(playerid, "You must wait %d seconds before sending another call.", pData[playerid][pCallTime] - gettime());
		
		new Float:x, Float:y, Float:z;
		GetPlayerPos(playerid, x, y, z);
		Info(playerid, "Your calling has sent to the taxi driver. please wait for respon!");
		pData[playerid][pCallTime] = gettime() + 60;
		foreach(new tx : Player)
		{
			if(pData[tx][pJob] == 1 || pData[tx][pJob2] == 1)
			{
				SendClientMessageEx(tx, COLOR_YELLOW, "[TAXI CALL] "WHITE_E"%s calling the taxi for order! Ph: ["GREEN_E"%d"WHITE_E"] | Location: %s", ReturnName(playerid), pData[playerid][pPhone], GetLocation(x, y, z));
			}
		}
	}
	if(ph == pData[playerid][pPhone]) return Error(playerid, "Nomor sedang sibuk!");
	foreach(new ii : Player)
	{
		if(pData[ii][pPhone] == ph)
		{
			if(pData[ii][pCall] == INVALID_PLAYER_ID)
			{
				pData[playerid][pCall] = ii;
			 
				PlayerPlaySound(playerid, 3600, 0,0,0);
				PlayerPlaySound(ii, 6003, 0,0,0);
				SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
				SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, "* %s takes out a cellphone and calling someone.", ReturnName(playerid));
				pData[playerid][pCallLine] = ii;
				pData[playerid][pCalling] = 1;
				pData[playerid][pCallStage] = 1;
			    for(new i = 0; i < 30; i++)
			    {
					TextDrawShowForPlayer(ii, PhoneCall[i]);
				}
				Info(playerid, "Gunakan '/cursor'Jika mouse hilang Dari Layar/teksdraw tidak bisa ditekan!");
				SelectTextDraw(playerid, COLOR_BLUE);
				TogglePlayerControllable(playerid, 0);
				for(new i = 0; i < 57; i++)
				{
					TextDrawHideForPlayer(playerid, PhoneBaru[i]);
				}
				SelectTextDraw(playerid, COLOR_BLUE);
				//InfoMsg(ii, "Ada panggilan masuk gunakan ~y~/p ~w~untuk menjawab panggilan");
				InfoMsg(playerid, "Sedang memanggil...");
				pData[ii][pCallLine] = playerid;
				pData[ii][pCallStage] = 1;
				return 1;
			}
			else
			{
				ErrorMsg(playerid, "Nomor ini sedang sibuk.");
				return 1;
			}
		}
	}
	return 1;
}

/*CMD:p(playerid, params[])
{
	if(pData[playerid][pCall] != INVALID_PLAYER_ID)
		return ErrorMsg(playerid, "Anda sudah sedang menelpon seseorang!");
		
	if(pData[playerid][pInjured] != 0)
		return ErrorMsg(playerid, "You cant do that in this time.");
		
	foreach(new ii : Player)
	{
		if(playerid == pData[ii][pCall])
		{
			pData[playerid][pCall] = ii;
			
			new targetid = pData[playerid][pCall];
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
			SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, "* %s mengangkat panggilan telepon.", ReturnName(playerid));
			InfoMsg(playerid, "Untuk mematikan telepon gunakan /hu");
			InfoMsg(ii, "Untuk mematikan telepon gunakan /hu");
			pData[ii][pCallStage] = 2;
			pData[playerid][pCallStage] = 2;
			pData[playerid][pTombolVoice] = 0;
			pData[ii][pTombolVoice] = 0;
			new aaa[600];
			format(aaa, sizeof(aaa), "%s", pData[playerid][pName]);
			TextDrawSetString(PhoneCall[22], aaa);
			//PlayerTextDrawSetString(ii, PhoneCall[ii][22], aaa);
			format(aaa, sizeof(aaa), "%s", pData[ii][pName]);
			TextDrawSetString(PhoneCall[22], aaa);
			//PlayerTextDrawSetString(playerid, TELPON[playerid][3], "Telah terhubung di panggilan");
		//	PlayerTextDrawSetString(ii, TELPON[ii][3], "Telah terhubung di panggilan");
			for(new b = 0; b < 28; b++)
			{
				TextDrawShowForPlayer(ii, PhoneCall1[b]);
			}
			for(new a = 0; a < 28; a++)
			{
				TextDrawShowForPlayer(playerid, PhoneCall1[a]);
			}
			 for(new i = 0; i < 57; i++)
			{
				TextDrawHideForPlayer(playerid, PhoneBaru[i]);
			}
			//////////Samp Voice/////////////////////////////////////////////////////////////
			StreamTelpon[targetid] = SvCreateGStream(0xFF0000FF, "Call");
			if (StreamTelpon[targetid]) {
                SvAttachListenerToStream(StreamTelpon[targetid], targetid);
                SvAttachListenerToStream(StreamTelpon[targetid], playerid);
            }
            if (StreamTelpon[targetid] && pData[playerid][pCall] != INVALID_PLAYER_ID) {
                SvAttachSpeakerToStream(StreamTelpon[targetid], playerid);
            }

            if(StreamTelpon[targetid] && pData[targetid][pCall] != INVALID_PLAYER_ID){
                SvAttachSpeakerToStream(StreamTelpon[targetid], targetid);
            }
			/////////////////////////////////////////////////////////////////////////////////
			return 1;
		}
	}
	return 1;
}
*/
/*CMD:hu(playerid)
{
		if(pData[playerid][pCallStage] != 2) return ErrorMsg(playerid, "Anda sedang tidak menelepon");
		if(pData[playerid][pCallStage] == 2)
		{
			new caller = pData[playerid][pCall];
			pData[caller][pCall] = INVALID_PLAYER_ID;
			SetPlayerSpecialAction(caller, SPECIAL_ACTION_STOPUSECELLPHONE);
			SendNearbyMessage(caller, 20.0, COLOR_PURPLE, "* %s mematikan panggilan telepon.", ReturnName(caller));
			if(StreamTelpon[caller])
			{
				SvDetachListenerFromStream(StreamTelpon[caller], caller);
			}
			if(StreamTelpon[playerid])
			{
				SvDetachListenerFromStream(StreamTelpon[playerid], playerid);
			}
			SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, "* %s mematikan panggilan telepon.", ReturnName(playerid));
			pData[playerid][pCall] = INVALID_PLAYER_ID;
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_STOPUSECELLPHONE);
			pData[playerid][pCallStage] = 0;
			pData[playerid][pCallLine] = INVALID_PLAYER_ID;
			pData[caller][pCallStage] = 0;
			pData[caller][pCallLine] = INVALID_PLAYER_ID;
			pData[playerid][pTombolVoice] = 1;
			pData[caller][pTombolVoice] = 1;
			for(new b = 0; b < 28; b++)
			{
				TextDrawHideForPlayer(caller, PhoneCall1[b]);
			}
			for(new a = 0; a < 28; a++)
			{
				TextDrawHideForPlayer(playerid, PhoneCall1[a]);
			}
	}
	return 1;
}*/


CMD:makesks(playerid, params[])
{
	if(pData[playerid][pSks] == 0) return ErrorMsg(playerid, "Anda tidak memiliki surat keterangan sehat");

	new string[1000];
	format(string, sizeof(string), ""YELLOW_E"======SURAT KETERANGAN SEHAT=====\nNama : %s\nTanggal lahir : %s\nMenyatakan bahwa:\nSurat ini sah hingga masa berlaku yang telah di tentukan", pData[playerid][pName], pData[playerid][pAge]);
	ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, "Memberi Surat Keterangan sehat", string, "{e31d1d}Close","");
    return 1;
}

CMD:givesks(playerid, params[])
{
    new jumlah, otherid;
	if(sscanf(params, "ud", otherid, jumlah))
        return SyntaxMsg(playerid, "/givesks [playerid id/name] <amount>");

	if(pData[playerid][pFaction] != 3)
        return Error(playerid, "You Must In Medical Faction!");

	if(jumlah > 1)
		return ErrorMsg(playerid, "Max 1!");

    if(!IsPlayerConnected(otherid))
        return ErrorMsg(playerid, "Player belum masuk!");

	new string[1000];
	format(string, sizeof(string), ""YELLOW_E"======TERMS AND PRIVACY=====\n1. Surat ini legal dan sangat penting.pergunakanlah Dengan baik!\n2. Jangan memalsukan surat ini.apabila ketahuan untuk memalsukan akan di pecat secara sepihak\n3. Pemecatan bila menyalahgunakan surat ini telah di tanda tangani oleh pemerintah.\n\njadilah petugas yang jujur dan amanah dalam bertugas.");
	ShowPlayerDialog(playerid, DIALOG_SKS, DIALOG_STYLE_MSGBOX, "Memberi Surat Keterangan sehat", string, "{27d23d}Enter", "{e31d1d}Cancel");

	pData[otherid][pSks] = jumlah;
    new lstr[500];
	format(lstr, sizeof(lstr), "Anda berhasil memberikan Surat Keterangan dan kebijakan~y~%d!", pData[otherid][pName]);
    SuccesMsg(playerid, lstr);
    new str[500];
    format(str, sizeof(str), "Medic %s Success To Give Your SKS", ReturnName(playerid));
    InfoMsg(otherid, str);
    return 1;
}		    

//giveskck
/*CMD:giveskck(playerid, params[])
{
    new jumlah, otherid;
    if(sscanf(params, "ud", otherid, jumlah))
        return SyntaxMsg(playerid, "/giveskck [playerid id/name] <amount>");

    if(pData[playerid][pFaction] != 1)
        return Error(playerid, "You Must Police Department!");

    if(jumlah > 1)
        return ErrorMsg(playerid, "Max 1!");

    if(!IsPlayerConnected(otherid))
        return ErrorMsg(playerid, "Player Not Connected!");

    new string[1000];
    format(string, sizeof(string), ""LGWRP_E"======GREENWICH SKCK=====\nName : %s \nAge : %s", pData[playerid][pName], pData[playerid][pAge]);
    ShowPlayerDialog(playerid, DIALOG_SKS, DIALOG_STYLE_MSGBOX, "Given SKCK", string, "{27d23d}Enter", "{e31d1d}Cancel");//DIALOG SKCK

    pData[otherid][pSks] = jumlah;
    new lstr[500];
    format(lstr, sizeof(lstr), "Anda berhasil memberikan Surat Keterangan dan kebijakan~y~%d!", pData[otherid][pName]);
    SuccesMsg(playerid, lstr);
    new str[500];
    format(str, sizeof(str), "Police %s Success To Give Your SKCK", ReturnName(playerid));
    InfoMsg(otherid, str);
    return 1;
}*/


CMD:savestats(playerid, params[])
{
	UpdateWeapons(playerid);
	UpdatePlayerData(playerid);
	SuccesMsg(playerid, "Data karakter kamu berhasil disimpan!");
	return 1;
}

CMD:ads(playerid, params[])
{
	if(!IsPlayerInRangeOfPoint(playerid, 3.0, 787.32, -1332.86, 710.29)) return Error(playerid, "You must in Greenwich News Agency Station!");
	if(pData[playerid][pDelayIklan] > 0) return Error(playerid, "Cooldown Your ADS %d detik", pData[playerid][pDelayIklan]);
	if(pData[playerid][pPhone] == 0) return Error(playerid, "You Don't Have a Phone!");
	
	if(isnull(params))
	{
		SyntaxMsg(playerid, "/ads [text] | 1 character pay $4");
		return 1;
	}
	if(strlen(params) >= 100 ) return Error(playerid, "Maximum character is 100 text." );
	new payout = strlen(params) * 4;
	if(GetPlayerMoney(playerid) < payout) return Error(playerid, "Not enough money.");
	
	GivePlayerMoneyEx(playerid, -payout);
	Server_AddMoney(payout);
	pData[playerid][pDelayIklan] = 600;
	foreach(new ii : Player)
	{
		if(pData[ii][pTogAds] == 0)
		{
			SendClientMessageEx(ii, COLOR_ORANGE2, "[IKLAN] "GREEN_E"%s.", params);
			SendClientMessageEx(ii, COLOR_ORANGE2, "Kontak Info: ["GREEN_E"%s"ORANGE_E2"] Ph: ["GREEN_E"%d"ORANGE_E2"]", pData[playerid][pName], pData[playerid][pPhone]);
		}
	}
	//SendClientMessageToAllEx(COLOR_ORANGE2, "[ADS] "GREEN_E"%s.", params);
	//SendClientMessageToAllEx(COLOR_ORANGE2, "Contact Info: ["GREEN_E"%s"ORANGE_E2"] Ph: ["GREEN_E"%d"ORANGE_E2"] Bank Rek: ["GREEN_E"%d"ORANGE_E2"]", pData[playerid][pName], pData[playerid][pPhone], pData[playerid][pBankRek]);
	return 1;
}

//------------------[ Bisnis and Buy Commands ]-------
CMD:buy(playerid, params[])
{
	if(IsPlayerInRangeOfPoint(playerid, 50, 2184.32, -1023.32, 1018.68))
		return Error(playerid, "Anda tidak dapat melakukan ini jika sedang berada di OOC Zone");
	//trucker product
	if(IsPlayerInRangeOfPoint(playerid, 3.5, -279.67, -2148.42, 28.54))
	{
		if(pData[playerid][pJob] == 4 || pData[playerid][pJob2] == 4)
		{
			if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
			{
				new mstr[128];
				format(mstr, sizeof(mstr), ""WHITE_E"Masukan jumlah product:\nProduct Stock: "GREEN_E"%d\n"WHITE_E"Product Price"GREEN_E"%s / item", Product, FormatMoney(ProductPrice));
				ShowPlayerDialog(playerid, DIALOG_PRODUCT, DIALOG_STYLE_INPUT, "Buy Product", mstr, "Buy", "Cancel");
			}
			else return Error(playerid, "You are not in vehicle trucker.");
		}
		else return Error(playerid, "You are not trucker job.");
	}
	if(IsPlayerInRangeOfPoint(playerid, 3.5, 336.70, 895.54, 20.40))
	{
		if(pData[playerid][pJob] == 4 || pData[playerid][pJob2] == 4)
		{
			if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
			{
				new mstr[128];
				format(mstr, sizeof(mstr), ""WHITE_E"Masukan jumlah liter gasoil:\nGasOil Stock: "GREEN_E"%d\n"WHITE_E"GasOil Price"GREEN_E"%s / liters", GasOil, FormatMoney(GasOilPrice));
				ShowPlayerDialog(playerid, DIALOG_GASOIL, DIALOG_STYLE_INPUT, "Buy GasOil", mstr, "Buy", "Cancel");
			}
			else return Error(playerid, "You are not in vehicle trucker.");
		}
		else return Error(playerid, "You are not trucker job.");
	}
	//Material
	if(IsPlayerInRangeOfPoint(playerid, 2.5, -258.54, -2189.92, 28.97))
	{
		if(pData[playerid][pMaterial] >= 500) return Error(playerid, "Anda sudah membawa 500 Material!");
		new mstr[128];
		format(mstr, sizeof(mstr), ""WHITE_E"Masukan jumlah material:\nMaterial Stock: "GREEN_E"%d\n"WHITE_E"Material Price"GREEN_E"%s / item", Material, FormatMoney(MaterialPrice));
		ShowPlayerDialog(playerid, DIALOG_MATERIAL, DIALOG_STYLE_INPUT, "Buy Material", mstr, "Buy", "Cancel");
	}
	//Component
	if(IsPlayerInRangeOfPoint(playerid, 2.5, 854.5555, -605.2056, 18.4219))
	{
		if(pData[playerid][pComponent] >= 1500) return Error(playerid, "Anda sudah membawa 1500 Component!");
		new mstr[128];
		format(mstr, sizeof(mstr), ""WHITE_E"Masukan jumlah component:\nComponent Stock: "GREEN_E"%d\n"WHITE_E"Component Price"GREEN_E"%s / item", Component, FormatMoney(ComponentPrice));
		ShowPlayerDialog(playerid, DIALOG_COMPONENT, DIALOG_STYLE_INPUT, "Buy Component", mstr, "Buy", "Cancel");
	}
	//Ayamfill
	if(IsPlayerInRangeOfPoint(playerid, 2.5, 921.7545,-1299.1313,14.0938))
	{
		if(pData[playerid][AyamFillet] >= 100) return Error(playerid, "Anda sudah membawa 100 kg AyamFillet!");

		new mstr[128];
		format(mstr, sizeof(mstr), ""WHITE_E"Masukan jumlah ayam:\nAyam Stock: "GREEN_E"%d\n"WHITE_E"Ayam Price"GREEN_E"%s / item", AyamFill, FormatMoney(AyamFillPrice));
		ShowPlayerDialog(playerid, DIALOG_AYAMFILL, DIALOG_STYLE_INPUT, "Buy Ayam", mstr, "Buy", "Cancel");
	}
	//Apotek
	if(IsPlayerInRangeOfPoint(playerid, 2.5, 1344.85, 1572.11, 3010.90))
	{
		if(pData[playerid][pFaction] != 3)
			return Error(playerid, "Medical only!");
			
		new mstr[128];
		format(mstr, sizeof(mstr), "Product\tPrice\n\
		Medicine\t"GREEN_E"%s\n\
		Medkit\t"GREEN_E"%s\n\
		Bandage\t"GREEN_E"$100\n\
		", FormatMoney(MedicinePrice), FormatMoney(MedkitPrice));
		ShowPlayerDialog(playerid, DIALOG_APOTEK, DIALOG_STYLE_TABLIST_HEADERS, "Apotek", mstr, "Buy", "Cancel");
	}
	//Food and Seed
	if(IsPlayerInRangeOfPoint(playerid, 2.5, -381.44, -1426.13, 25.93))
	{
		new mstr[128];
		format(mstr, sizeof(mstr), "Product\tPrice\n\
		Food\t"GREEN_E"%s\n\
		Seed\t"GREEN_E"%s\n\
		", FormatMoney(FoodPrice), FormatMoney(SeedPrice));
		ShowPlayerDialog(playerid, DIALOG_FOOD, DIALOG_STYLE_TABLIST_HEADERS, "Food", mstr, "Buy", "Cancel");
	}
	//Drugs
	if(IsPlayerInRangeOfPoint(playerid, 2.5, 874.52, -15.98, 63.19))
	{
		if(pData[playerid][pMarijuana] >= 100) return Error(playerid, "Anda sudah membawa 100 kg Marijuana!");
		
		new mstr[128];
		format(mstr, sizeof(mstr), ""WHITE_E"Masukan jumlah marijuana:\nMarijuana Stock: "GREEN_E"%d\n"WHITE_E"Marijuana Price"GREEN_E"%s / item", Marijuana, FormatMoney(MarijuanaPrice));
		ShowPlayerDialog(playerid, DIALOG_DRUGS, DIALOG_STYLE_INPUT, "Buy Drugs", mstr, "Buy", "Cancel");
	}
	// Obat Myr
	if(IsPlayerInRangeOfPoint(playerid, 2.5, 963.88, 1955.54, -88.65))
	{
		if(pData[playerid][pObat] >= 5) return Error(playerid, "Anda sudah membawa 5 Obat Myr!");
		
		new mstr[128];
		format(mstr, sizeof(mstr), ""WHITE_E"Masukan jumlah Obat:\nObat Stock: "GREEN_E"%d\n"WHITE_E"Obat Price"GREEN_E"%s / item", ObatMyr, FormatMoney(ObatPrice));
		ShowPlayerDialog(playerid, DIALOG_OBAT, DIALOG_STYLE_INPUT, "Buy Obat", mstr, "Buy", "Cancel");
	}
	//Buy House
	foreach(new hid : Houses)
	{
		if(IsPlayerInRangeOfPoint(playerid, 2.5, hData[hid][hExtposX], hData[hid][hExtposY], hData[hid][hExtposZ]))
		{
			if(hData[hid][hPrice] > GetPlayerMoney(playerid)) return Error(playerid, "Not enough money, you can't afford this houses.");
			if(strcmp(hData[hid][hOwner], "-")) return Error(playerid, "Someone already owns this house.");
			if(pData[playerid][pVip] == 1)
			{
			    #if LIMIT_PER_PLAYER > 0
				if(Player_HouseCount(playerid) + 1 > 2) return Error(playerid, "Kamu tidak dapat membeli rumah lebih.");
				#endif
			}
			else if(pData[playerid][pVip] == 2)
			{
			    #if LIMIT_PER_PLAYER > 0
				if(Player_HouseCount(playerid) + 1 > 3) return Error(playerid, "Kamu tidak dapat membeli rumah lebih.");
				#endif
			}
			else if(pData[playerid][pVip] == 3)
			{
			    #if LIMIT_PER_PLAYER > 0
				if(Player_HouseCount(playerid) + 1 > 4) return Error(playerid, "Kamu tidak dapat membeli rumah lebih.");
				#endif
			}
			else
			{
				#if LIMIT_PER_PLAYER > 0
				if(Player_HouseCount(playerid) + 1 > 1) return Error(playerid, "Kamu tidak dapat membeli rumah lebih.");
				#endif
			}
			GivePlayerMoneyEx(playerid, -hData[hid][hPrice]);
			Server_AddMoney(hData[hid][hPrice]);
			GetPlayerName(playerid, hData[hid][hOwner], MAX_PLAYER_NAME);
			hData[hid][hOwnerID] = pData[playerid][pID];
			hData[hid][hVisit] = gettime();
			new str[150];
			format(str,sizeof(str),"[HOUSE]: %s membeli rumah id %d seharga %s!", GetRPName(playerid), hid, FormatMoney(hData[hid][hPrice]));
			LogServer("Property", str);

			new query[128];
			mysql_format(g_SQL, query, sizeof(query), "UPDATE houses SET owner='%s', ownerid='%d', visit='%d' WHERE ID='%d'", hData[hid][hOwner], hData[hid][hOwnerID], hData[hid][hVisit], hid);
			mysql_tquery(g_SQL, query);
			
			House_Refresh(hid);
		}
	}
	
	//Buy Workshop
	foreach(new wid : Workshop)
	{
		if(IsPlayerInRangeOfPoint(playerid, 2.5, wsData[wid][wX], wsData[wid][wY], wsData[wid][wZ]))
		{
			if(wsData[wid][wPrice] > GetPlayerMoney(playerid))
				return Error(playerid, "Not enough money, you can't afford this workshop.");
			if(wsData[wid][wOwnerID] != 0 || strcmp(wsData[wid][wOwner], "-")) 
				return Error(playerid, "Someone already owns this workshop.");

			#if LIMIT_PER_PLAYER > 0
			if(Player_WorkshopCount(playerid) + 1 > 1) return Error(playerid, "You can't buy any more workshop.");
			#endif

			GivePlayerMoneyEx(playerid, -wsData[wid][wPrice]);
			Server_AddMoney(wsData[wid][wPrice]);
			GetPlayerName(playerid, wsData[wid][wOwner], MAX_PLAYER_NAME);
			wsData[wid][wOwnerID] = pData[playerid][pID];
			new str[150];
			format(str,sizeof(str),"[WS]: %s membeli workshop id %d seharga %s!", GetRPName(playerid), wid, FormatMoney(wsData[wid][wPrice]));
			LogServer("Property", str);

			Workshop_Refresh(wid);
			Workshop_Save(wid);
		}
	}
	return 1;
}

forward Revive(playerid);
public Revive(playerid)
{
	new otherid = GetPVarInt(playerid, "gcPlayer");
	TogglePlayerControllable(playerid,1);
	Servers(playerid, "Sukses revive");
	pData[playerid][pObat] -= 1;
    pData[otherid][pInjured] = 0;
    pData[otherid][pHospital] = 0;
    pData[otherid][pSick] = 0;
}

forward DownloadTwitter(playerid);
public DownloadTwitter(playerid)
{
	pData[playerid][pTwitter] = 1;
	pData[playerid][pKuota] -= 38000;
	Servers(playerid, "Twitter berhasil di Download");
}

CMD:selfie(playerid,params[])
{
	if(takingselfie[playerid] == 0)
	{
	    GetPlayerPos(playerid,lX[playerid],lY[playerid],lZ[playerid]);
		static Float: n1X, Float: n1Y;
		if(Degree[playerid] >= 360) Degree[playerid] = 0;
		Degree[playerid] += Speed;
		n1X = lX[playerid] + Radius * floatcos(Degree[playerid], degrees);
		n1Y = lY[playerid] + Radius * floatsin(Degree[playerid], degrees);
		SetPlayerCameraPos(playerid, n1X, n1Y, lZ[playerid] + Height);
		SetPlayerCameraLookAt(playerid, lX[playerid], lY[playerid], lZ[playerid]+1);
		SetPlayerFacingAngle(playerid, Degree[playerid] - 90.0);
		takingselfie[playerid] = 1;
		ApplyAnimation(playerid, "PED", "gang_gunstand", 4.1, 1, 1, 1, 1, 1, 1);
		return 1;
	}
    if(takingselfie[playerid] == 1)
	{
	    TogglePlayerControllable(playerid,1);
		SetCameraBehindPlayer(playerid);
	    takingselfie[playerid] = 0;
	    ApplyAnimation(playerid, "PED", "ATM", 4.1, 0, 1, 1, 0, 1, 1);
	    return 1;
	}
    return 1;
}
CMD:buyws(playerid, params[])
{
	foreach(new wid : Workshop)
	{
		if(IsPlayerInRangeOfPoint(playerid, 2.5, wsData[wid][wX], wsData[wid][wY], wsData[wid][wZ]))
		{
			if(wsData[wid][wPrice] > GetPlayerMoney(playerid))
				return Error(playerid, "Not enough money, you can't afford this workshop.");
			if(wsData[wid][wOwnerID] != 0 || strcmp(wsData[wid][wOwner], "-"))
				return Error(playerid, "Someone already owns this workshop.");

			#if LIMIT_PER_PLAYER > 0
			if(Player_WorkshopCount(playerid) + 1 > 1) return Error(playerid, "You can't buy any more workshop.");
			#endif

			GivePlayerMoneyEx(playerid, -wsData[wid][wPrice]);
			Server_AddMoney(wsData[wid][wPrice]);
			GetPlayerName(playerid, wsData[wid][wOwner], MAX_PLAYER_NAME);
			wsData[wid][wOwnerID] = pData[playerid][pID];
			new str[150];
			format(str,sizeof(str),"[WS]: %s membeli workshop id %d seharga %s!", GetRPName(playerid), wid, FormatMoney(wsData[wid][wPrice]));
			LogServer("Property", str);

			Workshop_Refresh(wid);
			Workshop_Save(wid);
		}
	}
	return 1;
}

// DelaysPlayer(playerid)
// {
// 	new str[(1024 * 2)], headers[500];
// 	strcat(headers, "Name\tTime\n");

// 	if(pData[playerid][pExitJob] > 0)
//     {
//         format(str, sizeof(str), "%s{ff0000}Exit Jobs{ffffff}\t%i Second\n", str, ReturnTimelapse(gettime(), pData[playerid][pExitJob]));
// 	}
// 	if(pData[playerid][pJobTime] > 0)
//     {
//         format(str, sizeof(str), "%sJobs\t%i Second\n", str, pData[playerid][pJobTime]);
// 	}
// 	if(pData[playerid][pBusTime] > 0)
//     {
//         format(str, sizeof(str), "%sBus (Sidejob)\t%i Second\n", str, pData[playerid][pBusTime]);
// 	}
// 	if(pData[playerid][pSparepartTime] > 0)
//     {
//         format(str, sizeof(str), "%sJob Sparepart (Jobs)\t%i Second\n", str, pData[playerid][pSparepartTime]);
// 	}
	
// 	strcat(headers, str);

// 	ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_TABLIST_HEADERS, "Delays", headers, "Okay", "");
// 	return 1;
// }

CMD:washmoney(playerid, params[])
{
	new merah = pData[playerid][pRedMoney];
	new rumus = (merah/200)*10; // 5 discount percent
 	new total = merah-rumus;
	if(pData[playerid][pRedMoney] < 0)
	{
		return Error(playerid, "You Don't Have Red Money!.");
	}
	if(!IsPlayerInRangeOfPoint(playerid, 5.0, -349.99, -1035.29, 59.35))
	{
		return Error(playerid, "You Must At Laundry Money Place!.");
	}
	Info(playerid, "You Wash The Red Money and Earn %s.", FormatMoney(total));
	pData[playerid][pRedMoney] -= total;
	GivePlayerMoneyEx(playerid, total);
	return 1;
}

CMD:clearchat(playerid, params[])
{
	ClearChat(playerid);
	return 1;
}

CMD:taclight(playerid, params[])
{
	if(!pData[playerid][pFlashlight]) 
		return Error(playerid, "Kamu tidak mempunyai senter.");
	if(pData[playerid][pUsedFlashlight] == 0)
	{
		if(IsPlayerAttachedObjectSlotUsed(playerid,8)) RemovePlayerAttachedObject(playerid,8);
		if(IsPlayerAttachedObjectSlotUsed(playerid,9)) RemovePlayerAttachedObject(playerid,9);
		SetPlayerAttachedObject(playerid, 8, 18656, 6, 0.25, -0.0175, 0.16, 86.5, -185, 86.5, 0.03, 0.1, 0.03);
		SetPlayerAttachedObject(playerid, 9, 18641, 6, 0.2, 0.01, 0.16, 90, -95, 90, 1, 1, 1);
		SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, "* %s attach the flashlight to the gun.", ReturnName(playerid));

		pData[playerid][pUsedFlashlight] = 1;
	}
	else
	{
		RemovePlayerAttachedObject(playerid,8);
		RemovePlayerAttachedObject(playerid,9);
		pData[playerid][pUsedFlashlight] =0;
		SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, "* %s take the flashlight off the gun.", ReturnName(playerid));
	}
	return 1;
}
CMD:flashlight(playerid, params[])
{
	if(!pData[playerid][pFlashlight])
		return Error(playerid, "Kamu tidak mempunyai senter.");

	if(pData[playerid][pUsedFlashlight] == 0)
	{
		if(IsPlayerAttachedObjectSlotUsed(playerid,8)) RemovePlayerAttachedObject(playerid,8);
		if(IsPlayerAttachedObjectSlotUsed(playerid,9)) RemovePlayerAttachedObject(playerid,9);
		SetPlayerAttachedObject(playerid, 8, 18656, 5, 0.1, 0.038, -0.01, -90, 180, 0, 0.03, 0.1, 0.03);
		SetPlayerAttachedObject(playerid, 9, 18641, 5, 0.1, 0.02, -0.05, 0, 0, 0, 1, 1, 1);
		SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, "* %s take out the flashlight and turn on the flashlight.", ReturnName(playerid));

		pData[playerid][pUsedFlashlight] =1;
	}
	else
	{
 		RemovePlayerAttachedObject(playerid,8);
		RemovePlayerAttachedObject(playerid,9);
		pData[playerid][pUsedFlashlight] =0;
		SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, "* %s turn off the flashlight and put it in.", ReturnName(playerid));
	}
	return 1;
}

CMD:giveweapon(playerid, params[])
{
    new weaponid = GetPlayerWeaponEx(playerid);
	new ammo = GetPlayerAmmoEx(playerid);
	
	
    if (!weaponid)
	    return ErrorMsg(playerid, "You are not holding a weapon.");
	    
	new otherid;
	if(sscanf(params, "ud", otherid, ammo))
     	return InfoMsg(playerid, "/giveweapon [playerid]");

	if(otherid == INVALID_PLAYER_ID || otherid == playerid || !NearPlayer(playerid, otherid, 5.0))
		return ErrorMsg(playerid, "You must in near target player.");
		
    if(ammo < 1 || ammo > 300)
        	return ErrorMsg(playerid, "You have specified an invalid weapon ammo, 1 - 300");

    Info(playerid, "You Give The Weapon Type %s For %s.", ReturnWeaponName(weaponid) , ReturnName(otherid));
	Info(otherid, "%s give weapon type %s For You.", ReturnName(playerid), ReturnWeaponName(weaponid));
    GivePlayerWeaponEx(otherid, weaponid, ammo);
	GivePlayerWeaponEx(playerid, weaponid, -ammo);
	return 1;
}

CMD:newweaponlic(playerid, params[])
{
	if(!IsPlayerInRangeOfPoint(playerid, 3.0, -2578.5625, -1383.2179, 1500.7570)) return Error(playerid, "Anda harus berada di Kantor SAPD!");
	if(pData[playerid][pDriveLic] != 0) return Error(playerid, "Anda sudah memiliki Weapon License!");
	if(GetPlayerMoney(playerid) < 4000) return Error(playerid, "Anda butuh $4,000 untuk membuat Weapon License.");
	pData[playerid][pWeaponLic] = 1;
	pData[playerid][pWeaponLicTime] = gettime() + (30 * 86400);
	GivePlayerMoneyEx(playerid, -4000);
	Server_AddMoney(4000);
	return 1;
}

CMD:s(playerid, params[])
{
	if(pData[playerid][pInjured] != 1) return ErrorMsg(playerid, "Anda tidak dapat menggunakannya saat ini!");
	{
		new Float:x, Float:y, Float:z;
		GetPlayerPos(playerid, x, y, z);
		InfoMsg(playerid, "Info: Sinyal kamu Sudah berasil di sampaikan Silakan Tunggu Ems Datang!");
		SendFactionMessage(3, COLOR_PINK2, "[EMERGENCY DOWN] "WHITE_E"%s [ID: %d] NOMER INI MENGIRIM SINYAL! Ph: ["GREEN_E"%d"WHITE_E"] | Location: %s", ReturnName(playerid), playerid, pData[playerid][pPhone], GetLocation(x, y, z));
	}
	return 1;
}
