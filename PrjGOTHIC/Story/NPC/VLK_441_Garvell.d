
instance VLK_441_Garvell(Npc_Default)
{
	name[0] = "Гарвелл";
	guild = GIL_VLK;
	id = 441;
	voice = 4;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Vlk_Axe);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItSe_GoldPocket25,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Lefty,BodyTex_N,ITAR_Vlk_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_441;
};


func void Rtn_Start_441()
{
	TA_Stand_Drinking(4,50,19,11,"NW_CITY_HABOUR_07");
	TA_Smalltalk(19,11,0,1,"NW_CITY_HABOUR_TAVERN01_SMALLTALK_01");
	TA_Stand_Drinking(0,1,4,50,"NW_CITY_HABOUR_TAVERN01_STAND_01");
};

