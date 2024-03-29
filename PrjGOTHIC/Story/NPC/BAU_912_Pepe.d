
instance BAU_912_Pepe(Npc_Default)
{
	name[0] = "����";
	guild = GIL_BAU;
	id = 912;
	voice = 3;
	flags = 0;
	npcType = NPCTYPE_MAIN;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_CreateAmbientInv(self);
	B_CreateItemToSteal(self,15,ItMi_Gold,25);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Weak_Markus_Kark,BodyTex_N,ITAR_Bau_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,10);
	daily_routine = Rtn_Start_912;
};


func void Rtn_Start_912()
{
	TA_Stand_Eating(10,0,16,0,"NW_BIGFARM_SHEEP2_02");
	TA_Stand_Drinking(16,0,22,0,"NW_BIGFARM_SHEEP2_03");
	TA_Stand_ArmsCrossed(22,0,4,0,"NW_BIGFARM_SHEEP2_04");
	TA_Stand_ArmsCrossed(4,0,10,0,"NW_BIGFARM_SHEEP2_01");
};

