
instance VLK_4250_Jorgen(Npc_Default)
{
	name[0] = "Йорген";
	guild = GIL_NONE;
	id = 4250;
	voice = 7;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_N_Tough_Skip,BodyTex_N,ITAR_Vlk_L);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
	daily_routine = Rtn_Start_4250;
};


func void Rtn_Start_4250()
{
	TA_Stand_ArmsCrossed(8,0,20,0,"NW_MONASTERY_BRIDGE_01");
	TA_Stand_ArmsCrossed(20,0,8,0,"NW_MONASTERY_BRIDGE_01");
};

func void Rtn_Kloster_4250()
{
	TA_Stand_ArmsCrossed(8,0,20,0,"NW_MONASTERY_PLACE_06");
	TA_Sleep(20,0,8,0,"NW_MONASTERY_NOVICE04_06");
};

func void Rtn_RausAusKloster_4250()
{
	TA_Stand_ArmsCrossed(8,0,20,0,"NW_BIGFARM_KITCHEN_OUT_06");
	TA_Stand_ArmsCrossed(20,0,8,0,"NW_BIGFARM_KITCHEN_OUT_06");
};

func void Rtn_WaitForShipCaptain_4250()
{
	TA_Sit_Bench(8,0,20,0,"NW_WAITFOR_SHIP_CAPTAIN");
	TA_Sit_Bench(20,0,8,0,"NW_WAITFOR_SHIP_CAPTAIN");
};

func void Rtn_AllOnBoard_4250()
{
	TA_Stand_WP(8,0,23,0,"SHIP_CREW_CAPTAIN");
	TA_Sleep(23,0,8,0,"SHIP_IN_06");
};

