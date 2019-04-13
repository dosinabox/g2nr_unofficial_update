
instance BDT_1017_Bandit_L(Npc_Default)
{
	name[0] = NAME_Bandit;
	guild = GIL_BDT;
	id = 1017;
//	voice = 13;
	voice = 9;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_EnemyOverride] = TRUE;
//	B_SetAttributesToChapter(self,1);
//	fight_tactic = FAI_HUMAN_COWARD;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_NORMAL;
//	EquipItem(self,ItMw_1h_Bau_Mace);
	EquipItem(self,ItMw_1h_Sld_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_NormalBart17,BodyTex_N,ITAR_Leather_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
//	start_aistate = ZS_Bandit;
	daily_routine = Rtn_Start_1017;
};

func void Rtn_Start_1017()
{
	TA_Sit_Bench(8,0,23,0,"NW_BIGFARM_FOREST_03_NAVIGATION2");
	TA_Sit_Bench(23,0,8,0,"NW_BIGFARM_FOREST_03_NAVIGATION2");
};

