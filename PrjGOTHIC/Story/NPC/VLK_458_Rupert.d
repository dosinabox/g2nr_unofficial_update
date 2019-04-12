
instance VLK_458_Rupert(Npc_Default)
{
	name[0] = "Руперт";
	guild = GIL_VLK;
	id = 458;
	voice = 3;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_1h_Vlk_Dagger);
	CreateInvItems(self,ItFo_Apple,12);
	CreateInvItems(self,ItFo_Bread,5);
	CreateInvItems(self,ItFo_Milk,5);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal20,BodyTex_N,ITAR_Vlk_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_458;
};


func void Rtn_Start_458()
{
	TA_Stand_Sweeping(5,0,6,0,"NW_CITY_MAINSTREET_02");
	TA_Stand_WP(6,0,9,30,"NW_CITY_MERCHANT_TRADE_01");
	TA_Stand_Sweeping(9,30,10,0,"NW_CITY_MAINSTREET_02");
	TA_Stand_WP(10,0,12,55,"NW_CITY_MERCHANT_TRADE_01");
	TA_Pee(12,55,13,30,"NW_CITY_MERCHANT_TRADE_03");
	TA_Stand_WP(14,0,15,30,"NW_CITY_MERCHANT_TRADE_01");
	TA_Stand_Sweeping(15,30,16,0,"NW_CITY_MAINSTREET_02");
	TA_Stand_WP(16,0,16,25,"NW_CITY_MERCHANT_TRADE_01");
	TA_Pee(16,25,16,30,"NW_CITY_MERCHANT_TRADE_03");
	TA_Stand_WP(16,30,17,30,"NW_CITY_MERCHANT_TRADE_01");
	TA_Stand_Sweeping(17,30,18,0,"NW_CITY_MAINSTREET_02");
	TA_Stand_WP(18,0,20,0,"NW_CITY_MERCHANT_TRADE_01");
	TA_Sit_Chair(20,0,0,0,"NW_CITY_SHOP02_SIT");
	TA_Sleep(0,0,5,0,"NW_CITY_BED_RUPERT");
};

