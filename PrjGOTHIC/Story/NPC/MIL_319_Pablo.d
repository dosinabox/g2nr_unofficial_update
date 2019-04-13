
instance MIL_319_Pablo(Npc_Default)
{
	name[0] = "Пабло";
	guild = GIL_MIL;
	id = 319;
	voice = 12;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Mil_Sword);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItKe_City_Tower_01,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_NormalBart_Dusty,BodyTex_N,ITAR_Mil_L);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_319;
};


func void Rtn_Start_319()
{
	TA_Stand_Guarding(1,0,3,0,"NW_CITY_MAINSTREET_07");
	TA_Stand_Guarding(3,0,5,0,"NW_CITY_MERCHANT_TEMPLE_PLACE_01");
	TA_Stand_Guarding(5,0,7,0,"NW_CITY_MERCHANT_PATH_22");
	TA_Stand_Guarding(7,0,9,0,"NW_CITY_MAINSTREET_07");
	TA_Stand_Guarding(9,0,11,0,"NW_CITY_MERCHANT_TEMPLE_PLACE_01");
	TA_Stand_Guarding(11,0,13,0,"NW_CITY_MERCHANT_PATH_22");
	TA_Stand_Guarding(13,0,15,0,"NW_CITY_MAINSTREET_07");
	TA_Stand_Guarding(15,0,17,0,"NW_CITY_MERCHANT_TEMPLE_PLACE_01");
	TA_Stand_Guarding(17,0,19,0,"NW_CITY_MERCHANT_PATH_22");
	TA_Stand_Guarding(19,0,21,0,"NW_CITY_MAINSTREET_07");
	TA_Stand_Guarding(21,0,23,0,"NW_CITY_MERCHANT_TEMPLE_PLACE_01");
	TA_Stand_Guarding(23,0,1,0,"NW_CITY_MERCHANT_PATH_22");
};

