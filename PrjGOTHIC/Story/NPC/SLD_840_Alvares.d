
instance SLD_840_Alvares(Npc_Default)
{
	name[0] = "Альварес";
	guild = GIL_BDT;
	id = 840;
	voice = 11;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	aivar[AIV_EnemyOverride] = TRUE;
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_2h_Sld_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_B_Tough_Silas,BodyTex_B,ItAr_Sld_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,25);
	daily_routine = Rtn_PreStart_840;
};


func void Rtn_PreStart_840()
{
	TA_Smalltalk(8,0,22,0,"NW_FARM2_PATH_02");
	TA_Smalltalk(22,0,8,0,"NW_FARM2_PATH_02");
};

func void Rtn_Start_840()
{
	TA_Smalltalk(8,0,22,0,"NW_FARM2_TO_TAVERN_08");
	TA_Smalltalk(22,0,8,0,"NW_FARM2_TO_TAVERN_08");
};

func void Rtn_Bigfarm_840()
{
	TA_Smalltalk(8,0,22,0,"NW_BIGFARM_HOUSE_OUT_05");
	TA_Sit_Chair(22,0,8,0,"NW_BIGFARM_HOUSE_12");
};

