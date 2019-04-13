
instance Mil_327_Miliz(Npc_Default)
{
	name[0] = NAME_Miliz;
	guild = GIL_MIL;
	id = 327;
	voice = 6;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Mil_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal20,BodyTex_N,ITAR_Mil_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_327;
};


func void Rtn_Start_327()
{
	TA_Smalltalk(21,0,23,59,"NW_CITY_BARRACK02_SMALLTALK_01");
	TA_Sleep(23,59,6,30,"NW_CITY_BARRACK01_BED_02");
	TA_Stand_Guarding(6,30,7,30,"NW_CITY_HABOUR_KASERN_14");
	TA_Stand_Guarding(7,30,8,30,"NW_CITY_HABOUR_KASERN_12");
	TA_Stand_Guarding(8,30,9,30,"NW_CITY_HABOUR_KASERN_10");
	TA_Stand_Guarding(9,30,10,30,"NW_CITY_HABOUR_KASERN_08");
	TA_Stand_Guarding(10,30,11,30,"NW_CITY_HABOUR_KASERN_14");
	TA_Stand_Guarding(11,30,12,30,"NW_CITY_HABOUR_KASERN_12");
	TA_Stand_Guarding(12,30,13,30,"NW_CITY_HABOUR_KASERN_10");
	TA_Stand_Guarding(13,30,14,30,"NW_CITY_HABOUR_KASERN_08");
	TA_Stand_Guarding(14,30,15,30,"NW_CITY_HABOUR_KASERN_14");
	TA_Stand_Guarding(15,30,16,30,"NW_CITY_HABOUR_KASERN_12");
	TA_Stand_Guarding(16,30,17,30,"NW_CITY_HABOUR_KASERN_10");
	TA_Stand_Guarding(17,30,18,30,"NW_CITY_HABOUR_KASERN_08");
	TA_Stand_Guarding(18,30,19,30,"NW_CITY_HABOUR_KASERN_14");
	TA_Stand_Guarding(19,30,21,0,"NW_CITY_HABOUR_KASERN_12");
};

