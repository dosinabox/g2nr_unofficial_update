
instance VLK_460_Buerger(Npc_Default)
{
	name[0] = NAME_Buerger;
	guild = GIL_VLK;
	id = 460;
	voice = 8;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Dagger);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Normal_Olli_Kahn,BodyTex_N,ITAR_Vlk_M);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,40);
	daily_routine = Rtn_Start_460;
};


func void Rtn_Start_460()
{
	TA_Smalltalk(5,35,11,30,"NW_CITY_HABOUR_05");
	TA_Stand_Drinking(11,30,13,35,"NW_CITY_HABOUR_03");
	TA_Smalltalk(13,35,17,30,"NW_CITY_HABOUR_03");
	TA_Stand_Drinking(17,30,23,30,"NW_CITY_HABOUR_TAVERN01_01");
	TA_Sleep(23,30,5,35,"NW_CITY_HABOUR_POOR_AREA_HUT_01_BED_02");
};

