
instance BDT_10400_Addon_DeadBandit(Npc_Default)
{
	name[0] = "Бандит";
	guild = GIL_BDT;
	id = 10400;
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
	EquipItem(self,ItMw_1h_Sld_Sword);
	CreateInvItems(self,ItMi_Gold,50);
	CreateInvItems(self,ItWr_DexStonePlate1_Addon,1);
	CreateInvItems(self,ItWr_OneHStonePlate1_Addon,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_L_Ian,BodyTex_L,ItAr_BDT_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_10400;
};


func void Rtn_Start_10400()
{
	TA_Stand_WP(8,0,16,0,"ADW_ADANOSTEMPEL_RHADEMES_DEADBDT_02");
	TA_Stand_WP(16,0,8,0,"ADW_ADANOSTEMPEL_RHADEMES_DEADBDT_02");
};

