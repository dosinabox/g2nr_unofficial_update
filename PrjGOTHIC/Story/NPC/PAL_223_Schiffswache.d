
instance Pal_223_Schiffswache(Npc_Default)
{
	name[0] = NAME_Schiffswache;
	guild = GIL_PAL;
	id = 223;
	voice = 4;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Pal_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_NormalBart02,BodyTex_N,ItAr_PAL_M);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_223;
};


func void Rtn_Start_223()
{
	TA_Stand_Guarding(8,0,23,0,"SHIP_DECK_37");
	TA_Stand_Guarding(23,0,8,0,"SHIP_DECK_37");
};

func void Rtn_ShipFree_223()
{
	TA_Stand_WP(8,0,23,0,"NW_CITY_UPTOWNPARADE_12");
	TA_Stand_WP(23,0,8,0,"NW_CITY_UPTOWNPARADE_12");
};

