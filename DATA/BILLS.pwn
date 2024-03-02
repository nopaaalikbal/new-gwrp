#define MAX_BILLS 4500

enum billing
{
    bilType,
    bilName[230],
    bilTarget,
    bilammount
}

new bilData[MAX_BILLS][billing],
    Iterator:tagihan<MAX_BILLS>;

function LoadBill()
{
    new rows = cache_num_rows();
    if(rows)
    {
        new tagid;
        for(new i; i < rows; i++)
        {
            cache_get_value_name_int(i, "bid", tagid);
            cache_get_value_name_int(i, "type", bilData[tagid][bilType]);
            cache_get_value_name(i, "name", bilData[tagid][bilName], 230);
            cache_get_value_name_int(i, "target", bilData[tagid][bilTarget]);
            cache_get_value_name_int(i, "ammount", bilData[tagid][bilammount]);

            Iter_Add(tagihan, tagid);
        }
        printf("[BILL] Number of billing loaded: %d", rows);
    }
    if(!rows)
    {
        print("Nothing billing Loaded");
    }
}

CMD:invoiceden(playerid)
{
    new header[256], count = 0;
    new bool:status = false;
    format(header, sizeof(header), "No.\tNama Tagihan\tJumlah\n");
    foreach(new i: tagihan)
    {
        if(i != -1)
        {
            if(bilData[i][bilTarget] == pData[playerid][pID])
            {
                format(header, sizeof(header), "%s%d.\t%s\t{00ff00}%s\n", header, count, bilData[i][bilName], FormatMoney(bilData[i][bilammount]));
                count++;
                status = true;
            }
        }
    }
    if(status)
    {
        ShowPlayerDialog(playerid, DIALOG_PAYBILL, DIALOG_STYLE_TABLIST_HEADERS, "Tagihan Saya", header, "Okay", "Exit");
    }
    else
    {
        ErrorMsg(playerid, "Kamu tidak punya tagihan");
    }

    return 1;
}
