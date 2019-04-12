
instance STRF_1130_Addon_Sklave(Npc_Default)
{
	name[0] = NAME_Addon_Sklave;
	guild = GIL_STRF;
	id = 1130;
	voice = 3;
	flags = 0;
	npcType = NPCTYPE_BL_AMBIENT;
	aivar[AIV_NoFightParker] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",Face_L_ToughBart_Quentin,BodyTex_L,ITAR_Prisoner);
	Mdl_SetModelFatness(self,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,10);
	daily_routine = Rtn_Start_1130;
};


func void Rtn_Start_1130()
{
	TA_Pick_Ore(8,0,23,0,"ADW_MINE_SLAVE_01");
	TA_Pick_Ore(23,0,8,0,"ADW_MINE_SLAVE_01");
};

func void Rtn_Flucht_1130()
{
	TA_RunToWP(8,0,23,0,"ADW_BL_HOEHLE_02");
	TA_RunToWP(23,0,8,0,"ADW_BL_HOEHLE_02");
};

