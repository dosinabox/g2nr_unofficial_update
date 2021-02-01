
instance KDF_508_Gorax(Npc_Default)
{
	name[0] = "Горакс";
	guild = GIL_KDF;
	id = 508;
	voice = 14;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_NPCIsTrader] = TRUE;
	B_SetAttributesToChapter(self,4);
	self.attribute[ATR_STRENGTH] = Condition_Stab04;
	self.attribute[ATR_DEXTERITY] = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMW_Addon_Stab04);
	CreateInvItems(self,ItKe_Innos_MIS,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_OldBald_Jeremiah,BodyTex_N,ITAR_KDF_L);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_508;
};


func void Rtn_Start_508()
{
	TA_Stand_Guarding(8,0,23,0,"NW_MONASTERY_WINEMAKER_01");
	TA_Sit_Throne(23,0,0,0,"NW_MONASTERY_ARMCHAIR_03");
	TA_Sleep(0,0,8,0,"NW_MONASTERY_MAGE02_BED_01");
};

func void Rtn_Wait_508()
{
	TA_Stand_Guarding(8,0,23,0,"NW_MONASTERY_PLACE_05");
	TA_Stand_Guarding(23,0,8,0,"NW_MONASTERY_PLACE_05");
};

