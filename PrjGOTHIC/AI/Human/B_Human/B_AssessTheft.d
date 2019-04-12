
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
		if(Hlp_IsValidItem(item) && Npc_OwnedByNpc(item,self))
		{
		}
		else
		{
			return;
		};
	};
	if(!C_IsTakenItemMyPossession(self,other,item))
	{
		return;
	};
	if(!Npc_CanSeeNpc(self,other))
	{
		if(Npc_IsInPlayersRoom(self) && (Npc_IsInState(self,ZS_ObservePlayer) || Npc_IsInState(self,ZS_ClearRoom)))
		{
		}
		else
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

