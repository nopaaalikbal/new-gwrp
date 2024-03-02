

function tukangkayu1(playerid)
{
	new dapatkayu = RandomEx(2,6);
    pData[playerid][pKayu] += dapatkayu;
    new str[500];
	format(str, sizeof(str), "Received_%dx", dapatkayu);
	ShowItemBox(playerid, "kayu", str, 1463, 4);
	return 1;
}

CMD:buychainsaw(playerid, params[])
{
	if(pData[playerid][pJob] == 3)
	{
		GivePlayerWeaponEx(playerid, 9, 1);
		GivePlayerMoneyEx(playerid, -400);
		SendClientMessageEx(playerid, COLOR_ARWIN, "LUMBER: "YELLOW_E"Anda telah membeli chainsaw dengan harga "GREEN_E"$400");
	}
	else return ErrorMsg(playerid, "Kamu bukan Pekerja kayu!");
	return 1;
}


CMD:jualkayuzar(playerid, params[])
{
	if(pData[playerid][pVip] > 0)
	{
		new total = pData[playerid][pKayu];
		if( pData[playerid][pProgress] == 1) return ErrorMsg(playerid, "Anda masih memiliki activity progress!");
		if( pData[playerid][pKayu] < 1) return ErrorMsg(playerid, "Anda Tidak Memiliki kayu");
		ShowProgressbar(playerid, "Menjual Kayu..", 10);
		ApplyAnimation(playerid,"INT_HOUSE","wash_up",4.0, 1, 0, 0, 0, 0,1);
		new pay = pData[playerid][pKayu] * 40;
		GivePlayerMoneyEx(playerid, pay);
		pData[playerid][pKayu] -= total;
		new str[500];
		format(str, sizeof(str), "Received_%dx", pay);
		ShowItemBox(playerid, "Uang", str, 1212, 4);
		format(str, sizeof(str), "Removed_%dx", total);
		ShowItemBox(playerid, "kayu", str, 1463, 4);
		Inventory_Update(playerid);
	}
	else
	{
		new total = pData[playerid][pKayu];
		if( pData[playerid][pProgress] == 1) return ErrorMsg(playerid, "Anda masih memiliki activity progress!");
		if( pData[playerid][pKayu] < 1) return ErrorMsg(playerid, "Anda Tidak Memiliki kayu");
		ShowProgressbar(playerid, "Menjual Kayu..", 10);
		ApplyAnimation(playerid,"INT_HOUSE","wash_up",4.0, 1, 0, 0, 0, 0,1);
		new pay = pData[playerid][pKayu] * 30;
		GivePlayerMoneyEx(playerid, pay);
		pData[playerid][pKayu] -= total;
		new str[500];
		format(str, sizeof(str), "Received_%dx", pay);
		ShowItemBox(playerid, "Uang", str, 1212, 4);
		format(str, sizeof(str), "Removed_%dx", total);
		ShowItemBox(playerid, "kayu", str, 1463, 4);
		Inventory_Update(playerid);
	}
	return 1;
}

	
CMD:tukangkayuzar(playerid, params[])
{
    if(pData[playerid][pJob] != 3) return 1;
    if( pData[playerid][pProgress] == 1) return ErrorMsg(playerid, "Anda masih memiliki activity progress!");
    if(pData[playerid][pKayu] > 50) return ErrorMsg(playerid, "Anda tidak dapat membawa 50 kayu");
 	ShowProgressbar(playerid, "Memotong kayu..", 4);
	SetPlayerArmedWeapon(playerid, WEAPON_CHAINSAW);
	ApplyAnimation(playerid, "CHAINSAW", "WEAPON_csaw", 4.1, 1, 0, 0, 1, 0, 1);
	SetTimerEx("tukangkayu1", 5000, false, "d", playerid);
    Inventory_Update(playerid);
	return 1;
}


