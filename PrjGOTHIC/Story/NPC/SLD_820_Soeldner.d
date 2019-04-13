
instance SLD_820_Soeldner(Npc_Default)
{
	name[0] = NAME_Soeldner;
	guild = GIL_SLD;
	id = 820;
	voice = 7;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Sword);
	EquipItem(self,ItRw_Sld_Bow);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_P_Normal01,BodyTex_P,itar_sld_M);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_820;
};


func void Rtn_Start_820()
{
	TA_Stand_Guarding(8,0,22,0,"NW_BIGFARM_HOUSE_OUT_03");
	TA_Stand_Guarding(22,0,8,0,"NW_BIGFARM_HOUSE_OUT_03");
};

