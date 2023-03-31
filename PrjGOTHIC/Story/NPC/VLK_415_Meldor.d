
instance VLK_415_Meldor(Npc_Default)
{
	name[0] = "Ìוכהמנ";
	guild = GIL_VLK;
	id = 415;
	voice = 7;
	flags = 0;
	npcType = NPCTYPE_MAIN;
	aivar[AIV_ToughGuy] = TRUE;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_1h_Sld_Sword);
	B_CreateAmbientInv(self);
	B_CreateItemToSteal(self,34,ItMi_Gold,55);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_P_NormalBald,BodyTex_P,ITAR_Vlk_L);
	Mdl_SetModelFatness(self,0.8);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,35);
	daily_routine = Rtn_Start_415;
};


func void Rtn_Start_415()
{
	TA_Smoke_Joint(5,5,23,55,"NW_CITY_HABOUR_POOR_AREA_PATH_20");
	TA_Sleep(23,55,5,5,"NW_CITY_HABOUR_HUT_04_BED_02");
};

