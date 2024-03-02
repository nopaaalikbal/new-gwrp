enum E_PEMOTONG
{
    STREAMER_TAG_MAP_ICON:LockerMap,
    STREAMER_TAG_MAP_ICON:TempatKerja,
    STREAMER_TAG_MAP_ICON:AmbilMap,
	STREAMER_TAG_AREA:AmbilAyam,
	STREAMER_TAG_AREA:AmbilAyamHidup1,
	STREAMER_TAG_AREA:AmbilAyamHidup2,
	STREAMER_TAG_AREA:AmbilAyamHidup3,
	STREAMER_TAG_AREA:AmbilAyamHidup4,
	STREAMER_TAG_AREA:AmbilAyamHidup5,
	STREAMER_TAG_CP:PotongAyam,
	STREAMER_TAG_CP:PotongAyam2,
	STREAMER_TAG_CP:PotongAyam3,
	STREAMER_TAG_CP:PackingAyam,
	STREAMER_TAG_CP:PackingAyam2
}
new PemotongArea[MAX_PLAYERS][E_PEMOTONG];
new ayam1;
new ayam2;
new ayam3;
new ayam4;
new ayam5;

DeletePemotongCP(playerid)
{
	if(IsValidDynamicArea(PemotongArea[playerid][AmbilAyam]))
	{
		DestroyDynamicArea(PemotongArea[playerid][AmbilAyam]);
		PemotongArea[playerid][AmbilAyam] = STREAMER_TAG_AREA: -1;
	}
	if(IsValidDynamicArea(PemotongArea[playerid][AmbilAyamHidup1]))
	{
		DestroyDynamicArea(PemotongArea[playerid][AmbilAyamHidup1]);
		PemotongArea[playerid][AmbilAyamHidup1] = STREAMER_TAG_AREA: -1;
	}
	if(IsValidDynamicArea(PemotongArea[playerid][AmbilAyamHidup2]))
	{
		DestroyDynamicArea(PemotongArea[playerid][AmbilAyamHidup2]);
		PemotongArea[playerid][AmbilAyamHidup2] = STREAMER_TAG_AREA: -1;
	}
	if(IsValidDynamicArea(PemotongArea[playerid][AmbilAyamHidup3]))
	{
		DestroyDynamicArea(PemotongArea[playerid][AmbilAyamHidup3]);
		PemotongArea[playerid][AmbilAyamHidup3] = STREAMER_TAG_AREA: -1;
	}
	if(IsValidDynamicArea(PemotongArea[playerid][AmbilAyamHidup4]))
	{
		DestroyDynamicArea(PemotongArea[playerid][AmbilAyamHidup4]);
		PemotongArea[playerid][AmbilAyamHidup4] = STREAMER_TAG_AREA: -1;
	}
	if(IsValidDynamicArea(PemotongArea[playerid][AmbilAyamHidup5]))
	{
		DestroyDynamicArea(PemotongArea[playerid][AmbilAyamHidup5]);
		PemotongArea[playerid][AmbilAyamHidup5] = STREAMER_TAG_AREA: -1;
	}
	if(IsValidDynamicCP(PemotongArea[playerid][PotongAyam]))
	{
		DestroyDynamicCP(PemotongArea[playerid][PotongAyam]);
		PemotongArea[playerid][PotongAyam] = STREAMER_TAG_CP: -1;
	}
	if(IsValidDynamicCP(PemotongArea[playerid][PotongAyam2]))
	{
		DestroyDynamicCP(PemotongArea[playerid][PotongAyam2]);
		PemotongArea[playerid][PotongAyam2] = STREAMER_TAG_CP: -1;
	}
	if(IsValidDynamicCP(PemotongArea[playerid][PotongAyam3]))
	{
		DestroyDynamicCP(PemotongArea[playerid][PotongAyam3]);
		PemotongArea[playerid][PotongAyam3] = STREAMER_TAG_CP: -1;
	}
	if(IsValidDynamicCP(PemotongArea[playerid][PackingAyam]))
	{
		DestroyDynamicCP(PemotongArea[playerid][PackingAyam]);
		PemotongArea[playerid][PackingAyam] = STREAMER_TAG_CP: -1;
	}
	if(IsValidDynamicCP(PemotongArea[playerid][PackingAyam2]))
	{
		DestroyDynamicCP(PemotongArea[playerid][PackingAyam2]);
		PemotongArea[playerid][PackingAyam2] = STREAMER_TAG_CP: -1;
	}
	if(IsValidDynamicMapIcon(PemotongArea[playerid][LockerMap]))
	{
		DestroyDynamicMapIcon(PemotongArea[playerid][LockerMap]);
		PemotongArea[playerid][LockerMap] = STREAMER_TAG_MAP_ICON: -1;
	}
	if(IsValidDynamicMapIcon(PemotongArea[playerid][TempatKerja]))
	{
		DestroyDynamicMapIcon(PemotongArea[playerid][TempatKerja]);
		PemotongArea[playerid][TempatKerja] = STREAMER_TAG_MAP_ICON: -1;
	}
	if(IsValidDynamicMapIcon(PemotongArea[playerid][AmbilMap]))
	{
		DestroyDynamicMapIcon(PemotongArea[playerid][AmbilMap]);
		PemotongArea[playerid][AmbilMap] = STREAMER_TAG_MAP_ICON: -1;
	}
}
destroyayam(playerid)
{
	DestroyDynamicObject(ayam1);
	DestroyDynamicObject(ayam2);
	DestroyDynamicObject(ayam3);
	DestroyDynamicObject(ayam4);
	DestroyDynamicObject(ayam5);
	if(IsValidDynamicArea(PemotongArea[playerid][AmbilAyamHidup1]))
	{
		DestroyDynamicArea(PemotongArea[playerid][AmbilAyamHidup1]);
		PemotongArea[playerid][AmbilAyamHidup1] = STREAMER_TAG_AREA: -1;
	}
	if(IsValidDynamicArea(PemotongArea[playerid][AmbilAyamHidup2]))
	{
		DestroyDynamicArea(PemotongArea[playerid][AmbilAyamHidup2]);
		PemotongArea[playerid][AmbilAyamHidup2] = STREAMER_TAG_AREA: -1;
	}
	if(IsValidDynamicArea(PemotongArea[playerid][AmbilAyamHidup3]))
	{
		DestroyDynamicArea(PemotongArea[playerid][AmbilAyamHidup3]);
		PemotongArea[playerid][AmbilAyamHidup3] = STREAMER_TAG_AREA: -1;
	}
	if(IsValidDynamicArea(PemotongArea[playerid][AmbilAyamHidup4]))
	{
		DestroyDynamicArea(PemotongArea[playerid][AmbilAyamHidup4]);
		PemotongArea[playerid][AmbilAyamHidup4] = STREAMER_TAG_AREA: -1;
	}
	if(IsValidDynamicArea(PemotongArea[playerid][AmbilAyamHidup5]))
	{
		DestroyDynamicArea(PemotongArea[playerid][AmbilAyamHidup5]);
		PemotongArea[playerid][AmbilAyamHidup5] = STREAMER_TAG_AREA: -1;
	}
	return 1;
}
RefreshJobPemotong(playerid)
{
	DeletePemotongCP(playerid);

	if(pData[playerid][pJob] == 2)
	{
	    PemotongArea[playerid][AmbilAyam] = CreateDynamicCircle(1431.42,369.74,18.90, -1, -1);
	    PemotongArea[playerid][PotongAyam] = CreateDynamicCP(1413.74,369.37,19.25, 2.0, -1, -1, playerid, 30.0);
	    PemotongArea[playerid][PotongAyam2] = CreateDynamicCP(1415.55,373.04,19.24, 2.0, -1, -1, playerid, 30.0);
	    PemotongArea[playerid][PotongAyam3] = CreateDynamicCP(1417.34,376.71,19.23, 2.0, -1, -1, playerid, 30.0);
	    PemotongArea[playerid][PackingAyam] = CreateDynamicCP(1408.72,380.88,19.54, 2.0, -1, -1, playerid, 30.0);
	    PemotongArea[playerid][PackingAyam2] = CreateDynamicCP(1410.00,383.63,19.53, 2.0, -1, -1, playerid, 30.0);
	    PemotongArea[playerid][AmbilMap] = CreateDynamicMapIcon(1431.42,369.74,18.90, 14, 0, -1, -1, playerid, 99999.0, MAPICON_GLOBAL);
		PemotongArea[playerid][TempatKerja] = CreateDynamicMapIcon(1408.72,380.88,19.54, 14, 0, -1, -1, playerid, 99999.0, MAPICON_GLOBAL);
	}
	return 1;
}
function AyamSpawn(playerid)
{
    if(IsPlayerConnected(playerid) && pData[playerid][pJob] == 2)
	{
		new rand = RandomEx(1,4);
		if(rand == 1)
		{
		    pData[playerid][ayamcp] = 1;
		    destroyayam(playerid);
		    PemotongArea[playerid][AmbilAyamHidup1] = CreateDynamicCircle(1431.42,369.74,18.90, -1, -1);
	        ayam1 = CreateDynamicObject(19078, 1431.42,369.74,18.90-0.8, 0.0, 0.0, 0.0, 0, 0, -1, 50.00, 50.00);
		}
		else if(rand == 2)
		{
		    pData[playerid][ayamcp] = 2;
		    destroyayam(playerid);
		    PemotongArea[playerid][AmbilAyamHidup2] = CreateDynamicCircle(1434.44,380.18,18.90, -1, -1);
	        ayam2 = CreateDynamicObject(19078, 1434.44,380.18,18.90-0.8, 0.0, 0.0, 0.0, 0, 0, -1, 50.00, 50.00);
		}
		else if(rand == 3)
		{
		    pData[playerid][ayamcp] = 3;
		    destroyayam(playerid);
		    PemotongArea[playerid][AmbilAyamHidup3] = CreateDynamicCircle(1428.06,376.23,18.89, -1, -1);
	        ayam3 = CreateDynamicObject(19078, 1428.06,376.23,18.89-0.8, 0.0, 0.0, 0.0, 0, 0, -1, 50.00, 50.00);
		}
		else if(rand == 4)
		{
		    pData[playerid][ayamcp] = 4;
		    destroyayam(playerid);
		    PemotongArea[playerid][AmbilAyamHidup4] = CreateDynamicCircle(1435.63,370.24,18.96, -1, -1);
	        ayam4 = CreateDynamicObject(19078, 1435.63,370.24,18.96-0.8, 0.0, 0.0, 0.0, 0, 0, -1, 50.00, 50.00);
		}
	}
	return 1;
}
CMD:ambilayamdentot(playerid, params[])
{
    if(pData[playerid][pJob] == 2 || pData[playerid][pJob2] == 2)
    {
            if(pData[playerid][pPemotongStatus] == 1) return ErrorMsg(playerid, "You'r Still Processing Chicken");
            if(pData[playerid][pProgress] == 1) return ErrorMsg(playerid, "You Still Have Activity Progress!");
            if(pData[playerid][AmbilAyam] == 10) return ErrorMsg(playerid, "You Already Took 10 Chicken!!");
            if(pData[playerid][AyamHidup] == 150) return ErrorMsg(playerid, "You've Brought 150 Chicken!");
            if(pData[playerid][DutyAmbilAyam] == 0) return ErrorMsg(playerid, "You've Have Not Permission From Chicken Farmer!");
            {
                pData[playerid][pPemotongStatus] += 1;
                pData[playerid][ayamcp] = 0;
                ayamjob[playerid] = SetTimerEx("getchicken", 2000, false, "id", playerid);
                ShowProgressbar(playerid, "Catch The Chicken", 2);
                ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.1, 0, 0, 0, 0, 0, 1);
            }
		}
    return 1;
}

CMD:izinayam(playerid, params[])
{
    if(pData[playerid][pJob] == 2 || pData[playerid][pJob2] == 2)
    {
        if(IsPlayerInRangeOfPoint(playerid, 2.0, 1411.11,358.78,19.17))
        {
            if(pData[playerid][DutyAmbilAyam] == 1) return ErrorMsg(playerid, "Please Finish Your Work First!");
            if(pData[playerid][AyamHidup] == 150) return ErrorMsg(playerid, "You've Brought 150 Chicken!");
            AyamSpawn(playerid);
            SetPlayerPos(playerid, 1431.42,369.74,18.90);
            pData[playerid][DutyAmbilAyam] = 1;
            PlayerData[playerid][pPos][0] = 1431.42,
			PlayerData[playerid][pPos][1] = 369.74,
			PlayerData[playerid][pPos][2] = 18.90;
			PlayerData[playerid][pPos][3] = pData[playerid][pPosA];
			InterpolateCameraPos(playerid, PlayerData[playerid][pPos][0]-2.5, PlayerData[playerid][pPos][1],250.00,PlayerData[playerid][pPos][0]-2.5, PlayerData[playerid][pPos][1], PlayerData[playerid][pPos][2]+2.5,2500,CAMERA_MOVE);
			InterpolateCameraLookAt(playerid, PlayerData[playerid][pPos][0], PlayerData[playerid][pPos][1], PlayerData[playerid][pPos][2], PlayerData[playerid][pPos][0], PlayerData[playerid][pPos][1], PlayerData[playerid][pPos][2], 2500, CAMERA_MOVE);
			SetTimerEx("SetPlayerCameraBehindAyam", 2500, false, "i", playerid);
        }
        else return ErrorMsg(playerid, "You're Not At The Chicken Processing Place!.");
    }
    else ErrorMsg(playerid, "You Don't Work As a Chicken Butcher.");
    return 1;
}
forward getchicken(playerid);
public getchicken(playerid)
{
    if(IsPlayerConnected(playerid) && pData[playerid][pJob] == 2)
	{
	    SuccesMsg(playerid, "Anda telah Mengambil Ayam Hidup.");
		ShowItemBox(playerid, "Ayam", "Received_1x", 16776, 5);
		pData[playerid][pActivityTime] = 0;
		KillTimer(ayamjob[playerid]);
		pData[playerid][pPemotongStatus] = 0;
		pData[playerid][AyamHidup] += 1;
		pData[playerid][AmbilAyam] += 1;
		pData[playerid][pEnergy] -= 1;
		ClearAnimations(playerid);
		AyamSpawn(playerid);
	}
	return 1;
}

CMD:potongayamdentot(playerid, params[])
{
    if(pData[playerid][pJob] == 2 || pData[playerid][pJob2] == 2)
    {
        if(pData[playerid][pPemotongStatus] == 1) return ErrorMsg(playerid, "You're Still Cutting Chicken");
        if(pData[playerid][AyamPotong] == 50) return ErrorMsg(playerid, "You've Brought 50 Chicken Cutlets!");
        if(pData[playerid][pProgress] == 1) return ErrorMsg(playerid, "You Still Have Activity Progress!");
        if(pData[playerid][AyamHidup] < 1) return ErrorMsg(playerid, "You Didn't Pick Up the Chicken.");
        {
            pData[playerid][pPemotongStatus] += 1;

            TogglePlayerControllable(playerid, 0);
            ShowProgressbar(playerid, "Cut The Chicken", 7);
            ApplyAnimation(playerid,"INT_HOUSE","wash_up",4.0, 1, 0, 0, 0, 0,1);
            ayamjob[playerid] = SetTimerEx("frychicken", 7000, false, "id", playerid);
        }
    }
    else return ErrorMsg(playerid, "You're Not a Chicken Butcher!");
    return 1;
}

forward frychicken(playerid);
public frychicken(playerid)
{
	SuccesMsg(playerid, "You Have Successfully Cut The Chicken.");
 	TogglePlayerControllable(playerid, 1);
  	ShowItemBox(playerid, "Chicken", "Removed_1x", 16776, 3);
  	ShowItemBox(playerid, "Ayam_Potong", "Received_5x", 2806, 3);
   	KillTimer(ayamjob[playerid]);
    pData[playerid][pActivityTime] = 0;
    pData[playerid][AyamPotong] += 5;
    pData[playerid][AyamHidup] -= 1;
    pData[playerid][pPemotongStatus] -= 1;
    pData[playerid][pEnergy] -= 2;
    ClearAnimations(playerid);
    return 1;
}

CMD:packingayamdentot(playerid, params[])
{
    if(pData[playerid][pJob] == 2 || pData[playerid][pJob2] == 2)
    {
        if(pData[playerid][pPemotongStatus] == 1) return ErrorMsg(playerid, "You Don't Have Finished Packing");
        if(pData[playerid][AyamPotong] < 1) return ErrorMsg(playerid, "You Don't Have a Chicken Chop.");
        if(pData[playerid][pProgress] == 1) return ErrorMsg(playerid, "You Still Have Activity Progress!");
        if(pData[playerid][AyamFillet] == 150) return ErrorMsg(playerid, "You Have Brought 150 Chicken Fillets!");
        {
            pData[playerid][pPemotongStatus] += 1;

            TogglePlayerControllable(playerid, 0);
            ayamjob[playerid] = SetTimerEx("packingchicken", 5000, false, "id", playerid);
            ShowProgressbar(playerid, "Packing Chicken", 5);
            ApplyAnimation(playerid,"INT_HOUSE","wash_up",4.0, 1, 0, 0, 0, 0,1);
        }
    }
    else return ErrorMsg(playerid, "You're Not a Chicken Butcher!");
    return 1;
}
forward packingchicken(playerid);
public packingchicken(playerid)
{
	SuccesMsg(playerid, "You Have Successfully Wrapped Chicken Cutlets.");
 	TogglePlayerControllable(playerid, 1);
  	KillTimer(ayamjob[playerid]);
   	pData[playerid][pActivityTime] = 0;
    pData[playerid][AyamFillet] += 1;
    ShowItemBox(playerid, "Ayam_Potong", "Removed_3x", 2806, 3);
    ShowItemBox(playerid, "Paket_Ayam", "Received_1x", 19566, 3);
    pData[playerid][AyamPotong] -= 3;
    pData[playerid][pPemotongStatus] -= 1;
    pData[playerid][pEnergy] -= 2;
    ClearAnimations(playerid);
    return 1;
}

CMD:jualayam(playerid, params[])
{
	if(pData[playerid][pVip] > 0)
	{
		if(pData[playerid][pProgress] == 1) return ErrorMsg(playerid, "You Still Have Activity Progress!");
		if(pData[playerid][AyamFillet] < 1) return ErrorMsg(playerid, "You Don't Have 1 Chicken Packet!");
		ShowProgressbar(playerid, "Selling Chicken Packet", 10);
		ApplyAnimation(playerid,"INT_HOUSE","wash_up",4.0, 1, 0, 0, 0, 0,1);
		new pay = pData[playerid][AyamFillet] * 40;
		new total = pData[playerid][AyamFillet];
		GivePlayerMoneyEx(playerid, pay);
		new str[500];
		format(str, sizeof(str), "Received_%dx", pay);
		ShowItemBox(playerid, "Uang", str, 1212, total);
		format(str, sizeof(str), "Removed_%dx", total);
		ShowItemBox(playerid, "Paket_Ayam", str, 19566, total);
		AyamFill += total;
		Server_MinMoney(pay);
		pData[playerid][AyamFillet] = 0;
		ShowProgressbar(playerid, "Sell The Chicken Packet", 5);
		ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.1, 0, 0, 0, 0, 0, 1);
	}
	else
	{
		if(pData[playerid][pProgress] == 1) return ErrorMsg(playerid, "You Still Have Activity Progress!");
		if(pData[playerid][AyamFillet] < 1) return ErrorMsg(playerid, "You Don't Have 1 Chicken Packet!");
		ShowProgressbar(playerid, "Selling Chicken Packet", 10);
		ApplyAnimation(playerid,"INT_HOUSE","wash_up",4.0, 1, 0, 0, 0, 0,1);
		new pay = pData[playerid][AyamFillet] * 20;
		new total = pData[playerid][AyamFillet];
		GivePlayerMoneyEx(playerid, pay);
		new str[500];
		format(str, sizeof(str), "Received_%dx", pay);
		ShowItemBox(playerid, "Uang", str, 1212, total);
		format(str, sizeof(str), "Removed_%dx", total);
		ShowItemBox(playerid, "Paket_Ayam", str, 19566, total);
		AyamFill += total;
		Server_MinMoney(pay);
		pData[playerid][AyamFillet] = 0;
		ShowProgressbar(playerid, "Sell The Chicken Packet", 5);
		ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.1, 0, 0, 0, 0, 0, 1);
	}
	return 1; 
	}


