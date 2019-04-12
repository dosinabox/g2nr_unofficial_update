
instance BDT_1031_Fluechtling(Npc_Default)
{
	name[0] = NAME_Fluechtling;
	guild = GIL_BDT;
	id = 1031;
	voice = 7;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Sword);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItWr_MorgahardTip,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_Normal01,BodyTex_B,ITAR_Leather_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_Start_1031;
};


func void Rtn_Start_1031()
{
	TA_Sit_Chair(8,0,23,0,"NW_XARDAS_BANDITS_LEFT");
	TA_Sit_Chair(23,0,8,0,"NW_XARDAS_BANDITS_LEFT");
};

