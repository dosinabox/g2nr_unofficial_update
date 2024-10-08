
instance VLK_435_Nadja(Npc_Default)
{
	name[0] = "����";
	guild = GIL_VLK;
	id = 435;
	voice = 16;
	flags = 0;
	npcType = NPCTYPE_MAIN;
	aivar[AIV_SubGuild] = GIL_SUB_RedLight;
	aivar[AIV_ToughGuy] = TRUE;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Dagger);
	B_CreateAmbientInv(self);
	B_CreateItemToSteal(self,40,ItMi_Gold,40);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe8",FaceBabe_N_Hure,BodyTexBabe_N,ITAR_VlkBabe_H);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_435;
};


func void Rtn_Start_435()
{
	TA_Stand_Drinking(5,0,17,0,"NW_PUFF_DANCE");
	TA_Dance(17,0,21,0,"NW_PUFF_DANCE");
	TA_Stand_Drinking(21,0,21,30,"NW_PUFF_DANCE");
	TA_Dance(21,30,5,0,"NW_PUFF_DANCE");
};

func void Rtn_Dance_435()
{
	TA_Stand_ArmsCrossed(8,0,22,0,"NW_CITY_HABOUR_PUFF_NADJA");
	TA_Stand_ArmsCrossed(22,0,8,0,"NW_CITY_HABOUR_PUFF_NADJA");
};

func void Rtn_Smoke_435()
{
	TA_Smoke_Joint(5,0,17,0,"NW_PUFF_DANCE");
	TA_Dance(17,0,21,0,"NW_PUFF_DANCE");
	TA_Smoke_Joint(21,0,21,30,"NW_PUFF_DANCE");
	TA_Dance(21,30,5,0,"NW_PUFF_DANCE");
};

func void Rtn_Tot_435()
{
	TA_Stand_Guarding(0,0,12,0,"TOT");
	TA_Stand_Guarding(12,0,0,0,"TOT");
};

