
instance SLD_827_Soeldner(Npc_Default)
{
	name[0] = NAME_Soeldner;
	guild = GIL_SLD;
	id = 827;
	voice = 7;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_2h_Sld_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_Tough_Silas,BodyTex_B,ItAr_Sld_L);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_827;
};


func void Rtn_Start_827()
{
	TA_Smalltalk(7,2,20,58,"NW_BIGFARM_ALLEE_HUT");
	TA_Sit_Bench(20,58,7,2,"NW_BIGFARM_HUT_BENCH");
};

