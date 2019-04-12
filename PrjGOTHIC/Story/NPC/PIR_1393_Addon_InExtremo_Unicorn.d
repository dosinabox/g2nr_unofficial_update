
instance PIR_1393_Addon_InExtremo_Unicorn(Npc_Default)
{
	name[0] = "Единорог";
	npcType = npctype_main;
	guild = GIL_NONE;
	level = 4;
	flags = 0;
	voice = 4;
	id = 1393;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 88;
	attribute[ATR_HITPOINTS] = 88;
	CreateInvItem(self,ItMi_IELaute);
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"HUM_IE_UNICORN_INSTRUMENT",DEFAULT,DEFAULT,"HUM_HEAD_UNICORN",DEFAULT,DEFAULT,-1);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	daily_routine = Rtn_Start_1393;
};


func void Rtn_Start_1393()
{
	TA_Stand_Eating(5,0,20,0,"WP_PICK");
	TA_Stand_Eating(20,0,5,0,"WP_PICK");
};

func void Rtn_Concert_1393()
{
	TA_Concert(5,0,20,0,"WP_PICK");
	TA_Concert(20,0,5,0,"WP_PICK");
};

