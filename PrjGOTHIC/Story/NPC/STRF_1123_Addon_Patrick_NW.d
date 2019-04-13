
instance STRF_1123_Addon_Patrick_NW(Npc_Default)
{
	name[0] = "Патрик";
	guild = GIL_SLD;
	id = 1123;
	voice = 7;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_1h_Sld_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_L_NormalBart02,BodyTex_L,ItAr_Sld_L);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_1123;
};


func void Rtn_Start_1123()
{
	TA_Stand_Drinking(0,0,12,0,"NW_BIGFARM_PATRICK");
	TA_Stand_Drinking(12,0,0,0,"NW_BIGFARM_PATRICK");
};

