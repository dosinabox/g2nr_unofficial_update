
instance VLK_420_Coragon(Npc_Default)
{
	name[0] = "Корагон";
	guild = GIL_VLK;
	id = 420;
	voice = 9;
	flags = 0;
	npcType = npctype_main;
	B_SetFightSkills(self,40);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald.",Face_N_Normal_Blade,BodyTex_N,ITAR_Smith);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_SetAttributesToChapter(self,3);
	B_GiveNpcTalents(self);
	daily_routine = Rtn_Start_420;
};


func void Rtn_Start_420()
{
	TA_Stand_ArmsCrossed(8,0,22,0,"NW_CITY_TAVERN_IN_03");
	TA_Stand_ArmsCrossed(22,0,8,0,"NW_CITY_TAVERN_IN_03");
};

