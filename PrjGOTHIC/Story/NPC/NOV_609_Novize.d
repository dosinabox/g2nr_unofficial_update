
instance NOV_609_Novize(Npc_Default)
{
	name[0] = NAME_Novize;
	guild = GIL_NOV;
	id = 609;
	voice = 8;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Nov_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal06,BodyTex_N,ItAr_NOV_L);
	Mdl_SetModelFatness(self,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_609;
};


func void Rtn_Start_609()
{
	TA_Pray_Innos_FP(8,0,23,0,"NW_MONASTERY_CHURCH_03");
	TA_Sleep(23,0,8,0,"NW_MONASTERY_NOVICE02_06");
};

func void Rtn_Fegen_609()
{
	TA_Stand_Sweeping(8,0,23,0,"NW_MONASTERY_NOVICE02_02");
	TA_Stand_Sweeping(23,0,8,0,"NW_MONASTERY_NOVICE02_02");
};

