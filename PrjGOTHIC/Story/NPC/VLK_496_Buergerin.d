
instance VLK_496_Buergerin(Npc_Default)
{
	name[0] = NAME_Buergerin;
	guild = GIL_VLK;
	id = 496;
	voice = 17;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	EquipItem(self,ItMw_1h_Vlk_Dagger);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe1",FaceBabe_N_OldBrown,BodyTex_N,ITAR_VlkBabe_L);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_496;
};


func void Rtn_Start_496()
{
	TA_Smalltalk(6,0,7,0,"NW_CITY_MERCHANT_PATH_28_D");
	TA_Stand_Drinking(7,0,8,0,"NW_CITY_MERCHANT_PATH_28_D");
	TA_Smalltalk(8,0,10,0,"NW_CITY_MERCHANT_PATH_28_D");
	TA_Stand_Drinking(10,0,11,0,"NW_CITY_MERCHANT_PATH_28_D");
	TA_Smalltalk(11,0,13,0,"NW_CITY_MERCHANT_PATH_28_D");
	TA_Stand_Drinking(13,0,14,0,"NW_CITY_MERCHANT_PATH_28_D");
	TA_Smalltalk(14,0,16,0,"NW_CITY_MERCHANT_PATH_28_D");
	TA_Cook_Stove(16,0,17,0,"NW_CITY_UPTOWN_HUT_04_COOK");
	TA_Smalltalk(17,0,21,45,"NW_CITY_UPTOWN_PATH_15");
	TA_Cook_Stove(21,45,0,0,"NW_CITY_UPTOWN_HUT_04_COOK");
	TA_Sleep(0,0,4,30,"NW_CITY_LUTERO_BED_WEIB");
	TA_Sweep_FP(4,30,6,0,"NW_CITY_UPTOWN_HUT_04_01");
};

