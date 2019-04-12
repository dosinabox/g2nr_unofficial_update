
instance PIR_1300_Addon_Greg_NW(Npc_Default)
{
	name[0] = "Грег";
	guild = GIL_NONE;
	id = 1300;
	voice = 1;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,5);
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_Piratensaebel);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_P_Greg,BodyTex_P,ITAR_PIR_H_Addon);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_1300;
};


func void Rtn_Start_1300()
{
	TA_Stand_ArmsCrossed(8,0,22,0,"NW_FARM1_PATH_SPAWN_05");
	TA_Stand_ArmsCrossed(22,0,8,0,"NW_FARM1_PATH_SPAWN_05");
};

func void Rtn_Markt_1300()
{
	TA_Stand_Eating(8,0,23,0,"MARKT");
	TA_Stand_Eating(23,0,8,0,"MARKT");
};

func void Rtn_Taverne_1300()
{
	TA_Sit_Bench(8,0,23,0,"NW_TAVERNE_GREGSBENCH");
	TA_Sit_Bench(23,0,8,0,"NW_TAVERNE_GREGSBENCH");
};

func void Rtn_RakeCave_1300()
{
	TA_RangerMeeting(8,0,23,0,"NW_BIGFARM_LAKE_CAVE_01");
	TA_RangerMeeting(23,0,8,0,"NW_BIGFARM_LAKE_CAVE_01");
};

func void Rtn_Bigcross_1300()
{
	TA_Stand_Eating(8,0,23,0,"BIGCROSS");
	TA_Stand_Eating(23,0,8,0,"BIGCROSS");
};

func void Rtn_Dexter_1300()
{
	TA_Stand_WP(8,0,23,0,"NW_CASTLEMINE_TOWER_CAMPFIRE_03");
	TA_Stand_WP(23,0,8,0,"NW_CASTLEMINE_TOWER_CAMPFIRE_03");
};

func void Rtn_DexterHouseRun_1300()
{
	TA_RunToWP(0,0,12,0,"NW_CASTLEMINE_HUT_10");
	TA_RunToWP(12,0,0,0,"NW_CASTLEMINE_HUT_10");
};

func void Rtn_DexterHouseWalk_1300()
{
	TA_Stand_WP(0,0,12,0,"NW_CASTLEMINE_HUT_10");
	TA_Stand_WP(12,0,0,0,"NW_CASTLEMINE_HUT_10");
};

func void Rtn_DexterThrone_1300()
{
	TA_Sit_Throne(0,0,12,0,"NW_CASTLEMINE_HUT_10");
	TA_Sit_Throne(12,0,0,0,"NW_CASTLEMINE_HUT_10");
};

func void Rtn_Tot_1300()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

