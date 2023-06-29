
instance BDT_1020_Bandit_L(Npc_Default)
{
	name[0] = "Разбойник";
	guild = GIL_BDT;
	id = 1020;
	voice = 6;
	flags = 0;
	npcType = NPCTYPE_MAIN;
	aivar[AIV_EnemyOverride] = TRUE;
//	aivar[AIV_DropDeadAndKill] = TRUE;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fatbald",Face_N_Mud,BodyTex_N,ITAR_Leather_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Intercept_1020;
};

func void Rtn_Intercept_1020()
{
	TA_Guard_Passage(0,0,12,0,"NW_TROLLAREA_PATH_47");
	TA_Guard_Passage(12,0,0,0,"NW_TROLLAREA_PATH_47");
};

func void Rtn_Hide_1020()
{
	TA_Guard_Passage(0,0,12,0,"NW_TROLLAREA_GOBBO_01");
	TA_Guard_Passage(12,0,0,0,"NW_TROLLAREA_GOBBO_01");
};

