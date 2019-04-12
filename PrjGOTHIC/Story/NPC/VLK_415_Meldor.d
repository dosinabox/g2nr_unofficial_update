
instance VLK_415_Meldor(Npc_Default)
{
	name[0] = "Ìוכהמנ";
	guild = GIL_VLK;
	id = 415;
	voice = 7;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_1h_Vlk_Dagger);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_P_NormalBald,BodyTex_P,ITAR_Vlk_L);
	Mdl_SetModelFatness(self,0.8);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,35);
	daily_routine = Rtn_PreStart_415;
};


func void Rtn_PreStart_415()
{
	TA_Smoke_Joint(5,5,23,55,"NW_CITY_HABOUR_POOR_AREA_PATH_20");
	TA_Sleep(23,55,5,5,"NW_CITY_HABOUR_HUT_04_BED_02");
};

func void Rtn_Start_415()
{
	TA_Smoke_Joint(5,5,12,35,"NW_CITY_HABOUR_POOR_AREA_PATH_20");
	TA_Smalltalk(12,35,16,5,"NW_CITY_HABOUR_HUT_08");
	TA_Smoke_Joint(16,5,18,5,"NW_CITY_HABOUR_POOR_AREA_PATH_20");
	TA_Stand_Eating(18,5,19,55,"NW_CITY_PATH_HABOUR_03");
	TA_Smoke_Joint(19,55,23,55,"NW_CITY_HABOUR_POOR_AREA_PATH_20");
	TA_Sleep(23,55,5,5,"NW_CITY_HABOUR_HUT_04_BED_02");
};

