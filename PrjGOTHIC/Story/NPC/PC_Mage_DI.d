
instance PC_Mage_DI(Npc_Default)
{
	name[0] = "������";
	guild = GIL_KDF;
	id = 22;
	voice = 3;
	flags = 0;
	npcType = NPCTYPE_FRIEND;
	aivar[AIV_PARTYMEMBER] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	aivar[AIV_NPCIsTrader] = TRUE;
	aivar[AIV_Teeth] = 1;
	B_SetAttributesToChapter(self,6);
	attribute[ATR_STRENGTH] = 1;
	attribute[ATR_DEXTERITY] = 1;
	fight_tactic = FAI_HUMAN_STRONG;
	B_CreateItemToSteal(self,45,ItMi_Gold,120);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Milten,BodyTex_N,ITAR_KDF_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_22;
};


func void Rtn_Start_22()
{
	TA_Smalltalk(8,0,23,0,"SHIP_CREW_19");
	TA_Sit_Bench(23,0,8,0,"SHIP_DECK_29");
};

func void Rtn_UNDEADDRAGONDEAD_22()
{
	TA_Stand_WP(8,0,23,0,"SKELETTE");
	TA_Stand_WP(23,0,8,0,"SKELETTE");
};

func void Rtn_SittingShipDI_22()
{
	TA_Sit_Bench(8,0,23,0,"SHIP_DECK_29");
	TA_Sit_Bench(23,0,8,0,"SHIP_DECK_29");
};

