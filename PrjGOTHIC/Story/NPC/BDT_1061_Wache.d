
instance BDT_1061_Wache(Npc_Default)
{
	name[0] = NAME_Wache;
	guild = GIL_BDT;
	id = 1061;
	voice = 1;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_ShortSword2);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_NormalBart17,BodyTex_N,ITAR_Leather_L);
	Mdl_SetModelFatness(self,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_1061;
};


func void Rtn_Start_1061()
{
	TA_Stand_Guarding(0,0,12,0,"NW_CASTLEMINE_PATH_02");
	TA_Stand_Guarding(12,0,0,0,"NW_CASTLEMINE_PATH_02");
};

