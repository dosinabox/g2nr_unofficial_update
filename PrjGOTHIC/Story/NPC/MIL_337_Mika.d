
instance Mil_337_Mika(Npc_Default)
{
	name[0] = "Мика";
	guild = GIL_OUT;
	id = 337;
	voice = 12;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Mil_Sword);
	CreateInvItems(self,ItPo_Health_01,4);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fatbald",Face_L_ToughBart_Quentin,BodyTex_L,ITAR_Mil_L);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_337;
};


func void Rtn_Start_337()
{
	TA_Stand_Guarding(8,0,22,0,"NW_CITY_TO_FOREST_01");
	TA_Stand_Guarding(22,0,8,0,"NW_CITY_TO_FOREST_01");
};

func void Rtn_Akil_337()
{
	TA_RunToWP(6,0,18,0,"NW_FARM2_PATH_03");
	TA_RunToWP(18,0,6,0,"NW_FARM2_PATH_03");
};

