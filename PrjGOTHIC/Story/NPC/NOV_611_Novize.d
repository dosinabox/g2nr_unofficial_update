
instance NOV_611_Novize(Npc_Default)
{
	name[0] = NAME_Novize;
	guild = GIL_NOV;
	id = 611;
	voice = 3;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Nov_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_Normal03,BodyTex_N,ItAr_NOV_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,15);
	daily_routine = Rtn_Start_611;
};


func void Rtn_Start_611()
{
	TA_Pray_Innos_FP(8,0,9,0,"NW_MONASTERY_CHURCH_03");
	TA_Smalltalk(9,0,23,5,"NW_MONASTERY_GRASS_01");
	TA_Sleep(23,5,8,0,"NW_MONASTERY_NOVICE02_04");
};

func void Rtn_Fegen_611()
{
	TA_Stand_Sweeping(8,0,23,5,"NW_MONASTERY_NOVICE01_02");
	TA_Stand_Sweeping(23,5,8,0,"NW_MONASTERY_NOVICE01_02");
};

