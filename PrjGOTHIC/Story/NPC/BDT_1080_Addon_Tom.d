
instance BDT_1080_Addon_Tom(Npc_Default)
{
	name[0] = "Том";
	guild = GIL_BDT;
	id = 1080;
	voice = 11;
	flags = 0;
	npcType = NPCTYPE_BL_MAIN;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_ElBastardo);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_P_OldMan_Gravo,BodyTex_P,ItAr_BDT_M);
	Mdl_SetModelFatness(self,0.75);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_Start_1080;
};


func void Rtn_Start_1080()
{
	TA_Sit_Campfire(9,0,21,0,"ADW_BL_HOEHLE_04");
	TA_Sit_Campfire(21,0,9,0,"ADW_BL_HOEHLE_04");
};

func void Rtn_LAGER_1080()
{
	TA_Stand_Drinking(9,0,21,0,"BL_INN_03_C");
	TA_Stand_Drinking(21,0,9,0,"BL_INN_03_C");
};

