
instance VLK_429_Buergerin(Npc_Default)
{
	name[0] = NAME_Buergerin;
	guild = GIL_VLK;
	id = 429;
	voice = 16;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	EquipItem(self,ItMw_1h_Vlk_Dagger);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe4",FaceBabe_N_VlkBlonde,BodyTex_N,ITAR_VlkBabe_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_429;
};


func void Rtn_Start_429()
{
	TA_Smalltalk(5,5,12,5,"NW_CITY_HABOUR_POOR_AREA_PATH_06");
	TA_Stomp_Herb(12,5,22,5,"NW_CITY_HABOUR_POOR_AREA_PATH_08_A");
	TA_Smalltalk(22,5,0,5,"NW_CITY_HABOUR_POOR_AREA_PATH_07");
	TA_Sleep(0,5,5,5,"NW_CITY_HABOUR_HUT_03_BED_01");
};

