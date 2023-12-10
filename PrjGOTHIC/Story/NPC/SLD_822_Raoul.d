
instance SLD_822_Raoul(Npc_Default)
{
	name[0] = "Рауль";
	guild = GIL_SLD;
	id = 822;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_MAIN;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Axe);
	B_CreateAmbientInv(self);
	B_CreateItemToSteal(self,45,ItMi_Gold,85);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_L_Ian,BodyTex_L,ITAR_SLD_L);
	Mdl_SetModelFatness(self,1.5);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_PreStart_822;
};


func void Rtn_PreStart_822()
{
	TA_Stand_Guarding(8,0,22,0,"NW_BIGFARM_PATH_01");
	TA_Stand_Guarding(22,0,8,0,"NW_BIGFARM_PATH_01");
};

func void Rtn_Start_822()
{
	TA_Stand_Guarding(7,0,0,10,"NW_BIGFARM_PATH_01");
	TA_Sit_Chair(0,10,7,0,"NW_BIGFARM_KITCHEN_07");
};

