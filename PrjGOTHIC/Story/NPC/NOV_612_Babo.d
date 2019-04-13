
instance NOV_612_Babo(Npc_Default)
{
	name[0] = "Бабо";
	guild = GIL_NOV;
	id = 612;
	voice = 3;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Nov_Mace);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItMw_1h_Nov_Mace,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_Normal07,BodyTex_N,ItAr_NOV_L);
	Mdl_SetModelFatness(self,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_612;
};


func void Rtn_Start_612()
{
	TA_Stand_Sweeping(8,0,14,0,"NW_MONASTERY_CORRIDOR_10");
	TA_Pray_Innos_FP(14,0,15,0,"NW_MONASTERY_CHURCH_03");
	TA_Stand_Sweeping(15,0,23,30,"NW_MONASTERY_CORRIDOR_10");
	TA_Sleep(23,30,8,0,"NW_MONASTERY_NOVICE04_05");
};

func void Rtn_Train_612()
{
	TA_Sleep(23,30,5,0,"NW_MONASTERY_NOVICE04_05");
	TA_Practice_Sword(5,0,7,0,"NW_MONASTERY_TRAIN_02");
	TA_Stand_Sweeping(7,0,14,0,"NW_MONASTERY_CORRIDOR_10");
	TA_Pray_Innos_FP(14,0,15,0,"NW_MONASTERY_CHURCH_03");
	TA_Stand_Sweeping(15,0,23,30,"NW_MONASTERY_CORRIDOR_10");
};

func void Rtn_Fegen_612()
{
	TA_Stand_Sweeping(8,0,23,30,"NW_MONASTERY_NOVICE04_02");
	TA_Stand_Sweeping(23,30,8,0,"NW_MONASTERY_NOVICE04_02");
};

func void Rtn_Favour_612()
{
	TA_Rake_FP(8,0,23,30,"NW_MONASTERY_HERB_05");
	TA_Sleep(23,30,8,0,"NW_MONASTERY_NOVICE04_05");
};

