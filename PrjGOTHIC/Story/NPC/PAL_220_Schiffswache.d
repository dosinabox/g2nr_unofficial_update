
instance Pal_220_Schiffswache(Npc_Default)
{
	name[0] = NAME_Schiffswache;
	guild = GIL_PAL;
	id = 220;
	voice = 4;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Pal_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_NormalBart05,BodyTex_N,ItAr_PAl_H);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_220;
};


func void Rtn_Start_220()
{
	TA_Stand_Guarding(8,0,23,0,"SHIP_DECK_05");
	TA_Stand_Guarding(23,0,8,0,"SHIP_DECK_05");
};

func void Rtn_ShipFree_220()
{
	TA_Stand_WP(8,0,23,0,"NW_CITY_UPTOWNPARADE_01");
	TA_Stand_WP(23,0,8,0,"NW_CITY_UPTOWNPARADE_01");
};

