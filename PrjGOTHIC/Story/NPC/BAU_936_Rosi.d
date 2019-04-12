
instance BAU_936_Rosi(Npc_Default)
{
	name[0] = "Рози";
	guild = GIL_BAU;
	id = 936;
	voice = 17;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe8",FaceBabe_N_Hure,BodyTexBabe_N,ITAR_BauBabe_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,15);
	daily_routine = Rtn_Start_936;
};


func void Rtn_Start_936()
{
	TA_Cook_Stove(8,0,22,0,"NW_FARM4_ROSI");
	TA_Cook_Stove(22,0,8,0,"NW_FARM4_ROSI");
};

func void Rtn_FleeDMT_936()
{
	TA_Stand_ArmsCrossed(8,0,22,0,"NW_FLEEDMT_KAP3");
	TA_Stand_ArmsCrossed(22,0,8,0,"NW_FLEEDMT_KAP3");
};

func void Rtn_FleeFromSekob_936()
{
	TA_Stand_ArmsCrossed(8,0,22,0,"NW_TAVERNE_TROLLAREA_14");
	TA_Stand_ArmsCrossed(22,0,8,0,"NW_TAVERNE_TROLLAREA_14");
};

func void Rtn_FollowCity_936()
{
	TA_Follow_Player(8,0,22,0,"CITY2");
	TA_Follow_Player(22,0,8,0,"CITY2");
};

func void Rtn_FollowBigfarm_936()
{
	TA_Follow_Player(8,0,22,0,"NW_BIGFARM_KITCHEN_02");
	TA_Follow_Player(22,0,8,0,"NW_BIGFARM_KITCHEN_02");
};

func void Rtn_FollowKloster_936()
{
	TA_Follow_Player(8,0,22,0,"KLOSTER");
	TA_Follow_Player(22,0,8,0,"KLOSTER");
};

func void Rtn_City_936()
{
	TA_Sit_Bench(8,0,22,0,"NW_CITY_MERCHANT_PATH_25");
	TA_Sit_Bench(22,0,8,0,"NW_CITY_MERCHANT_PATH_25");
};

func void Rtn_Bigfarm_936()
{
	TA_Sit_Chair(8,0,22,0,"NW_BIGFARM_KITCHEN_02");
	TA_Sit_Chair(22,0,8,0,"NW_BIGFARM_KITCHEN_02");
};

func void Rtn_Kloster_936()
{
	TA_Stand_ArmsCrossed(8,0,22,0,"NW_MONASTERY_SHEEP_01");
	TA_Stand_ArmsCrossed(22,0,8,0,"NW_MONASTERY_SHEEP_01");
};

