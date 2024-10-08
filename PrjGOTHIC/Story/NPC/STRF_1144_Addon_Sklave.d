
instance STRF_1144_Addon_Sklave(Npc_Default)
{
	name[0] = NAME_Addon_Sklave;
	guild = GIL_STRF;
	id = 1144;
	voice = 3;
	flags = 0;
	npcType = NPCTYPE_BL_AMBIENT;
	aivar[AIV_NoFightParker] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",Face_N_NormalBart_Senyan,BodyTex_N,ITAR_Slave);
	Mdl_SetModelFatness(self,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,10);
	daily_routine = Rtn_Start_1144;
};


func void Rtn_Start_1144()
{
	TA_Stand_WP(8,0,23,0,"BL_UP_PLACE_06_SIDE_02");
	TA_Stand_WP(23,0,8,0,"BL_UP_PLACE_06_SIDE_02");
};

