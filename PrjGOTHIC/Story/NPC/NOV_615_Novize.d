
instance NOV_615_Novize(Npc_Default)
{
	name[0] = NAME_Novize;
	guild = GIL_NOV;
	id = 615;
	voice = 3;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Nov_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_P_NormalBart_Riordian,BodyTex_P,ItAr_NOV_L);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_615;
};


func void Rtn_Start_615()
{
	TA_Stand_Sweeping(8,0,15,0,"NW_MONASTERY_CELLAR_08");
	TA_Pray_Innos_FP(15,0,16,0,"NW_MONASTERY_CHURCH_03");
	TA_Stand_Sweeping(16,0,22,0,"NW_MONASTERY_CELLAR_08");
	TA_Sleep(22,0,8,0,"NW_MONASTERY_NOVICE04_04");
};

func void Rtn_Fegen_615()
{
	TA_Stand_Sweeping(8,0,22,0,"NW_MONASTERY_NOVICE03_02");
	TA_Stand_Sweeping(22,0,8,0,"NW_MONASTERY_NOVICE03_02");
};

