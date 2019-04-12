
instance VLK_481_Buerger(Npc_Default)
{
	name[0] = NAME_Buerger;
	guild = GIL_VLK;
	id = 474;
	voice = 8;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Dagger);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal20,BodyTex_N,ITAR_Vlk_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_481;
};


func void Rtn_Start_481()
{
	TA_Cook_Cauldron(5,5,12,5,"NW_CITY_PATH_HABOUR_13_C");
	TA_Smalltalk(12,5,15,55,"NW_CITY_HABOUR_SMALLTALK_02");
	TA_Cook_Cauldron(15,55,20,5,"NW_CITY_PATH_HABOUR_13_C");
	TA_Smalltalk(20,5,23,55,"NW_CITY_HABOUR_SMALLTALK_02");
	TA_Sleep(23,55,5,5,"NW_CITY_HABOUR_HUT_06_BED_02");
};

