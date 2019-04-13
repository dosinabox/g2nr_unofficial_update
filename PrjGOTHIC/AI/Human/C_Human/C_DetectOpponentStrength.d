
func int C_AmIStronger(var C_Npc slf,var C_Npc oth)
{
	if(oth.id == 0)
	{
		if((oth.guild > GIL_SEPERATOR_HUM) && (oth.guild < GIL_SEPERATOR_ORC) && ((2 * slf.level) > MonsterTransformLevel))
		{
			return TRUE;
		}
		else if((oth.guild < GIL_SEPERATOR_HUM) && (slf.aivar[AIV_DefeatedByPlayer] == TRUE))
		{
			return FALSE;
		};
	};
	if((2 * slf.level) > oth.level)
	{
		return TRUE;
	};
	return FALSE;
};

func int C_AmIWeaker(var C_Npc slf,var C_Npc oth)
{
	if(oth.id == 0)
	{
		if((oth.guild > GIL_SEPERATOR_HUM) && (oth.guild < GIL_SEPERATOR_ORC) && ((2 * slf.level) <= MonsterTransformLevel))
		{
			return TRUE;
		}
		else if((oth.guild < GIL_SEPERATOR_HUM) && (slf.aivar[AIV_DefeatedByPlayer] == TRUE))
		{
			return TRUE;
		};
	};
	if((2 * slf.level) <= oth.level)
	{
		return TRUE;
	};
	return FALSE;
};

