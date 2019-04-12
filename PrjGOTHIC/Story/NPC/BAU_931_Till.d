
instance BAU_931_Till(Npc_Default)
{
	name[0] = "Тилл";
	guild = GIL_OUT;
	id = 931;
	voice = 3;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Bau_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_P_Weak_Cutter,BodyTex_P,ITAR_Bau_M);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,25);
	daily_routine = Rtn_PreStart_931;
};


func void Rtn_PreStart_931()
{
	TA_Stand_Guarding(8,0,22,0,"NW_FARM4_TILL");
	TA_Stand_Guarding(22,0,8,0,"NW_FARM4_TILL");
};

func void Rtn_Start_931()
{
	TA_Saw(8,0,22,0,"NW_FARM4_TILL");
	TA_Sit_Throne(22,0,8,0,"NW_FARM4_SEKOB");
};

func void Rtn_FleeDMT_931()
{
	TA_Stand_Guarding(8,0,22,0,"NW_FLEEDMT_KAP3");
	TA_Stand_Guarding(22,0,8,0,"NW_FLEEDMT_KAP3");
};

func void Rtn_FleeFromSekob_931()
{
	TA_Stand_ArmsCrossed(8,0,22,0,"NW_TAVERNE_TROLLAREA_14");
	TA_Stand_ArmsCrossed(22,0,8,0,"NW_TAVERNE_TROLLAREA_14");
};

func void Rtn_FollowCity_931()
{
	TA_Follow_Player(8,0,22,0,"CITY2");
	TA_Follow_Player(22,0,8,0,"CITY2");
};

func void Rtn_FollowBigfarm_931()
{
	TA_Follow_Player(8,0,22,0,"NW_BIGFARM_KITCHEN_02");
	TA_Follow_Player(22,0,8,0,"NW_BIGFARM_KITCHEN_02");
};

func void Rtn_FollowKloster_931()
{
	TA_Follow_Player(8,0,22,0,"KLOSTER");
	TA_Follow_Player(22,0,8,0,"KLOSTER");
};

func void Rtn_City_931()
{
	TA_Stand_WP(8,0,22,0,"NW_CITY_MERCHANT_PATH_25");
	TA_Stand_WP(22,0,8,0,"NW_CITY_MERCHANT_PATH_25");
};

func void Rtn_Bigfarm_931()
{
	TA_Sit_Chair(8,0,22,0,"NW_BIGFARM_KITCHEN_02");
	TA_Sit_Chair(22,0,8,0,"NW_BIGFARM_KITCHEN_02");
};

func void Rtn_Kloster_931()
{
	TA_Pick_FP(8,0,22,0,"NW_MONASTERY_HERB_02");
	TA_Pick_FP(22,0,8,0,"NW_MONASTERY_HERB_02");
};

