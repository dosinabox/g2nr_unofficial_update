
instance PIR_1390_Addon_InExtremo_DrPymonte(Npc_Default)
{
	name[0] = "Др. Примонт";
	npcType = npctype_main;
	guild = GIL_NONE;
	level = 4;
	voice = 12;
	id = 1390;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 88;
	attribute[ATR_HITPOINTS] = 88;
	CreateInvItem(self,ItMi_IEHarfe);
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"HUM_IE_PYMONTE_INSTRUMENT",DEFAULT,DEFAULT,"HUM_HEAD_PYMONTE",DEFAULT,DEFAULT,-1);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	daily_routine = Rtn_Start_1390;
};


func void Rtn_Start_1390()
{
	TA_Stand_Eating(5,0,20,0,"WP_COOK_CAULDRON");
	TA_Stand_Eating(20,0,5,0,"WP_COOK_CAULDRON");
};

func void Rtn_Concert_1390()
{
	TA_Concert(5,0,20,0,"WP_COOK_CAULDRON");
	TA_Concert(20,0,5,0,"WP_COOK_CAULDRON");
};

