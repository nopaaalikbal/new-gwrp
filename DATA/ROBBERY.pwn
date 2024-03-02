CMD:carsteal(playerid, params[])
{
	if(pData[playerid][pFamily] == -1)
        return ErrorMsg(playerid, "Anda bukan anggota keluarga!");
	if(pData[playerid][pLinggis] < 1)
	{
	UpdateDynamic3DTextLabelText(teksrob[playerid], COLOR_WHITE, "{D2D2AB}Gangster: {FFFFFF}Kau tidak memiliki Linggis, ingin membelinya dariku?");
	ShowPlayerDialog(playerid, DIALOG_LINGGIS, DIALOG_STYLE_TABLIST_HEADERS, "Warga Indo - Carsteal Shop", "Nama\tHarga\nLinggis\t"LG_E"$500", "Pilih", "Batal");
	}
	else
	{
	UpdateDynamic3DTextLabelText(teksrob[playerid], COLOR_WHITE, "{D2D2AB}Gangster: {FFFFFF}Baik, tolong dengarkan! Sebuah {7fffd4}Remington {ffffff}sedang diparkirkan di sekitar {FFFF00}Willowfield.\n{ffffff}Ambil dan bawalah kemari, kau punya waktu selama 15 menit.Waspadalah terhadap polisi!\n{FFFF00}CMD:{FFFFFF}/csinfo");
	}
	return 1;
}
function gajadibeli(playerid)
{
	UpdateDynamic3DTextLabelText(teksrob[playerid], COLOR_WHITE, "{D2D2AB}Gangster: {FFFFFF}Baiklah, datanglah kemari lagi jika kau berubah pikiran.");
	SetTimerEx("kembalisepertiawal", 6000, false, "d", playerid);
	return 1;
}
function uanggacukup(playerid)
{
	UpdateDynamic3DTextLabelText(teksrob[playerid], COLOR_WHITE, "{D2D2AB}Gangster: {FFFFFF}Bagaimana mungkin kau ingin membeli alat itu jika uangmu sendiri tidak mencukupi?");
	SetTimerEx("kembalisepertiawal", 6000, false, "d", playerid);
	return 1;
}
function kembalisepertiawal(playerid)
{
	UpdateDynamic3DTextLabelText(teksrob[playerid], COLOR_WHITE, "{D2D2AB}Gangster: {FFFFFF}Apa kau ingin melakukan tugas dariku?\nJika kau berani melakukannya maka akan kuberi bayaran yang setimpal.\n{FFFF00}CMD:{FFFFFF}/carsteal");
	return 1;
}


