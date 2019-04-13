
instance BDT_1084_Addon_Senyan(Npc_Default)
{
	name[0] = "Сеньян";
	guild = GIL_BDT;
	id = 1084;
	voice = 12;
	flags = 0;
	npcType = NPCTYPE_BL_MAIN;
	aivar[AIV_NewsOverride] = TRUE;
	aivar[AIV_StoryBandit] = TRUE;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_1h_Mil_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_Tough_Pacho,BodyTex_B,ItAr_BDT_M);
	Mdl_SetModelFatness(self,0.75);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_Start_1084;
};


func void Rtn_Start_1084()
{
	TA_Stand_Guarding(10,0,12,0,"BL_DOWN_CENTER_03");
	TA_Stand_Guarding(12,0,10,0,"BL_DOWN_CENTER_03");
};

