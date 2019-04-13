
var int enter_oldworld_firsttime_trigger_onetime;

func void enter_oldworld_firsttime_trigger()
{
	if(enter_oldworld_firsttime_trigger_onetime == FALSE)
	{
		B_KillNpc(Bruder);
		B_KillNpc(VLK_Leiche3);
		B_KillNpc(VLK_Leiche2);
		B_KillNpc(STRF_Leiche1);
		B_KillNpc(STRF_Leiche2);
		B_KillNpc(STRF_Leiche3);
		B_KillNpc(STRF_Leiche4);
		B_KillNpc(STRF_Leiche5);
		B_KillNpc(STRF_Leiche6);
		B_KillNpc(STRF_Leiche7);
		B_KillNpc(STRF_Leiche8);
		B_KillNpc(PAL_Leiche1);
		B_KillNpc(PAL_Leiche2);
		B_KillNpc(PAL_Leiche3);
		B_KillNpc(VLK_Leiche1);
		B_KillNpc(PAL_Leiche4);
		B_KillNpc(PAL_Leiche5);
		B_KillNpc(Olav);
		Wld_InsertNpc(OC_Sheep1,"FP_SLEEP_OC_SHEEP_01");
		Wld_InsertNpc(OC_Sheep2,"FP_SLEEP_OC_SHEEP_02");
		Wld_InsertNpc(OC_Sheep3,"FP_SLEEP_OC_SHEEP_03");
		PlayVideo("DRAGONATTACK.BIK");
		enter_oldworld_firsttime_trigger_onetime = TRUE;
	};
};

func void newworld_fishfood_trigger()
{
	PlayVideo("FISHFOOD.BIK");
	ExitSession();
};


