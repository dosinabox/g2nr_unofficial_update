
instance BDT_1040_Bandit_L(Npc_Default)
{
	name[0] = NAME_Bandit;
	guild = GIL_BDT;
	id = 1040;
	voice = 10;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_B_Normal01,BodyTex_B,ItAr_BDT_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_1040;
};


func void Rtn_Start_1040()
{
	TA_Smalltalk(0,0,12,0,"NW_CASTLEMINE_TOWER_STAND_01");
	TA_Smalltalk(12,0,0,0,"NW_CASTLEMINE_TOWER_STAND_01");
};

