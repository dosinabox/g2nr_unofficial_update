
instance VLK_442_Arbeiter(Npc_Default)
{
	name[0] = "Работник";
	guild = GIL_VLK;
	id = 442;
	voice = 6;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_NormalBart_Senyan,BodyTex_N,ITAR_Bau_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_442;
};


func void Rtn_Start_442()
{
	TA_Repair_Hut(5,0,19,0,"NW_CITY_HABOUR_WERFT_ENTRY");
	TA_Smalltalk(19,0,5,0,"NW_CITY_PATH_HABOUR_01");
};

