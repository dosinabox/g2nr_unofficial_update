
instance MIL_350_Addon_Martin(Npc_Default)
{
	name[0] = "������";
	guild = GIL_MIL;
	id = 350;
	voice = 7;
	flags = 0;
	npcType = NPCTYPE_MAIN;
	aivar[AIV_SubGuild] = GIL_SUB_Ranger;
	aivar[AIV_NPCIsTrader] = TRUE;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_Meisterdegen);
	B_CreateItemToSteal(self,65,ItMi_Gold,77);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_P_OldMan_Gravo,BodyTex_P,ITAR_MIL_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_PreStart_350;
};


func void Rtn_PreStart_350()
{
	TA_Study_WP(4,0,23,0,"NW_CITY_PALCAMP_15");
	TA_Study_WP(23,0,4,0,"NW_CITY_PALCAMP_15");
};

func void Rtn_Start_350()
{
	TA_Study_WP(4,0,23,0,"NW_CITY_PALCAMP_15");
	TA_Sit_Chair(23,0,4,0,"NW_CITY_HABOUR_TAVERN01_04");
};

func void Rtn_PreRangerMeeting_350()
{
	TA_RangerMeeting(5,0,20,0,"NW_TAVERNE_07");
	TA_RangerMeeting(20,0,5,0,"NW_TAVERNE_07");
};

func void Rtn_RangerMeeting_350()
{
	TA_RangerMeeting(5,0,20,0,"NW_TAVERNE_IN_RANGERMEETING");
	TA_RangerMeeting(20,0,5,0,"NW_TAVERNE_IN_RANGERMEETING");
};

func void Rtn_Parking_350()
{
	TA_Stand_Guarding(5,0,20,0,"NW_TAVERNE_IN_RANGERMEETING");
	TA_Stand_Guarding(20,0,5,0,"NW_TAVERNE_IN_RANGERMEETING");
};

