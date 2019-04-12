
instance BDT_1033_Fluechtling(Npc_Default)
{
	name[0] = NAME_Fluechtling;
	guild = GIL_OUT;
	id = 1033;
	voice = 7;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Sword);
	CreateInvItems(self,ItWr_MorgahardTip,1);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_NormalBart_Graham,BodyTex_N,ITAR_Leather_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_Start_1033;
};


func void Rtn_Start_1033()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"NW_TAVERNE_IN_06");
	TA_Stand_ArmsCrossed(23,0,8,0,"NW_TAVERNE_IN_06");
};

