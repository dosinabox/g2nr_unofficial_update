
instance VLK_427_Buergerin(Npc_Default)
{
	name[0] = NAME_Buergerin;
	guild = GIL_VLK;
	id = 427;
	voice = 16;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	EquipItem(self,ItMw_1h_Vlk_Dagger);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_BabeHair",FaceBabe_N_HairAndCloth,BodyTex_N,ITAR_BauBabe_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_427;
};


func void Rtn_Start_427()
{
	TA_Cook_Stove(4,30,12,0,"NW_CITY_MERCHANT_SHOP01_IN_03_B");
	TA_Stand_Sweeping(12,0,13,2,"NW_CITY_MERCHANT_SHOP01_FRONT_02_B");
	TA_Smalltalk(13,2,14,5,"NW_CITY_MERCHANT_SHOP01_FRONT_03_E");
	TA_Cook_Stove(14,5,16,0,"NW_CITY_MERCHANT_SHOP01_IN_03_B");
	TA_Stand_Sweeping(16,0,17,2,"NW_CITY_MERCHANT_SHOP01_FRONT_02_B");
	TA_Smalltalk(17,2,18,5,"NW_CITY_MERCHANT_SHOP01_FRONT_03_E");
	TA_Cook_Stove(18,5,20,0,"NW_CITY_MERCHANT_SHOP01_IN_03_B");
	TA_Sit_Chair(20,0,23,30,"NW_CITY_MERCHANT_SHOP01_IN_01");
	TA_Sleep(23,30,4,30,"NW_CITY_MERCHANT_SHOP01_IN_01");
};

