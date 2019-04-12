
instance VLK_414_Hanna(Npc_Default)
{
	name[0] = "Ханна";
	guild = GIL_VLK;
	id = 414;
	voice = 17;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe1",FaceBabe_N_WhiteCloth,BodyTex_N,ITAR_VlkBabe_L);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,35);
	daily_routine = Rtn_Start_414;
};


func void Rtn_Start_414()
{
	TA_Stand_ArmsCrossed(8,0,22,0,"NW_CITY_HANNA");
	TA_Stand_ArmsCrossed(22,0,8,0,"NW_CITY_HANNA");
};

