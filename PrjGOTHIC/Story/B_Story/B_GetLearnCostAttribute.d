
func int B_GetLearnCostAttribute(var C_Npc oth,var int attribut)
{
	var int kosten;
	kosten = 0;
	if(attribut == ATR_STRENGTH)
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
	};
	if(attribut == ATR_DEXTERITY)
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
	};
	if(attribut == ATR_MANA_MAX)
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
	};
	return kosten;
};

