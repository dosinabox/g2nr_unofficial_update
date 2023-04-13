
instance PIR_1394_Addon_InExtremo_YellowPfeiffer(Npc_Default)
{
	name[0] = "Æוכעûי Ïפאיפונ";
	guild = GIL_NONE;
	id = 1394;
	voice = 9;
	flags = NPC_FLAG_IMMORTAL;
	npcType = NPCTYPE_MAIN;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_STRONG;
	CreateInvItem(self,ItMi_IEDudelGelb);
	B_CreateAmbientInv(self);
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"Hum_IE_Pfeiffer_INSTRUMENT",DEFAULT,DEFAULT,"HUM_HEAD_Pfeiffer",DEFAULT,DEFAULT,NO_ARMOR);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_1394;
};


func void Rtn_Start_1394()
{
	TA_Stand_Eating(5,0,20,0,"NW_CITY_IE_04");
	TA_Stand_Eating(20,0,5,0,"NW_CITY_IE_04");
};

func void Rtn_Concert_1394()
{
	TA_Concert(5,0,20,0,"NW_CITY_IE_04");
	TA_Concert(20,0,5,0,"NW_CITY_IE_04");
};

