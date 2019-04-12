
instance VLK_489_Buerger(Npc_Default)
{
	name[0] = NAME_Buerger;
	guild = GIL_VLK;
	id = 489;
	voice = 8;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal14,BodyTex_N,ITAR_Vlk_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_489;
};


func void Rtn_Start_489()
{
	TA_Smoke_Joint(11,20,19,15,"NW_CITY_WATCH_FIGHT_02");
	TA_Stand_Drinking(19,15,2,30,"NW_CITY_HABOUR_03");
	TA_Pee(21,0,21,5,"NW_CITY_HABOUR_PUFF_02_01");
	TA_Stand_Drinking(21,5,2,30,"NW_CITY_HABOUR_03");
	TA_Stand_Drinking(2,30,5,20,"NW_CITY_HABOUR_PUFF_IN_07");
	TA_Smoke_Joint(5,20,11,20,"NW_CITY_PATH_HABOUR_01");
};

