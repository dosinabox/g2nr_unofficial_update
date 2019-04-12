
instance VLK_456_Abuyin(Npc_Default)
{
	name[0] = "¿·ÛËÌ";
	guild = GIL_VLK;
	id = 456;
	voice = 13;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_1h_Vlk_Dagger);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_Normal_Sharky,BodyTex_B,ITAR_Vlk_M);
	Mdl_SetModelFatness(self,0);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_456;
};


func void Rtn_Start_456()
{
	TA_Stand_ArmsCrossed(7,20,1,20,"NW_CITY_MERCHANT_BENCH_02");
	TA_Sleep(1,20,7,20,"NW_CITY_HOTEL_BED_05");
};

