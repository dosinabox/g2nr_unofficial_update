
instance STRF_1128_Addon_Sklave(Npc_Default)
{
	name[0] = NAME_Addon_Sklave;
	guild = GIL_STRF;
	id = 1128;
	voice = 3;
	flags = 0;
	npcType = NPCTYPE_BL_AMBIENT;
	aivar[AIV_NoFightParker] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_B_Normal_Orik,BodyTex_B,ITAR_Prisoner);
	Mdl_SetModelFatness(self,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_Start_1128;
};


func void Rtn_Start_1128()
{
	TA_Pick_Ore(8,0,23,0,"ADW_MINE_19");
	TA_Pick_Ore(23,0,8,0,"ADW_MINE_19");
};

func void Rtn_Flucht_1128()
{
	TA_RunToWP(8,0,23,0,"ADW_BL_HOEHLE_02");
	TA_RunToWP(23,0,8,0,"ADW_BL_HOEHLE_02");
};

