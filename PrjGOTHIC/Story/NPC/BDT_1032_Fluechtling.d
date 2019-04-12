
instance BDT_1032_Fluechtling(Npc_Default)
{
	name[0] = NAME_Fluechtling;
	guild = GIL_BDT;
	id = 1032;
	voice = 6;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_NormalBart09,BodyTex_N,ITAR_Leather_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_Start_1032;
};


func void Rtn_Start_1032()
{
	TA_Sleep(8,0,23,0,"NW_XARDAS_BANDITS_LEFT");
	TA_Sleep(23,0,8,0,"NW_XARDAS_BANDITS_LEFT");
};

