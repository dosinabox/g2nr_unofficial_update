
instance SLD_804_Rod(Npc_Default)
{
	name[0] = "Род";
	guild = GIL_SLD;
	id = 804;
	voice = 6;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_DexToSteal] = 15;
	aivar[AIV_GoldToSteal] = 35;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_2h_Rod);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_ToughBart01,BodyTex_N,ITAR_SLD_M);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
//	B_SetTeacherFightSkills(self,50,TeachLimit_2H_Rod,50,50);
	daily_routine = Rtn_Start_804;
};


func void Rtn_Start_804()
{
	TA_Smalltalk(7,55,22,55,"NW_BIGFARM_PATH_02");
	TA_Sleep(22,55,7,55,"NW_BIGFARM_HOUSE_SLD_SLEEP");
};

func void Rtn_Tot_804()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

