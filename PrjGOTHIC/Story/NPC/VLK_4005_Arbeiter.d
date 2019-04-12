
instance VLK_4005_Arbeiter(Npc_Default)
{
	name[0] = NAME_Arbeiter;
	guild = GIL_VLK;
	id = 4005;
	voice = 6;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal_Olli_Kahn,BodyTex_N,ITAR_Bau_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_4005;
};


func void Rtn_Start_4005()
{
	TA_Stand_Sweeping(6,33,8,0,"NW_CITY_UPTOWN_PATH_07");
	TA_Stand_Sweeping(8,0,10,0,"NW_CITY_UPTOWN_PATH_18");
	TA_Stand_Sweeping(10,0,12,0,"NW_CITY_UPTOWN_PATH_03_B");
	TA_Sit_Bench(12,0,15,0,"NW_CITY_UPTOWN_PATH_24_B");
	TA_Stand_Sweeping(15,0,17,0,"NW_CITY_UPTOWN_PATH_07");
	TA_Stand_Sweeping(17,0,19,0,"NW_CITY_UPTOWN_PATH_18");
	TA_Stand_Sweeping(19,0,21,0,"NW_CITY_UPTOWN_PATH_03_B");
	TA_Sit_Bench(21,0,0,4,"NW_CITY_UPTOWN_PATH_24_B");
	TA_Sit_Campfire(0,4,6,33,"NW_CITY_SMALLTALK_05");
};

