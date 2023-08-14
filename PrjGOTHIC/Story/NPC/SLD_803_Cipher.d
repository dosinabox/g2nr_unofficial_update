
instance SLD_803_Cipher(Npc_Default)
{
	name[0] = "�����";
	guild = GIL_SLD;
	id = 803;
	voice = 7;
	flags = 0;
	npcType = NPCTYPE_MAIN;
	aivar[AIV_NPCIsTrader] = TRUE;
	aivar[AIV_Teeth] = 2;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	CreateInvItems(self,ItRw_Arrow,10);
	EquipItem(self,ItMw_2H_OrcAxe_01);
	EquipItem(self,ItRw_Bow_L_02);
	B_CreateItemToSteal(self,65,ItMi_Gold,65);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_NormalBart10,BodyTex_N,ITAR_SLD_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_803;
};


func void Rtn_Start_803()
{
	TA_Smalltalk(7,35,23,35,"NW_BIGFARM_PATH_04_1");
	TA_Sleep(23,35,7,35,"NW_BIGFARM_STABLE_SLEEP_02");
};

func void Rtn_Tot_803()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

