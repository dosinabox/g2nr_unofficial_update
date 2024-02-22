
func int C_NpcIsMage(var C_Npc slf)
{
	if(slf.guild == GIL_KDF)
	{
		return TRUE;
	};
	if(slf.guild == GIL_KDW)
	{
		return TRUE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Xardas))
	{
		return TRUE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Vatras))
	{
		return TRUE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Myxir_CITY))
	{
		return TRUE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Daron))
	{
		return TRUE;
	};
	return FALSE;
};

