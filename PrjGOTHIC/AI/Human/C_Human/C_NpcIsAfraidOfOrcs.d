
func int C_NpcIsAfraidOfOrcs(var C_Npc slf)
{
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Myxir_CITY))
	{
		return FALSE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Daron))
	{
		return FALSE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Vatras))
	{
		return FALSE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Xardas))
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

