
instance BDT_1074_Addon_Edgor(Npc_Default)
{
	name[0] = "Ýהדמנ";
	guild = GIL_BDT;
	id = 1074;
	voice = 6;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_1h_Sld_Sword);
	EquipItem(self,ItRw_Sld_Bow);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_NormalBart20,BodyTex_N,ItAr_BDT_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,65);
	daily_routine = Rtn_Start_1074;
};


func void Rtn_Start_1074()
{
	TA_Sit_Campfire(9,0,12,0,"ADW_BANDIT_VP1_09");
	TA_Sit_Campfire(12,0,9,0,"ADW_BANDIT_VP1_09");
};

