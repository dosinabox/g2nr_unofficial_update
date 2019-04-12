
instance VLK_430_Buergerin(Npc_Default)
{
	name[0] = NAME_Buergerin;
	guild = GIL_VLK;
	id = 430;
	voice = 17;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	EquipItem(self,ItMw_1h_Vlk_Dagger);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe8",FaceBabe_N_Lilo,BodyTex_N,ITAR_VlkBabe_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_430;
};


func void Rtn_Start_430()
{
	TA_Smalltalk(5,7,12,7,"NW_CITY_HABOUR_POOR_AREA_PATH_07");
	TA_Cook_Stove(12,7,16,0,"NW_CITY_HABOUR_POOR_AREA_HUT_04_BED_01");
	TA_Smalltalk(16,7,19,7,"NW_CITY_HABOUR_POOR_AREA_PATH_07");
	TA_Sweep_FP(19,7,22,7,"NW_CITY_HABOUR_POOR_AREA_HUT_04_IN_B");
	TA_Smalltalk(22,7,0,7,"NW_CITY_HABOUR_POOR_AREA_PATH_07");
	TA_Sleep(0,7,5,7,"NW_CITY_HABOUR_POOR_AREA_HUT_04_BED_01");
};

