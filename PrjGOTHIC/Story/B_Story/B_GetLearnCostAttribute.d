
func int GetMainAttributeCost(var int current,var int amount)
{
	if(LP_Static > 0)
	{
		return LP_Static * amount;
	};
	if(current >= 120)
	{
		return 5 * amount;
	};
	if(current >= 90)
	{
		if((HonestStatCalculation == TRUE) && (current + amount > 120))
		{
			return (5 * amount) + current - 120;
		};
		return 4 * amount;
	};
	if(current >= 60)
	{
		if((HonestStatCalculation == TRUE) && (current + amount > 90))
		{
			return (4 * amount) + current - 90;
		};
		return 3 * amount;
	};
	if(current >= 30)
	{
		if((HonestStatCalculation == TRUE) && (current + amount > 60))
		{
			return (3 * amount) + current - 60;
		};
		return 2 * amount;
	};
	if((HonestStatCalculation == TRUE) && (current + amount > 30))
	{
		return (2 * amount) + current - 30;
	};
	return amount;
};

func int GetRegenerationAttributeCost(var int current)
{
	if(current == 0)
	{
		return 1;
	};
	if(current <= 11)
	{
		return 3;
	};
	if(current <= 21)
	{
		return 2;
	};
	return 1;
};

func int B_GetLearnCostAttribute(var C_Npc oth,var int attribut,var int amount)
{
	var int current;
	if(attribut == ATR_STRENGTH)
	{
		current = oth.aivar[REAL_STRENGTH];
		if(PenaltiesAffectLearnCost == TRUE)
		{
			current -= OrcRingCurrentPenalty;
		};
		return GetMainAttributeCost(current,amount);
	};
	if(attribut == ATR_DEXTERITY)
	{
		return GetMainAttributeCost(oth.aivar[REAL_DEXTERITY],amount);
	};
	if(attribut == ATR_MANA_MAX)
	{
		return GetMainAttributeCost(oth.aivar[REAL_MANA_MAX],amount);
	};
	if(attribut == ATR_REGENERATEHP)
	{
		return GetRegenerationAttributeCost(oth.attribute[ATR_REGENERATEHP]);
	};
	if(attribut == ATR_REGENERATEMANA)
	{
		return GetRegenerationAttributeCost(oth.attribute[ATR_REGENERATEMANA]);
	};
	Print(PRINT_WrongParameter);
	return 0;
};

