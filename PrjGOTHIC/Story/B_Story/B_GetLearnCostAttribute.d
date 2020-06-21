
func int B_GetLearnCostAttribute(var C_Npc oth,var int attribut)
{
	var int kosten;
	kosten = 0;
	if(attribut == ATR_STRENGTH)
	{
		if(PenaltiesAffectLearnCost == FALSE)
		{
			if(oth.aivar[REAL_STRENGTH] >= 120)
			{
				kosten = 5;
			}
			else if(oth.aivar[REAL_STRENGTH] >= 90)
			{
				kosten = 4;
			}
			else if(oth.aivar[REAL_STRENGTH] >= 60)
			{
				kosten = 3;
			}
			else if(oth.aivar[REAL_STRENGTH] >= 30)
			{
				kosten = 2;
			}
			else
			{
				kosten = 1;
			};
		}
		else
		{
			if((oth.aivar[REAL_STRENGTH] - OrcRingCurrentPenalty) >= 120)
			{
				kosten = 5;
			}
			else if((oth.aivar[REAL_STRENGTH] - OrcRingCurrentPenalty) >= 90)
			{
				kosten = 4;
			}
			else if((oth.aivar[REAL_STRENGTH] - OrcRingCurrentPenalty) >= 60)
			{
				kosten = 3;
			}
			else if((oth.aivar[REAL_STRENGTH] - OrcRingCurrentPenalty) >= 30)
			{
				kosten = 2;
			}
			else
			{
				kosten = 1;
			};
		};
	}
	else if(attribut == ATR_DEXTERITY)
	{
		if(oth.aivar[REAL_DEXTERITY] >= 120)
		{
			kosten = 5;
		}
		else if(oth.aivar[REAL_DEXTERITY] >= 90)
		{
			kosten = 4;
		}
		else if(oth.aivar[REAL_DEXTERITY] >= 60)
		{
			kosten = 3;
		}
		else if(oth.aivar[REAL_DEXTERITY] >= 30)
		{
			kosten = 2;
		}
		else
		{
			kosten = 1;
		};
	}
	else if(attribut == ATR_MANA_MAX)
	{
		if(oth.aivar[REAL_MANA_MAX] >= 120)
		{
			kosten = 5;
		}
		else if(oth.aivar[REAL_MANA_MAX] >= 90)
		{
			kosten = 4;
		}
		else if(oth.aivar[REAL_MANA_MAX] >= 60)
		{
			kosten = 3;
		}
		else if(oth.aivar[REAL_MANA_MAX] >= 30)
		{
			kosten = 2;
		}
		else
		{
			kosten = 1;
		};
	}
	else if(attribut == ATR_REGENERATEHP)
	{
		if(oth.attribute[ATR_REGENERATEHP] > 30)
		{
			kosten = 1;
		}
		else if(oth.attribute[ATR_REGENERATEHP] > 10)
		{
			kosten = 2;
		}
		else
		{
			kosten = 3;
		};
	}
	else if(attribut == ATR_REGENERATEMANA)
	{
		if(oth.attribute[ATR_REGENERATEMANA] > 30)
		{
			kosten = 1;
		}
		else if(oth.attribute[ATR_REGENERATEMANA] > 10)
		{
			kosten = 2;
		}
		else
		{
			kosten = 3;
		};
	};
	return kosten;
};

