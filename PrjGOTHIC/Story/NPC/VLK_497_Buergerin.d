
instance VLK_497_Buergerin(Npc_Default)
{
	name[0] = NAME_Buergerin;
	guild = GIL_VLK;
	id = 497;
	voice = 16;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	EquipItem(self,ItMw_1h_Vlk_Dagger);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_BabeHair",FaceBabe_N_HairAndCloth,BodyTex_N,ITAR_VlkBabe_L);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_497;
};


func void Rtn_Start_497()
{
	TA_Stand_Eating(5,0,6,0,"NW_CITY_MERCHANT_PATH_28_E");
	TA_Smalltalk(6,0,7,0,"MARKT_02");
	TA_Stand_Eating(7,0,8,0,"NW_CITY_MERCHANT_PATH_28_E");
	TA_Smalltalk(8,0,10,0,"MARKT_02");
	TA_Stand_ArmsCrossed(10,0,11,0,"MARKT");
	TA_Smalltalk(11,0,13,0,"MARKT_02");
	TA_Stand_Eating(13,0,14,0,"NW_CITY_MERCHANT_PATH_28_E");
	TA_Smalltalk(14,0,16,0,"MARKT_02");
	TA_Stand_ArmsCrossed(16,0,17,0,"MARKT");
	TA_Cook_Stove(17,0,18,0,"NW_CITY_UPTOWN_HUT_01_COOK");
	TA_Sweep_FP(18,0,19,0,"NW_CITY_UPTOWN_HUT_01_COOK");
	TA_Smalltalk(19,0,22,0,"NW_CITY_UPTOWN_PATH_08");
	TA_Sleep(22,0,5,0,"NW_CITY_GERBRANDT_BED_02");
};

func void Rtn_NewLife_497()
{
	TA_Smalltalk(22,0,8,0,"NW_CITY_HABOUR_POOR_AREA_PATH_03");
	TA_Smalltalk(8,0,11,0,"NW_CITY_HABOUR_POOR_AREA_PATH_03");
	TA_Smalltalk(11,0,15,0,"NW_CITY_HABOUR_POOR_AREA_PATH_03");
	TA_Smalltalk(15,0,18,0,"NW_CITY_HABOUR_POOR_AREA_PATH_03");
	TA_Smalltalk(18,0,22,0,"NW_CITY_HABOUR_POOR_AREA_PATH_03");
};

