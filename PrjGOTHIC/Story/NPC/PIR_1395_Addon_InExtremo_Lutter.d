
instance PIR_1395_Addon_InExtremo_Lutter(Npc_Default)
{
	name[0] = "Люттер";
	npcType = npctype_main;
	guild = GIL_NONE;
	level = 4;
	voice = 7;
	id = 1395;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 88;
	attribute[ATR_HITPOINTS] = 88;
	CreateInvItem(self,ItMi_IEDrumScheit);
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"Hum_IE_Lutter_INSTRUMENT",DEFAULT,DEFAULT,"HUM_HEAD_Lutter",DEFAULT,DEFAULT,-1);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	daily_routine = Rtn_Start_1395;
};


func void Rtn_Start_1395()
{
	TA_Stand_Eating(5,0,20,0,"WP_STAND");
	TA_Stand_Eating(20,0,5,0,"WP_STAND");
};

func void Rtn_Concert_1395()
{
	TA_Concert(5,0,20,0,"WP_STAND");
	TA_Concert(20,0,5,0,"WP_STAND");
};

