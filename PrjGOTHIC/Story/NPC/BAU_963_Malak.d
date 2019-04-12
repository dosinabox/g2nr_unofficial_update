
instance BAU_963_Malak(Npc_Default)
{
	name[0] = "Малак";
	guild = GIL_OUT;
	id = 963;
	voice = 8;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Bau_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal_Sly,BodyTex_N,ITAR_Bau_M);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,35);
	daily_routine = Rtn_Start_963;
};


func void Rtn_Start_963()
{
	TA_Stand_Eating(8,0,22,0,"NW_FARM3_MALAK");
	TA_Stand_Eating(22,0,8,0,"NW_FARM3_MALAK");
};

func void Rtn_FleeFromPass_963()
{
	TA_Stand_Eating(8,0,22,0,"NW_BIGMILL_MALAKSVERSTECK_MALAK");
	TA_Stand_Eating(22,0,8,0,"NW_BIGMILL_MALAKSVERSTECK_MALAK");
};

