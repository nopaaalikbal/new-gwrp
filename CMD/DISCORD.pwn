forward DCC_DM(str[]);
public DCC_DM(str[])
{
    new DCC_Channel:PM;
	PM = DCC_GetCreatedPrivateChannel();
	DCC_SendChannelMessage(PM, str);
	return 1;
}
forward CheckPIN(Nama_UCP[]);
public CheckPIN(Nama_UCP[])
{
	new rows = cache_num_rows(), ucp[200], dc[8000], pin, ID[210];
	if(rows > 0) 
	{
		cache_get_value_name(0, "ucp", ucp);
		cache_get_value_name_int(0, "verifycode", pin);
		cache_get_value_name(0, "DiscordID", ID);

		format(dc, sizeof(dc),  "**USER PIN:**\n**UCP: %s\nPIN: %d\nID Discord: <@%s>**", ucp, pin, ID);
		return DCC_SendChannelMessage(g_cekpin, dc);
	}
	else 
	{
		DCC_SendChannelMessage(g_cekpin, "```UCP Not Verified In Database!```");
	}
	return 1;
}
forward DCC_DM_EMBED(str[], pin, id[]);
public DCC_DM_EMBED(str[], pin, id[])
{
    new DCC_Channel:PM, query[200];
	PM = DCC_GetCreatedPrivateChannel();

	new DCC_Embed:embed = DCC_CreateEmbed(.title="Greenwich Roleplay", .image_url="https://media.discordapp.net/attachments/1168435654980534342/1190208064322797618/20231229_152106.png?ex=65cf1b23&is=65bca623&hm=3efe5bc22200585f4f2e7563797fcaa23a4f1a1d4e72ce630d087476907387e1&=&format=webp&quality=lossless&width=473&height=473");
	new str1[100], str2[100];

	format(str1, sizeof str1, "```\nWhatsup!!\nYou're UCP Succes To Verified,\nUse This PIN To Login At Greenwich City```");
	DCC_SetEmbedDescription(embed, str1);
	format(str1, sizeof str1, "UCP");
	format(str2, sizeof str2, "\n```%s```", str);
	DCC_AddEmbedField(embed, str1, str2, bool:1);
	format(str1, sizeof str1, "PIN");
	format(str2, sizeof str2, "\n```%d```", pin);
	DCC_AddEmbedField(embed, str1, str2, bool:1);

	DCC_SendChannelEmbedMessage(PM, embed);

	mysql_format(g_SQL, query, sizeof query, "INSERT INTO `playerucp` (`ucp`, `verifycode`, `DiscordID`) VALUES ('%e', '%d', '%e')", str, pin, id);
	mysql_tquery(g_SQL, query);
	return 1;
}



forward CheckDiscordUCP(DiscordID[], Nama_UCP[]);
public CheckDiscordUCP(DiscordID[], Nama_UCP[])
{
	new rows = cache_num_rows();
	new DCC_Role: WARGA, DCC_Guild: guild, DCC_User: user, dc[100];
	new verifycode = RandomEx(1111111, 9888888);
	if(rows > 0)
	{
		return SendDiscordMessage(7,"```[ERROR] Nama UCP account tersebut sudah terdaftar, silahkan ganti dengan nama lain!```");
	}
	else
	{
		new ns[32];
		guild = DCC_FindGuildById("1086881963010441298");
		WARGA = DCC_FindRoleById("1086881963052380207");
		user = DCC_FindUserById(DiscordID);
		format(ns, sizeof(ns), "Civil | %s ", Nama_UCP);
		DCC_SetGuildMemberNickname(guild, user, ns);
		DCC_AddGuildMemberRole(guild, user, WARGA);
		SendDiscordMessage(7, "```[SUCCESS] UCP Succes To Verified, Check Message From Greenwich Bot.```");
		format(dc, sizeof(dc),  "```\n[UCP]: %s is now Verified.```", Nama_UCP);
		SendDiscordMessage(7, dc);
		DCC_CreatePrivateChannel(user, "DCC_DM_EMBED", "sds", Nama_UCP, verifycode, DiscordID);
	}
	return 1;
}

forward CheckDiscordID(DiscordID[], Nama_UCP[]);
public CheckDiscordID(DiscordID[], Nama_UCP[])
{
	new rows = cache_num_rows(), ucp[20], dc[100];
	if(rows > 0)
	{
		cache_get_value_name(0, "ucp", ucp);

		format(dc, sizeof(dc),  "```\n[INFO]: Kamu sudah mendaftar UCP sebelumnya dengan nama %s```", ucp);
		return SendDiscordMessage(7, dc);
	}
	else
	{
		new characterQuery[178];
		mysql_format(g_SQL, characterQuery, sizeof(characterQuery), "SELECT * FROM `playerucp` WHERE `ucp` = '%s'", Nama_UCP);
		mysql_tquery(g_SQL, characterQuery, "CheckDiscordUCP", "ss", DiscordID, Nama_UCP);
	}
	return 1;
}

DCMD:reffucp(user, channel, params[])
{
	new id[21];
    if(channel != DCC_FindChannelById("1206645941801590784"))
		return 1;
    if(isnull(params))
		return DCC_SendChannelMessage(channel, "```\n[USAGE]: !reffucp [ucp name]```");
	if(!IsValidNameUCP(params))
		return DCC_SendChannelMessage(channel, "```\nGunakan nama UCP bukan nama IC!```");
//	DCC_SendChannelMessage(channel, "**Accept Silahkan Cek PM Bot Discord HamZyy!**);

	DCC_GetUserId(user, id, sizeof id);
	new uname[33];
	DCC_GetUserName(user, uname);

	DCC_SendChannelMessage(channel, "Perintah berhasil disubmit, mohon tunggu hasil pemeriksaan dari kami!");
	new zQuery[256];
	mysql_format(g_SQL, zQuery, sizeof(zQuery), "SELECT * FROM `playerucp` WHERE `discordID` = '%e' LIMIT 1", id);
	new Cache:ex = mysql_query(g_SQL, zQuery, true);
	new count = cache_num_rows();
	if(count > 0)
	{
		new str[256];
		format(str, sizeof(str), "***[ERROR] Hai %s, anda sudah pernah mendaftar dan tidak bisa lagi mengambil Karcis.Silahkan ke channel <#1095732559897444394> untuk refund role dan di cek oleh staff!***", uname);
		DCC_SendChannelMessage(channel, str);
	}
	else
	{
    	new characterQuery[178];
		mysql_format(g_SQL, characterQuery, sizeof(characterQuery), "SELECT * FROM `playerucp` WHERE `DiscordID` = '%s'", id);
		mysql_tquery(g_SQL, characterQuery, "CheckDiscordID", "ss", id, params);
		DCC_SendChannelMessage(channel, "```Ucp anda berhasil diverifikasi,silahkan cek pm dari Greenwich Bot!```");
	}
    cache_delete(ex);
	return 1;
}
DCMD:gwrppin(user, channel, params[])
{
    if(channel != DCC_FindChannelById("1207709539198308392"))
		return DCC_SendChannelMessage(channel, "Ke Channel <#1185287016414461992> Dek!");
    if(isnull(params)) 
		return DCC_SendChannelMessage(channel, "```[EXMP] !gwrppin [UCP]```");

	new characterQuery[1780];
	mysql_format(g_SQL, characterQuery, sizeof(characterQuery), "SELECT * FROM `playerucp` WHERE `ucp` = '%s'", params);
	mysql_tquery(g_SQL, characterQuery, "CheckPIN", "s", params);
	return 1;
}

DCMD:online(user, channel, params[])
{
    if(channel != DCC_FindChannelById("1090642592250740746"))
		return 1;
	new DCC_Embed:msgEmbed, msgField[256];
	format(msgField, sizeof(msgField), " **Player Online In Greenwich City : %s/50**", number_format(Iter_Count(Player)));
	msgEmbed = DCC_CreateEmbed("", msgField, "", "", 0x00ff00, "Greenwich Roleplay | #HijauBersamaGWRP", "", "", "");
	DCC_SendChannelEmbedMessage(channel, msgEmbed);
	return 1;
}
DCMD:ucp(user, channel, params[])
{
	new id[21];
    if(channel != DCC_FindChannelById("1086881965464100870"))
		return 1;
    if(isnull(params))
		return DCC_SendChannelMessage(channel, "```\n[USE]: !ucp [NAMA UCP]```");
	if(!IsValidNameUCP(params))
		return DCC_SendChannelMessage(channel, "```\n[ERROR] Gunakan nama UCP bukan nama IC!```");
	//DCC_SendChannelMessage(channel, "```\n[SUCCESS] Silahkan Cek PM Bot Greenwich!```");

	DCC_GetUserId(user, id, sizeof id);
	new uname[33];
	DCC_GetUserName(user, uname);

	new zQuery[256];
	mysql_format(g_SQL, zQuery, sizeof(zQuery), "SELECT * FROM `playerucp` WHERE `discordID` = '%e' LIMIT 1", id);
	new Cache:ex = mysql_query(g_SQL, zQuery, true);
	new count = cache_num_rows();
	if(count > 0)
	{
		new str[256];
		format(str, sizeof(str), "***[ERROR]*** **Hai %s, Anda sudah pernah mendaftar dan tidak bisa lagi mengambil karcis**", uname);
		DCC_SendChannelMessage(channel, str);
	}
	else
	{
    	new characterQuery[178];
		mysql_format(g_SQL, characterQuery, sizeof(characterQuery), "SELECT * FROM `playerucp` WHERE `DiscordID` = '%s'", id);
		mysql_tquery(g_SQL, characterQuery, "CheckDiscordID", "ss", id, params);
	}
    cache_delete(ex);
	return 1;
}
DCMD:pengumuman(user, channel, params[])
{
    if(channel != DCC_FindChannelById("1090642592250740746"))
		return 1;

	new DCC_Channel:Info;
   	Info = DCC_FindChannelById("1090642592250740746");
	if(isnull(params)) return DCC_SendChannelMessage(channel, "```USE : !pengumuman [Text]```");

    new str[5000];
	format(str, sizeof(str), "%s", params);
	DCC_SendChannelMessage(Info, str);
	DCC_SendChannelMessage(channel, "```Pengumuman anda berhasil dikirimkan oleh Greenwich Bot!```");
	return 1;
}


DCMD:admins(user, channel, params[])
{
	new count = 0, line3[1200];
	foreach(new i:Player)
	{
		if(pData[i][pAdmin] > 0 || pData[i][pHelper] > 0)
		{
			format(line3, sizeof(line3), "%s\n%s(%s)\n", line3, pData[i][pName], pData[i][pAdminname], GetStaffRank(i));
			count++;
		}
	}
	if(count > 0)
	{
		new DCC_Embed:msgEmbed, msgField[256];
		format(msgField, sizeof(msgField), "```%s```", line3);
		msgEmbed = DCC_CreateEmbed("", "", "", "", 0x00ff00, "Admin online list", "", "", "");
		DCC_AddEmbedField(msgEmbed, "Admin Online In Greenwich", msgField);
		DCC_SendChannelEmbedMessage(channel, msgEmbed);
	}
	else return DCC_SendChannelMessage(channel, "Tidak ada administrator di kota!");
	return 1;
}

DCMD:pesan(user, channel, params[])
{
    if(channel != DCC_FindChannelById("1090642592250740746"))
		return 1;
	new string[256];

	if(isnull(params)) return DCC_SendChannelMessage(channel, "/pesan [text]");
	format(string, sizeof(string), "{ffffff}[Discord] : %s ", params);
	SendClientMessageToAll(COLOR_YELLOW, string);
	DCC_SendChannelMessage(channel, "```Pesan anda berhasil dikirim ke dalam kota oleh Greenwich Bot!```");
	return 1;
}

DCMD:ip(user, channel, params[])
{
    new DCC_Embed:msgEmbed, msgField[256];
	format(msgField, sizeof(msgField), "**Greenwich Roleplay IP Address**\n```Portal Gate 1```\n```204.10.192.68:7008```\n```144.76.57.59:27150```");
	msgEmbed = DCC_CreateEmbed("", msgField, "", "", 0x00ff00, "Greenwich Roleplay || #HijauBersamaGWRP", "", "", "");
	DCC_SendChannelEmbedMessage(channel, msgEmbed);
	return 1;
}

DCMD:players(user, channel, params[])
{
	foreach(new i : Player)
	{
		new DCC_Embed:embed = DCC_CreateEmbed(.title = "Greenwich City");
		new str1[100], str2[100], name[MAX_PLAYER_NAME+1];
		GetPlayerName(i, name, sizeof(name));

		format(str1, sizeof str1, "**NAME SERVER**");
		format(str2, sizeof str2, "\nGreenwich Roleplay");
		DCC_AddEmbedField(embed, str1, str2, false);
		format(str1, sizeof str1, "**WEBSITE**");
		format(str2, sizeof str2, "\nhttps://discord.gg/Greenwich");
		DCC_AddEmbedField(embed, str1, str2, false);
		format(str1, sizeof str1, "**PLAYERS**");
		format(str2, sizeof str2, "\n%d Online", pemainic);
		DCC_AddEmbedField(embed, str1, str2, false);
		format(str1, sizeof str1, "**GAMEMODE**");
		format(str2, sizeof str2, "\nGreenwich v3");
		DCC_AddEmbedField(embed, str1, str2, false);
		format(str1, sizeof str1, "```__[ID]\tName\tLevel\tPing__\n```");
		format(str2, sizeof str2, "%i\t%s\t%i\t%i\n", i, name, GetPlayerScore(i), GetPlayerPing(i));
		DCC_AddEmbedField(embed, str1, str2, false);

		DCC_SendChannelEmbedMessage(channel, embed);
		return 1;
	}
	return 1;
}

DCMD:id(use, channel, params[])
{
	new otherid;
	new str[356];
	if(sscanf(params, "u", otherid))
	{
	    DCC_SendChannelMessage(channel, "USAGE: !id [Name Ic]");
 		return 1;
 	}
	//Servers(playerid, "Name: %s(ID: %d) | UCP Name: %s | Level: %d", pData[otherid][pName], otherid, pData[otherid][pUCP], pData[otherid][pLevel]);
	format(str, sizeof(str), "%sName: %s(ID: %d) | UCP Name: %s | Level: %d\n", str, pData[otherid][pName], otherid, pData[otherid][pUCP], pData[otherid][pLevel]);
	//format(str,sizeof(str),"Name: %s(ID: %d) | UCP Name: %s | Level: %d", pData[otherid][pName], otherid, pData[otherid][pUCP], pData[otherid][pLevel]);
	DCC_SendChannelMessage(channel, str);
	return 1;
}

DCMD:ann(user, channel, params[])
{
	if(channel != DCC_FindChannelById("1090642592250740746"))
		return 1;

	if(isnull(params)) return DCC_SendChannelMessage(channel, "```!ann [text]```");

	new str[512];
	format(str, sizeof(str), "~w~%s", params);
	GameTextForAll(str, 7000, 3);

	new msgAnn[256];
	format(msgAnn, sizeof(msgAnn), "`[GreenwichBOT]: '%s' Berhasil ditampilkan`", params);
	DCC_SendChannelMessage(channel, msgAnn);
	return 1;
}


DCMD:ojail(user, channel, params[])
{
    if(channel != DCC_FindChannelById("1090642592250740746"))
		return 1;
	new player[24], datez, tmp[50], PlayerName[MAX_PLAYER_NAME];
	if(sscanf(params, "s[24]ds[50]", player, datez, tmp))
		return DCC_SendChannelMessage(channel, "`USAGE: !ojail <name> <time in minutes> <reason>`");

	if(strlen(tmp) > 50) return DCC_SendChannelMessage(channel, "`[GreenwichBOT]: Reason must be shorter than 50 characters.`");
	if(datez < 1 || datez > 60) return DCC_SendChannelMessage(channel, "`[GreenwichBOT]: Jail time must remain between 1 and 60 minutes`");

	foreach(new ii : Player)
	{
		GetPlayerName(ii, PlayerName, MAX_PLAYER_NAME);

	    if(strfind(PlayerName, player, true) != -1)
		{
			DCC_SendChannelMessage(channel, "```[GreenwichBOT]: Player tersebut online, tidak bisa menggunakan command tersebut```");
	  		return 1;
	  	}
	}
	new query[512];
	mysql_format(g_SQL, query, sizeof(query), "SELECT reg_id FROM players WHERE username='%e'", player);
	mysql_tquery(g_SQL, query, "OJailPlayerDiscord", "ssi", player, tmp, datez);
	return 1;
}

function OJailPlayerDiscord(adminid, NameToJail[], jailReason[], jailTime, channel)
{
	if(cache_num_rows() < 1)
	{
		return Error(adminid, "Account {ffff00}'%s' "WHITE_E"does not exist.", NameToJail);
	}
	else
	{
	    new RegID, JailMinutes = jailTime * 60;
		cache_get_value_index_int(0, 0, RegID);
		SendClientMessageToAllEx(COLOR_RED, "Server: {ffff00}Admin %s telah menjail(offline) player %s selama %d menit. [Reason: %s]", pData[adminid][pAdminname], NameToJail, jailTime, jailReason);
		new str[150];
		format(str,sizeof(str),"Admin: %s memberi %s jail(offline) selama %d menit. Alasan: %s!", GetRPName(adminid), NameToJail, jailTime, jailReason);
		LogServer("Admin", str);
		new query[512];
		mysql_format(g_SQL, query, sizeof(query), "UPDATE players SET jail=%d WHERE reg_id=%d", JailMinutes, RegID);
		mysql_tquery(g_SQL, query);
	}
	return 1;
}/*

DCMD:setcs(user, channel, params[])
{
	if(channel != channelCS) return DCC_SendChannelMessage(channel, "`[NOPIXELBOT]: Error you are not part of the admin team`");
	new target, cs[5], string[256];
	if(sscanf(params, "us[5]", target, cs)) return DCC_SendChannelMessage(channel, "`[NOPIXELBOT]: Usage !setcs [PlayerName] [Yes/No]`");

	if(!strcmp(cs, "Yes", true))
	{
		if(!IsPlayerConnected(target)) return DCC_SendChannelMessage(channel, "```\n[NOPIXEL]: Error Player yang ingin anda atur sedang tidak ada di dalam kota, Silahkan gunakan \"/osetcs\"\n```");

		format(string, sizeof(string), "`[NOPIXELBOT]: Error akun dengan nama %s cs nya telah di atur Ke [ACCEPT]`", pData[target][pCs]);
		if(pData[target][pCs]) return DCC_SendChannelMessage(channel, string);

		pData[target][pCs] = 1;
		Servers(target, "Character Story Anda berhasil di atur | [ACCEPTED]");

		format(string, sizeof(string), "`[NOPIXELBOT]: Akun dengan nama %s Character Storynya Berhasil Diatur | [ACCEPTED]`", pData[target][pName]);
		DCC_SendChannelMessage(channel, string);
	}
	else if(!strcmp(cs, "No", true))
	{
		if(!IsPlayerConnected(target)) return DCC_SendChannelMessage(channel, "```\n[NOPIXEL]: Error Player yang ingin anda atur sedang tidak ada di dalam kota, Silahkan gunakan \"/osetcs\"\n```");

		format(string, sizeof(string), "`[NOPIXELBOT]: Error akun dengan nama %s cs nya telah di atur Ke [DENIED]`", pData[target][pCs]);
		if(!pData[target][pCs]) return DCC_SendChannelMessage(channel, string);

		pData[target][pCs] = 0;
		Servers(target, "Character Story Anda berhasil di atur | [DENIED]");

		format(string, sizeof(string), "`[NOPIXELBOT]: Akun dengan nama %s Character Storynya Berhasil Diatur | [DENIED]`", pData[target][pName]);
		DCC_SendChannelMessage(channel, string);
	}
	return 1;
}

DCMD:osetcs(user, channel, params[])
{
	if(channel != channelCS) return DCC_SendChannelMessage(channel, "`[NOPIXELBOT]: Error you are not part of the admin team`");
	new target, cs[5], string[256];
	if(sscanf(params, "ss[5]", target, cs)) return DCC_SendChannelMessage(channel, "`[NOPIXELBOT]: Usage !osetcs [PlayerName] [Yes/No]`");

	if(!strcmp(cs, "Yes", true))
	{
		if(IsPlayerConnected(target)) return DCC_SendChannelMessage(channel, "```\n[NOPIXEL]: Error Player yang ingin anda atur sedang berada di dalam kota, silahkan gunakan /setcs\n```");

		new query[256];
		mysql_format(g_SQL, query, sizeof query, "SELECT * FROM players WHERE username = '%s'", target);
		mysql_tquery(g_SQL, query, "CheckPlayerUserCs", "sd", target, 1);
	}
	else if(!strcmp(cs, "No", true))
	{
		if(IsPlayerConnected(target)) return DCC_SendChannelMessage(channel, "```\n[NOPIXEL]: Error Player yang ingin anda atur sedang berada di dalam kota, silahkan gunakan /setcs\n```");

		new query[256];
		mysql_format(g_SQL, query, sizeof query, "SELECT * FROM players WHERE username = '%s'", target);
		mysql_tquery(g_SQL, query, "CheckPlayerUserCs", "sd", target, 0);
	}
	return 1;
}


DCMD:sapdonline(user, channel, params[])
{
	if(channel != panelNOPIXEL) return DCC_SendChannelMessage(channel, "```[GREENWICH BOT]: Error you are not part of the admin team```");

	new duty[16], lstr[1024], count = 0;
	format(lstr, sizeof(lstr), "Name\tRank\tStatus\tDuty Time\n");
	foreach(new i: Player)
	{
		if(pData[i][pFaction] == 1)
		{
			switch(pData[i][pOnDuty])
			{
				case 0:
				{
					duty = "Off Duty";
				}
				case 1:
				{
					duty = "On Duty";
				}
			}
			format(lstr, sizeof(lstr), "%s%s(%d)\t%s(%d)\t%s\t%d detik", lstr, pData[i][pName], i, GetFactionRank(i), pData[i][pFactionRank], duty, pData[i][pOnDutyTime]);
			format(lstr, sizeof(lstr), "%s\n", lstr);
			count++;
		}
	}
	format(lstr, sizeof(lstr), "%s\n", lstr);

	if(count > 0)
	{
		new DCC_Embed:msgEmbed, msgField[1520];
		format(msgField, sizeof(msgField), "```\n%s\n```", lstr);
		msgEmbed = DCC_CreateEmbed("", "", "", "", 0x00ff00, "SAPD online list", "", "", "");
		DCC_AddEmbedField(msgEmbed, "SAPD Online In Server", msgField);
		DCC_SendChannelEmbedMessage(channel, msgEmbed);
	}
	else DCC_SendChannelMessage(channel, "`[GREENWICH BOT]: There are no sapd online`");
	return 1;
}

DCMD:samdonline(user, channel, params[])
{
	if(channel != panelNOPIXEL) return DCC_SendChannelMessage(channel, "`[GREENWICH BOT]: Error you are not part of the admin team`");

	new duty[16], lstr[1024], count = 0;
	format(lstr, sizeof(lstr), "Name\tRank\tStatus\tDuty Time\n");
	foreach(new i: Player)
	{
		if(pData[i][pFaction] == 3)
		{
			switch(pData[i][pOnDuty])
			{
				case 0:
				{
					duty = "Off Duty";
				}
				case 1:
				{
					duty = "On Duty";
				}
			}
			format(lstr, sizeof(lstr), "%s%s(%d)\t%s(%d)\t%s\t%d detik", lstr, pData[i][pName], i, GetFactionRank(i), pData[i][pFactionRank], duty, pData[i][pOnDutyTime]);
			format(lstr, sizeof(lstr), "%s\n", lstr);
			count++;
		}
	}
	format(lstr, sizeof(lstr), "%s\n", lstr);

	if(count > 0)
	{
		new DCC_Embed:msgEmbed, msgField[1520];
		format(msgField, sizeof(msgField), "```\n%s\n```", lstr);
		msgEmbed = DCC_CreateEmbed("", "", "", "", 0x00ff00, "SAMD online list", "", "", "");
		DCC_AddEmbedField(msgEmbed, "SAMD Online In Server", msgField);
		DCC_SendChannelEmbedMessage(channel, msgEmbed);
	}
	else DCC_SendChannelMessage(channel, "`[GREENWICH BOT]: There are no samd online`");

	return 1;
}*/


/*
DCMD:checkucp(user, channel, params[])
{
	if(channel != panelNOPIXEL) return DCC_SendChannelMessage(channel, "`[GREENWICH BOT]: Error you are not part of the admin team`");

	new nameUcp[24];
	if(sscanf(params, "s[24]", nameUcp)) return DCC_SendChannelMessage(channel, "`[GREENWICH BOT]: Usage !checkucp [UCP]`");

	new query[256];
	format(query, sizeof(query), "SELECT * FROM `playerucp` WHERE `uUserUCP` = '%s' LIMIT 1", nameUcp);
	mysql_tquery(g_SQL, query, "DiscordCheckCharUCP", "s", nameUcp);
	return 1;
}

DCMD:jumlahucp(user, channel, params[])
{
	if(channel != panelNOPIXEL) return DCC_SendChannelMessage(channel, "`[NOPIXELBOT]: Error you are not part of the admin team`");

	new registered_players, Cache:result = mysql_query(g_SQL, "SELECT COUNT(*) FROM `playerucp`");
	cache_get_value_int(0, 0, registered_players);

	new msg[256];
	format(msg, sizeof msg, "`[NOPIXELBOT]: Registered ucp account is %d accounts`", registered_players);
	DCC_SendChannelMessage(channel, msg);
	cache_delete(result);
	return 1;
}

DCMD:setucp(user, channel, params[])
{
	new DCC_Channel:channelSetUCP;
	channelSetUCP = DCC_FindChannelById("940852705251950642");

	if(channel != channelSetUCP) return DCC_SendChannelMessage(channel, "`[NOPIXELBOT]: Error you are not part of the admin team`");
	new getNameIC[256], getNameUCP[12];
	if(sscanf(params, "s[256]s[12]", getNameIC, getNameUCP)) return DCC_SendChannelMessage(channel, "`[NOPIXELBOT]: Usage !setucpuser [Name IC] [Name UCP]`");

	new setUCPQuery[178];
	mysql_format(g_SQL, setUCPQuery, sizeof setUCPQuery, "SELECT * FROM `playerucp` WHERE `uUserUcp` = '%s' LIMIT 1", getNameUCP);
	mysql_tquery(g_SQL, setUCPQuery, "CheckPlayerUCPex", "ss", getNameIC, getNameUCP);
	return 1;
}

DCMD:admins(user, channel, params[])
{
	new count = 0, line3[1200];
	foreach(new i:Player)
	{
		if(pData[i][pAdmin] > 0 || pData[i][pHelper] > 0)
		{
			format(line3, sizeof(line3), "%s\n%s(%s)\n", line3, pData[i][pName], pData[i][pAdminname], GetStaffRank(i));
			count++;
		}
	}
	if(count > 0)
	{
		new DCC_Embed:msgEmbed, msgField[256];
		format(msgField, sizeof(msgField), "```%s```", line3);
		msgEmbed = DCC_CreateEmbed("", "", "", "", 0x00ff00, "Admin online list", "", "", "");
		DCC_AddEmbedField(msgEmbed, "Admin Online In Server", msgField);
		DCC_SendChannelEmbedMessage(channel, msgEmbed);
	}
	else return DCC_SendChannelMessage(channel, "There are no admin online!");
	return 1;
}

DCMD:id(use, channel, params[])
{
	new otherid;
	new str[356];
	if(sscanf(params, "u", otherid))
	{
	    DCC_SendChannelMessage(channel, "USAGE: !id [ID/Name]");
 		return 1;
 	}
	//Servers(playerid, "Name: %s(ID: %d) | UCP Name: %s | Level: %d", pData[otherid][pName], otherid, pData[otherid][pUCP], pData[otherid][pLevel]);
	format(str, sizeof(str), "%sName: %s(ID: %d) | UCP Name: %s | Level: %d\n", str, pData[otherid][pName], otherid, pData[otherid][pUCP], pData[otherid][pLevel]);
	//format(str,sizeof(str),"Name: %s(ID: %d) | UCP Name: %s | Level: %d", pData[otherid][pName], otherid, pData[otherid][pUCP], pData[otherid][pLevel]);
	DCC_SendChannelMessage(channel, str);
	return 1;
}







DCMD:ans(user, channel, params[])
{
	if(channel != g_Discord_ReportAccept) return DCC_SendChannelMessage(channel, "`[NOPIXELBOT]: Kamu tidak bisa menggunakan cmd ini!`");

	new userName[DCC_NICKNAME_SIZE];
	DCC_GetUserName(user, userName, sizeof(userName));

	new to_player, message[256];
	if(sscanf(params, "us[256]", to_player, message)) return DCC_SendChannelMessage(channel, "`USAGE: !ans [ID] [Message]`");

	new fmt_str[128];

	format(fmt_str, sizeof fmt_str, "[DISCORD REPORT]\n {ffffff}From {ff0000}[%S]:{FFFFFF} %s", userName, message);
	SendClientMessage(to_player, 0xFFFF00FF, fmt_str);
	PlayerPlaySound(to_player, 1085, 0.0, 0.0, 0.0);

	new DCC_Embed:msgAnsReport, msgDescReport[256];
	format(msgDescReport, sizeof(msgDescReport), "Report Message Berhasil Dikirim Ke Player %s(%d)\nMessage Report: %s", pData[to_player][pName], to_player, message);
	msgAnsReport = DCC_CreateEmbed("[ REPORT ACCEPT ]", msgDescReport, "", "", 0x00ff00, "Report Send", "", "", "");
	DCC_SendChannelEmbedMessage(channel, msgAnsReport);

	SendStaffMessage(COLOR_RED, ""YELLOW_E"[REPORT DISCORD LOGS] [Msg: %s] | %s[%d]:{FFFFFF} | %s", userName, pData[to_player][pName], to_player, message);

	return 1;
}


