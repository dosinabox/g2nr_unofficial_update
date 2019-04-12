
instance VLK_418_Gritta(Npc_Default)
{
	name[0] = "Гритта";
	guild = GIL_VLK;
	id = 418;
	voice = 16;
	flags = 0;
	npcType = npctype_main;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 5;
	attribute[ATR_HITPOINTS] = 5;
	fight_tactic = FAI_HUMAN_MASTER;
	CreateInvItems(self,ItMi_Gold,100);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe8",FaceBabe_N_YoungBlonde,BodyTex_N,ITAR_VlkBabe_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_418;
};


func void Rtn_Start_418()
{
	TA_Stand_Sweeping(8,0,12,0,"NW_CITY_MERCHANT_HUT_01_IN");
	TA_Cook_Stove(12,0,14,0,"NW_CITY_BED_BOSPER_B");
	TA_Stand_Sweeping(14,0,18,0,"NW_CITY_MERCHANT_HUT_01_IN");
	TA_Cook_Stove(18,0,20,0,"NW_CITY_BED_BOSPER_B");
	TA_Read_Bookstand(20,0,23,0,"NW_CITY_MERCHANT_HUT_01_IN");
	TA_Sleep(23,0,8,0,"NW_CITY_BED_BOSPER_B");
};

