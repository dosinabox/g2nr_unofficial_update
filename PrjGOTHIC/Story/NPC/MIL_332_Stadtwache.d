
instance Mil_332_Stadtwache(Npc_Default)
{
	name[0] = NAME_Stadtwache;
	guild = GIL_MIL;
	id = 332;
	voice = 4;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Mil_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Normal_Stone,BodyTex_N,ITAR_Mil_L);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_332;
};


func void Rtn_Start_332()
{
	TA_Stand_WP(8,0,22,0,"NW_CITY_ENTRANCE_BACK_GUARD_01");
	TA_Stand_WP(22,0,8,0,"NW_CITY_ENTRANCE_BACK_GUARD_01");
};

