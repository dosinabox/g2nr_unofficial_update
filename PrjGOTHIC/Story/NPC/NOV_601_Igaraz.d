
instance NOV_601_Igaraz(Npc_Default)
{
	name[0] = "Игарац";
	guild = GIL_NOV;
	id = 601;
	voice = 13;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Nov_Mace);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItKe_IgarazChest_Mis,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",Face_N_Normal_Stone,BodyTex_N,itar_nov_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_601;
};


func void Rtn_Start_601()
{
	TA_Smalltalk(9,0,22,4,"NW_MONASTERY_GRASS_01");
	TA_Sleep(22,4,8,0,"NW_MONASTERY_NOVICE02_05");
	TA_Pray_Innos_FP(8,0,9,0,"NW_MONASTERY_CHURCH_03");
};

func void Rtn_CONTEST_601()
{
	TA_Stand_ArmsCrossed(8,0,23,4,"NW_TAVERNE_TROLLAREA_05");
	TA_Stand_ArmsCrossed(23,4,8,0,"NW_TAVERNE_TROLLAREA_05");
};

func void Rtn_CONTESTWAIT_601()
{
	TA_Stand_ArmsCrossed(8,0,23,4,"NW_TAVERNE_TROLLAREA_66");
	TA_Stand_ArmsCrossed(23,4,8,0,"NW_TAVERNE_TROLLAREA_66");
};

