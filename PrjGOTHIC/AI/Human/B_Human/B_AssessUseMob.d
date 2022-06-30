
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
		if(!Npc_IsDetectedMobOwnedByNpc(other,self))
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
		if(!C_IsPlayerObservedByNpc(self))
		{
			return;
		};
	};
	detMob = Npc_GetDetectedMob(other);
	if(!Hlp_StrCmp(detMob,"CHESTBIG") && !Hlp_StrCmp(detMob,"CHESTSMALL"))
	{
		if(Hlp_StrCmp(detMob,"TOUCHPLATE"))
		{
			if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Salandril))
			{
				B_Attack(self,other,AR_UseMob,0);
			}
			else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Richter))
			{
				B_Attack(self,other,AR_UseMob,0);
			}
			else if(C_IsNpc(self,VLK_4002_Buergerin))
			{
				B_Attack(self,other,AR_UseMob,0);
			};
		}
		else if(Hlp_StrCmp(detMob,"LEVER"))
		{
			if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Valentino))
			{
				B_Attack(self,other,AR_UseMob,0);
			}
			else if(C_IsNpc(self,VLK_4001_Buergerin))
			{
				B_Attack(self,other,AR_UseMob,0);
			};
		};
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

