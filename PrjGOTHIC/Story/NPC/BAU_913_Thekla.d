
instance BAU_913_Thekla(Npc_Default)
{
	name[0] = "Текла";
	guild = GIL_BAU;
	id = 913;
	voice = 17;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe",FaceBabe_N_Brown,BodyTexBabe_N,ITAR_BauBabe_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,10);
	daily_routine = Rtn_Start_913;
};


func void Rtn_Start_913()
{
	TA_Stand_Guarding(8,0,8,30,"NW_BIGFARM_KITCHEN_BARKEEPER");
	TA_Cook_Stove(8,30,9,0,"NW_BIGFARM_KITCHEN_COOK");
	TA_Stand_Guarding(9,0,9,30,"NW_BIGFARM_KITCHEN_BARKEEPER");
	TA_Cook_Stove(9,30,10,0,"NW_BIGFARM_KITCHEN_COOK");
	TA_Stand_Guarding(10,0,10,30,"NW_BIGFARM_KITCHEN_BARKEEPER");
	TA_Cook_Stove(10,30,11,0,"NW_BIGFARM_KITCHEN_COOK");
	TA_Stand_Guarding(11,0,11,30,"NW_BIGFARM_KITCHEN_BARKEEPER");
	TA_Cook_Stove(11,30,12,0,"NW_BIGFARM_KITCHEN_COOK");
	TA_Stand_Guarding(12,0,12,30,"NW_BIGFARM_KITCHEN_BARKEEPER");
	TA_Cook_Stove(12,30,13,0,"NW_BIGFARM_KITCHEN_COOK");
	TA_Stand_Guarding(13,0,13,30,"NW_BIGFARM_KITCHEN_BARKEEPER");
	TA_Cook_Stove(13,30,14,0,"NW_BIGFARM_KITCHEN_COOK");
	TA_Stand_Guarding(14,0,14,30,"NW_BIGFARM_KITCHEN_BARKEEPER");
	TA_Cook_Stove(14,30,15,0,"NW_BIGFARM_KITCHEN_COOK");
	TA_Stand_Guarding(15,0,15,30,"NW_BIGFARM_KITCHEN_BARKEEPER");
	TA_Cook_Stove(15,30,16,0,"NW_BIGFARM_KITCHEN_COOK");
	TA_Stand_Guarding(16,0,16,30,"NW_BIGFARM_KITCHEN_BARKEEPER");
	TA_Cook_Stove(16,30,17,0,"NW_BIGFARM_KITCHEN_COOK");
	TA_Stand_Guarding(17,0,17,30,"NW_BIGFARM_KITCHEN_BARKEEPER");
	TA_Cook_Stove(17,30,18,0,"NW_BIGFARM_KITCHEN_COOK");
	TA_Stand_Guarding(18,0,18,30,"NW_BIGFARM_KITCHEN_BARKEEPER");
	TA_Cook_Stove(18,30,19,0,"NW_BIGFARM_KITCHEN_COOK");
	TA_Stand_Guarding(19,0,19,30,"NW_BIGFARM_KITCHEN_BARKEEPER");
	TA_Cook_Stove(19,30,20,0,"NW_BIGFARM_KITCHEN_COOK");
	TA_Stand_Guarding(20,0,20,30,"NW_BIGFARM_KITCHEN_BARKEEPER");
	TA_Cook_Stove(20,30,21,0,"NW_BIGFARM_KITCHEN_COOK");
	TA_Stand_Guarding(21,0,21,30,"NW_BIGFARM_KITCHEN_BARKEEPER");
	TA_Cook_Stove(21,30,22,0,"NW_BIGFARM_KITCHEN_COOK");
	TA_Stand_Guarding(22,0,8,0,"NW_BIGFARM_KITCHEN_BARKEEPER");
};

