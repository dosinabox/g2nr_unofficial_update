
instance VLK_492_Rengaru(Npc_Default)
{
	name[0] = "Ренгару";
	guild = GIL_VLK;
	id = 492;
	voice = 7;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Sword);
	CreateInvItems(self,ItMi_Gold,50);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_ToughBart01,BodyTex_N,ITAR_Vlk_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_492;
};


func void Rtn_Start_492()
{
	TA_Stand_ArmsCrossed(5,15,20,15,"NW_CITY_MERCHANT_PATH_36");
	TA_Stand_Drinking(20,15,5,15,"NW_CITY_MERCHANT_PATH_33_B");
};

func void Rtn_RunAway_492()
{
	TA_FleeToWp(8,0,23,0,"NW_CITY_HABOUR_KASERN_05_01");
	TA_FleeToWp(23,0,8,0,"NW_CITY_HABOUR_KASERN_05_01");
};

func void Rtn_Prison_492()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"NW_CITY_HABOUR_KASERN_RENGARU");
	TA_Stand_ArmsCrossed(23,0,8,0,"NW_CITY_HABOUR_KASERN_RENGARU");
};

