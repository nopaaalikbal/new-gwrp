

function robbank1(playerid)
{
	new dapatuang = RandomEx(2000,6000);
    GivePlayerMoneyEx(playerid, dapatuang);
    new str[500];
    format(str, sizeof(str), "Received_%dx", dapatuang);
	ShowItemBox(playerid, "Uang", str, 1212, 4);
	return 1;
}

CMD:robbank(playerid, params[])
{
	if(pData[playerid][pFamily] == -1)
        return ErrorMsg(playerid, "Anda bukan anggota keluarga!");
	if(pData[playerid][pLinggis] < 1) return ErrorMsg(playerid,"Anda tidak memiliki Linggis!.");
	ShowProgressbar(playerid, "Mengambil Uang..", 19);
	ApplyAnimation(playerid, "BOMBER","BOM_Plant_Loop",4.1, 1, 1, 1, 1, 1, 1);
	pData[playerid][pLinggis] --;
	SetTimerEx("robbank1", 5000, false, "d", playerid);
	new lstr[1024];
   	format(lstr, sizeof(lstr), "BERITA | PERAMPOKAN: {FFFFFF}Ada yang melakukan aksi rob bank Harap menjauh dari daerah rob bank!!");
    SendClientMessageToAll(COLOR_PINK2, lstr);
	ClearAnimations(playerid);
	Inventory_Update(playerid);
	return 1;
}