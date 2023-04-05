
instance PIR_1395_Addon_InExtremo_Lutter(Npc_Default)
{
	name[0] = "Люттер";
	guild = GIL_NONE;
	id = 1395;
	voice = 7;
	flags = NPC_FLAG_IMMORTAL;
	npcType = NPCTYPE_MAIN;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_STRONG;
	CreateInvItem(self,ItMi_IEDrumScheit);
	B_CreateAmbientInv(self);
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"Hum_IE_Lutter_INSTRUMENT",DEFAULT,DEFAULT,"HUM_HEAD_Lutter",DEFAULT,DEFAULT,NO_ARMOR);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_1395;
};


func void Rtn_Start_1395()
{
	TA_Stand_Eating(5,0,20,0,"NW_CITY_IE_05");
	TA_Stand_Eating(20,0,5,0,"NW_CITY_IE_05");
};

func void Rtn_Concert_1395()
{
	TA_Concert(5,0,20,0,"NW_CITY_IE_05");
	TA_Concert(20,0,5,0,"NW_CITY_IE_05");
};

