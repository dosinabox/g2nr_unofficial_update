
instance BDT_10005_Addon_Wache_02(Npc_Default)
{
	name[0] = NAME_Addon_Esteban_Guard;
	guild = GIL_BDT;
	id = 10005;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_BL_MAIN;
	aivar[AIV_StoryBandit_Esteban] = TRUE;
	aivar[AIV_StoryBandit] = TRUE;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_2h_Sld_Axe);
	EquipItem(self,ItRw_Mil_Crossbow);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_B_Normal_Orik,BodyTex_B,ITAR_Bloodwyn_Addon);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,45);
	daily_routine = Rtn_Start_10005;
};


func void Rtn_Start_10005()
{
	TA_Stand_Guarding(9,0,21,0,"BL_MID_07_SHARP");
	TA_Stand_Guarding(21,0,9,0,"BL_MID_07_SHARP");
};

func void Rtn_Ambush_10005()
{
	TA_Stand_Guarding(9,0,21,0,"BL_INN_OUTSIDE_02");
	TA_Stand_Guarding(21,0,9,0,"BL_INN_OUTSIDE_02");
};

