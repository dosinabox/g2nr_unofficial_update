
instance BDT_10002_Addon_Bandit_M(Npc_Default)
{
	name[0] = NAME_Bandit;
	guild = GIL_BDT;
	id = 10002;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_BL_AMBIENT;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Sword);
	EquipItem(self,ItRw_Mil_Crossbow);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_NormalBart02,BodyTex_N,ItAr_BDT_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_Start_10002;
};


func void Rtn_Start_10002()
{
	TA_Stand_ArmsCrossed(9,0,21,0,"XXX");
	TA_Stand_ArmsCrossed(21,0,9,0,"XXX");
};

