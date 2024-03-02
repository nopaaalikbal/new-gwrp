function olah1(playerid)
{
	ShowItemBox(playerid, "Marijuana", "Rechived_1x", 1578, 4);
	pData[playerid][pMarijuana] ++;
	pData[playerid][pKanabis] -= 2;
	return 1;
}

function ambil1(playerid)
{
	ShowItemBox(playerid, "Canabis", "Rechived_1x", 800, 4);
	pData[playerid][pKanabis] ++;
	return 1;
}
CMD:olahkanabis(playerid, params[])
{
	if(pData[playerid][pFamily] == -1)
        return ErrorMsg(playerid, "You'r Not Join Family!");
	if(pData[playerid][pKanabis] < 1) return ErrorMsg(playerid, "Anda Tidak memiliki kanabis");
	if(pData[playerid][pProgress] == 1) return ErrorMsg(playerid, "Anda Tidak masih memiliki activity");
	ShowProgressbar(playerid, "Proccessing Canabis", 15);
	ApplyAnimation(playerid,"INT_HOUSE","wash_up",4.0, 1, 0, 0, 0, 0,1);
	SetTimerEx("olah1", 10000, false, "d", playerid);
	return 1;
}

CMD:ambilkanabis(playerid, params[])
{
    new clientMessage[128];
	if(polisidikota < 3 && emsdikota < 2)
		return ErrorMsg(playerid, "Anda Tidak Dapat Mengambil Canabis, Membutuhkan 3 Police & 2 Medical");
	if(pData[playerid][pKanabis] > 15) return ErrorMsg(playerid, "You Cannot Plant More Than 15 Canabis");
	if(pData[playerid][pProgress] == 1) return ErrorMsg(playerid, "Anda Tidak masih memiliki activity");
	ShowProgressbar(playerid, "Plant Canabis", 10);
	ApplyAnimation(playerid,"INT_HOUSE","wash_up",4.0, 1, 0, 0, 0, 0,1);
	SetTimerEx("ambil1", 10000, false, "d", playerid);
    format(clientMessage,sizeof(clientMessage),"%s{ffffff} telah dilaporkan {FF0000}ada yang mencoba mengambil kanabis.", pData[playerid][pName]);
    SendFactionMessage(1, COLOR_YELLOW, clientMessage);
    if(pData[playerid][pFaction] == 1 || pData[playerid][pFaction] == 2 || pData[playerid][pFaction] == 3)
    {
        return Error(playerid, "Kamu Seorang Polisi, Tidak Dapat Mengambil!");
    }
	return 1;
}
