
instance VLK_454_Buerger(Npc_Default)
{
	name[0] = NAME_Buerger;
	guild = GIL_VLK;
	id = 454;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_P_OldMan_Gravo,BodyTex_P,ITAR_Vlk_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_454;
};


func void Rtn_Start_454()
{
	TA_Stand_ArmsCrossed(5,15,20,15,"NW_CITY_MERCHANT_PATH_14_C");
	TA_Smoke_Waterpipe(20,15,1,15,"NW_CITY_RAUCH_03");
	TA_Sit_Chair(1,15,5,15,"NW_CITY_TAVERN_IN_01");
};

func void Rtn_VatrasAway_454()
{
	TA_Sit_Chair(5,15,20,15,"NW_CITY_TAVERN_IN_01");
	TA_Smoke_Waterpipe(20,15,1,15,"NW_CITY_RAUCH_03");
	TA_Sit_Chair(1,15,5,15,"NW_CITY_TAVERN_IN_01");
};

