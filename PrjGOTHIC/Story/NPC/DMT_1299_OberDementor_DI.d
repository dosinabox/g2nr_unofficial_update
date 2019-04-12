
instance DMT_1299_OberDementor_DI(Npc_Default)
{
	name[0] = "Черный маг";
	guild = GIL_DMT;
	id = 1299;
	voice = 9;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	bodyStateInterruptableOverride = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_STRONG;
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItWr_LastDoorToUndeadDrgDI_MIS,1);
	CreateInvItems(self,ItKe_ChestMasterDementor_MIS,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_MadPsi,BodyTex_N,ITAR_Xardas);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,90);
	daily_routine = Rtn_Start_1299;
};


func void Rtn_Start_1299()
{
	TA_Stand_Dementor(8,0,23,0,"DI_SCHWARZMAGIER");
	TA_Stand_Dementor(23,0,8,0,"DI_SCHWARZMAGIER");
};

