
instance BAU_951_Hilda(Npc_Default)
{
	name[0] = "Хильда";
	guild = GIL_OUT;
	id = 951;
	voice = 17;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe8",FaceBabe_N_WhiteCloth,BodyTexBabe_N,ITAR_BauBabe_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,10);
	daily_routine = Rtn_Start_951;
};


func void Rtn_Start_951()
{
	TA_Cook_Stove(8,0,22,0,"NW_FARM1_INHOUSE_02");
	TA_Sleep(22,0,8,0,"NW_FARM1_INHOUSE_BED_02");
};

func void Rtn_Krank_951()
{
	TA_Sleep(8,0,22,0,"NW_FARM1_INHOUSE_BED_02");
	TA_Sleep(22,0,8,0,"NW_FARM1_INHOUSE_BED_02");
};

