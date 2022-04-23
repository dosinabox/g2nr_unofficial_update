
instance MIL_336_Rick(Npc_Default)
{
	name[0] = "Ðèê";
	guild = GIL_NONE;
	id = 336;
	voice = 10;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_DexToSteal] = 10;
	aivar[AIV_GoldToSteal] = 45;
	aivar[AIV_DropDeadAndKill] = TRUE;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_1h_Mil_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fatbald",Face_N_Ricelord,BodyTex_N,ITAR_MIL_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_336;
};


func void Rtn_Start_336()
{
	TA_Smalltalk(8,0,22,0,"NW_FARM3_PATH_02");
	TA_Smalltalk(22,0,8,0,"NW_FARM3_PATH_02");
};

func void Rtn_MilComing_336()
{
	TA_Stand_ArmsCrossed(8,0,22,0,"NW_FARM3_HOUSE");
	TA_Stand_ArmsCrossed(22,0,8,0,"NW_FARM3_HOUSE");
};

/* func void Rtn_Flucht2_336()
{
	TA_Smalltalk(8,0,22,0,"NW_RUMBOLD_FLUCHT2");
	TA_Smalltalk(22,0,8,0,"NW_RUMBOLD_FLUCHT2");
}; */

func void Rtn_Flucht3_336()
{
	TA_Smalltalk(8,0,22,0,"NW_RUMBOLD_FLUCHT3");
	TA_Smalltalk(22,0,8,0,"NW_RUMBOLD_FLUCHT3");
};

func void Rtn_Ch3_336()
{
	TA_Stand_Guarding(0,0,6,30,"NW_CITY_HABOUR_KASERN_14");
	TA_Sit_Chair(6,30,7,30,"NW_CITY_HABOUR_KASERN_BARRACK01_ENTRY_01");
	TA_Sleep(7,30,15,0,"NW_CITY_BARRACK01_BED_06");
	TA_Smalltalk(15,0,0,0,"NW_CITY_ANDRE_SMALLTALK");
};

