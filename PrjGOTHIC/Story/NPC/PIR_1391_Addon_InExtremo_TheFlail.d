
instance PIR_1391_Addon_InExtremo_TheFlail(Npc_Default)
{
	name[0] = "Моргенштерн";
	guild = GIL_NONE;
	id = 1391;
	voice = 3;
	flags = NPC_FLAG_IMMORTAL;
	npcType = NPCTYPE_MAIN;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_STRONG;
	CreateInvItem(self,ItMi_IEDrum);
	B_CreateAmbientInv(self);
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"HUM_IE_FLAIL_INSTRUMENT",DEFAULT,DEFAULT,"HUM_HEAD_FLAIL",DEFAULT,DEFAULT,NO_ARMOR);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_1391;
};


func void Rtn_Start_1391()
{
	TA_Stand_Eating(5,0,20,0,"NW_CITY_IE_01");
	TA_Stand_Eating(20,0,5,0,"NW_CITY_IE_01");
};

func void Rtn_Concert_1391()
{
	TA_Concert(5,0,20,0,"NW_CITY_IE_01");
	TA_Concert(20,0,5,0,"NW_CITY_IE_02");
};

