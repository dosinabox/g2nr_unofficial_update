
instance VLK_479_Lucy(Npc_Default)
{
	name[0] = "Люси";
	guild = GIL_VLK;
	id = 479;
	voice = 17;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	EquipItem(self,ItMw_1h_Vlk_Dagger);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe1",FaceBabe_N_Anne,BodyTex_N,ITAR_BauBabe_L);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,35);
	daily_routine = Rtn_Start_479;
};


func void Rtn_Start_479()
{
	TA_Rake_FP(5,0,19,0,"NW_CITY_PICK_02");
	TA_Cook_Stove(19,0,22,0,"NW_CITY_HABOUR_HUT_07_IN");
	TA_Sleep(22,0,5,0,"NW_CITY_HABOUR_HUT_07_BED_01");
};

