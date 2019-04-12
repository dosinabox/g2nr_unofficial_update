
instance VLK_459_Buerger(Npc_Default)
{
	name[0] = NAME_Buerger;
	guild = GIL_VLK;
	id = 459;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_P_Weak_Cutter,BodyTex_P,ITAR_Vlk_L);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_459;
};


func void Rtn_Start_459()
{
	TA_Smalltalk(5,30,11,35,"NW_CITY_HABOUR_06");
	TA_Stand_Drinking(11,35,13,30,"NW_CITY_HABOUR_TAVERN01_01");
	TA_Smalltalk(13,30,17,35,"NW_CITY_HABOUR_04");
	TA_Stand_Drinking(17,35,19,10,"NW_CITY_HABOUR_TAVERN01_01");
	TA_Smalltalk(19,10,0,0,"NW_CITY_HABOUR_TAVERN01_06");
	TA_Stand_Drinking(0,0,2,0,"NW_CITY_HABOUR_TAVERN01_01");
	TA_Sleep(2,0,5,30,"NW_CITY_HABOUR_POOR_AREA_HUT_07_BED_02");
};

