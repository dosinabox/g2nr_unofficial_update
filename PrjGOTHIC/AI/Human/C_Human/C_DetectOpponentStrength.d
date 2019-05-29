
func int C_AmIStronger(var C_Npc slf,var C_Npc oth)
{
	if(oth.id == 0)
	{
		if((oth.guild > GIL_SEPERATOR_HUM) && (oth.guild < GIL_SEPERATOR_ORC) && ((slf.level * 2) > MonsterTransformLevel))
		{
			return TRUE;
		}
		else if((oth.guild < GIL_SEPERATOR_HUM) && (slf.aivar[AIV_DefeatedByPlayer] == TRUE))
		{
			return FALSE;
		};
	};
	if((slf.level * 2) > oth.level)
	{
		return TRUE;
	};
	return FALSE;
};

func int C_AmIWeaker(var C_Npc slf,var C_Npc oth)
{
	if(oth.id == 0)
	{
		if((oth.guild > GIL_SEPERATOR_HUM) && (oth.guild < GIL_SEPERATOR_ORC) && ((slf.level * 2) <= MonsterTransformLevel))
		{
			return TRUE;
		}
		else if((oth.guild < GIL_SEPERATOR_HUM) && (slf.aivar[AIV_DefeatedByPlayer] == TRUE))
		{
			return TRUE;
		};
	};
	if((slf.level * 2) <= oth.level)
	{
		return TRUE;
	};
	return FALSE;
};

