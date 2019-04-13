
instance VLK_406_Herold(Npc_Default)
{
//	name[0] = "Герольд";
	name[0] = "Глашатай";
	guild = GIL_VLK;
	id = 406;
	voice = 4;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Dagger);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal_Sly,BodyTex_N,ITAR_Governor);
	Mdl_SetModelFatness(self,1.5);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_406;
};


func void Rtn_Start_406()
{
	TA_Announce_Herold(5,0,23,55,"NW_CITY_HEROLD_UP");
//	TA_Announce_Herold(20,0,8,0,"NW_CITY_HEROLD_UP");
	TA_Sleep(23,55,5,0,"NW_CITY_HOTEL_BED_06");
};

