
instance Pal_222_Schiffswache(Npc_Default)
{
	name[0] = NAME_Schiffswache;
	guild = GIL_PAL;
	id = 222;
	voice = 12;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Pal_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_NormalBart09,BodyTex_N,ItAr_PAL_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_222;
};


func void Rtn_Start_222()
{
	TA_Stand_Guarding(8,0,23,0,"SHIP_DECK_26");
	TA_Stand_Guarding(23,0,8,0,"SHIP_DECK_26");
};

func void Rtn_ShipFree_222()
{
	TA_Stand_WP(8,0,23,0,"NW_CITY_UPTOWNPARADE_03");
	TA_Stand_WP(23,0,8,0,"NW_CITY_UPTOWNPARADE_03");
};

