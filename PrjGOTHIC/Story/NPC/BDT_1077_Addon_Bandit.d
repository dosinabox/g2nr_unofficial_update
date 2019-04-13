
instance BDT_1077_Addon_Bandit(Npc_Default)
{
	name[0] = NAME_Bandit;
	guild = GIL_BDT;
	id = 1077;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_TAL_AMBIENT;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Bau_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",Face_P_Normal01,BodyTex_P,ItAr_BDT_M);
	Mdl_SetModelFatness(self,-0.5);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,90);
	daily_routine = Rtn_Start_1077;
};


func void Rtn_Start_1077()
{
	TA_Smalltalk(6,0,12,0,"BL_SMALLTALK_01");
	TA_Smith_Sharp(12,0,22,4,"ADW_PATH_TO_BL_SHARP");
	TA_Roast_Scavenger(22,4,6,0,"ADW_SWAMP_ROAST");
};

