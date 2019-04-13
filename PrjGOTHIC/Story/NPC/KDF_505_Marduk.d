
instance KDF_505_Marduk(Npc_Default)
{
	name[0] = "Мардук";
	guild = GIL_KDF;
	id = 505;
	voice = 5;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_P_OldMan_Gravo,BodyTex_P,ItAr_KDF_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_505;
};


func void Rtn_Start_505()
{
	TA_Stand_Guarding(8,0,23,0,"NW_MONASTERY_CORRIDOR_03");
	TA_Sleep(23,0,8,0,"NW_MONASTERY_MAGE01_BED_01");
};

