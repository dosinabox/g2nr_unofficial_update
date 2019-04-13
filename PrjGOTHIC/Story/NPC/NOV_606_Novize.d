
instance NOV_606_Novize(Npc_Default)
{
	name[0] = NAME_Novize;
	guild = GIL_NOV;
	id = 606;
	voice = 3;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Nov_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal08,BodyTex_N,ItAr_NOV_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_606;
};


func void Rtn_Start_606()
{
	TA_Stomp_Herb(8,0,11,0,"NW_MONASTERY_WINEMAKER_04");
	TA_Pray_Innos_FP(11,0,12,0,"NW_MONASTERY_CHURCH_03");
	TA_Stomp_Herb(12,0,22,30,"NW_MONASTERY_WINEMAKER_04");
	TA_Sleep(22,30,8,0,"NW_MONASTERY_NOVICE03_04");
};

