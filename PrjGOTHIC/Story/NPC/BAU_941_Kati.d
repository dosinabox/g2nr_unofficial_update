
instance BAU_941_Kati(Npc_Default)
{
	name[0] = "Кати";
	guild = GIL_OUT;
	id = 941;
	voice = 16;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe8",FaceBabe_N_Lilo,BodyTexBabe_N,ITAR_BauBabe_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,15);
	daily_routine = Rtn_PreStart_941;
};


func void Rtn_PreStart_941()
{
	TA_Stand_ArmsCrossed(8,0,22,0,"NW_FARM2_PATH_01");
	TA_Stand_ArmsCrossed(22,0,8,0,"NW_FARM2_PATH_01");
};

func void Rtn_Start_941()
{
	TA_Cook_Stove(5,0,10,0,"NW_FARM2_HOUSE_IN_04");
	TA_Sit_Bench(10,0,12,0,"NW_FARM2_BENCH_02");
	TA_Cook_Stove(12,0,20,55,"NW_FARM2_HOUSE_IN_04");
	TA_Roast_Scavenger(20,55,23,59,"NW_FARM2_BBQ");
	TA_Sleep(23,59,5,0,"NW_FARM2_HOUSE_IN_02");
};

