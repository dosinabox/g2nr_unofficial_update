
func int B_GhostSpecialDamage(var C_Npc oth,var C_Npc slf)
{
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Quarhodron)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Rhademes)))
	{
		Wld_PlayEffect("spellFX_BELIARSRAGE",oth,oth,0,0,0,FALSE);
		if(oth.flags != NPC_FLAG_IMMORTAL)
		{
			if(!C_NpcIsHero(oth))
			{
				Npc_ChangeAttribute(oth,ATR_HITPOINTS,-oth.attribute[ATR_HITPOINTS_MAX]);
			}
			else
			{
				GhostAttackWarn += 1;
				if(GhostAttackWarn < 3)
				{
					oth.attribute[ATR_HITPOINTS] /= 2;
				}
				else
				{
					oth.attribute[ATR_HITPOINTS] = 0;
					AI_PlayAni(oth,"T_DEAD");
				};
			};
		};
	};
	return FALSE;
};

