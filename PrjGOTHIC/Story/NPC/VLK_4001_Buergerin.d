
instance VLK_4001_Buergerin(Npc_Default)
{
	name[0] = NAME_Buergerin;
	guild = GIL_VLK;
	id = 4001;
	voice = 16;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_BabeHair",FaceBabe_N_HairAndCloth,BodyTex_N,ITAR_VlkBabe_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_4001;
};


func void Rtn_Start_4001()
{
	TA_Sleep(21,45,6,30,"NW_CITY_REICH03_BED_02");
	TA_Stand_Sweeping(6,30,8,0,"NW_CITY_UPTOWN_HUT_02_ENTRY");
	TA_Cook_Stove(8,0,10,0,"NW_CITY_REICH03_COOK");
	TA_Smalltalk(10,0,14,0,"NW_CITY_UPTOWN_PATH_15_B");
	TA_Sweep_FP(14,0,15,30,"NW_CITY_UPTOWN_HUT_02_IN");
	TA_Cook_Stove(15,30,17,0,"NW_CITY_REICH03_COOK");
	TA_Smalltalk(17,0,21,45,"NW_CITY_UPTOWN_PATH_15_B");
};

