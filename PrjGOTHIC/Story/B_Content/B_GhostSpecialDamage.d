
func void B_GhostSpecialDamage(var C_Npc attacker)
{
	Wld_PlayEffect("spellFX_BELIARSRAGE",attacker,attacker,0,0,0,FALSE);
	if(attacker.flags != NPC_FLAG_IMMORTAL)
	{
		if(!C_NpcIsHero(attacker))
		{
			Npc_ChangeAttribute(attacker,ATR_HITPOINTS,-attacker.attribute[ATR_HITPOINTS_MAX]);
		}
		else
		{
			GhostAttackWarn += 1;
			if(GhostAttackWarn < 3)
			{
				attacker.attribute[ATR_HITPOINTS] /= 2;
			}
			else
			{
				attacker.attribute[ATR_HITPOINTS] = 0;
				AI_PlayAni(attacker,"T_DEAD");
			};
		};
	};
};

