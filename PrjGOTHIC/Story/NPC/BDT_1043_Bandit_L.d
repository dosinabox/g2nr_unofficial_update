
instance BDT_1043_Bandit_L(Npc_Default)
{
	name[0] = NAME_Bandit;
	guild = GIL_BDT;
	id = 1043;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_SubGuild] = GIL_SUB_Dexter;
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fatbald",Face_P_NormalBart01,BodyTex_P,ITAR_BDT_M);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_1043;
};


func void Rtn_Start_1043()
{
	TA_Sit_Bench(0,0,8,0,"NW_CASTLEMINE_HUT_BENCH_CAVE");
	TA_Saw(8,0,0,0,"NW_CASTLEMINE_TOWER__MOBSI");
};

