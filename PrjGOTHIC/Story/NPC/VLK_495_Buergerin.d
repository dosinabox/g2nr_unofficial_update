
instance VLK_495_Buergerin(Npc_Default)
{
	name[0] = NAME_Magd;
	guild = GIL_VLK;
	id = 495;
	voice = 16;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	EquipItem(self,ItMw_1h_Vlk_Dagger);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_BabeHair",FaceBabe_N_HairAndCloth,BodyTex_N,ITAR_BauBabe_L);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_495;
};


func void Rtn_Start_495()
{
	TA_Smalltalk(6,0,8,0,"NW_CITY_MERCHANT_PATH_28_B");
	TA_Stand_Eating(8,0,9,0,"NW_CITY_MERCHANT_PATH_30");
	TA_Smalltalk(9,0,11,0,"NW_CITY_MERCHANT_PATH_28_B");
	TA_Stand_Eating(11,0,12,0,"NW_CITY_MERCHANT_PATH_30");
	TA_Smalltalk(12,0,14,0,"NW_CITY_MERCHANT_PATH_28_B");
	TA_Stand_Eating(14,0,15,0,"NW_CITY_MERCHANT_PATH_30");
	TA_Smalltalk(15,0,17,0,"NW_CITY_MERCHANT_PATH_28_B");
	TA_Stand_Eating(17,0,18,0,"NW_CITY_MERCHANT_PATH_30");
	TA_Cook_Stove(18,0,1,0,"TAVERN02");
	TA_Stand_Drinking(1,0,5,0,"NW_CITY_TAVERN_IN_04");
	TA_Stand_Sweeping(5,0,6,0,"NW_CITY_MERCHANT_TAVERN01_IN");
};

