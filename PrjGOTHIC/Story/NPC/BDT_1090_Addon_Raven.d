
instance BDT_1090_Addon_Raven(Npc_Default)
{
	name[0] = "Ворон";
	guild = GIL_BDT;
	id = 1090;
	voice = 10;
	flags = 0;
	npcType = npctype_main;
	level = 50;
	attribute[ATR_STRENGTH] = 50;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	attribute[ATR_HITPOINTS_MAX] = 500;
	attribute[ATR_HITPOINTS] = 500;
	aivar[AIV_IgnoresArmor] = TRUE;
	aivar[AIV_EnemyOverride] = TRUE;
	attribute[ATR_MANA_MAX] = 666666;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_BeliarWeapon_Raven);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItMi_Addon_Stone_01,1);
	CreateInvItems(self,ItMi_Addon_Stone_02,1);
	CreateInvItems(self,ItMi_Addon_Stone_03,1);
	CreateInvItems(self,ItMi_Addon_Stone_04,1);
	CreateInvItems(self,ItMi_Addon_Stone_05,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_N_Raven,BodyTex_N,ITAR_Raven_Addon);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,90);
	daily_routine = Rtn_Start_1090;
};


func void Rtn_Start_1090()
{
	TA_Pray_Innos_FP(9,0,21,0,"ADW_ADANOSTEMPEL_RAVEN_11");
	TA_Pray_Innos_FP(21,0,9,0,"ADW_ADANOSTEMPEL_RAVEN_11");
};

func void Rtn_WaitforPlayer_1090()
{
	TA_Stand_WP(9,0,21,0,"ADW_ADANOSTEMPEL_RAVEN_11");
	TA_Stand_WP(21,0,9,0,"ADW_ADANOSTEMPEL_RAVEN_11");
};

