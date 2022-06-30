
instance BDT_1083_Addon_Esteban(Npc_Default)
{
	name[0] = "Ёстебан";
	guild = GIL_BDT;
	id = 1083;
	voice = 7;
	flags = 0;
	npcType = NPCTYPE_BL_MAIN;
	aivar[AIV_StoryBandit_Esteban] = TRUE;
	aivar[AIV_StoryBandit] = TRUE;
	aivar[AIV_NewsOverride] = TRUE;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Axe);
	B_CreateAmbientInv(self);
	B_CreateItemToSteal(self,105,ItMi_Gold,500);
	CreateInvItem(self,ItKe_Addon_Esteban);
	CreateInvItems(self,ItMi_Addon_Stone_01,5);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_L_ToughBart_Quentin,BodyTex_L,ITAR_BDT_H);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_1083;
};


func void Rtn_Start_1083()
{
	TA_Stand_ArmsCrossed(9,0,20,0,"BL_MID_07");
	TA_Sleep(20,0,9,0,"BL_BEDS_SLEEP_02");
};

