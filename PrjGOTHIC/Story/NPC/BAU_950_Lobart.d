
instance BAU_950_Lobart(Npc_Default)
{
	name[0] = "Лобарт";
	guild = GIL_OUT;
	id = 950;
	voice = 5;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_NormalBart_Senyan,BodyTex_N,ITAR_Bau_M);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,20);
	daily_routine = Rtn_Start_950;
};


func void Rtn_Start_950()
{
	TA_Stand_Guarding(7,30,23,0,"NW_FARM1_LOBART");
	TA_Sleep(23,0,7,30,"NW_FARM1_INHOUSE_BED_01");
};

func void Rtn_ObesessionRitual_950()
{
	TA_Stand_Guarding(7,30,23,0,"NW_FARM1_OUT_05");
	TA_Stand_Guarding(23,0,7,30,"NW_FARM1_OUT_05");
};

