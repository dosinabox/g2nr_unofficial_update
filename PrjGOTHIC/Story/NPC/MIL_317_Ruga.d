
instance MIL_317_Ruga(Npc_Default)
{
	name[0] = "Руга";
	guild = GIL_MIL;
	id = 317;
	voice = 11;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_DexToSteal] = 40;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Mil_Sword);
	EquipItem(self,ItRw_Mil_Crossbow);
	B_CreateAmbientInv(self);
	B_CreateItemToSteal(self,ItKe_City_Tower_03);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_N_NormalBart03,BodyTex_N,ITAR_MIL_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
//	B_SetFightSkills(self,30);
	B_SetTeacherFightSkills(self,30,30,30,TeachLimit_Crossbow_Ruga);
	daily_routine = Rtn_Start_317;
};


func void Rtn_Start_317()
{
	TA_Stand_Drinking(7,0,20,0,"KASERNE");
	TA_Sit_Chair(20,0,7,0,"NW_CITY_HABOUR_KASERN_15_B");
};

