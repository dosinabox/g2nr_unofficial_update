
instance BDT_1064_Bandit_L(Npc_Default)
{
	name[0] = "Стражник";
	guild = GIL_BDT;
	id = 1064;
	voice = 4;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_NewsOverride] = TRUE;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_Normal_Orik,BodyTex_B,ITAR_Leather_L);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_Start_1064;
};


func void Rtn_Start_1064()
{
	TA_Guard_Passage(0,0,12,0,"NW_CASTLEMINE_TOWER_BEYOND");
	TA_Guard_Passage(12,0,0,0,"NW_CASTLEMINE_TOWER_BEYOND");
};

