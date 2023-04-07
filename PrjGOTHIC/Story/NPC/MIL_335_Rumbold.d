
instance MIL_335_Rumbold(Npc_Default)
{
	name[0] = "Румболд";
	guild = GIL_NONE;
	id = 335;
	voice = 10;
	flags = 0;
	npcType = NPCTYPE_MAIN;
	aivar[AIV_DropDeadAndKill] = TRUE;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_1h_Mil_Sword);
	B_CreateAmbientInv(self);
	B_CreateItemToSteal(self,24,ItMi_Gold,45);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_Important_Arto,BodyTex_N,ITAR_MIL_L);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_335;
};


func void Rtn_Start_335()
{
	TA_Smalltalk(8,0,22,0,"NW_FARM3_PATH_02");
	TA_Smalltalk(22,0,8,0,"NW_FARM3_PATH_02");
};

func void Rtn_MilComing_335()
{
	TA_Smalltalk(8,0,22,0,"NW_FARM3_BENGAR");
	TA_Smalltalk(22,0,8,0,"NW_FARM3_BENGAR");
};

func void Rtn_Flucht3_335()
{
	TA_Smalltalk(8,0,22,0,"NW_RUMBOLD_FLUCHT3");
	TA_Smalltalk(22,0,8,0,"NW_RUMBOLD_FLUCHT3");
};

func void Rtn_Ch3_335()
{
	TA_Stand_Guarding(0,0,6,0,"NW_CITY_MERCHANT_SHOP01_FRONT_03_E");
	TA_Smith_Sharp(6,0,7,5,"NW_CITY_KASERN_ARMORY_SHARP");
	TA_Sleep(7,5,15,0,"NW_CITY_BARRACK01_BED_RUGA");
	TA_Smalltalk(15,0,0,0,"NW_CITY_HABOUR_KASERN_OFFICE");
};

