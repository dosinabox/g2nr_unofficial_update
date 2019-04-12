
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
		PlayVideo("DRAGONATTACK.BIK");
		enter_oldworld_firsttime_trigger_onetime = TRUE;
	};
	if(TschuessBilgot == TRUE)
	{
		B_RemoveNpc(Bilgot);
	};
};

