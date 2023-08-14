
instance PIR_1392_Addon_InExtremo_ThomasTheForger(Npc_Default)
{
	name[0] = "Ланг";
	guild = GIL_NONE;
	id = 1392;
	voice = 8;
	flags = NPC_FLAG_IMMORTAL;
	npcType = NPCTYPE_MAIN;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_STRONG;
	CreateInvItem(self,ItMi_IECello);
	B_CreateAmbientInv(self);
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"HUM_IE_THOMAS_INSTRUMENT",DEFAULT,DEFAULT,"HUM_HEAD_THOMAS",DEFAULT,DEFAULT,NO_ARMOR);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_1392;
};


func void Rtn_Start_1392()
{
	TA_Stand_Eating(5,0,20,0,"NW_CITY_IE_02");
	TA_Stand_Eating(20,0,5,0,"NW_CITY_IE_02");
};

func void Rtn_Concert_1392()
{
	TA_Concert(5,0,20,0,"NW_CITY_IE_02");
	TA_Concert(20,0,5,0,"NW_CITY_IE_02");
};

