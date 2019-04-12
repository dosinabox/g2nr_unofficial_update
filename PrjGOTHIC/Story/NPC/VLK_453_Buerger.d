
instance VLK_453_Buerger(Npc_Default)
{
	name[0] = "Работник";
	guild = GIL_VLK;
	id = 453;
	voice = 6;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_NormalBart22,BodyTex_N,ITAR_Bau_L);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_453;
};


func void Rtn_Start_453()
{
	TA_Saw(5,10,6,10,"NW_CITY_POOR_SAW");
	TA_Smith_Sharp(6,10,7,10,"NW_CITY_POOR_SMITH_SHARP");
	TA_Saw(7,10,8,10,"NW_CITY_POOR_SAW");
	TA_Smith_Sharp(8,10,9,10,"NW_CITY_POOR_SMITH_SHARP");
	TA_Saw(9,10,10,10,"NW_CITY_POOR_SAW");
	TA_Smith_Sharp(10,10,11,10,"NW_CITY_POOR_SMITH_SHARP");
	TA_Saw(11,10,12,10,"NW_CITY_POOR_SAW");
	TA_Smith_Sharp(12,10,13,10,"NW_CITY_POOR_SMITH_SHARP");
	TA_Saw(13,10,14,10,"NW_CITY_POOR_SAW");
	TA_Smith_Sharp(14,10,15,10,"NW_CITY_POOR_SMITH_SHARP");
	TA_Saw(15,10,16,10,"NW_CITY_POOR_SAW");
	TA_Smith_Sharp(16,10,17,10,"NW_CITY_POOR_SMITH_SHARP");
	TA_Saw(17,10,18,10,"NW_CITY_POOR_SAW");
	TA_Smith_Sharp(18,10,19,10,"NW_CITY_POOR_SMITH_SHARP");
	TA_Saw(19,10,20,5,"NW_CITY_POOR_SAW");
	TA_Smalltalk(20,5,22,5,"NW_CITY_HABOUR_POOR_AREA_PATH_07");
	TA_Stand_Eating(22,5,0,55,"NW_CITY_HABOUR_POOR_AREA_HUT_03");
	TA_Sleep(0,55,5,10,"NW_CITY_HABOUR_POOR_AREA_HUT_04_BED_02");
};

