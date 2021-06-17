
instance PC_Thief_NW(Npc_Default)
{
	name[0] = "Диего";
	guild = GIL_NONE;
	id = 21;
	voice = 11;
	flags = NPC_FLAG_IMMORTAL;
	npcType = NPCTYPE_FRIEND;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	aivar[AIV_Teeth] = 4;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Sld_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_L_Diego,BodyTex_L,ITAR_Vlk_H);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_21;
};


func void Rtn_Start_21()
{
	TA_Stand_WP(8,0,23,0,"NW_CITY_MERCHANT_TRADE_02");
	TA_Stand_WP(23,0,8,0,"NW_CITY_MERCHANT_TRADE_02");
};

func void Rtn_Gerbrandt_21()
{
	TA_Stand_ArmsCrossed(8,0,20,0,"NW_CITY_UPTOWN_PATH_23");
	TA_Sit_Chair(20,0,23,0,"NW_CITY_TAVERN_IN_08");
	TA_Sleep(23,0,8,0,"NW_CITY_GERBRANDT_BED_01");
};

func void Rtn_WAITFORSHIP_21()
{
	TA_Smalltalk(8,0,23,0,"NW_WAITFOR_SHIP_05");
	TA_Smalltalk(23,0,8,0,"NW_WAITFOR_SHIP_05");
};

func void Rtn_SHIP_21()
{
	TA_Smalltalk(8,0,23,0,"SHIP_CREW_05");
	TA_Smalltalk(23,0,8,0,"SHIP_CREW_05");
};

