
instance VLK_401_Cornelius(Npc_Default)
{
	name[0] = "Корнелиус";
//	guild = GIL_NONE;
	guild = GIL_VLK;
	id = 401;
	voice = 13;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_ShortSword5);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_P_Weak_Ulf_Wohlers,BodyTex_P,ITAR_Governor);
	Mdl_SetModelFatness(self,0.9);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_401;
};


func void Rtn_Start_401()
{
	TA_Read_Bookstand(8,0,23,0,"NW_CITY_CORNELIUS");
	TA_Sit_Throne(23,0,8,0,"NW_CITY_LARIUS");
};

func void Rtn_Flee_401()
{
	TA_FleeToWp(8,0,23,0,"NW_XARDAS_BANDITS_LEFT");
	TA_FleeToWp(23,0,8,0,"NW_XARDAS_BANDITS_LEFT");
};

func void Rtn_Prison_401()
{
	TA_Stand_Guarding(8,0,23,0,"NW_CITY_HABOUR_KASERN_BORKA");
	TA_Stand_Guarding(23,0,8,0,"NW_CITY_HABOUR_KASERN_BORKA");
};

