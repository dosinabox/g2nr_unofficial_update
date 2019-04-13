
instance Pal_225_Schiffswache(Npc_Default)
{
	name[0] = NAME_Schiffswache;
	guild = GIL_PAL;
	id = 225;
	voice = 12;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Pal_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_NormalBart_Huno,BodyTex_N,ItAr_PAL_M);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_225;
};


func void Rtn_Start_225()
{
	TA_Stand_Guarding(8,0,23,0,"SHIP_DECK_13");
	TA_Stand_Guarding(23,0,8,0,"SHIP_DECK_13");
};

func void Rtn_ShipFree_225()
{
	TA_Stand_WP(8,0,23,0,"NW_CITY_UPTOWNPARADE_06");
	TA_Stand_WP(23,0,8,0,"NW_CITY_UPTOWNPARADE_06");
};

