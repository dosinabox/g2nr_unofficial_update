
instance SLD_825_Soeldner(Npc_Default)
{
	name[0] = NAME_Soeldner;
	guild = GIL_SLD;
	id = 825;
	voice = 7;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Axe);
	EquipItem(self,ItRw_Sld_Bow);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Homer,BodyTex_N,itar_sld_M);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_825;
};


func void Rtn_Start_825()
{
	TA_Smalltalk(8,0,22,0,"NW_BIGFARM_HOUSE_08");
	TA_Smalltalk(22,0,8,0,"NW_BIGFARM_HOUSE_08");
};

