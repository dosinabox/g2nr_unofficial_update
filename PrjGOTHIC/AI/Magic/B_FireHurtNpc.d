
func void B_FireHurtNpc(var C_Npc attacker,var C_Npc target,var int damage)
{
	var int effectiveDamage;
	if((target.flags != NPC_FLAG_IMMORTAL) && (target.protection[PROT_FIRE] != IMMUNE) && (damage > 0))
	{
		effectiveDamage = damage - target.protection[PROT_FIRE];
		if(effectiveDamage > 0)
		{
			Npc_ChangeAttribute(target,ATR_HITPOINTS,-effectiveDamage);
		};
	};
	if(Npc_IsDead(target))
	{
		B_GiveDeathXP(attacker,target);
	};
};

