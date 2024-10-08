
instance STRF_1131_Addon_Sklave(Npc_Default)
{
	name[0] = NAME_Addon_Sklave;
	guild = GIL_STRF;
	id = 1131;
	voice = 3;
	flags = 0;
	npcType = NPCTYPE_MAIN;
	aivar[AIV_NoFightParker] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",Face_N_NormalBart01,BodyTex_N,ITAR_Slave);
	Mdl_SetModelFatness(self,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_Start_1131;
};


func void Rtn_Start_1131()
{
	TA_Stand_WP(8,0,23,0,"ADW_MINE_SKLAVENTOD_01");
	TA_Stand_WP(23,0,8,0,"ADW_MINE_SKLAVENTOD_01");
};

