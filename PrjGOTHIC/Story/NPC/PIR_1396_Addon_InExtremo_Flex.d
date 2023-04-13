
instance PIR_1396_Addon_InExtremo_Flex(Npc_Default)
{
	name[0] = "Флекс";
	guild = GIL_NONE;
	id = 1396;
	voice = 13;
	flags = NPC_FLAG_IMMORTAL;
	npcType = NPCTYPE_MAIN;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_STRONG;
	CreateInvItem(self,ItMi_IEDudelBlau);
	B_CreateAmbientInv(self);
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"Hum_IE_Flex_INSTRUMENT",DEFAULT,DEFAULT,"HUM_HEAD_Flex",DEFAULT,DEFAULT,NO_ARMOR);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_1396;
};


func void Rtn_Start_1396()
{
	TA_Stand_Eating(5,0,20,0,"NW_CITY_IE_06");
	TA_Stand_Eating(20,0,5,0,"NW_CITY_IE_06");
};

func void Rtn_Concert_1396()
{
	TA_Concert(5,0,20,0,"NW_CITY_IE_06");
	TA_Concert(20,0,5,0,"NW_CITY_IE_06");
};

