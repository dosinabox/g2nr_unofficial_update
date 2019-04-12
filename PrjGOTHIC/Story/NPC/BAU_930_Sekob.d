
instance BAU_930_Sekob(Npc_Default)
{
	name[0] = "Секоб";
	guild = GIL_OUT;
	id = 930;
	voice = 1;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fatbald",Face_P_OldMan_Gravo,BodyTex_P,ITAR_Vlk_H);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,20);
	daily_routine = Rtn_Start_930;
};


func void Rtn_Start_930()
{
	TA_Sit_Throne(8,0,22,0,"NW_FARM4_SEKOB");
	TA_Sleep(22,0,8,0,"NW_FARM4_IN_BED");
};

func void Rtn_FleeDMT_930()
{
	TA_Stand_WP(8,0,22,0,"NW_BIGFARM_FARM4_PATH_01");
	TA_Stand_WP(22,0,8,0,"NW_BIGFARM_FARM4_PATH_01");
};

func void Rtn_Obsessed_930()
{
	TA_Stand_Guarding(8,0,22,0,"NW_FARM4_02");
	TA_Stand_Guarding(22,0,8,0,"NW_FARM4_02");
};

