
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
	if(attribut == ATR_REGENERATEHP)
	{
		return GetRegenerationAttributeCost(ATR_Training[ATR_REGENERATEHP]);
	};
	if(attribut == ATR_REGENERATEMANA)
	{
		return GetRegenerationAttributeCost(ATR_Training[ATR_REGENERATEMANA]);
	};
	return GetMainAttributeCost(RealAttributeValue(attribut),amount);
};

