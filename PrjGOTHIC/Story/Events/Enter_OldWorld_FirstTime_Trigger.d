
var int Enter_OldWorld_FirstTime_Trigger_OneTime;

func void enter_oldworld_firsttime_trigger()
{
	if(Enter_OldWorld_FirstTime_Trigger_OneTime == FALSE)
	{
		B_KillNpc(PAL_2004_Bruder);
		B_KillNpc(VLK_4150_Leiche);
		B_KillNpc(VLK_4151_Leiche);
		B_KillNpc(VLK_4112_Den);
		B_KillNpc(STRF_1150_Leiche);
		B_KillNpc(STRF_1151_Leiche);
		B_KillNpc(STRF_1152_Leiche);
		B_KillNpc(STRF_1153_Leiche);
		B_KillNpc(STRF_1154_Leiche);
		B_KillNpc(STRF_1155_Leiche);
		B_KillNpc(STRF_1156_Leiche);
		B_KillNpc(STRF_1157_Leiche);
		B_KillNpc(PAL_2002_Leiche);
		B_KillNpc(PAL_2003_Leiche);
		B_KillNpc(PAL_2005_Leiche);
		B_KillNpc(PAL_2006_Leiche);
		B_KillNpc(PAL_2007_Leiche);
		B_KillNpc(VLK_4152_Olav);
		Wld_InsertNpc(OC_Sheep1,"FP_SLEEP_OC_SHEEP_01");
		Wld_InsertNpc(OC_Sheep2,"FP_SLEEP_OC_SHEEP_02");
		Wld_InsertNpc(OC_Sheep3,"FP_SLEEP_OC_SHEEP_03");
		PlayVideo("DRAGONATTACK.BIK");
		Enter_OldWorld_FirstTime_Trigger_OneTime = TRUE;
	};
};

