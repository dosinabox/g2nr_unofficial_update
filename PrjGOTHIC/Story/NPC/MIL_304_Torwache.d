
instance Mil_304_Torwache(Npc_Default)
{
	name[0] = NAME_Torwache;
	guild = GIL_MIL;
	id = 304;
	voice = 8;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Mil_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal16,BodyTex_N,ItAr_PAL_M);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_Start_304;
};


func void Rtn_Start_304()
{
	TA_Stand_WP(8,0,22,0,"NW_CITY_UPTOWN_GUARD_01");
	TA_Stand_WP(22,0,8,0,"NW_CITY_UPTOWN_GUARD_01");
};

