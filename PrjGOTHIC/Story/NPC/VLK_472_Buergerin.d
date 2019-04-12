
instance VLK_472_Buergerin(Npc_Default)
{
	name[0] = NAME_Buergerin;
	guild = GIL_VLK;
	id = 472;
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
	daily_routine = Rtn_Start_472;
};


func void Rtn_Start_472()
{
	TA_Smalltalk(5,0,12,35,"NW_CITY_HABOUR_JACK");
	TA_Smalltalk(12,35,18,0,"NW_CITY_HABOUR_POOR_AREA_01");
	TA_Sweep_FP(18,0,22,0,"NW_CITY_HABOUR_POOR_AREA_HUT_07_01");
	TA_Sleep(22,0,5,0,"NW_CITY_HABOUR_POOR_AREA_HUT_07_BED_01");
};

