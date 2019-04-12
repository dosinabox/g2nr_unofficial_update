
instance PIR_1391_Addon_InExtremo_TheFlail(Npc_Default)
{
	name[0] = "÷ÂÔ";
	npcType = npctype_main;
	guild = GIL_NONE;
	level = 4;
	flags = 0;
	voice = 3;
	id = 1391;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 88;
	attribute[ATR_HITPOINTS] = 88;
	CreateInvItem(self,ItMi_IEDrum);
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"HUM_IE_FLAIL_INSTRUMENT",DEFAULT,DEFAULT,"HUM_HEAD_FLAIL",DEFAULT,DEFAULT,-1);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	daily_routine = Rtn_Start_1391;
};


func void Rtn_Start_1391()
{
	TA_Stand_Eating(5,0,20,0,"WP_WASH");
	TA_Stand_Eating(20,0,5,0,"WP_WASH");
};

func void Rtn_Concert_1391()
{
	TA_Concert(5,0,20,0,"WP_WASH");
	TA_Concert(20,0,5,0,"WP_WASH");
};

