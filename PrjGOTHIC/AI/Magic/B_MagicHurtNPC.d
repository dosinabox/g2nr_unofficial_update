
func void B_MagicHurtNpc(var C_Npc attacker,var C_Npc target,var int damage)
{
	if((target.flags != NPC_FLAG_IMMORTAL) && (target.protection[PROT_MAGIC] != IMMUNE))
	{
		Npc_ChangeAttribute(target,ATR_HITPOINTS,-damage);
	};
	if(Npc_IsDead(target))
	{
		B_GiveDeathXP(attacker,target);
	};
};

func void B_FireHurtNpc(var C_Npc attacker,var C_Npc target,var int damage)
{
	var int effectiveDamage;
	if((target.flags != NPC_FLAG_IMMORTAL) && (target.protection[PROT_FIRE] != IMMUNE))
	{
		effectiveDamage = damage - target.protection[PROT_FIRE];
		if(effectiveDamage < 0)
		{
			effectiveDamage = 0;
		};
		Npc_ChangeAttribute(target,ATR_HITPOINTS,-effectiveDamage);
	};
	if(Npc_IsDead(target))
	{
		B_GiveDeathXP(attacker,target);
	};
};

