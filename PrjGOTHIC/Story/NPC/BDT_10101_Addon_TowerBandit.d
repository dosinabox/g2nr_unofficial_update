
instance BDT_10101_Addon_TowerBandit(Npc_Default)
{
	name[0] = NAME_Bandit;
	guild = GIL_BDT;
	id = 10101;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Sword);
	EquipItem(self,ItRw_Mil_Crossbow);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_L_Ratford,BodyTex_L,ItAr_BDT_M);
	Mdl_SetModelFatness(self,0.5);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_Start_10101;
};


func void Rtn_Start_10101()
{
	TA_Sit_Campfire(9,0,21,0,"ADW_PIRATECAMP_2_TOWER_05");
	TA_Sit_Campfire(21,0,9,0,"ADW_PIRATECAMP_2_TOWER_05");
};

