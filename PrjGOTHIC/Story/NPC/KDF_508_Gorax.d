
instance KDF_508_Gorax(Npc_Default)
{
	name[0] = "Горакс";
	guild = GIL_KDF;
	id = 508;
	voice = 14;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMW_Addon_Stab04);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_OldBald_Jeremiah,BodyTex_N,ITAR_KDF_L);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_508;
};


func void Rtn_Start_508()
{
	TA_Stand_Guarding(8,0,23,0,"NW_MONASTERY_WINEMAKER_01");
	TA_Sleep(23,0,8,0,"NW_MONASTERY_MAGE02_BED_01");
};

