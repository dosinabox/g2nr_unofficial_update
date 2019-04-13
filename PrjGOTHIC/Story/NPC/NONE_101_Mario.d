
instance None_101_Mario(Npc_Default)
{
	name[0] = "Марио";
	guild = GIL_NONE;
	id = 101;
	voice = 7;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2h_Sld_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_B_Normal_Kirgo,BodyTex_B,ItAr_MIL_M);
	Mdl_SetModelFatness(self,1.2);
	Mdl_ApplyOverlayMds(self,"Humans_MILITIA.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,85);
	daily_routine = Rtn_Start_101;
};


func void Rtn_Start_101()
{
	TA_Stand_Drinking(8,0,21,0,"NW_CITY_HABOUR_TAVERN01_STAND_01");
	TA_Stand_Drinking(21,0,8,0,"NW_CITY_HABOUR_TAVERN01_STAND_01");
};

func void Rtn_WaitForShip_101()
{
	TA_Stand_Drinking(8,0,19,0,"NW_WAITFOR_SHIP_01");
	TA_Stand_Drinking(19,0,8,0,"NW_WAITFOR_SHIP_01");
};

func void Rtn_ShipOff_101()
{
	TA_Stand_Drinking(8,0,21,0,"NW_CITY_HABOUR_TAVERN01_STAND_01");
	TA_Stand_Drinking(21,0,8,0,"NW_CITY_HABOUR_TAVERN01_STAND_01");
};

func void Rtn_Ship_101()
{
	TA_Sit_Bench(8,0,23,0,"SHIP_DECK_25");
	TA_Sit_Bench(23,0,8,0,"SHIP_DECK_25");
};

