
instance BDT_10401_Addon_DeadBandit(Npc_Default)
{
	name[0] = "Бандит";
	guild = GIL_BDT;
	id = 10401;
	voice = 4;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	level = 20;
	attribute[ATR_STRENGTH] = 70;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_2h_Sld_Sword);
	CreateInvItems(self,ItMi_GoldChalice,1);
	CreateInvItems(self,ItMi_SilverRing,1);
	CreateInvItems(self,ItPo_Health_02,2);
	CreateInvItems(self,ItPo_Mana_01,5);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_P_NormalBart01,BodyTex_P,ITAR_Thorus_Addon);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_10401;
};


func void Rtn_Start_10401()
{
	TA_Stand_WP(8,0,16,0,"ADW_ADANOSTEMPEL_RHADEMES_DEADBDT_01");
	TA_Stand_WP(16,0,8,0,"ADW_ADANOSTEMPEL_RHADEMES_DEADBDT_01");
};

