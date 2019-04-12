
func void B_AssessUseMob()
{
	var string detMob;
	if(!Npc_IsPlayer(other))
	{
		return;
	};
	if(Wld_GetPlayerPortalGuild() >= GIL_NONE)
	{
		if(Npc_GetHeightToNpc(self,other) > PERC_DIST_INDOOR_HEIGHT)
		{
			return;
		};
	};
	if(Wld_GetGuildAttitude(self.guild,other.guild) == ATT_FRIENDLY)
	{
		if(Npc_IsDetectedMobOwnedByNpc(other,self))
		{
		}
		else
		{
			return;
		};
	};
	if(!C_IsUsedMobMyPossession(self,other))
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
	detMob = Npc_GetDetectedMob(other);
	if((Hlp_StrCmp(detMob,"CHESTBIG") == FALSE) && (Hlp_StrCmp(detMob,"CHESTSMALL") == FALSE))
	{
		return;
	};
	if(!C_WantToAttackThief(self,other))
	{
		if(C_NpcIsGateGuard(self))
		{
			B_MemorizePlayerCrime(self,other,CRIME_THEFT);
		};
		return;
	};
	B_Attack(self,other,AR_UseMob,0);
};

