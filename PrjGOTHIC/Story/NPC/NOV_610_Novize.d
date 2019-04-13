
instance NOV_610_Novize(Npc_Default)
{
	name[0] = NAME_Novize;
	guild = GIL_NOV;
	id = 610;
	voice = 8;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Nov_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal04,BodyTex_N,ItAr_NOV_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_610;
};


func void Rtn_Start_610()
{
	TA_Pick_FP(8,0,13,0,"NW_MONASTERY_HERB_03");
	TA_Pray_Innos_FP(13,0,14,0,"NW_MONASTERY_CHURCH_03");
	TA_Pick_FP(14,0,22,50,"NW_MONASTERY_HERB_03");
	TA_Sleep(22,50,8,0,"NW_MONASTERY_NOVICE04_06");
};

