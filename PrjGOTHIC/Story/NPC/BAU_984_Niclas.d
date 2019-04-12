
instance BAU_984_Niclas(Npc_Default)
{
	name[0] = "Никлас";
	guild = GIL_OUT;
	id = 984;
	voice = 3;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Sword);
	EquipItem(self,ItRw_Sld_Bow);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_N_NormalBart12,BodyTex_N,ITAR_Leather_L);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,40);
	daily_routine = Rtn_Start_984;
};


func void Rtn_Start_984()
{
	TA_Sit_Bench(8,0,23,0,"NW_CITY_JAEGER_SIT");
	TA_Sit_Bench(23,0,8,0,"NW_CITY_JAEGER_SIT");
};

