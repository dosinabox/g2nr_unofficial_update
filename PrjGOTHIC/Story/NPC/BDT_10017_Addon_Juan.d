
instance BDT_10017_Addon_Juan(Npc_Default)
{
	name[0] = "Хуан";
	guild = GIL_BDT;
	id = 10017;
	voice = 13;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_2h_Sld_Axe);
	CreateInvItems(self,ItMi_Addon_Steel_Paket,1);
	CreateInvItems(self,ItMi_Addon_Lennar_Paket,1);
	CreateInvItems(self,ItFo_Addon_Grog,20);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_L_NormalBart01,BodyTex_L,ItAr_BDT_H);
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

