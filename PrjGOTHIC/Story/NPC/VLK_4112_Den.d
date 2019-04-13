
instance VLK_4112_Den(Npc_Default)
{
	name[0] = "Δεν";
	guild = GIL_MIL;
	id = 4112;
	voice = 5;
	flags = 0;
	npcType = NPCTYPE_OCAMBIENT;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 1;
	attribute[ATR_HITPOINTS] = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Dagger);
	CreateInvItems(self,ItMi_Gold,200);
	CreateInvItems(self,ItMi_SilverRing,1);
	CreateInvItems(self,ItMi_GoldRing,1);
	CreateInvItems(self,ItMi_SilverCandleHolder,1);
	CreateInvItems(self,ItMi_GoldNecklace,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_NormalBart_Grim,BodyTex_N,ITAR_Mil_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_4112;
};


func void Rtn_Start_4112()
{
	TA_Stand_Guarding(8,0,23,0,"OW_PATH_182");
	TA_Stand_Guarding(23,0,8,0,"OW_PATH_182");
};

