
instance Mil_306_Tuerwache(Npc_Default)
{
	name[0] = "Стражник судьи";
	guild = GIL_MIL;
	id = 306;
	voice = 7;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Mil_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_L_ToughBald01,BodyTex_L,ItAr_MIL_M);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_Start_306;
};


func void Rtn_Start_306()
{
	TA_Stand_Guarding(8,0,18,45,"NW_CITY_JUDGE_GUARD_01");
	TA_Stand_Guarding(18,45,22,0,"NW_CITY_UPTOWN_JUDGE_01");
	TA_Stand_Guarding(22,0,8,0,"NW_CITY_JUDGE_GUARD_01");
};

