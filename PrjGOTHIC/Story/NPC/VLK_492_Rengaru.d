
instance VLK_492_Rengaru(Npc_Default)
{
	name[0] = "�������";
	guild = GIL_VLK;
	id = 492;
	voice = 7;
	flags = 0;
	npcType = NPCTYPE_MAIN;
	aivar[AIV_SubGuild] = GIL_SUB_Thief_City;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Sword);
	CreateInvItems(self,ItMi_Gold,50);
	CreateInvItems(self,ItFo_Bread,1);
	CreateInvItems(self,ItFo_Water,1);
	CreateInvItems(self,ItFo_Cheese,1);
	B_CreateItemToSteal(self,20,ItMi_SilverRing,1);
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
	TA_Sit_Campfire(23,0,8,0,"NW_CITY_HABOUR_KASERN_RENGARU");
};

func void Rtn_Hide_492()
{
	TA_FleeToWp(8,0,23,0,"NW_CITY_HABOUR_POOR_AREA_PATH_01_03");
	TA_FleeToWp(23,0,8,0,"NW_CITY_HABOUR_POOR_AREA_PATH_01_03");
};

