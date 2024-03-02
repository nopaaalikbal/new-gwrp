//======== Bus ===========
enum E_BUS
{
    STREAMER_TAG_MAP_ICON:BusMap,
	STREAMER_TAG_CP:BusCp,
	STREAMER_TAG_MAP_ICON:BusMapBaru,
	STREAMER_TAG_CP:BusCpBaru
}
new BusArea[MAX_PLAYERS][E_BUS];

DeleteBusCP(playerid)
{
	if(IsValidDynamicCP(BusArea[playerid][BusCp]))
	{
		DestroyDynamicCP(BusArea[playerid][BusCp]);
		BusArea[playerid][BusCp] = STREAMER_TAG_CP: -1;
	}
	if(IsValidDynamicMapIcon(BusArea[playerid][BusMap]))
	{
		DestroyDynamicMapIcon(BusArea[playerid][BusMap]);
		BusArea[playerid][BusMap] = STREAMER_TAG_MAP_ICON: -1;
	}
	if(IsValidDynamicCP(BusArea[playerid][BusCpBaru]))
	{
		DestroyDynamicCP(BusArea[playerid][BusCpBaru]);
		BusArea[playerid][BusCpBaru] = STREAMER_TAG_CP: -1;
	}
	if(IsValidDynamicMapIcon(BusArea[playerid][BusMapBaru]))
	{
		DestroyDynamicMapIcon(BusArea[playerid][BusMapBaru]);
		BusArea[playerid][BusMapBaru] = STREAMER_TAG_MAP_ICON: -1;
	}
}

RefreshJobBus(playerid)
{
	DeleteBusCP(playerid);

	if(pData[playerid][pJob] == 1)
	{
		BusArea[playerid][BusCp] = CreateDynamicCP(1280.061767,-2059.221923,59.007038, 2.0, -1, -1, playerid, 30.0);
		BusArea[playerid][BusMap] = CreateDynamicMapIcon(1280.061767,-2059.221923,59.007038, 61, 0, -1, -1, playerid, 99999.0, MAPICON_GLOBAL);//rute 
		BusArea[playerid][BusCpBaru] = CreateDynamicCP(2118.415283,-1920.911254,13.606877, 2.0, -1, -1, playerid, 30.0);
		BusArea[playerid][BusMapBaru] = CreateDynamicMapIcon(2118.415283,-1920.911254,13.606877, 61, 0, -1, -1, playerid, 99999.0, MAPICON_GLOBAL);// rute 
	}
	return 1;
}

#define buspoint1 		1280.061767,-2059.221923,59.007038
#define buspoint2 		1406.055297,-2042.139648,54.090114
#define buspoint3 		1388.694702,-1967.259033,36.970306
#define buspoint4 		1274.351928,-1944.078491,29.449188
#define buspoint5 		1314.175903,-1915.889160,23.581806
#define buspoint6 		1428.827514,-1898.697509,13.864680
#define buspoint7 		1486.388183,-1874.732299,13.483360
#define buspoint8 		1527.490722,-1922.029785,15.756288
#define buspoint9 		1529.773315,-2037.733764,30.656585
#define buspoint10 		1611.311889,-2151.531005,26.838613
#define buspoint11 		1789.403564,-2168.911621,13.483464
#define buspoint12 		1935.325927,-2169.052978,13.483065
#define buspoint13 		1964.242919,-2070.636230,13.494494
#define buspoint14 		1964.018798,-1907.571533,13.483125
#define buspoint15 		1965.075073,-1779.868530,13.479113
#define buspoint16 		2060.129394,-1755.007446,13.488880
#define buspoint17 		2160.542480,-1755.085693,13.485799
#define buspoint18 		2198.407714,-1732.569335,13.494822
#define buspoint19 		2216.002197,-1875.839477,13.483457
#define buspoint20 		2216.152343,-2013.465087,13.449681
#define buspoint21 		2339.216552,-2139.990478,15.328786
#define buspoint22 		2464.309570,-2264.988769,25.163112
#define buspoint23 		2563.019287,-2363.141357,15.987734
#define buspoint24 		2670.505859,-2407.984619,13.555817
#define buspoint25 		2758.318359,-2430.743164,13.597185
#define buspoint26 		2763.975097,-2479.834228,13.575368
#define buspoint27 		2659.496582,-2501.279052,13.589831
#define buspoint28		2532.097412,-2501.937988,13.636500
#define buspoint29		2482.001953,-2577.090576,13.606858
#define buspoint30		2409.167968,-2660.492431,13.627305
#define buspoint31		2257.277099,-2661.927734,13.542902
#define buspoint32 		2227.485107,-2538.904296,13.509632
#define buspoint33 		2187.636474,-2492.173828,13.477516
#define buspoint34 		2158.403320,-2569.258544,13.475986
#define buspoint35 		2085.054687,-2665.911376,13.479298
#define buspoint36		1917.729125,-2668.174560,6.034108
#define buspoint37 		1783.769409,-2669.453857,5.979684
#define buspoint38 		1638.428466,-2669.250488,5.967841
#define buspoint39 		1472.686035,-2669.243164,11.927350
#define buspoint40 		1350.609497,-2578.896972,13.475920
#define buspoint41		1348.375732,-2405.036865,13.475702
#define buspoint42 		1361.083129,-2297.251708,13.486678
#define buspoint43 		1470.698364,-2334.642333,13.482721
#define buspoint44 		1559.332519,-2289.056396,13.486524
#define buspoint45 		1661.341674,-2321.407958,13.483482
#define buspoint46 		1735.662109,-2282.550292,13.475940
#define buspoint47 		1697.473754,-2250.877929,13.482275
#define buspoint48		1562.058715,-2283.249267,13.483885
#define buspoint49 		1473.046752,-2237.903320,13.483382
#define buspoint50 		1394.131225,-2282.712158,13.460983
#define buspoint51  	1325.282470,-2386.672119,13.475554
#define buspoint52 		1261.956054,-2444.065429,8.715504
#define buspoint53 		1149.169677,-2391.894531,11.152619
#define buspoint54      1042.016845,-2242.414794,13.042969
#define buspoint55		1051.437133,-2061.033691,13.037005
#define buspoint56      1060.096801,-1859.927856,13.488168
#define buspoint57      1164.005981,-1854.715087,13.497838
#define buspoint58      1235.685913,-1855.510986,13.481544//stop ke 3
#define buspoint59      1356.235473,-1867.938354,13.483355
#define buspoint60      1423.378295,-1903.542480,13.874370
#define buspoint61      1303.339843,-1907.860839,24.613706
#define buspoint62      1307.518798,-1958.998779,29.257463
#define buspoint63  	1426.418212,-1996.640136,50.198066
#define buspoint64      1295.822021,-2053.925292,58.574115
#define buspoint65      1260.515625,-2015.804565,59.541069
#define cpbus1 			2094.261474,-1891.929687,12.942075
#define cpbus2 			2073.602783,-1929.571777,12.911071
#define cpbus3 			1909.409545,-1929.344238,12.945344//stop 1
#define cpbus4 			1824.199584,-1915.408813,12.946771
#define cpbus5 		 	1824.763671,-1795.390869,12.948184
#define cpbus6 			1825.054931,-1665.261474,12.955155//stop 2
#define cpbus7 			1870.526000,-1615.226928,12.946949
#define cpbus8 			1939.025512,-1647.727661,12.945476
#define cpbus9 			1971.842041,-1755.290161,12.946095
#define cpbus10         2082.242187,-1777.502929,12.955197//stop 3
#define cpbus11         2078.640136,-1881.102661,12.890936
#define cpbus12         2117.376953,-1918.438720,13.170484
// rute a
#define abuspoint1 		1796.999267,-1930.377319,13.387498
#define abuspoint2 		1818.981933,-1877.758422,13.397062
#define abuspoint3 		1781.176757,-1828.506713,13.382812
#define abuspoint4 		1690.289550,-1822.933105,13.382812
#define abuspoint5 		1624.370849,-1871.885986,13.382812
#define abuspoint6 		1508.755981,-1872.999023,13.382812
#define abuspoint7 		1378.036621,-1869.651489,13.382812
#define abuspoint8 		1233.421142,-1826.628662,13.410322 //rute a menunggu
#define abuspoint9 		1059.197387,-1869.703857,13.295679
#define abuspoint10 		1049.975463,-2052.742431,12.959084
#define abuspoint11 		1043.097778,-2251.219482,12.928205
#define abuspoint12 		1167.533203,-2406.778320,10.542358
#define abuspoint13 		1287.208007,-2447.129638,7.944396
#define abuspoint14 		1320.061767,-2394.107421,13.375000					//rute a bus selesai
#define abuspoint16 		1426.862426,-2286.196289,13.382812
#define abuspoint17 		1554.446533,-2283.566406,13.382812
#define abuspoint18 		1664.885498,-2250.255615,13.363609 // rute a menunggu 
#define abuspoint19 		1717.887695,-2319.040527,13.382812
#define abuspoint20 		1575.692016,-2299.910888,13.324309
#define abuspoint21 		1490.289672,-2198.633544,13.375000
#define abuspoint22 		1704.305419,-2191.867431,13.375000
#define abuspoint23 		1812.333251,-2161.033447,13.546875
#define abuspoint24 		1830.893188,-2057.628906,13.382812
#define abuspoint25 		1953.062133,-2047.861694,13.382812
#define abuspoint26 		1957.487670,-1977.764892,13.390586 //rute a menunggu 
#define abuspoint27 		1879.535400,-1933.909423,13.382812
#define abuspoint28 		1812.423583,-1895.253295,13.578125
#define abuspoint29 		1801.523193,-1928.831909,13.388253



// rute b 
#define bbuspoint1 		1965.075073,-1779.868530,13.479113
#define bbuspoint2 		2060.129394,-1755.007446,13.488880
#define bbuspoint3 		2160.542480,-1755.085693,13.485799
#define bbuspoint4 		2198.407714,-1732.569335,13.494822
#define bbuspoint5 		2216.002197,-1875.839477,13.483457
#define bbuspoint6 		2216.152343,-2013.465087,13.449681
#define bbuspoint7 		2339.216552,-2139.990478,15.328786
#define bbuspoint8 		2464.309570,-2264.988769,25.163112
#define bbuspoint9 		2563.019287,-2363.141357,15.987734
#define bbuspoint10 		2670.505859,-2407.984619,13.555817
#define bbuspoint11 		2758.318359,-2430.743164,13.597185
#define bbuspoint12 		2763.975097,-2479.834228,13.575368
#define bbuspoint13 		2659.496582,-2501.279052,13.589831
#define bbuspoint14		2532.097412,-2501.937988,13.636500
#define bbuspoint15		2482.001953,-2577.090576,13.606858
