
instance BDT_1082_Addon_Skinner(Npc_Default)
{
	name[0] = "Скиннер";
	guild = GIL_BDT;
	id = 1082;
	voice = 8;
	flags = 0;
	npcType = NPCTYPE_BL_MAIN;
	aivar[AIV_StoryBandit] = TRUE;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_Addon_Betty);
	B_CreateAmbientInv(self);
	CreateInvItems(self,itke_addon_skinner,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_L_Tough01,BodyTex_L,ItAr_BDT_H);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_Start_1082;
};


func void Rtn_Start_1082()
{
	TA_Sleep(9,0,21,0,"BL_DOWN_HUT_02_SLEEP");
	TA_Sleep(21,0,9,0,"BL_DOWN_HUT_02_SLEEP");
};

