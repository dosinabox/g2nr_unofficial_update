
instance VLK_488_Buergerin(Npc_Default)
{
	name[0] = NAME_Buergerin;
	guild = GIL_VLK;
	id = 488;
	voice = 16;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	EquipItem(self,ItMw_1h_Vlk_Dagger);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_BabeHair",FaceBabe_N_HairAndCloth,BodyTex_N,ITAR_BauBabe_L);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_488;
};


func void Rtn_Start_488()
{
	TA_Cook_Stove(5,0,8,0,"NW_CITY_HABOUR_HUT_08_IN_B");
	TA_Smalltalk(8,0,12,0,"NW_CITY_PATH_HABOUR_04");
	TA_Stand_Eating(12,0,14,0,"NW_CITY_PATH_HABOUR_03");
	TA_Sweep_FP(14,0,16,0,"NW_CITY_HABOUR_HUT_08_IN_B");
	TA_Stand_Eating(16,0,18,0,"NW_CITY_PATH_HABOUR_03");
	TA_Cook_Stove(18,0,20,0,"NW_CITY_HABOUR_HUT_08_IN_B");
	TA_Sweep_FP(20,0,0,0,"NW_CITY_HABOUR_HUT_08_IN_B");
	TA_Sleep(0,0,5,0,"NW_CITY_HABOUR_HUT_08_BED_01");
};

