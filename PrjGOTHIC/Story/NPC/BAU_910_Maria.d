
instance BAU_910_Maria(Npc_Default)
{
	name[0] = "Мария";
	guild = GIL_BAU;
	id = 910;
	voice = 17;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe8",FaceBabe_N_MidBauBlonde,BodyTexBabe_N,ITAR_BauBabe_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,10);
	daily_routine = Rtn_Start_910;
};


func void Rtn_Start_910()
{
	TA_Sit_Throne(8,0,22,0,"NW_BIGFARM_HOUSE_UP1_SESSEL");
	TA_Sleep(22,0,8,0,"NW_BIGFARM_HOUSE_UP1_04");
};

