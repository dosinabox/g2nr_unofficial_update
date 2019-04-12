
var int EVT_OPEN_DOOR_LIBRARY_S1_OneTime;

func void evt_open_door_library_s1()
{
	if(EVT_OPEN_DOOR_LIBRARY_S1_OneTime == FALSE)
	{
		Snd_Play("DEM_Die");
		Wld_InsertNpc(Skeleton,"FP_ROAM_NW_KDF_LIBRARY_19");
		Wld_InsertNpc(Skeleton,"FP_ROAM_NW_KDF_LIBRARY_18");
		Wld_InsertNpc(Skeleton,"FP_ROAM_NW_KDF_LIBRARY_30");
		Wld_InsertNpc(Demon,"FP_ROAM_NW_KDF_LIBRARY_21");
		Wld_InsertNpc(Demon,"FP_ROAM_NW_KDF_LIBRARY_22");
		Wld_InsertNpc(DemonLord,"FP_ROAM_NW_KDF_LIBRARY_20");
		EVT_OPEN_DOOR_LIBRARY_S1_OneTime = TRUE;
	};
};

