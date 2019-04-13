
instance Bau_912_Pepe(Npc_Default)
{
	name[0] = "Пепе";
	guild = GIL_BAU;
	id = 912;
	voice = 3;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Weak_Markus_Kark,BodyTex_N,ITAR_Bau_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,10);
	daily_routine = Rtn_Start_912;
};


func void Rtn_Start_912()
{
	TA_Stand_Eating(8,0,22,0,"NW_BIGFARM_SHEEP2_02");
	TA_Stand_Eating(22,0,8,0,"NW_BIGFARM_SHEEP2_02");
};

