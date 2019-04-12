
instance VLK_4004_Arbeiter(Npc_Default)
{
	name[0] = NAME_Arbeiter;
	guild = GIL_VLK;
	id = 4004;
	voice = 6;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_Cavalorn,BodyTex_B,ITAR_Bau_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_4004;
};


func void Rtn_Start_4004()
{
	TA_Stand_Sweeping(6,35,8,0,"NW_CITY_UPTOWN_PATH_11");
	TA_Stand_Sweeping(8,0,10,0,"NW_CITY_UPTOWN_PATH_12");
	TA_Stand_Sweeping(10,0,12,0,"NW_CITY_SMALLTALK_04");
	TA_Sit_Bench(12,0,15,0,"NW_CITY_UPTOWN_PATH_24");
	TA_Stand_Sweeping(15,0,17,0,"NW_CITY_UPTOWN_PATH_11");
	TA_Stand_Sweeping(17,0,19,0,"NW_CITY_UPTOWN_PATH_12");
	TA_Stand_Sweeping(19,0,21,0,"NW_CITY_SMALLTALK_04");
	TA_Sit_Bench(21,0,0,5,"NW_CITY_UPTOWN_PATH_24");
	TA_Sit_Campfire(0,5,6,35,"NW_CITY_UPTOWN_PATH_20_B");
};

