
instance PAL_260_Tandor(Npc_Default)
{
	name[0] = "������";
	guild = GIL_PAL;
	id = 260;
	voice = 8;
	flags = 0;
	npcType = NPCTYPE_OCMAIN;
	aivar[AIV_NPCIsTrader] = TRUE;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_Doppelaxt);
	EquipItem(self,ItRw_Crossbow_M_02);
	B_CreateItemToSteal(self,47,ItMi_Gold,90);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_P_Tough_Rodriguez,BodyTex_P,ITAR_PAL_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
	daily_routine = Rtn_Start_260;
};


func void Rtn_Start_260()
{
	TA_Stand_Guarding(8,0,23,0,"OC_STAND_TANDOR_01");
	TA_Stand_Guarding(23,0,8,0,"OC_STAND_TANDOR_01");
};

func void Rtn_PostenVerlassen_260()
{
	TA_Practice_Sword(8,0,23,0,"OC_CENTER_03");
	TA_Stand_Eating(23,0,8,0,"OC_CENTER_03");
};

