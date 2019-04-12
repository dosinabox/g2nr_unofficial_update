
func int C_NpcIsHero(var C_Npc slf)
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(her))
	{
		return TRUE;
	};
	return FALSE;
};

