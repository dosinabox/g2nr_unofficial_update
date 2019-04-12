
instance VLK_444_Jack(Npc_Default)
{
	name[0] = "Джек";
	guild = GIL_VLK;
	id = 444;
	voice = 14;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_ImportantOld,BodyTex_N,ITAR_Vlk_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_444;
};


func void Rtn_Start_444()
{
	TA_Sit_Bench(4,45,19,45,"NW_CITY_HABOUR_06_C");
	TA_Sit_Throne(19,45,4,45,"NW_CITY_PUFF_THRONE");
};

func void Rtn_Lighthouse_444()
{
	TA_Sit_Throne(8,0,20,0,"NW_LIGHTHOUSE_IN_03");
	TA_Sleep(20,0,8,0,"NW_LIGHTHOUSE_IN_03");
};

func void Rtn_WaitForShipCaptain_444()
{
	TA_Sit_Bench(8,0,20,0,"NW_WAITFOR_SHIP_CAPTAIN");
	TA_Sit_Bench(0,0,8,0,"NW_WAITFOR_SHIP_CAPTAIN");
};

func void Rtn_AllOnBoard_444()
{
	TA_Stand_WP(8,0,23,0,"SHIP_CREW_CAPTAIN");
	TA_Sleep(23,0,8,0,"SHIP_IN_06");
};

