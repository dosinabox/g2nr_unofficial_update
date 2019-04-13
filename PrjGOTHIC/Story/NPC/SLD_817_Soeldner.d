
instance SLD_817_Soeldner(Npc_Default)
{
	name[0] = NAME_Soeldner;
	guild = GIL_SLD;
	id = 817;
	voice = 6;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Axe);
	EquipItem(self,ItRw_Sld_Bow);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_L_Tough01,BodyTex_L,ItAr_Sld_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_817;
};


func void Rtn_Start_817()
{
	TA_Stand_Guarding(8,0,22,0,"NW_BIGFARM_VORPOSTEN1_02");
	TA_Stand_Guarding(22,0,8,0,"NW_BIGFARM_VORPOSTEN1_02");
};

func void Rtn_BengarsFarm_817()
{
	TA_Smalltalk(8,0,22,0,"NW_FARM3_PATH_02");
	TA_Smalltalk(22,0,8,0,"NW_FARM3_PATH_02");
};

