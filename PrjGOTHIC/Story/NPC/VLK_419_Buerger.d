
instance VLK_419_Buerger(Npc_Default)
{
	name[0] = NAME_Buerger;
	guild = GIL_VLK;
	id = 419;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald.",Face_N_NormalBart_Graham,BodyTex_N,ITAR_Vlk_H);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,35);
	daily_routine = Rtn_Start_419;
};


func void Rtn_Start_419()
{
	TA_Sit_Bench(7,0,11,0,"NW_CITY_UPTOWN_PATH_23");
	TA_Stand_Drinking(11,0,12,30,"NW_CITY_UPTOWN_HUT_02_ENTRY");
	TA_Stand_Eating(12,30,15,0,"NW_CITY_UPTOWN_PATH_17");
	TA_Sit_Bench(15,0,18,0,"NW_CITY_UPTOWN_PATH_23");
	TA_Stand_Drinking(18,0,20,0,"NW_CITY_UPTOWN_PATH_17");
	TA_Sit_Chair(20,0,23,0,"NW_CITY_UPTOWN_HUT_03_IN");
	TA_Sleep(23,0,7,0,"NW_CITY_UPTOWN_HUT_03_BED");
};

