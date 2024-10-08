
instance BDT_1013_Bandit_L(Npc_Default)
{
	name[0] = NAME_Bandit;
	guild = GIL_BDT;
	id = 1013;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_MAIN;
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetAttributesToChapter(self,0);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_CreateAmbientInv(self);
	CreateInvItem(self,ItWr_Poster_MIS);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_Homer,BodyTex_N,ITAR_Leather_L);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,10);
	daily_routine = Rtn_Start_1013;
};


func void Rtn_Start_1013()
{
	TA_Stand_ArmsCrossed(0,0,12,0,"NW_XARDAS_STAIRS_01");
	TA_Stand_ArmsCrossed(12,0,0,0,"NW_XARDAS_STAIRS_01");
};

func void Rtn_Ambush_1013()
{
	TA_Guide_Player(0,0,12,0,"NW_XARDAS_BANDITS_RIGHT");
	TA_Guide_Player(12,0,0,0,"NW_XARDAS_BANDITS_RIGHT");
};

func void Rtn_Away_1013()
{
	TA_Sit_Campfire(0,0,12,0,"NW_XARDAS_GOBBO_02");
	TA_Sit_Campfire(12,0,0,0,"NW_XARDAS_GOBBO_02");
};

func void Rtn_Away2_1013()
{
	TA_FleeToWp(0,0,12,0,"NW_XARDAS_MONSTER_INSERT_01");
	TA_FleeToWp(12,0,0,0,"NW_XARDAS_MONSTER_INSERT_01");
};

