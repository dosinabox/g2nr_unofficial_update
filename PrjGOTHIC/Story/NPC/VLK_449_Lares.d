
instance VLK_449_Lares(Npc_Default)
{
	name[0] = "Ларес";
	guild = GIL_NONE;
	id = 449;
	voice = 9;
	flags = NPC_FLAG_IMMORTAL;
	npcType = NPCTYPE_FRIEND;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_NPCIsRanger] = TRUE;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_Schwert3);
	CreateInvItems(self,ItMw_Schwert3,1);
	CreateInvItems(self,ItMi_Gold,100);
	CreateInvItems(self,ItMi_OldCoin,1);
	CreateInvItems(self,ItPo_Health_02,5);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_N_Lares,BodyTex_N,ITAR_Vlk_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,35);
	daily_routine = Rtn_PreStart_449;
};


func void Rtn_PreStart_449()
{
	TA_Stand_Guarding(8,0,20,0,"NW_CITY_HABOUR_02_B");
	TA_Stand_Guarding(20,0,8,0,"NW_CITY_HABOUR_02_B");
};

func void Rtn_Start_449()
{
	TA_Stand_Guarding(4,35,20,5,"NW_CITY_HABOUR_02_B");
	TA_Sit_Chair(20,5,4,35,"NW_CITY_HABOUR_TAVERN01_08");
};

func void Rtn_Guide_449()
{
	TA_Guide_Player(8,0,20,0,"NW_TAVERNE_BIGFARM_05");
	TA_Guide_Player(20,0,8,0,"NW_TAVERNE_BIGFARM_05");
};

func void Rtn_GUIDEPORTALTEMPEL1_449()
{
	TA_Guide_Player(8,0,20,0,"NW_CITY_TO_FOREST_11");
	TA_Guide_Player(20,0,8,0,"NW_CITY_TO_FOREST_11");
};

func void Rtn_GUIDEPORTALTEMPEL2_449()
{
	TA_Guide_Player(8,0,20,0,"NW_TAVERN_TO_FOREST_02");
	TA_Guide_Player(20,0,8,0,"NW_TAVERN_TO_FOREST_02");
};

func void Rtn_GUIDEPORTALTEMPEL3_449()
{
	TA_Guide_Player(8,0,20,0,"NW_TAVERNE_TROLLAREA_14");
	TA_Guide_Player(20,0,8,0,"NW_TAVERNE_TROLLAREA_14");
};

func void Rtn_GUIDEPORTALTEMPEL4_449()
{
	TA_Guide_Player(8,0,20,0,"NW_TROLLAREA_PATH_58");
	TA_Guide_Player(20,0,8,0,"NW_TROLLAREA_PATH_58");
};

func void Rtn_GUIDEPORTALTEMPEL5_449()
{
	TA_Guide_Player(8,0,20,0,"NW_TROLLAREA_PATH_47");
	TA_Guide_Player(20,0,8,0,"NW_TROLLAREA_PATH_47");
};

func void Rtn_GUIDEPORTALTEMPEL6_449()
{
	TA_Guide_Player(8,0,20,0,"NW_TROLLAREA_RUINS_02");
	TA_Guide_Player(20,0,8,0,"NW_TROLLAREA_RUINS_02");
};

func void Rtn_GUIDEPORTALTEMPELEND_449()
{
	TA_Guide_Player(8,0,20,0,"NW_TROLLAREA_RUINS_41");
	TA_Guide_Player(20,0,8,0,"NW_TROLLAREA_RUINS_41");
};

func void Rtn_GUIDEMEDIUMWALD1_449()
{
	TA_Guide_Player(8,0,20,0,"NW_CITY_TO_FARM2_04");
	TA_Guide_Player(20,0,8,0,"NW_CITY_TO_FARM2_04");
};

func void Rtn_GUIDEMEDIUMWALD2_449()
{
	TA_Guide_Player(8,0,20,0,"NW_FOREST_PATH_62");
	TA_Guide_Player(20,0,8,0,"NW_FOREST_PATH_62");
};

func void Rtn_PreRangerMeeting_449()
{
	TA_RangerMeeting(5,0,20,0,"NW_TAVERNE_03");
	TA_RangerMeeting(20,0,5,0,"NW_TAVERNE_03");
};

func void Rtn_RangerMeeting_449()
{
	TA_RangerMeeting(5,0,20,0,"NW_TAVERNE_IN_RANGERMEETING_LARES");
	TA_RangerMeeting(20,0,5,0,"NW_TAVERNE_IN_RANGERMEETING_LARES");
};

func void Rtn_Parking_449()
{
	TA_Stand_WP(5,0,20,0,"NW_TAVERNE_IN_RANGERMEETING_LARES");
	TA_Stand_WP(20,0,5,0,"NW_TAVERNE_IN_RANGERMEETING_LARES");
};

func void Rtn_WaitForShip_449()
{
	TA_Smalltalk(8,0,20,0,"NW_WAITFOR_SHIP_05");
	TA_Smalltalk(20,0,8,0,"NW_WAITFOR_SHIP_05");
};

func void Rtn_ShipOff_449()
{
	TA_Stand_Guarding(4,35,20,5,"NW_CITY_HABOUR_02_B");
	TA_Sit_Chair(20,5,4,35,"NW_CITY_HABOUR_TAVERN01_08");
};

func void Rtn_Ship_449()
{
	TA_Smalltalk(8,0,23,0,"SHIP_CREW_05");
	TA_Smalltalk(23,0,8,0,"SHIP_CREW_05");
};

