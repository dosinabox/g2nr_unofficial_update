
instance BDT_10023_Addon_Wache(Npc_Default)
{
	name[0] = "Охранник рабов";
	guild = GIL_BDT;
	id = 10023;
	voice = 11;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_L_Tough01,BodyTex_L,ITAR_Bloodwyn_Addon);
	Mdl_SetModelFatness(self,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_Start_10023;
};


func void Rtn_Start_10023()
{
	TA_Stand_Guarding(6,0,12,0,"ADW_MINE_LAGER_01");
	TA_Stand_Guarding(12,0,6,0,"ADW_MINE_LAGER_01");
};

func void Rtn_SOUP_10023()
{
	TA_Stand_Eating(6,0,12,0,"ADW_MINE_27");
	TA_Stand_Eating(12,0,6,0,"ADW_MINE_27");
};

