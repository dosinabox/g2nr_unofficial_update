
instance VLK_468_Canthar(Npc_Default)
{
	name[0] = "Кантар";
	guild = GIL_NONE;
	id = 468;
	voice = 9;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Vlk_Sword);
	CreateInvItems(self,ItMi_Gold,50);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Weak_Orry,BodyTex_N,ITAR_Vlk_M);
	Mdl_SetModelFatness(self,1.8);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_PreStart_468;
};


func void Rtn_PreStart_468()
{
	TA_Sit_Bench(8,0,23,0,"NW_FARM1_PATH_CITY_SHEEP_05");
	TA_Sit_Bench(23,0,8,0,"NW_FARM1_PATH_CITY_SHEEP_05");
};

func void Rtn_Start_468()
{
	TA_Sit_Bench(7,45,19,45,"NW_CITY_MERCHANT_PATH_30");
	TA_Smoke_Waterpipe(19,45,0,45,"NW_CITY_RAUCH_05");
	TA_Sleep(0,45,7,45,"NW_CITY_HOTEL_BED_01");
};

func void Rtn_Marktstand_468()
{
	TA_Stand_ArmsCrossed(7,45,19,45,"NW_CITY_SARAH");
	TA_Smoke_Waterpipe(19,45,0,45,"NW_CITY_RAUCH_05");
	TA_Sleep(0,45,7,45,"NW_CITY_HOTEL_BED_01");
};

func void Rtn_Knast_468()
{
	TA_Sit_Bench(8,0,23,0,"NW_CITY_HABOUR_KASERN_RENGARU");
	TA_Sit_Bench(23,0,8,0,"NW_CITY_HABOUR_KASERN_RENGARU");
};

