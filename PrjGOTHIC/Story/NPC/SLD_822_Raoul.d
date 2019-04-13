
instance Sld_822_Raoul(Npc_Default)
{
	name[0] = "Рауль";
	guild = GIL_SLD;
	id = 822;
	voice = 1;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_L_Ian,BodyTex_L,ItAr_Sld_L);
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

