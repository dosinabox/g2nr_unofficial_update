
instance PIR_1393_Addon_InExtremo_Unicorn(Npc_Default)
{
	name[0] = "Единорог";
	guild = GIL_NONE;
	id = 1393;
	voice = 4;
	flags = NPC_FLAG_IMMORTAL;
	npcType = NPCTYPE_MAIN;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_STRONG;
	CreateInvItem(self,ItMi_IELaute);
	B_CreateAmbientInv(self);
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"HUM_IE_UNICORN_INSTRUMENT",DEFAULT,DEFAULT,"HUM_HEAD_UNICORN",DEFAULT,DEFAULT,NO_ARMOR);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_1393;
};


func void Rtn_Start_1393()
{
	TA_Stand_Eating(5,0,20,0,"NW_CITY_IE_03");
	TA_Stand_Eating(20,0,5,0,"NW_CITY_IE_03");
};

func void Rtn_Concert_1393()
{
	TA_Concert(5,0,20,0,"NW_CITY_IE_03");
	TA_Concert(20,0,5,0,"NW_CITY_IE_03");
};

