
instance KDF_506_Neoras(Npc_Default)
{
	name[0] = "Неорас";
	guild = GIL_KDF;
	id = 506;
	voice = 1;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_P_NormalBart_Cronos,BodyTex_P,ItAr_KDF_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_506;
};


func void Rtn_Start_506()
{
	TA_Potion_Alchemy(8,0,23,0,"NW_MONASTERY_ALCHEMY_01");
	TA_Potion_Alchemy(23,0,8,0,"NW_MONASTERY_ALCHEMY_01");
};

