
instance BAU_952_Vino(Npc_Default)
{
	name[0] = "����";
	guild = GIL_OUT;
	id = 952;
	voice = 5;
	flags = 0;
	npcType = NPCTYPE_MAIN;
	aivar[AIV_SubGuild] = GIL_SUB_Lobart;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_1h_Bau_Axe);
	B_CreateAmbientInv(self);
	B_CreateItemToSteal(self,34,ItMi_Gold,60);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fatbald",Face_N_Weak_Herek,BodyTex_N,ITAR_Bau_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,10);
	daily_routine = Rtn_Start_952;
};


func void Rtn_Start_952()
{
	TA_Rake_FP(8,0,12,0,"NW_FARM1_FIELD_04");
	TA_Rake_FP(12,0,15,0,"NW_FARM1_FIELD_05");
	TA_Rake_FP(15,0,17,0,"NW_FARM1_FIELD_04");
	TA_Rake_FP(17,0,18,0,"NW_FARM1_FIELD_05");
	TA_Sit_Campfire(18,0,22,0,"NW_FARM1_MILL_05");
	TA_Sleep(22,0,8,0,"NW_FARM1_INSTABLE_BED");
};

func void Rtn_BugsThere_952()
{
	TA_Stand_Drinking(8,0,22,0,"NW_FARM1_ENTRANCE_03");
	TA_Sleep(22,0,8,0,"NW_FARM1_INSTABLE_BED");
};

func void Rtn_ObesessionRitual_952()
{
	TA_Obesession(7,30,23,0,"NW_LITTLESTONEHENDGE_01");
	TA_Obesession(23,0,7,30,"NW_LITTLESTONEHENDGE_01");
};

func void Rtn_RunFromRitual_952()
{
	TA_FleeToWp(7,30,23,0,"NW_FARM1_OUT_09");
	TA_FleeToWp(23,0,7,30,"NW_FARM1_OUT_09");
};

func void Rtn_Kloster_952()
{
	TA_Stand_Drinking(8,0,22,0,"NW_MONASTERY_PLACE_07");
	TA_Sleep(22,0,8,0,"NW_MONASTERY_NOVICE04_07");
};

func void Rtn_Flee_952()
{
	TA_Stand_Drinking(8,0,22,0,"NW_TAVERNE_CROSS");
	TA_Sleep(22,0,8,0,"NW_TAVERNE_CROSS");
};

