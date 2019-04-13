
instance BDT_1076_Addon_Bandit(Npc_Default)
{
	name[0] = NAME_Bandit;
	guild = GIL_BDT;
	id = 1076;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_TAL_AMBIENT;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1H_Mace_L_04);
	EquipItem(self,ItRw_Bow_M_02);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_NormalBart06,BodyTex_N,ItAr_BDT_M);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,90);
	daily_routine = Rtn_Start_1076;
};


func void Rtn_Start_1076()
{
	TA_Smalltalk(6,0,12,0,"BL_SMALLTALK_01");
	TA_Cook_Cauldron(12,0,22,0,"ADW_PATH_TO_BL_COOK");
	TA_Stand_Eating(22,0,6,0,"BL_FIGHT_04");
};

