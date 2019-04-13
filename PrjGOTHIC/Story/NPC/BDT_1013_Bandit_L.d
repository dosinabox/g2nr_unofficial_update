
instance Bdt_1013_Bandit_L(Npc_Default)
{
	name[0] = NAME_Bandit;
	guild = GIL_BDT;
	id = 1013;
	voice = 1;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetAttributesToChapter(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItWr_Poster_MIS,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_Homer,BodyTex_N,ITAR_Leather_L);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,10);
	daily_routine = RTN_Start_1013;
};


func void RTN_Start_1013()
{
	TA_Stand_ArmsCrossed(0,0,12,0,"NW_XARDAS_STAIRS_01");
	TA_Stand_ArmsCrossed(12,0,0,0,"NW_XARDAS_STAIRS_01");
};

func void RTN_Ambush_1013()
{
	TA_Guide_Player(0,0,12,0,"NW_XARDAS_BANDITS_RIGHT");
	TA_Guide_Player(12,0,0,0,"NW_XARDAS_BANDITS_RIGHT");
};

func void rtn_away_1013()
{
	TA_Sit_Campfire(0,0,12,0,"NW_XARDAS_GOBBO_02");
	TA_Sit_Campfire(12,0,0,0,"NW_XARDAS_GOBBO_02");
};

func void rtn_away2_1013()
{
	TA_FleeToWp(0,0,12,0,"NW_XARDAS_MONSTER_INSERT_01");
	TA_FleeToWp(12,0,0,0,"NW_XARDAS_MONSTER_INSERT_01");
};

