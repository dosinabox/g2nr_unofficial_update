
instance VLK_405_Fernando(Npc_Default)
{
	name[0] = "Фернандо";
	guild = GIL_VLK;
	id = 405;
	voice = 14;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Vlk_Mace);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItSe_GoldPocket100,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Corristo,BodyTex_N,ITAR_Governor);
	Mdl_SetModelFatness(self,3);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_405;
};


func void Rtn_Start_405()
{
	TA_Sleep(22,5,7,59,"NW_CITY_REICH02_BED_01");
	TA_Smalltalk(7,59,11,0,"NW_CITY_UPTOWN_PATH_08");
	TA_Stand_WP(11,0,14,59,"NW_CITY_UPTOWN_PATH_04");
	TA_Smalltalk(14,59,18,0,"NW_CITY_UPTOWN_PATH_08");
	TA_Read_Bookstand(18,0,20,0,"NW_CITY_REICH02_READ");
	TA_Read_Bookstand(20,0,22,5,"NW_CITY_REICH02_READ");
};

func void Rtn_Wait_405()
{
	TA_Smalltalk(7,59,11,0,"NW_CITY_UPTOWN_PATH_08");
	TA_Stand_WP(11,0,14,59,"NW_CITY_UPTOWN_PATH_04");
	TA_Smalltalk(14,59,18,0,"NW_CITY_UPTOWN_PATH_08");
	TA_Stand_WP(18,0,7,59,"NW_CITY_UPTOWN_PATH_04");
};

func void Rtn_Prison_405()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"NW_CITY_HABOUR_KASERN_RENGARU");
	TA_Stand_ArmsCrossed(23,0,8,0,"NW_CITY_HABOUR_KASERN_RENGARU");
};

