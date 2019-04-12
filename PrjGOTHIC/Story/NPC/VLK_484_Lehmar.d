
instance VLK_484_Lehmar(Npc_Default)
{
	name[0] = "Лемар";
	guild = GIL_VLK;
	id = 484;
	voice = 9;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Sword);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItWr_Schuldenbuch,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Whistler,BodyTex_N,ITAR_Vlk_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_484;
};


func void Rtn_Start_484()
{
	TA_Sit_Throne(6,30,0,30,"NW_CITY_HABOUR_HUT_08_IN_C");
	TA_Sleep(0,30,6,30,"NW_CITY_HABOUR_HUT_08_BED_02");
};

