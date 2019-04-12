
func int C_WantToAttackRoomIntruder(var C_Npc slf)
{
	if((self.guild == GIL_MIL) || (self.guild == GIL_PAL) || (self.guild == GIL_SLD) || (self.guild == GIL_DJG) || (B_GetPlayerCrime(self) != CRIME_NONE))
	{
		return TRUE;
	};
	return FALSE;
};

