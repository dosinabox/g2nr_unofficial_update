
instance BAU_973_Rukhar(Npc_Default)
{
	name[0] = "Рухар";
	guild = GIL_OUT;
	id = 973;
	voice = 12;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_L_NormalBart02,BodyTex_L,ITAR_Bau_M);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_973;
};


func void Rtn_Start_973()
{
	TA_Stand_Drinking(8,0,22,0,"NW_TAVERNE_RUKHAR");
	TA_Sit_Bench(22,0,8,0,"NW_TAVERNE_OUT_01");
};

func void Rtn_Wettkampf_973()
{
	TA_Stand_Drinking(8,0,22,0,"NW_TAVERNE_RUKHAR");
	TA_Stand_Drinking(22,0,8,0,"NW_TAVERNE_RUKHAR");
};

func void Rtn_WettkampfRukharWon_973()
{
	TA_Stand_ArmsCrossed(8,0,22,0,"NW_TAVERNE_RUKHAR");
	TA_Stand_ArmsCrossed(22,0,8,0,"NW_TAVERNE_RUKHAR");
};

func void Rtn_WettkampfRukharLost_973()
{
	TA_Sit_Bench(8,0,22,0,"NW_TAVERNE_OUT_01");
	TA_Sit_Bench(22,0,8,0,"NW_TAVERNE_OUT_01");
};

