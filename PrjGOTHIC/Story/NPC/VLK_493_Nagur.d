
instance VLK_493_Nagur(Npc_Default)
{
	name[0] = "Нагур";
	guild = GIL_VLK;
	id = 493;
	voice = 8;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal17,BodyTex_N,ITAR_Vlk_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_493;
};


func void Rtn_Start_493()
{
	TA_Sit_Chair(8,0,23,0,"NW_CITY_HABOUR_TAVERN01_02");
	TA_Sit_Chair(23,0,8,0,"NW_CITY_HABOUR_TAVERN01_02");
};

func void Rtn_Prison_493()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"NW_CITY_HABOUR_KASERN_NAGUR");
	TA_Stand_ArmsCrossed(23,0,8,0,"NW_CITY_HABOUR_KASERN_NAGUR");
};

