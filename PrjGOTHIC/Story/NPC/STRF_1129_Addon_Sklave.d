
instance STRF_1129_Addon_Sklave(Npc_Default)
{
	name[0] = NAME_Addon_Sklave;
	guild = GIL_STRF;
	id = 1129;
	voice = 3;
	flags = 0;
	npcType = NPCTYPE_BL_AMBIENT;
	aivar[AIV_NoFightParker] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",Face_N_Weak_Asghan,BodyTex_N,ITAR_Prisoner);
	Mdl_SetModelFatness(self,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_Start_1129;
};


func void Rtn_Start_1129()
{
	TA_Pick_Ore(8,0,23,0,"ADW_MINE_TO_MC_04_B");
	TA_Pick_Ore(23,0,8,0,"ADW_MINE_TO_MC_04_B");
};

func void Rtn_Flucht_1129()
{
	TA_RunToWP(8,0,23,0,"ADW_BL_HOEHLE_02");
	TA_RunToWP(23,0,8,0,"ADW_BL_HOEHLE_02");
};

