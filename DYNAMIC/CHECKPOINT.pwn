#define MAX_CEPE 300

enum    E_Cepe
{
	// loaded from db
	Float: CepeX,
	Float: CepeY,
	Float: CepeZ,
	CepeInt,
	CepeWorld,
	// temp
	CepePickup,
	Text3D: CepeLabel,
	CepeMap
}

new CepeData[MAX_CEPE][E_Cepe],
	Iterator:Cepes<MAX_CEPE>;

function LoadCepe()
{
	new rows;
	cache_get_row_count(rows);
	if(rows)
  	{
 		new id, i = 0;
		while(i < rows)
		{
		    cache_get_value_name_int(i, "id", id);
			cache_get_value_name_float(i, "posx", CepeData[id][CepeX]);
			cache_get_value_name_float(i, "posy", CepeData[id][CepeY]);
			cache_get_value_name_float(i, "posz", CepeData[id][CepeZ]);
			cache_get_value_name_int(i, "interior", CepeData[id][CepeInt]);
			cache_get_value_name_int(i, "world", CepeData[id][CepeWorld]);
			CepeData[id][CepePickup] = CreateDynamicObject(1317, CepeData[id][CepeX], CepeData[id][CepeY], CepeData[id][CepeZ] -1.0, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
			SetDynamicObjectMaterial(CepeData[id][CepePickup], 0, -1, "none", "none", 0x49EE4FFF);
			Iter_Add(Cepes, id);
	    	i++;
		}
		printf("[Cepe]: %d Loaded.", i);
	}
}

Cepe_Save(id)
{
	new cQuery[512];
	format(cQuery, sizeof(cQuery), "UPDATE checkpoint SET posx='%f', posy='%f', posz='%f', interior=%d, world=%d WHERE id=%d",
	CepeData[id][CepeX],
	CepeData[id][CepeY],
	CepeData[id][CepeZ],
	CepeData[id][CepeInt],
	CepeData[id][CepeWorld],
	id
	);
	return mysql_tquery(g_SQL, cQuery);
}

CMD:createcepe(playerid, params[])
{
	if(pData[playerid][pAdmin] < 4)
		if(pData[playerid][pServerModerator] < 1)
			return ErrorMsg(playerid, "Anda tidak bisa akses perintah ini!");

	new id = Iter_Free(Cepes), query[512];
	if(id == -1) return ErrorMsg(playerid, "Can't add any more Cepe Point.");
 	new Float: x, Float: y, Float: z;
 	GetPlayerPos(playerid, x, y, z);
	CepeData[id][CepeX] = x;
	CepeData[id][CepeY] = y;
	CepeData[id][CepeZ] = z;
	CepeData[id][CepeInt] = GetPlayerInterior(playerid);
	CepeData[id][CepeWorld] = GetPlayerVirtualWorld(playerid);

	CepeData[id][CepePickup] = CreateDynamicObject(1317, CepeData[id][CepeX], CepeData[id][CepeY], CepeData[id][CepeZ] -1.0, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(CepeData[id][CepePickup], 0, -1, "none", "none", 0xFF00FFFF);
	Iter_Add(Cepes, id);

    mysql_format(g_SQL, query, sizeof(query), "INSERT INTO checkpoint SET id=%d, posx='%f', posy='%f', posz='%f', interior=%d, world=%d", id, CepeData[id][CepeX], CepeData[id][CepeY], CepeData[id][CepeZ], GetPlayerInterior(playerid), GetPlayerVirtualWorld(playerid));
	mysql_tquery(g_SQL, query, "OnCepeCreated", "ii", playerid, id);
	return 1;
}

function OnCepeCreated(playerid, id)
{
	Cepe_Save(id);
	Servers(playerid, "You has created Cepe Kota id: %d.", id);
	new str[150];
	format(str,sizeof(str),"[Cepe]: %s membuat Cepe kota id %d!", GetRPName(playerid), id);
	LogServer("Admin", str);
	return 1;
}

CMD:removecepe(playerid, params[])
{
    if(pData[playerid][pAdmin] < 4)
		if(pData[playerid][pServerModerator] < 1)
			return ErrorMsg(playerid, "Anda tidak bisa akses perintah ini!");

	new id, query[512];
	if(sscanf(params, "i", id)) return SyntaxMsg(playerid, "/removecepe [id]");
	if(!Iter_Contains(Cepes, id)) return ErrorMsg(playerid, "Invalid ID.");

	DestroyDynamic3DTextLabel(CepeData[id][CepeLabel]);
	DestroyDynamicObject(CepeData[id][CepePickup]);
	DestroyDynamicMapIcon(CepeData[id][CepeMap]);

	CepeData[id][CepeX] = CepeData[id][CepeY] = CepeData[id][CepeZ] = 0.0;
	CepeData[id][CepeInt] = CepeData[id][CepeWorld] = 0;
	CepeData[id][CepePickup] = -1;
	CepeData[id][CepeLabel] = Text3D: -1;
	Iter_Remove(Cepes, id);

	mysql_format(g_SQL, query, sizeof(query), "DELETE FROM checkpoint WHERE id=%d", id);
	mysql_tquery(g_SQL, query);
	Servers(playerid, "Menghapus ID Cepe Point %d.", id);
	new str[150];
	format(str,sizeof(str),"[Garkot]: %s menghapus garkot id %d!", GetRPName(playerid), id);
	LogServer("Admin", str);
	return 1;
}

CMD:gotocepe(playerid, params[])
{
	new id;
	if(pData[playerid][pAdmin] < 4)
		if(pData[playerid][pServerModerator] < 1)
			return ErrorMsg(playerid, "Anda tidak bisa akses perintah ini!");

	if(sscanf(params, "d", id))
		return SyntaxMsg(playerid, "/gotocepe [id]");
	if(!Iter_Contains(Cepes, id)) return ErrorMsg(playerid, "Cepe Point ID tidak ada.");

	SetPlayerPosition(playerid, CepeData[id][CepeX], CepeData[id][CepeY], CepeData[id][CepeZ], 2.0);
    SetPlayerInterior(playerid, CepeData[id][CepeInt]);
    SetPlayerVirtualWorld(playerid, CepeData[id][CepeWorld]);
	pData[playerid][pInDoor] = -1;
	pData[playerid][pInHouse] = -1;
	pData[playerid][pInBiz] = -1;
	pData[playerid][pInFamily] = -1;
	Servers(playerid, "Teleport ke ID Cepe Point %d", id);
	return 1;
}

