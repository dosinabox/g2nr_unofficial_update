
instance BDT_1052_Wegelagerer(Npc_Default)
{
	name[0] = "Ѕрод€га";
	guild = GIL_BDT;
	id = 1051;
	voice = 6;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_2h_Sld_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Normal07,BodyTex_N,ItAr_BDT_M);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	start_aistate = ZS_Smalltalk;
};

