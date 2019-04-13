
instance Mil_307_Tuerwache(Npc_Default)
{
	name[0] = NAME_Miliz;
	guild = GIL_MIL;
	id = 307;
	voice = 6;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Mil_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Horatio,BodyTex_N,ItAr_MIL_M);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_Start_307;
};


func void Rtn_Start_307()
{
	TA_Stand_Guarding(12,0,14,0,"NW_CITY_UPTOWN_PATH_13");
	TA_Stand_ArmsCrossed(14,0,16,0,"NW_CITY_UPTOWN_PATH_05");
	TA_Stand_Guarding(16,0,18,0,"NW_CITY_UPTOWN_PATH_09");
	TA_Stand_Guarding(18,0,20,0,"NW_CITY_UPTOWN_PATH_13");
	TA_Stand_ArmsCrossed(20,0,22,0,"NW_CITY_UPTOWN_PATH_05");
	TA_Stand_Guarding(22,0,23,30,"NW_CITY_UPTOWN_PATH_09");
	TA_Stand_Guarding(23,30,1,0,"NW_CITY_UPTOWN_PATH_14");
	TA_Stand_ArmsCrossed(1,0,2,30,"NW_CITY_UPTOWN_PATH_09");
	TA_Stand_Guarding(2,30,4,0,"NW_CITY_UPTOWN_PATH_13");
	TA_Stand_Guarding(4,0,5,30,"NW_CITY_UPTOWN_PATH_14");
	TA_Stand_Guarding(5,30,8,0,"NW_CITY_UPTOWN_PATH_13");
	TA_Stand_ArmsCrossed(8,0,10,0,"NW_CITY_UPTOWN_PATH_05");
	TA_Stand_Guarding(10,0,12,0,"NW_CITY_UPTOWN_PATH_09");
};

