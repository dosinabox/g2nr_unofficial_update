
func int C_NpcIsAfraidOfOrcs(var C_Npc slf)
{
	if(C_NpcIsMage(slf))
	{
		return FALSE;
	};
	if(C_NpcIsPaladin(slf))
	{
		return FALSE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mario))
	{
		return FALSE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DiegoNW))
	{
		return FALSE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Lares))
	{
		return FALSE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Bartok))
	{
		return FALSE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Lester))
	{
		return FALSE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Cavalorn))
	{
		return FALSE;
	};
	return TRUE;
};

