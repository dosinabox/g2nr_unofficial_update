
instance PAL_203_Lothar(Npc_Default)
{
	name[0] = "Лотар";
	guild = GIL_PAL;
	id = 203;
	voice = 1;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Pal_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",Face_P_NormalBart_Nefarius,BodyTex_P,ItAr_PAl_H);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_preStart_203;
};


func void Rtn_preStart_203()
{
	TA_Stand_Guarding(8,0,23,0,"NW_CITY_MAINSTREET_01_B");
	TA_Stand_Guarding(23,0,8,0,"NW_CITY_MAINSTREET_01_B");
};

func void Rtn_Start_203()
{
	TA_Stand_Guarding(8,0,23,0,"NW_CITY_LOTHAR");
	TA_Stand_Guarding(23,0,8,0,"NW_CITY_LOTHAR");
};

func void Rtn_Tot_203()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

