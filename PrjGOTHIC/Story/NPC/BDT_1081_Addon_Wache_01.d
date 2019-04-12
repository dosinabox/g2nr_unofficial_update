
instance BDT_1081_Addon_Wache_01(Npc_Default)
{
	name[0] = NAME_Addon_Esteban_Guard;
	guild = GIL_BDT;
	id = 1081;
	voice = 4;
	flags = 0;
	npcType = NPCTYPE_BL_MAIN;
	aivar[AIV_StoryBandit_Esteban] = TRUE;
	aivar[AIV_StoryBandit] = TRUE;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_2h_Pal_Sword);
	EquipItem(self,ItRw_Mil_Crossbow);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_Normal14,BodyTex_N,ITAR_Bloodwyn_Addon);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_1081;
};


func void Rtn_Start_1081()
{
	TA_Stand_Guarding(0,0,0,0,"BL_MID_07_B");
	TA_Stand_Guarding(0,0,0,0,"BL_MID_07_B");
};

func void Rtn_Ambush_1081()
{
	TA_Stand_Guarding(0,0,0,0,"BL_INN_OUTSIDE_01");
	TA_Stand_Guarding(0,0,0,0,"BL_INN_OUTSIDE_01");
};

