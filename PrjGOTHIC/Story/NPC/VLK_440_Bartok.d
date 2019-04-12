
instance VLK_440_Bartok(Npc_Default)
{
	name[0] = "Барток";
	guild = GIL_VLK;
	id = 440;
	voice = 4;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItRw_Bow_M_03);
	EquipItem(self,ItMW_Addon_Hacker_1h_01);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItRw_Arrow,40);
	CreateInvItems(self,ItPo_Health_03,5);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_Important_Arto,BodyTex_N,ITAR_Vlk_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_440;
};


func void Rtn_Start_440()
{
	TA_Stand_Drinking(7,0,9,15,"NW_CITY_MERCHANT_PATH_33");
	TA_Stand_Eating(9,15,10,45,"NW_CITY_MERCHANT_PATH_30");
	TA_Stand_Drinking(10,45,15,15,"NW_CITY_MERCHANT_PATH_33");
	TA_Stand_Eating(15,15,16,45,"NW_CITY_MERCHANT_PATH_30");
	TA_Stand_Drinking(16,45,20,45,"NW_CITY_MERCHANT_PATH_33");
	TA_Sit_Bench(20,45,21,45,"NW_CITY_MERCHANT_TAVERN01_FRONT");
	TA_Stand_Drinking(21,45,0,45,"NW_CITY_MERCHANT_TAVERN01_FRONT");
	TA_Sit_Chair(0,45,4,45,"TAVERN02_B");
	TA_Sit_Bench(4,45,7,0,"NW_CITY_MERCHANT_TAVERN01_FRONT");
};

func void Rtn_GuideMitte_440()
{
	TA_Guide_Player(8,0,20,0,"NW_FARM1_CITYWALL_FOREST_03");
	TA_Guide_Player(20,0,8,0,"NW_FARM1_CITYWALL_FOREST_03");
};

func void Rtn_GuideEnde_440()
{
	TA_Guide_Player(8,0,20,0,"NW_FARM1_CITYWALL_FOREST_07");
	TA_Guide_Player(20,0,8,0,"NW_FARM1_CITYWALL_FOREST_07");
};

