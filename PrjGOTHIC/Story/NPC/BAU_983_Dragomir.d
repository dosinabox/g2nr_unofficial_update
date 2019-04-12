
instance BAU_983_Dragomir(Npc_Default)
{
	name[0] = "Äðàãîìèð";
	guild = GIL_OUT;
	id = 983;
	voice = 12;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Sword);
	EquipItem(self,ItRw_Mil_Crossbow);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Tough_Lee_ähnlich,BodyTex_N,ITAR_Leather_L);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,40);
	daily_routine = Rtn_Start_983;
};


func void Rtn_Start_983()
{
	TA_Sit_Bench(8,0,23,0,"NW_TAVERNE_TROLLAREA_MONSTER_02_01");
	TA_Sit_Bench(23,0,8,0,"NW_TAVERNE_TROLLAREA_MONSTER_02_01");
};

