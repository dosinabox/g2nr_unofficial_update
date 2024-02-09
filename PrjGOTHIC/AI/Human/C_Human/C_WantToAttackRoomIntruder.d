
func int C_WantToAttackRoomIntruder(var C_Npc slf)
{
	if(slf.guild == GIL_MIL)
	{
		return TRUE;
	};
	if(slf.guild == GIL_PAL)
	{
		return TRUE;
	};
	if(slf.guild == GIL_SLD)
	{
		return TRUE;
	};
	if(slf.guild == GIL_DJG)
	{
		return TRUE;
	};
	if(B_GetPlayerCrime(slf) != CRIME_NONE)
	{
		return TRUE;
	};
	return FALSE;
};

