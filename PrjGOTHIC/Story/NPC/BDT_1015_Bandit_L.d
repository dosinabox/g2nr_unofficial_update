
instance Bdt_1015_Bandit_L(Npc_Default)
{
	name[0] = NAME_Bandit;
	guild = GIL_BDT;
	id = 1015;
	voice = 6;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetAttributesToChapter(self,0);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_1h_Vlk_Dagger);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItWr_BanditLetter_MIS,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_Normal01,BodyTex_B,ItAr_BDT_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,10);
	daily_routine = RTN_Start_1015;
};


func void RTN_Start_1015()
{
	TA_Stand_ArmsCrossed(0,0,12,0,"NW_XARDAS_BANDITS_RIGHT");
	TA_Stand_ArmsCrossed(12,0,0,0,"NW_XARDAS_BANDITS_RIGHT");
};

