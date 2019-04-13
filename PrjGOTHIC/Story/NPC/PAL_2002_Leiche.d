
instance PAL_2002_Leiche(Npc_Default)
{
	name[0] = "Сильвестро";
	guild = GIL_NONE;
	id = 2002;
	voice = 4;
	flags = 0;
	npcType = npctype_main;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 1;
	attribute[ATR_HITPOINTS] = 1;
	fight_tactic = FAI_HUMAN_STRONG;
	CreateInvItems(self,ItWr_Silvestro_MIS,1);
	CreateInvItems(self,ItPo_Mana_02,2);
	CreateInvItems(self,ItMi_Gold,100);
	CreateInvItems(self,ItPo_Health_02,2);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal20,BodyTex_N,ItAr_PAL_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
	daily_routine = Rtn_Start_2002;
};


func void Rtn_Start_2002()
{
	TA_Stand_Guarding(8,0,23,0,"OW_MINE3_LEICHE_01");
	TA_Stand_Guarding(23,0,8,0,"OW_MINE3_LEICHE_01");
};

