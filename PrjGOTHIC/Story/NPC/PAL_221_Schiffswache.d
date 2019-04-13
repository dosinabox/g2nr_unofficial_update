
instance Pal_221_Schiffswache(Npc_Default)
{
	name[0] = NAME_Schiffswache;
	guild = GIL_PAL;
	id = 221;
	voice = 9;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Pal_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_NormalBart06,BodyTex_N,ItAr_PAL_M);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_221;
};


func void Rtn_Start_221()
{
	TA_Stand_Guarding(8,0,23,0,"SHIP");
	TA_Stand_Guarding(23,0,8,0,"SHIP");
};

func void Rtn_ShipFree_221()
{
	TA_Stand_WP(8,0,23,0,"NW_CITY_UPTOWNPARADE_02");
	TA_Stand_WP(23,0,8,0,"NW_CITY_UPTOWNPARADE_02");
};

