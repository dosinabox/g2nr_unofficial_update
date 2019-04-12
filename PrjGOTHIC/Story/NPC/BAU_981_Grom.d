
instance BAU_981_Grom(Npc_Default)
{
	name[0] = "Гром";
	guild = GIL_OUT;
	id = 981;
	voice = 8;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_P_Gilbert,BodyTex_P,ITAR_Bau_L);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,40);
	daily_routine = Rtn_Start_981;
};


func void Rtn_Start_981()
{
	TA_Saw(8,0,23,0,"NW_CASTLEMINE_TROLL_04_C");
	TA_Sleep(23,0,8,0,"NW_CASTLEMINE_TROLL_04");
};

