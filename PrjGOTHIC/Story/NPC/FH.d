
instance FH(Npc_Default)
{
	name[0] = "Помощник по лицам";
	npcType = NPCTYPE_FRIEND;
	aivar[AIV_IgnoresArmor] = TRUE;
	guild = GIL_NONE;
	level = 999;
	voice = 5;
	id = 1311;
	flags = 0;
	attribute[ATR_STRENGTH] = 45;
	attribute[ATR_DEXTERITY] = 35;
	attribute[ATR_MANA_MAX] = 50;
	attribute[ATR_MANA] = 50;
	attribute[ATR_HITPOINTS_MAX] = 220;
	attribute[ATR_HITPOINTS] = 220;
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Gomez,BodyTex_N,NO_ARMOR);
	fight_tactic = FAI_HUMAN_STRONG;
	daily_routine = Rtn_start_1311;
};


func void Rtn_start_1311()
{
	TA_Smalltalk(8,0,23,0,"XXX");
	TA_Smalltalk(23,0,8,0,"XXX");
};

