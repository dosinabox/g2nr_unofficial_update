
instance BDT_1064_Bandit_L(Npc_Default)
{
	name[0] = NAME_Bandit;
	guild = GIL_BDT;
	id = 1064;
	voice = 4;
	flags = 0;
	npcType = NPCTYPE_MAIN;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_NewsOverride] = TRUE;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_ShortSword3);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_Normal_Orik,BodyTex_B,ITAR_Leather_L);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_Start_1064;
};


func void Rtn_Start_1064()
{
	TA_Guard_Passage(0,0,12,0,"NW_CASTLEMINE_TOWER_BEYOND");
	TA_Guard_Passage(12,0,0,0,"NW_CASTLEMINE_TOWER_BEYOND");
};

func void Rtn_Attack_1064()
{
	TA_Stand_Guarding(0,0,12,0,"NW_CASTLEMINE_HUT_BENCH_CAVE");
	TA_Stand_Guarding(12,0,0,0,"NW_CASTLEMINE_HUT_BENCH_CAVE");
};

