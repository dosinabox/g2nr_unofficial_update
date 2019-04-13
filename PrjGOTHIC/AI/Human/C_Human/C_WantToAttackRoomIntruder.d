
func int C_WantToAttackRoomIntruder(var C_Npc slf)
{
	if((slf.guild == GIL_MIL) || (slf.guild == GIL_PAL) || (slf.guild == GIL_SLD) || (slf.guild == GIL_DJG) || (B_GetPlayerCrime(slf) != CRIME_NONE))
	{
		return TRUE;
	};
	return FALSE;
};

