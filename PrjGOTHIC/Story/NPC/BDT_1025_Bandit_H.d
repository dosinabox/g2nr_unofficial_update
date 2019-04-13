
instance BDT_1025_Bandit_H(Npc_Default)
{
	name[0] = NAME_Bandit;
	guild = GIL_BDT;
	id = 1025;
	voice = 9;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Sword);
	EquipItem(self,ItRw_Sld_Bow);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_B_Normal01,BodyTex_B,ItAr_BDT_H);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_1025;
};


func void Rtn_Start_1025()
{
	TA_Stand_Guarding(8,0,22,0,"NW_FOREST_CAVE1_02");
	TA_Stand_Guarding(22,0,8,0,"NW_FOREST_CAVE1_02");
};

