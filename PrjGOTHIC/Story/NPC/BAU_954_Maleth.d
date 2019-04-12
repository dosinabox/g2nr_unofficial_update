
instance BAU_954_Maleth(Npc_Default)
{
	name[0] = "Малет";
	guild = GIL_OUT;
	id = 954;
	voice = 8;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Bau_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_NormalBart_Dexter,BodyTex_N,ITAR_Bau_L);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,25);
	daily_routine = Rtn_Start_954;
};


func void Rtn_Start_954()
{
	TA_Stand_Guarding(8,0,22,0,"NW_FARM1_PATH_CITY_SHEEP_09");
	TA_Sleep(22,0,8,0,"NW_FARM1_INSTABLE_BED");
};

