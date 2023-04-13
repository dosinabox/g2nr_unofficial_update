
instance PIR_1390_Addon_InExtremo_DrPymonte(Npc_Default)
{
	name[0] = "Доктор Пимонте";
	guild = GIL_NONE;
	id = 1390;
	voice = 12;
	flags = NPC_FLAG_IMMORTAL;
	npcType = NPCTYPE_MAIN;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_STRONG;
	CreateInvItem(self,ItMi_IEHarfe);
	B_CreateAmbientInv(self);
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"HUM_IE_PYMONTE_INSTRUMENT",DEFAULT,DEFAULT,"HUM_HEAD_PYMONTE",DEFAULT,DEFAULT,NO_ARMOR);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_1390;
};


func void Rtn_Start_1390()
{
	TA_Stand_Eating(5,0,20,0,"NW_CITY_HABOUR_KASERN_18");
	TA_Stand_Eating(20,0,5,0,"NW_CITY_HABOUR_KASERN_18");
};

func void Rtn_Concert_1390()
{
	TA_Concert(5,0,20,0,"NW_CITY_HABOUR_KASERN_18");
	TA_Concert(20,0,5,0,"NW_CITY_HABOUR_KASERN_18");
};

