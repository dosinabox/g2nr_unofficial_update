
instance BDT_10003_Addon_Bandit_H(Npc_Default)
{
	name[0] = NAME_Bandit;
	guild = GIL_BDT;
	id = 10003;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_BL_AMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_2h_Sld_Sword);
	EquipItem(self,ItRw_Mil_Crossbow);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_NormalBart10,BodyTex_N,ItAr_BDT_H);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,90);
	daily_routine = Rtn_Start_10003;
};


func void Rtn_Start_10003()
{
	TA_Stand_ArmsCrossed(9,0,21,0,"XXX");
	TA_Stand_ArmsCrossed(21,0,9,0,"XXX");
};

