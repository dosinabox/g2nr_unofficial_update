
instance BDT_1092_Addon_Isabel(Npc_Default)
{
	name[0] = "Изабель";
	guild = GIL_BDT;
	id = 1092;
	voice = 17;
	flags = 0;
	npcType = NPCTYPE_BL_MAIN;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe",FaceBabe_N_BlackHair,BodyTexBabe_S,NO_ARMOR);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,25);
	daily_routine = Rtn_Start_1092;
};


func void Rtn_Start_1092()
{
	TA_Smalltalk(7,1,12,0,"BL_INN_UP_07");
	TA_Stand_Drinking(12,0,1,5,"BL_INN_UP_05");
	TA_Sleep(1,5,7,1,"BL_INN_UPSIDE_SLEEP_02");
};

