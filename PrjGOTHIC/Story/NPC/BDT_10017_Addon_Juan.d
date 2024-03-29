
instance BDT_10017_Addon_Juan(Npc_Default)
{
	name[0] = "����";
	guild = GIL_BDT;
	id = 10017;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_MAIN;
	aivar[AIV_NPCIsTrader] = TRUE;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_2h_Sld_Axe);
	CreateInvItems(self,ItMi_Addon_Steel_Paket,1);
	CreateInvItems(self,ItMi_Addon_Fisk_Paket,1);
	CreateInvItems(self,ItMi_Grog_Crate,5);
	B_CreateItemToSteal(self,65,ItMi_Gold,73);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_L_NormalBart01,BodyTex_L,ITAR_BDT_H);
	Mdl_SetModelFatness(self,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_Start_10017;
};


func void Rtn_Start_10017()
{
	TA_Sit_Campfire(2,0,10,0,"ADW_SENAT_CAVE_SIT");
	TA_Sit_Campfire(10,0,2,0,"ADW_SENAT_CAVE_SIT");
};

