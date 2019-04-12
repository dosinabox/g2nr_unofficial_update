
instance VLK_487_Buergerin(Npc_Default)
{
	name[0] = NAME_Buergerin;
	guild = GIL_VLK;
	id = 487;
	voice = 17;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	EquipItem(self,ItMw_1h_Vlk_Dagger);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe1",FaceBabe_N_Anne,BodyTex_N,ITAR_VlkBabe_L);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_487;
};


func void Rtn_Start_487()
{
	TA_Stomp_Herb(5,0,8,0,"NW_CITY_PATH_HABOUR_04_STOMPER");
	TA_Smalltalk(8,0,12,0,"NW_CITY_PATH_HABOUR_04_01");
	TA_Cook_Stove(12,0,12,30,"NW_CITY_PATH_HABOUR_04_01");
	TA_Smalltalk(12,30,16,0,"NW_CITY_PATH_HABOUR_04_01");
	TA_Stomp_Herb(16,0,19,30,"NW_CITY_PATH_HABOUR_04_STOMPER");
	TA_Cook_Stove(19,30,22,0,"NW_CITY_HABOUR_HUT_04_IN");
	TA_Sleep(22,0,5,0,"NW_CITY_HABOUR_HUT_04_BED_01");
};

