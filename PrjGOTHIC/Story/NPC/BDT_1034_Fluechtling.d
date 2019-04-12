
instance BDT_1034_Fluechtling(Npc_Default)
{
	name[0] = NAME_Fluechtling;
	guild = GIL_OUT;
	id = 1034;
	voice = 6;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",Face_N_Weak05,BodyTex_N,ITAR_Leather_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_Start_1034;
};


func void Rtn_Start_1034()
{
	TA_Stand_Eating(8,0,23,0,"NW_TAVERNE_IN_06");
	TA_Stand_Eating(23,0,8,0,"NW_TAVERNE_IN_06");
};

