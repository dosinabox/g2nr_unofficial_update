
instance PC_Thief_DI(Npc_Default)
{
	name[0] = "Диего";
	guild = GIL_NONE;
	id = 31;
	voice = 11;
	flags = 0;
	npcType = NPCTYPE_FRIEND;
	aivar[AIV_DexToSteal] = 120;
	aivar[AIV_GoldToSteal] = 600;
	aivar[AIV_PARTYMEMBER] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	aivar[AIV_NPCIsTrader] = TRUE;
	aivar[AIV_Teeth] = 4;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	CreateInvItems(self,ItRw_Arrow,10);
	EquipItem(self,ItMw_1h_Sld_Sword);
	EquipItem(self,ItRw_Bow_M_03);
//	EquipItem(self,ItRw_Bow_M_02);
//	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_L_Diego,BodyTex_L,ITAR_Diego);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_31;
};


func void Rtn_Start_31()
{
	TA_Smalltalk(8,0,23,0,"SHIP_CREW_05");
	TA_Smalltalk(23,0,8,0,"SHIP_CREW_05");
};

func void Rtn_UNDEADDRAGONDEAD_31()
{
	TA_Stand_WP(8,0,23,0,"WP_UNDEAD_RIGHT_DOWN_01");
	TA_Stand_WP(23,0,8,0,"WP_UNDEAD_RIGHT_DOWN_01");
};

func void Rtn_SittingShipDI_31()
{
	TA_Sit_Bench(8,0,23,0,"SHIP_CREW_04");
	TA_Smoke_Joint(23,0,8,0,"SHIP_CREW_06");
};

