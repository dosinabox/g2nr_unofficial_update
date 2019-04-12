
instance BDT_1079_Addon_Carlos(Npc_Default)
{
	name[0] = "Карлос";
	guild = GIL_BDT;
	id = 1079;
	voice = 12;
	flags = 0;
	npcType = NPCTYPE_BL_MAIN;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FIGHTER",Face_L_Ian,BodyTex_L,ITAR_Bloodwyn_Addon);
	Mdl_SetModelFatness(self,0.5);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_PreStart_1079;
};


func void Rtn_PreStart_1079()
{
	TA_Stand_Guarding(0,0,12,0,"BL_WAIT_CARLOS");
	TA_Stand_Guarding(12,0,0,0,"BL_WAIT_CARLOS");
};

func void Rtn_Start_1079()
{
	TA_Stand_Guarding(6,0,20,0,"ADW_PATH_TO_BL_02");
	TA_Stand_Guarding(20,0,0,0,"BANDIT_FIGHT");
	TA_Stand_Eating(0,0,3,0,"BANDIT_FIGHT");
	TA_Stand_Drinking(3,0,6,0,"BANDIT_FIGHT");
};

