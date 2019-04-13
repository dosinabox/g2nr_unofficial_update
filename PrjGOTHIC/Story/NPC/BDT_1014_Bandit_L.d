
instance Bdt_1014_Bandit_L(Npc_Default)
{
	name[0] = "Браго";
	guild = GIL_BDT;
	id = 1014;
	voice = 6;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetAttributesToChapter(self,0);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_Nagelknueppel);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItKe_Bandit,1);
	CreateInvItems(self,ItWr_SaturasFirstMessage_Addon_Sealed,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",Face_N_Mud,BodyTex_N,ITAR_Leather_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,10);
	daily_routine = RTN_Start_1014;
};


func void RTN_Start_1014()
{
	TA_Stand_ArmsCrossed(0,0,12,0,"NW_XARDAS_BANDITS_LEFT");
	TA_Stand_ArmsCrossed(12,0,0,0,"NW_XARDAS_BANDITS_LEFT");
};

