
instance BDT_10304_Addon_RangerBandit_M(Npc_Default)
{
	name[0] = NAME_Bandit;
	guild = GIL_BDT;
	id = 10304;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_Addon_BanditTrader);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_L_Tough02,BodyTex_L,ItAr_BDT_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,40);
	daily_routine = Rtn_Start_10304;
};


func void Rtn_Start_10304()
{
	TA_Smalltalk(8,0,23,0,"NW_FARM2_TO_TAVERN_07");
	TA_Smalltalk(23,0,8,0,"NW_FARM2_TO_TAVERN_07");
};

