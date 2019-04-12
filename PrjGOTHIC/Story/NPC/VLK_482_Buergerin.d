
instance VLK_482_Buergerin(Npc_Default)
{
	name[0] = NAME_Buergerin;
	guild = GIL_VLK;
	id = 482;
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
	daily_routine = Rtn_Start_482;
};


func void Rtn_Start_482()
{
	TA_Smalltalk(12,0,16,0,"NW_CITY_HABOUR_STOMPER_01");
	TA_Stomp_Herb(16,0,20,0,"NW_CITY_HABOUR_STOMPER_01");
	TA_Smalltalk(20,0,0,0,"NW_CITY_HABOUR_SMALLTALK_02");
	TA_Sleep(0,0,5,0,"NW_CITY_HABOUR_HUT_06_BED_01");
};

