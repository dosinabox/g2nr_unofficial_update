
func int C_IsPlayerObservedByNpc(var C_Npc slf)
{
	if(!Npc_IsInPlayersRoom(slf))
	{
		return FALSE;
	};
	if(Npc_IsInState(slf,ZS_ObservePlayer))
	{
		return TRUE;
	};
	if(Npc_IsInState(slf,ZS_ClearRoom))
	{
		return TRUE;
	};
	return FALSE;
};

func void B_AssessTheft()
{
	if(!Npc_IsPlayer(other))
	{
		return;
	};
	if((Wld_GetPlayerPortalGuild() >= GIL_NONE) && (Npc_GetHeightToNpc(self,other) > PERC_DIST_INDOOR_HEIGHT))
	{
		return;
	};
	if(Wld_GetGuildAttitude(self.guild,other.guild) == ATT_FRIENDLY)
	{
		if(!Hlp_IsValidItem(item))
		{
			return;
		};
		if(!Npc_OwnedByNpc(item,self))
		{
			return;
		};
	};
	if(!C_IsTakenItemMyPossession(self,item))
	{
		return;
	};
	if(!Npc_CanSeeNpc(self,other))
	{
		if(!C_IsPlayerObservedByNpc(self))
		{
			return;
		};
	};
	if(!C_WantToAttackThief(self,other))
	{
		if(C_NpcIsGateGuard(self))
		{
			B_MemorizePlayerCrime(self,other,CRIME_THEFT);
		};
		return;
	};
	B_Attack(self,other,AR_Theft,0);
};

