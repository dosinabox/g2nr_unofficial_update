
instance KDF_503_Karras(Npc_Default)
{
	name[0] = "Каррас";
	guild = GIL_KDF;
	id = 503;
	voice = 10;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_STRONG;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_L_NormalBart02,BodyTex_L,ItAr_KDF_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_503;
};


func void Rtn_Start_503()
{
	TA_Read_Bookstand(8,0,23,0,"NW_MONASTERY_RUNEMAKER_02");
	TA_Read_Bookstand(8,0,23,0,"NW_MONASTERY_RUNEMAKER_02");
};

