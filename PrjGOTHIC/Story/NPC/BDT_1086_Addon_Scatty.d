
instance BDT_1086_Addon_Scatty(Npc_Default)
{
	name[0] = "Скатти";
	guild = GIL_BDT;
	id = 1086;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_BL_MAIN;
	aivar[AIV_NPCIsTrader] = TRUE;
	aivar[AIV_Teeth] = 2;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_Zweihaender1);
	CreateInvItems(self,ItMi_GoldNugget_Addon,5);
	CreateInvItems(self,ItPo_Health_03,2);
	B_CreateItemToSteal(self,60,ItMi_Gold,90);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_L_Scatty,BodyTex_L,ITAR_Diego);
	Mdl_SetModelFatness(self,1.6);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,75);
	daily_routine = Rtn_Start_1086;
};


func void Rtn_Start_1086()
{
	TA_Stand_Guarding(9,0,20,0,"BL_MINELAGER_06");
	TA_Stand_Drinking(20,0,9,0,"BL_MINELAGER_06");
};

