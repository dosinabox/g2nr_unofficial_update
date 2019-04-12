
instance VLK_477_Buergerin(Npc_Default)
{
	name[0] = NAME_Buergerin;
	guild = GIL_VLK;
	id = 477;
	voice = 17;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	EquipItem(self,ItMw_1h_Vlk_Dagger);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe1",FaceBabe_N_Anne,BodyTex_N,ITAR_VlkBabe_L);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,35);
	daily_routine = Rtn_Start_477;
};


func void Rtn_Start_477()
{
	TA_Stand_Eating(5,5,11,55,"NW_CITY_PATH_HABOUR_03");
	TA_Stand_Eating(11,55,14,5,"NW_CITY_WAY_TO_SHIP_01");
	TA_Stand_Eating(14,5,15,55,"NW_CITY_PATH_HABOUR_03");
	TA_Stand_Eating(15,55,19,5,"NW_CITY_WAY_TO_SHIP_01");
	TA_Cook_Stove(19,5,21,5,"NW_CITY_BED_BRAHIM");
	TA_Sleep(21,5,5,5,"NW_CITY_BED_BRAHIM");
};

