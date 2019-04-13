
instance Pal_224_Schiffswache(Npc_Default)
{
	name[0] = NAME_Schiffswache;
	guild = GIL_PAL;
	id = 224;
	voice = 9;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Pal_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_B_Normal_Kirgo,BodyTex_B,ItAr_PAL_M);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_224;
};


func void Rtn_Start_224()
{
	TA_Stand_Guarding(8,0,23,0,"SHIP_DECK_31");
	TA_Stand_Guarding(23,0,8,0,"SHIP_DECK_31");
};

func void Rtn_ShipFree_224()
{
	TA_Stand_WP(8,0,23,0,"NW_CITY_UPTOWNPARADE_05");
	TA_Stand_WP(23,0,8,0,"NW_CITY_UPTOWNPARADE_05");
};

