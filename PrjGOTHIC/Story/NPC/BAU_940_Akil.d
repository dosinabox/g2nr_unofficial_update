
instance BAU_940_Akil(Npc_Default)
{
	name[0] = "Акил";
	guild = GIL_OUT;
	id = 940;
	voice = 13;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_HITPOINTS_MAX] = 300;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_NormalBart_Grim,BodyTex_N,ITAR_Bau_M);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,40);
	daily_routine = Rtn_PreStart_940;
};


func void Rtn_PreStart_940()
{
	TA_Smalltalk(8,0,22,0,"NW_FARM2_PATH_02");
	TA_Smalltalk(22,0,8,0,"NW_FARM2_PATH_02");
};

func void Rtn_Start_940()
{
	TA_Sit_Bench(5,0,10,0,"NW_FARM2_BENCH_02");
	TA_Stand_Guarding(10,0,12,0,"NW_FARM2_PATH_01_B");
	TA_Sit_Bench(12,0,14,0,"NW_FARM2_BENCH_02");
	TA_Stand_Guarding(14,0,16,0,"NW_FARM2_FIELD_01");
	TA_Sit_Bench(16,0,21,0,"NW_FARM2_BENCH_02");
	TA_Sit_Bench(21,0,0,0,"NW_FARM2_OUT_06");
	TA_Sleep(0,0,5,0,"NW_FARM2_HOUSE_IN_02");
};

