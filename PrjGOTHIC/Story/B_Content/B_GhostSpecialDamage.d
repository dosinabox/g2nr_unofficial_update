
func int B_GhostSpecialDamage(var C_Npc oth,var C_Npc slf)
{
	var C_Npc Quarho;
	var C_Npc Rhadem;
	var C_Npc her;
	Quarho = Hlp_GetNpc(NONE_ADDON_111_Quarhodron);
	Rhadem = Hlp_GetNpc(NONE_ADDON_112_Rhademes);
	her = Hlp_GetNpc(PC_Hero);
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Quarho)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Rhadem)))
	{
		Wld_PlayEffect("spellFX_BELIARSRAGE",oth,oth,0,0,0,FALSE);
		if(oth.flags != NPC_FLAG_IMMORTAL)
		{
			if(Hlp_GetInstanceID(oth) != Hlp_GetInstanceID(her))
			{
				Npc_ChangeAttribute(oth,ATR_HITPOINTS,-oth.attribute[ATR_HITPOINTS_MAX]);
			}
			else
			{
				GhostAttackWarn = GhostAttackWarn + 1;
				if(GhostAttackWarn < 3)
				{
					oth.attribute[ATR_HITPOINTS] = oth.attribute[ATR_HITPOINTS] / 2;
				}
				else if(Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(her))
				{
					oth.attribute[ATR_HITPOINTS] = 0;
					AI_PlayAni(oth,"T_DEAD");
				};
			};
		};
		return FALSE;
	};
};

