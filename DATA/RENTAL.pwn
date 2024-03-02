#define MAX_RENTVEH 20

CMD:rentbike(playerid)
{
    if(!IsPlayerInRangeOfPoint(playerid, 3.0, 2772.847900,-2398.968750,13.632812) && !IsPlayerInRangeOfPoint(playerid, 3.0, 1775.85,-1904.42,13.38) && !IsPlayerInRangeOfPoint(playerid, 3.0, 1686.63, -2261.61, 13.50))
        return ErrorMsg(playerid, "You Don't At Rent Bike Place!");
        
    new str[1024];
    format(str, sizeof(str), "Bike Type & Series\tRent Price\n"WHITE_E"TDR-3000\t"LG_E"$75\n{ffffff} Mountain Bike Aviator 2690 XT Steel\t"LG_E"$150\n{FFB6C1}> Select this to return a vehicle rented from the state");
                
    ShowPlayerDialog(playerid, DIALOG_RENT_BIKE, DIALOG_STYLE_TABLIST_HEADERS, "Greenwich - Rent Bike", str, "{27d23d}Rent", "{e31d1d}Close");
    return 1;
}    

CMD:rentboat(playerid, params)
{
    if(!IsPlayerInRangeOfPoint(playerid, 3.0, 213.6747, -1986.3925, 1.4154)) return Error(playerid, "Kamu tidak berada di dekat penyewaan Kapal!");

    new str[1024];
    format(str, sizeof(str), "Kendaraan\tHarga\n"WHITE_E"%s\t"LG_E"$750 / one days\n%s\t"LG_E"$1.250 / one days\n%s\t"LG_E"$1.500 / one days",
    GetVehicleModelName(473), 
    GetVehicleModelName(453),
    GetVehicleModelName(452));
           
    ShowPlayerDialog(playerid, DIALOG_RENT_BOAT, DIALOG_STYLE_TABLIST_HEADERS, "Rent Boat", str, "Rent", "Close");
    return 1;
}
