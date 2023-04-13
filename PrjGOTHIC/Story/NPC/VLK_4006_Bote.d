
instance VLK_4006_Bote(Npc_Default)
{
	name[0] = "Посыльный";
	guild = GIL_VLK;
	id = 4006;
	voice = 9;
	flags = 0;
	npcType = NPCTYPE_MAIN;
	B_SetAttributesToChapter(self,1);
	attribute[ATR_HITPOINTS_MAX] = 500;
	attribute[ATR_HITPOINTS] = 500;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_ShortSword2);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_Normal_Stone,BodyTex_N,ITAR_Bau_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_4006;
};


func void Rtn_Start_4006()
{
	TA_Stand_ArmsCrossed(8,0,18,0,"NW_CITY_MERCHANT_SHOP03_FRONT_02");
	TA_Sit_Chair(18,0,22,0,"TAVERN02_B");
	TA_Sit_Throne(22,0,8,0,"NW_CITY_HOTEL_UPTSAIRS_05");
};

func void Rtn_Baltram_4006()
{
	TA_Stand_ArmsCrossed(8,0,18,0,"NW_CITY_MERCHANT_SHOP03_FRONT_02_B");
	TA_Sit_Chair(18,0,22,0,"TAVERN02_B");
	TA_Sit_Throne(22,0,8,0,"NW_CITY_HOTEL_UPTSAIRS_05");
};

func void Rtn_Dead_4006()
{
	TA_Sleep(8,0,22,0,"NW_CITY_HABOUR_KASERN_05_01");
	TA_Sleep(22,0,8,0,"NW_CITY_HABOUR_KASERN_05_01");
};

