
instance PAL_299_Sergio(Npc_Default)
{
	name[0] = "Сержио";
	guild = GIL_PAL;
	id = 299;
	voice = 4;
	flags = 0;
	npcType = NPCTYPE_MAIN;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_2h_Pal_Sword);
	B_CreateAmbientInv(self);
	B_CreateItemToSteal(self,78,ItMi_Gold,85);
	CreateInvItems(self,ItKe_Innos_MIS,1);
	CreateInvItems(self,ItPo_Health_02,4);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_Normal_Erpresser,BodyTex_N,ITAR_PAL_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
//	B_SetFightSkills(self,65);
	B_SetTeacherFightSkills(self,65,90,65,65);
	daily_routine = Rtn_Start_299;
};


func void Rtn_Start_299()
{
	TA_Pray_Innos_FP(8,0,23,0,"NW_MONASTERY_CHAPELL_02");
	TA_Pray_Innos_FP(23,0,8,0,"NW_MONASTERY_CHAPELL_02");
};

func void Rtn_Train_299()
{
	TA_Pray_Innos_FP(7,0,23,0,"NW_MONASTERY_CHAPELL_02");
	TA_Pray_Innos_FP(23,0,5,0,"NW_MONASTERY_CHAPELL_02");
	TA_Practice_Sword(5,0,7,0,"NW_MONASTERY_TRAIN_01");
};

func void Rtn_Guide_299()
{
	TA_Guide_Player(8,0,23,0,"NW_TO_PASS_01");
	TA_Guide_Player(23,0,8,0,"NW_TO_PASS_01");
};

