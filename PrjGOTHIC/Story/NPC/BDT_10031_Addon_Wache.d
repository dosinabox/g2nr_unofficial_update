
instance BDT_10031_Addon_Wache(Npc_Default)
{
	name[0] = NAME_Wache;
	guild = GIL_BDT;
	id = 10031;
	voice = 6;
	flags = 0;
	npcType = NPCTYPE_BL_MAIN;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_2h_Sld_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_NormalBart09,BodyTex_N,ITAR_Bloodwyn_Addon);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_Start_10031;
};


func void Rtn_Start_10031()
{
	TA_Stand_Eating(6,0,12,0,"BL_MINELAGER_03");
	TA_Stand_Eating(12,0,6,0,"BL_MINELAGER_03");
};

