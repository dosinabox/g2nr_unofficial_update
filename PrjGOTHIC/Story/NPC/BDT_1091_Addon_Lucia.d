
instance BDT_1091_Addon_Lucia(Npc_Default)
{
	name[0] = "Люсия";
	guild = GIL_BDT;
	id = 1091;
	voice = 16;
	flags = 0;
	npcType = NPCTYPE_BL_MAIN;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_1h_Vlk_Dagger);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe8",FaceBabe_N_GreyCloth,BodyTexBabe_F,NO_ARMOR);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,25);
	daily_routine = Rtn_Start_1091;
};


func void Rtn_Start_1091()
{
	TA_Stand_WP(7,0,12,0,"BL_INN_05_D");
	TA_Stand_Sweeping(12,0,14,0,"BL_INN_05_B");
	TA_Stand_WP(14,0,1,0,"BL_INN_05_D");
	TA_Potion_Alchemy(1,0,4,0,"BL_INN_UP_LABOR");
	TA_Sleep(4,0,7,0,"BL_INN_UPSIDE_SLEEP_01");
};

