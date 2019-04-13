
instance BDT_10022_Addon_Miguel(Npc_Default)
{
	name[0] = "Мигель";
	guild = GIL_BDT;
	id = 10022;
	voice = 11;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_Nagelknueppel);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItPo_Health_01,20);
	CreateInvItems(self,ItPo_Health_02,8);
	CreateInvItems(self,ItPo_Health_03,5);
	CreateInvItems(self,ItPo_Mana_01,7);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_P_OldMan_Gravo,BodyTex_P,ItAr_BDT_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_10022;
};


func void Rtn_Start_10022()
{
	TA_Pick_FP(6,0,12,0,"ADW_PATH_TO_VP3_01");
	TA_Pick_FP(12,0,18,0,"ADW_PATH_TO_VP3_02");
	TA_Pick_FP(18,0,22,0,"ADW_PATH_TO_VP3_03");
	TA_Sit_Bench(22,0,6,0,"ADW_SWAMP_SIT_BENCH_03");
};

