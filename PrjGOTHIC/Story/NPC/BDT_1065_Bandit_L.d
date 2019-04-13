
instance BDT_1065_Bandit_L(Npc_Default)
{
	name[0] = NAME_Bandit;
	guild = GIL_BDT;
	id = 1065;
	voice = 10;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_ToughBart01,BodyTex_N,ItAr_BDT_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_1065;
};


func void Rtn_Start_1065()
{
	TA_Smalltalk(0,0,12,0,"NW_CASTLEMINE_TOWER_C");
	TA_Smalltalk(12,0,0,0,"NW_CASTLEMINE_TOWER_C");
};

