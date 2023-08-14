
instance BDT_1024_MalethsBandit(Npc_Default)
{
	name[0] = "Главарь бандитов";
	guild = GIL_BDT;
	id = 1024;
	voice = 9;
	flags = 0;
	npcType = NPCTYPE_MAIN;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Axe);
	EquipItem(self,ItRw_Mil_Crossbow);
	B_CreateAmbientInv(self);
	CreateInvItem(self,ItWr_Poster_MIS);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_P_ToughBald_Nek,BodyTex_P,ITAR_Bloodwyn_Addon);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_1024;
};

func void Rtn_Start_1024()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"NW_FARM1_BANDITS_CAVE_08");
	TA_Stand_ArmsCrossed(23,0,8,0,"NW_FARM1_BANDITS_CAVE_08");
};

