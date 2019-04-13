
instance BDT_10007_Addon_Bandit(Npc_Default)
{
	name[0] = NAME_Bandit;
	guild = GIL_BDT;
	id = 10007;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_BL_AMBIENT;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Mil_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_P_Normal01,BodyTex_P,ItAr_BDT_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_Start_10007;
};


func void Rtn_Start_10007()
{
	TA_Stand_Drinking(9,0,21,0,"BL_ENTRANCE_SIDE_03");
	TA_Stand_Drinking(21,0,9,0,"BL_ENTRANCE_SIDE_03");
};

