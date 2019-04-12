
instance BDT_1063_Bandit_L(Npc_Default)
{
	name[0] = NAME_Bandit;
	guild = GIL_BDT;
	id = 1063;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",Face_L_ToughBart_Quentin,BodyTex_L,ITAR_Leather_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_1063;
};


func void Rtn_Start_1063()
{
	TA_Sit_Bench(0,0,12,0,"NW_CASTLEMINE_HUT_BENCH_CAVE");
	TA_Sit_Bench(12,0,0,0,"NW_CASTLEMINE_HUT_BENCH_CAVE");
};

