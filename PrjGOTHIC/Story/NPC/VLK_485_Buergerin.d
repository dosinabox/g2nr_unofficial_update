
instance VLK_485_Buergerin(Npc_Default)
{
	name[0] = NAME_Buergerin;
	guild = GIL_VLK;
	id = 485;
	voice = 16;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	EquipItem(self,ItMw_1h_Vlk_Dagger);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_BabeHair",FaceBabe_N_HairAndCloth,BodyTex_N,ITAR_VlkBabe_L);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,15);
	daily_routine = Rtn_Start_485;
};


func void Rtn_Start_485()
{
	TA_Sit_Bench(5,10,10,10,"NW_CITY_HABOUR_BENCH_02");
	TA_Stand_Sweeping(10,10,12,10,"NW_CITY_HABOUR_POOR_AREA_HUT_05_IN");
	TA_Stomp_Herb(12,10,16,5,"NW_CITY_HABOUR_POOR_AREA_PATH_06_B");
	TA_Smalltalk(16,5,19,5,"NW_CITY_HABOUR_POOR_AREA_PATH_06");
	TA_Sit_Bench(19,5,22,55,"NW_CITY_HABOUR_BENCH_02");
	TA_Sleep(22,55,5,10,"NW_CITY_HABOUR_POOR_AREA_HUT_05_BED_01");
};

