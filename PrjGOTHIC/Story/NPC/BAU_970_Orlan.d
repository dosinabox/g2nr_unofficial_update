
instance BAU_970_Orlan(Npc_Default)
{
	name[0] = "�����";
	guild = GIL_BAU;
	id = 970;
	voice = 5;
	flags = NPC_FLAG_IMMORTAL;
	npcType = NPCTYPE_MAIN;
	aivar[AIV_SubGuild] = GIL_SUB_Ranger;
	aivar[AIV_NPCIsTrader] = TRUE;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1H_Sword_L_03);
	B_CreateItemToSteal(self,89,ItMi_Gold,260);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fatbald",Face_B_Normal_Sharky,BodyTex_B,ITAR_Bau_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_970;
};


func void Rtn_Start_970()
{
	TA_Stand_WP(8,0,22,0,"NW_TAVERNE_IN_04");
	TA_Stand_Sweeping(22,0,23,0,"NW_TAVERNE_IN_01");
	TA_Sit_Chair(23,0,7,0,"NW_TAVERNE_IN_RANGERMEETING_LARES");
	TA_Stand_Sweeping(7,0,8,0,"NW_TAVERNE_IN_01");
};

func void Rtn_Wettkampf_970()
{
	TA_Stand_WP(8,0,22,0,"NW_TAVERNE");
	TA_Stand_WP(22,0,8,0,"NW_TAVERNE");
};

func void Rtn_RangerMeeting_970()
{
	TA_RangerMeeting(8,0,22,0,"NW_TAVERNE_IN_RANGERMEETING");
	TA_RangerMeeting(22,0,8,0,"NW_TAVERNE_IN_RANGERMEETING");
};

func void Rtn_Parking_970()
{
	TA_Stand_Guarding(8,0,22,0,"NW_TAVERNE_IN_RANGERMEETING");
	TA_Stand_Guarding(22,0,8,0,"NW_TAVERNE_IN_RANGERMEETING");
};

