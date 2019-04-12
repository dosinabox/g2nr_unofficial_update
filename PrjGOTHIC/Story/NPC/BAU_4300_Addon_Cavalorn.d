
instance BAU_4300_Addon_Cavalorn(Npc_Default)
{
	name[0] = "Кавалорн";
	guild = GIL_NONE;
	id = 4300;
	voice = 8;
	flags = NPC_FLAG_IMMORTAL;
	npcType = NPCTYPE_FRIEND;
	aivar[AIV_NPCIsRanger] = TRUE;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_ShortSword2);
	EquipItem(self,ItRw_Sld_Bow);
	CreateInvItems(self,ITAR_Bau_L,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",Face_B_Cavalorn,BodyTex_B,ITAR_RANGER_Addon);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_4300;
};


func void Rtn_Start_4300()
{
	TA_Stand_Eating(5,0,20,0,"NW_XARDAS_GOBBO_01");
	TA_Stand_Eating(20,0,5,0,"NW_XARDAS_GOBBO_01");
};

func void Rtn_KillBandits_4300()
{
	TA_RunToWP(5,0,20,0,"NW_XARDAS_BANDITS_LEFT");
	TA_RunToWP(20,0,5,0,"NW_XARDAS_BANDITS_LEFT");
};

func void Rtn_OrnamentSteinring_4300()
{
	TA_Stand_WP(5,0,20,0,"NW_LITTLESTONEHENDGE");
	TA_Stand_WP(20,0,5,0,"NW_LITTLESTONEHENDGE");
};

func void Rtn_PreRangerMeeting_4300()
{
	TA_RangerMeeting(5,0,20,0,"NW_TAVERNE_06");
	TA_RangerMeeting(20,0,5,0,"NW_TAVERNE_06");
};

func void Rtn_RangerMeeting_4300()
{
	TA_RangerMeeting(5,0,20,0,"NW_TAVERNE_IN_RANGERMEETING");
	TA_RangerMeeting(20,0,5,0,"NW_TAVERNE_IN_RANGERMEETING");
};

func void Rtn_Parking_4300()
{
	TA_Stand_ArmsCrossed(5,0,20,0,"NW_TAVERNE_IN_RANGERMEETING");
	TA_Stand_ArmsCrossed(20,0,5,0,"NW_TAVERNE_IN_RANGERMEETING");
};

func void Rtn_Stadt_4300()
{
	TA_Sit_Bench(5,0,20,0,"NW_CITY_MERCHANT_PATH_15");
	TA_Sit_Bench(20,0,5,0,"NW_CITY_MERCHANT_PATH_15");
};

