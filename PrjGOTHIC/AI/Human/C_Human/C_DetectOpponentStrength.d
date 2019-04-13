
func int C_AmIStronger(var C_Npc slf,var C_Npc oth)
{
	if((2 * slf.level) > oth.level)
	{
		return TRUE;
	};
	return FALSE;
};

func int C_AmIWeaker(var C_Npc slf,var C_Npc oth)
{
	if((2 * slf.level) <= oth.level)
	{
		return TRUE;
	};
	return FALSE;
};

