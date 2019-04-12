
instance VLK_404_Lutero(Npc_Default)
{
	name[0] = "Лютеро";
	guild = GIL_VLK;
	id = 404;
	voice = 13;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Vlk_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_P_Normal02,BodyTex_P,ITAR_Governor);
	Mdl_SetModelFatness(self,3);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_404;
};


func void Rtn_Start_404()
{
	TA_Smalltalk(8,0,12,0,"NW_CITY_LUTERO");
	TA_Sit_Bench(12,0,15,0,"NW_CITY_UPTOWN_PATH_27");
	TA_Smalltalk(15,0,18,0,"NW_CITY_LUTERO");
	TA_Sit_Bench(18,0,20,0,"NW_CITY_UPTOWN_PATH_27");
	TA_Read_Bookstand(20,0,22,0,"NW_CITY_LUTERO_READ");
	TA_Sit_Throne(22,0,0,0,"NW_CITY_UPTOWN_HUT_04_05");
	TA_Sleep(0,0,8,0,"NW_CITY_LUTERO_BED");
};

