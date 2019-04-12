
instance VLK_478_Buergerin(Npc_Default)
{
	name[0] = NAME_Buergerin;
	guild = GIL_VLK;
	id = 478;
	voice = 17;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	EquipItem(self,ItMw_1h_Vlk_Dagger);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe1",FaceBabe_N_OldBrown,BodyTex_N,ITAR_VlkBabe_L);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,15);
	daily_routine = Rtn_Start_478;
};


func void Rtn_Start_478()
{
	TA_Pick_FP(5,0,17,0,"NW_CITY_PICK_01");
	TA_Stomp_Herb(17,0,22,0,"NW_CITY_HABOUR_STOMPER_02");
	TA_Sleep(22,0,5,0,"NW_CITY_HABOUR_HUT_05_BED_02");
};

