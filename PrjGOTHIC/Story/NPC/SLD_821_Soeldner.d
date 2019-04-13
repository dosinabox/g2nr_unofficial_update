
instance SLD_821_Soeldner(Npc_Default)
{
	name[0] = NAME_Soeldner;
	guild = GIL_SLD;
	id = 821;
	voice = 6;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Sword);
	EquipItem(self,ItRw_Sld_Bow);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Gomez,BodyTex_N,itar_sld_M);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_821;
};


func void Rtn_Start_821()
{
	TA_Smalltalk(7,30,23,30,"NW_BIGFARM_PATH_04_1");
	TA_Sleep(23,30,7,30,"NW_BIGFARM_HOUSE_08");
};

func void Rtn_RodWeg_821()
{
	TA_Smalltalk(7,55,22,55,"NW_BIGFARM_PATH_02");
	TA_Sleep(22,55,7,55,"NW_BIGFARM_HOUSE_08");
};

