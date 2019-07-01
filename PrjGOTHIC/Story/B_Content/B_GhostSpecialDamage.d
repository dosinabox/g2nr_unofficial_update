
func int B_GhostSpecialDamage(var C_Npc oth,var C_Npc slf)
{
//	var C_Npc Quarho;
//	var C_Npc Rhadem;
	var C_Npc her;
//	Quarho = Hlp_GetNpc(NONE_ADDON_111_Quarhodron);
//	Rhadem = Hlp_GetNpc(NONE_ADDON_112_Rhademes);
	her = Hlp_GetNpc(PC_Hero);
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Quarhodron)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Rhademes)))
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
				GhostAttackWarn += 1;
				if(GhostAttackWarn < 3)
				{
					oth.attribute[ATR_HITPOINTS] /= 2;
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


func void B_ArrowBonusDamage(var C_Npc oth,var C_Npc slf)
{
	var C_Item readyweap;
	readyweap = Npc_GetReadiedWeapon(oth);
	if(readyweap.munition == ItRw_Addon_FireArrow)
	{
		Wld_PlayEffect("spellFX_Firestorm_SPREAD",slf,slf,0,0,0,FALSE);
		Wld_PlayEffect("VOB_MAGICBURN",slf,slf,0,0,0,FALSE);
		if(slf.flags == 0)
		{
			if(slf.protection[PROT_FIRE] < 40)
			{
				if((slf.attribute[ATR_HITPOINTS] + slf.protection[PROT_FIRE] - 40) >= 0)
				{
					slf.attribute[ATR_HITPOINTS] -= (40 - slf.protection[PROT_FIRE]);
				}
				else
				{
					slf.attribute[ATR_HITPOINTS] = 0;
				};
			};
		};
		if(Npc_GetDistToNpc(slf,oth) <= 600)
		{
			Wld_PlayEffect("VOB_MAGICBURN",oth,oth,0,0,0,FALSE);
			if(oth.protection[PROT_FIRE] < 40)
			{
				if((oth.attribute[ATR_HITPOINTS] + oth.protection[PROT_FIRE] - 40) >= 0)
				{
					oth.attribute[ATR_HITPOINTS] -= (40 - oth.protection[PROT_FIRE]);
				}
				else
				{
					oth.attribute[ATR_HITPOINTS] = 0;
				};
			};
			if(oth.attribute[ATR_HITPOINTS] <= 0)
			{
				AI_PlayAni(oth,"T_DEAD");
			};
		};
		if(Npc_IsDead(slf))
		{
			B_GiveDeathXP(oth,slf);
		};
	};
};

