
func void B_MagicHurtNpc(var C_Npc slf,var C_Npc oth,var int damage)
{
	var int effectiveDamage;
	if((oth.flags != NPC_FLAG_IMMORTAL) || (oth.protection[PROT_MAGIC] != IMMUNE))
	{
		effectiveDamage = damage - oth.protection[PROT_MAGIC];
		if(effectiveDamage < 0)
		{
			effectiveDamage = 0;
		};
		Npc_ChangeAttribute(oth,ATR_HITPOINTS,-effectiveDamage);
	};
	if(Npc_IsDead(oth))
	{
		B_GiveDeathXP(slf,oth);
	};
};

func void B_FireHurtNpc(var C_Npc slf,var C_Npc oth,var int damage)
{
	var int effectiveDamage;
	if((oth.flags != NPC_FLAG_IMMORTAL) || (oth.protection[PROT_FIRE] != IMMUNE))
	{
		effectiveDamage = damage - oth.protection[PROT_FIRE];
		if(effectiveDamage < 0)
		{
			effectiveDamage = 0;
		};
		Npc_ChangeAttribute(oth,ATR_HITPOINTS,-effectiveDamage);
	};
	if(Npc_IsDead(oth))
	{
		B_GiveDeathXP(slf,oth);
	};
};

