
func void B_AssessFightSound()
{
	if(!Hlp_IsValidNpc(victim))
	{
		return;
	};
	if(victim.guild == GIL_MEATBUG)
	{
		return;
	};
	if((victim.aivar[AIV_SubGuild] == GIL_SUB_Thief_Sewer) || (other.aivar[AIV_SubGuild] == GIL_SUB_Thief_Sewer))
	{
		if(self.aivar[AIV_SubGuild] != GIL_SUB_Thief_Sewer)
		{
			return;
		};
	};
	if(C_IsNpc(self,VLK_448_Joe))
	{
		if(Npc_GetDistToWP(self,"NW_CITY_MERCHANT_TOWER_01") < 600)
		{
			return;
		};
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Peck))
	{
		if(Npc_GetDistToWP(self,"NW_CITY_HABOUR_PUFF_PECK") <= 500)
		{
			if(Npc_GetDistToWP(victim,"NW_PUFF_DANCE") > 1000)
			{
				return;
			};
		};
	};
	if((Npc_GetDistToNpc(self,victim) > PERC_DIST_INTERMEDIAT) && (Npc_GetDistToNpc(self,other) > PERC_DIST_INTERMEDIAT))
	{
		if(((self.guild == GIL_OUT) || (self.guild == GIL_BDT)) && ((victim.guild == self.guild) || (other.guild == self.guild)))
		{
		}
		else
		{
			return;
		};
	};
	if(self.aivar[AIV_MM_FollowInWater] == FALSE)
	{
		if(C_NpcIsSwimming(other) || C_NpcIsSwimming(victim))
		{
			return;
		};
	};
	if((other.fight_tactic == FAI_NAILED) || (victim.fight_tactic == FAI_NAILED))
	{
		return;
	};
	if((Npc_GetHeightToNpc(self,other) > PERC_DIST_HEIGHT) && (Npc_GetHeightToNpc(self,victim) > PERC_DIST_HEIGHT))
	{
		return;
	};
	if(CurrentLevel == NEWWORLD_ZEN)
	{
		if((Npc_GetHeightToNpc(self,other) > 500) && (Npc_GetDistToWP(self,"NW_MONASTERY_PLACE_04") <= 3000))
		{
			return;
		};
	};
	if((Hlp_GetInstanceID(victim) == Hlp_GetInstanceID(self)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(self)))
	{
		return;
	};
	if(victim.guild == GIL_SHEEP)
	{
		if(C_WantToAttackSheepKiller(self,other))
		{
			B_Attack(self,other,AR_SheepKiller,0);
		}
		else if(C_NpcIsGateGuard(self))
		{
			B_MemorizePlayerCrime(self,other,CRIME_SHEEPKILLER);
		};
		return;
	};
	if(C_NpcIsGateGuard(self))
	{
		return;
	};
	if(other.guild > GIL_SEPERATOR_HUM)
	{
		if(victim.guild > GIL_SEPERATOR_HUM)
		{
			return;
		};
		if(Npc_GetAttitude(self,victim) != ATT_HOSTILE)
		{
			B_Attack(self,other,AR_MonsterVsHuman,0);
			return;
		};
	};
	if((victim.guild > GIL_SEPERATOR_HUM) && (Npc_GetAttitude(self,other) != ATT_HOSTILE) && !Npc_IsDead(victim))
	{
		B_Attack(self,victim,AR_MonsterVsHuman,0);
		return;
	};
	if(self.aivar[AIV_EnemyOverride] == TRUE)
	{
		self.aivar[AIV_EnemyOverride] = FALSE;
		Npc_PerceiveAll(self);
		Npc_GetNextTarget(self);
		if(!C_NpcIsDown(other))
		{
			B_Attack(self,other,AR_GuildEnemy,0);
		};
		return;
	};
	if((C_PlayerIsFakeBandit(self,other) || C_PlayerIsFakeBandit(self,victim)) && ((other.guild == GIL_BDT) || (victim.guild == GIL_BDT)))
	{
		if(self.guild == GIL_BDT)
		{
			if(self.aivar[AIV_SubGuild] == GIL_SUB_Esteban)
			{
				if(other.aivar[AIV_SubGuild] == GIL_SUB_Esteban)
				{
					B_Attack(self,victim,AR_NONE,0);
					return;
				};
				if(victim.aivar[AIV_SubGuild] == GIL_SUB_Esteban)
				{
					B_Attack(self,other,AR_NONE,0);
					return;
				};
			};
			if((other.aivar[AIV_ATTACKREASON] == AR_NONE) && (victim.aivar[AIV_ATTACKREASON] == AR_NONE))
			{
				Npc_ClearAIQueue(self);
				B_ClearPerceptions(self);
				AI_StartState(self,ZS_WatchFight,0,"");
				return;
			};
			if((other.aivar[AIV_StoryBandit] == TRUE) || (victim.aivar[AIV_StoryBandit] == TRUE))
			{
				Npc_ClearAIQueue(self);
				B_ClearPerceptions(self);
				AI_StartState(self,ZS_WatchFight,0,"");
				return;
			};
		};
	};
	if(((other.aivar[AIV_ATTACKREASON] == AR_GuardStopsIntruder) || (other.aivar[AIV_ATTACKREASON] == AR_MonsterCloseToGate) || (other.aivar[AIV_ATTACKREASON] == AR_HumanMurderedHuman) || (other.aivar[AIV_ATTACKREASON] == AR_GuildEnemy) || (other.aivar[AIV_ATTACKREASON] == AR_GuardCalledToKill)) && (Npc_GetAttitude(self,other) == ATT_FRIENDLY))
	{
		B_Attack(self,victim,AR_GuardCalledToKill,0);
		return;
	};
	if(((victim.aivar[AIV_ATTACKREASON] == AR_GuardStopsIntruder) || (victim.aivar[AIV_ATTACKREASON] == AR_MonsterCloseToGate) || (victim.aivar[AIV_ATTACKREASON] == AR_HumanMurderedHuman) || (victim.aivar[AIV_ATTACKREASON] == AR_GuildEnemy) || (victim.aivar[AIV_ATTACKREASON] == AR_GuardCalledToKill)) && (Npc_GetAttitude(self,victim) == ATT_FRIENDLY))
	{
		B_Attack(self,other,AR_GuardCalledToKill,0);
		return;
	};
	if(((other.aivar[AIV_ATTACKREASON] == AR_GuardStopsFight) || (other.aivar[AIV_ATTACKREASON] == AR_ReactToDamage) || (other.aivar[AIV_ATTACKREASON] == AR_ReactToWeapon)) && (Npc_GetAttitude(self,other) == ATT_FRIENDLY))
	{
		if(((other.guild == GIL_SLD) || (other.guild == GIL_DJG) || (other.guild == GIL_NONE)) && ((victim.guild == GIL_SLD) || (victim.guild == GIL_DJG) || (victim.guild == GIL_NONE)))
		{
		}
		else if(!Npc_IsPlayer(other) && !Npc_IsPlayer(victim))
		{
		}
		else
		{
			B_Attack(self,victim,AR_GuardStopsFight,0);
			return;
		};
	};
	if(((victim.aivar[AIV_ATTACKREASON] == AR_GuardStopsFight) || (victim.aivar[AIV_ATTACKREASON] == AR_ReactToDamage) || (victim.aivar[AIV_ATTACKREASON] == AR_ReactToWeapon)) && (Npc_GetAttitude(self,victim) == ATT_FRIENDLY))
	{
		if(((other.guild == GIL_SLD) || (other.guild == GIL_DJG) || (other.guild == GIL_NONE)) && ((victim.guild == GIL_SLD) || (victim.guild == GIL_DJG) || (victim.guild == GIL_NONE)))
		{
		}
		else if(!Npc_IsPlayer(other) && !Npc_IsPlayer(victim))
		{
		}
		else
		{
			B_Attack(self,other,AR_GuardStopsFight,0);
			return;
		};
	};
	if(((other.aivar[AIV_ATTACKREASON] == AR_NONE) || (other.aivar[AIV_ATTACKREASON] == AR_KILL)) && ((victim.aivar[AIV_ATTACKREASON] == AR_NONE) || (victim.aivar[AIV_ATTACKREASON] == AR_KILL)) && (self.guild == GIL_MIL))
	{
		if((Npc_GetAttitude(self,other) == ATT_FRIENDLY) && (Npc_GetAttitude(self,victim) != ATT_FRIENDLY))
		{
			B_Attack(self,victim,AR_GuardStopsFight,0);
		}
		else if((Npc_GetAttitude(self,victim) == ATT_FRIENDLY) && (Npc_GetAttitude(self,other) != ATT_FRIENDLY))
		{
			B_Attack(self,other,AR_GuardStopsFight,0);
		}
		else if(Npc_IsPlayer(other))
		{
			B_Attack(self,victim,AR_GuardStopsFight,0);
		}
		else if(Npc_IsPlayer(victim))
		{
			B_Attack(self,other,AR_GuardStopsFight,0);
		}
		else
		{
			B_Attack(self,other,AR_GuardStopsFight,0);
		};
		return;
	};
	if(((other.aivar[AIV_ATTACKREASON] == AR_UseMob) || (other.aivar[AIV_ATTACKREASON] == AR_Theft) || (other.aivar[AIV_ATTACKREASON] == AR_LeftPortalRoom)) && (Npc_GetAttitude(self,other) == ATT_FRIENDLY))
	{
		if(C_WantToAttackThief(self,victim))
		{
			B_Attack(self,victim,AR_GuardCalledToThief,0);
		};
		return;
	};
	if(((victim.aivar[AIV_ATTACKREASON] == AR_UseMob) || (victim.aivar[AIV_ATTACKREASON] == AR_Theft) || (victim.aivar[AIV_ATTACKREASON] == AR_LeftPortalRoom)) && (Npc_GetAttitude(self,victim) == ATT_FRIENDLY))
	{
		if(C_WantToAttackThief(self,other))
		{
			B_Attack(self,other,AR_GuardCalledToThief,0);
		};
		return;
	};
	if((other.aivar[AIV_ATTACKREASON] == AR_ClearRoom) && (Npc_GetAttitude(self,other) == ATT_FRIENDLY))
	{
		B_Attack(self,victim,AR_GuardCalledToRoom,0);
		return;
	};
	if((victim.aivar[AIV_ATTACKREASON] == AR_ClearRoom) && (Npc_GetAttitude(self,victim) == ATT_FRIENDLY))
	{
		B_Attack(self,other,AR_GuardCalledToRoom,0);
		return;
	};
	if((Npc_GetDistToNpc(self,other) > PERC_DIST_INTERMEDIAT) && (Npc_GetDistToNpc(self,victim) > PERC_DIST_INTERMEDIAT))
	{
		return;
	};
	if((Npc_GetAttitude(self,other) == ATT_HOSTILE) || (Npc_GetAttitude(self,victim) == ATT_HOSTILE))
	{
		if(self.guild != GIL_BDT)
		{
			return;
		};
	};
	if(!Npc_CanSeeNpcFreeLOS(self,victim))
	{
		return;
	};
	if((self.guild != GIL_DMT) && ((victim.guild == GIL_DMT) || (other.guild == GIL_DMT)))
	{
		if(!C_NpcIsBestFriend(self))
		{
			Npc_SetTarget(self,other);
			AI_StartState(self,ZS_Flee,0,"");
			return;
		}
		else if(victim.guild == GIL_DMT)
		{
			B_Attack(self,victim,AR_NONE,0);
			return;
		}
		else if(other.guild == GIL_DMT)
		{
			B_Attack(self,other,AR_NONE,0);
			return;
		};
	};
	Npc_ClearAIQueue(self);
	B_ClearPerceptions(self);
	AI_StartState(self,ZS_WatchFight,0,"");
};

