
instance BDT_1060_Dexter(Npc_Default)
{
	name[0] = "Декстер";
	guild = GIL_BDT;
	id = 1060;
	voice = 9;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_ShortSword2);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItKe_Dexter,1);
	CreateInvItems(self,ItWr_RavensKidnapperMission_Addon,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_NormalBart_Dexter,BodyTex_N,ITAR_Diego);
	Mdl_SetModelFatness(self,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_1060;
};


func void Rtn_Start_1060()
{
	TA_Sit_Throne(0,0,12,0,"NW_CASTLEMINE_HUT_10");
	TA_Sit_Throne(12,0,0,0,"NW_CASTLEMINE_HUT_10");
};

