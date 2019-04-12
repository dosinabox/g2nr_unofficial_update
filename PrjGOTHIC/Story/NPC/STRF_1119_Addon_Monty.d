
instance STRF_1119_Addon_Monty(Npc_Default)
{
	name[0] = "Монти";
	guild = GIL_STRF;
	id = 1119;
	voice = 8;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_NoFightParker] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_2H_Axe_L_01);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_NormalBart04,BodyTex_N,ITAR_Bau_L);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_1119;
};


func void Rtn_Start_1119()
{
	TA_Pick_Ore(8,0,23,0,"ADW_MINE_LAGER_06");
	TA_Pick_Ore(23,0,8,0,"ADW_MINE_LAGER_06");
};

func void Rtn_Flucht_1119()
{
	TA_RunToWP(8,0,23,0,"ADW_BL_HOEHLE_03");
	TA_RunToWP(23,0,8,0,"ADW_BL_HOEHLE_03");
};

