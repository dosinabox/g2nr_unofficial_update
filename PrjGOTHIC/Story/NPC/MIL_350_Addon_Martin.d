
instance Mil_350_Addon_Martin(Npc_Default)
{
	name[0] = "Мартин";
	guild = GIL_NONE;
	id = 350;
	voice = 7;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_NPCIsRanger] = TRUE;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Mil_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_P_OldMan_Gravo,BodyTex_P,ITAR_Mil_L);
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

