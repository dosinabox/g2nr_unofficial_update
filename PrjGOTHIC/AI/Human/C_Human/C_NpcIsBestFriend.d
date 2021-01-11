
func int C_NpcIsBestFriend(var C_Npc slf)
{
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DiegoOW))
	{
		return TRUE;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DiegoNW))
	{
		return TRUE;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Diego_DI))
	{
		return TRUE;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Lester))
	{
		return TRUE;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Lester_DI))
	{
		return TRUE;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(MiltenOW))
	{
		return TRUE;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(MiltenNW))
	{
		return TRUE;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Milten_DI))
	{
		return TRUE;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(GornOW))
	{
		return TRUE;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(GornNW_vor_DJG))
	{
		return TRUE;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(GornDJG))
	{
		return TRUE;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(GornNW_nach_DJG))
	{
		return TRUE;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Gorn_DI))
	{
		return TRUE;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DJG_Angar))
	{
		return TRUE;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Angar_NW))
	{
		return TRUE;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Angar_DI))
	{
		return TRUE;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Xardas))
	{
		return TRUE;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Greg_NW))
	{
		return TRUE;
	};
	return FALSE;
};

