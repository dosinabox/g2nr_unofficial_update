
func void B_MagicHurtNpc(var C_Npc attacker,var C_Npc target,var int damage)
{
	if(!C_NpcIsImmortal(target) && (target.protection[PROT_MAGIC] != IMMUNE) && (damage > 0))
	{
		Npc_ChangeAttribute(target,ATR_HITPOINTS,-damage);
	};
	if(Npc_IsDead(target))
	{
		B_GiveDeathXP(attacker,target);
	};
};

