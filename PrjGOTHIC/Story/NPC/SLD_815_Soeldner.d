
instance SLD_815_Soeldner(Npc_Default)
{
	name[0] = NAME_Soeldner;
	guild = GIL_SLD;
	id = 815;
	voice = 6;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Axe);
	EquipItem(self,ItRw_Sld_Bow);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal05,BodyTex_N,ItAr_Sld_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_815;
};


func void Rtn_Start_815()
{
	TA_Sit_Campfire(8,0,22,0,"NW_BIGFARM_VORPOSTEN1_01");
	TA_Sit_Campfire(22,0,8,0,"NW_BIGFARM_VORPOSTEN1_01");
};

func void Rtn_BengarsFarm_815()
{
	TA_Smalltalk(8,0,22,0,"NW_FARM3_PATH_02");
	TA_Smalltalk(22,0,8,0,"NW_FARM3_PATH_02");
};

