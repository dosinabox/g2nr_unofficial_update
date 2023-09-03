
func void B_AssessSurprise()
{
	Npc_SetTarget(self,other);
	if(!C_NpcIsHero(self))
	{
		self.aivar[AIV_ATTACKREASON] = AR_GuildEnemy;
	};
};

func void ZS_Attack()
{
	Perception_Set_Minimal();
	Npc_PercEnable(self,PERC_ASSESSSURPRISE,B_AssessSurprise);
	B_ValidateOther();
	self.aivar[AIV_LASTTARGET] = Hlp_GetInstanceID(other);
	if(CurrentLevel == NEWWORLD_ZEN)
	{
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Dexter))
		{
			B_Greg_ComesToDexter();
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Randolph))
		{
			if(Npc_GetDistToWP(self,"NW_FARM2_TO_TAVERN_06") <= 5000)
			{
				B_Flee();
				return;
			};
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Cornelius))
		{
			if(Npc_GetDistToWP(self,"NW_XARDAS_BANDITS_LEFT") <= 5000)
			{
				B_Flee();
				return;
			};
		}
		else if((BragoBanditsAttacked == FALSE) && (Kapitel < 3))
		{
			if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ambusher_1013)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ambusher_1014)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ambusher_1015)))
			{
				BragoBanditsAttacked = TRUE;
			};
		};
	};
	if(C_WantToFlee(self))
	{
		B_Flee();
		return;
	};
	if(self.aivar[AIV_LOADGAME] == FALSE)
	{
		B_Say_AttackReason();
	};
	if(Npc_IsInFightMode(self,FMODE_NONE) && (self.guild != GIL_STRF))
	{
		AI_EquipBestRangedWeapon(self);
		AI_EquipBestMeleeWeapon(self);
	};
	AI_Standup(self);
	B_StopLookAt(self);
	B_TurnToNpc(self,other);
	AI_SetWalkMode(self,NPC_RUN);
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	self.aivar[AIV_LastAbsolutionLevel] = B_GetCurrentAbsolutionLevel(self);
	self.aivar[AIV_PursuitEnd] = FALSE;
	self.aivar[AIV_StateTime] = 0;
	self.aivar[AIV_TAPOSITION] = 0;
	self.aivar[AIV_HitByOtherNpc] = 0;
	self.aivar[AIV_SelectSpell] = 0;
};

func int ZS_Attack_Loop()
{
	Npc_GetTarget(self);
	if(C_WantToFlee(self))
	{
		return LOOP_END;
	};
	if(Npc_GetDistToNpc(self,other) > self.aivar[AIV_FightDistCancel])
	{
		Npc_ClearAIQueue(self);
		AI_Standup(self);
		self.aivar[AIV_PursuitEnd] = TRUE;
		return LOOP_END;
	};
	if((Npc_GetStateTime(self) > self.aivar[AIV_MM_FollowTime]) && (self.aivar[AIV_PursuitEnd] == FALSE))
	{
		Npc_ClearAIQueue(self);
		AI_Standup(self);
		self.aivar[AIV_PursuitEnd] = TRUE;
		self.aivar[AIV_Dist] = Npc_GetDistToNpc(self,other);
		self.aivar[AIV_StateTime] = Npc_GetStateTime(self);
		if(other.guild < GIL_SEPERATOR_HUM)
		{
			//B_Say(self,other,"$RUNCOWARD");
			AI_PlayAni(self,"T_IGETYOU");
			B_Say_Overlay(self,other,"$RUNCOWARD");
		};
	};
	if(self.aivar[AIV_PursuitEnd] == TRUE)
	{
		if(Npc_GetDistToNpc(self,other) > self.senses_range)
		{
			return LOOP_END;
		};
		if(Npc_GetStateTime(self) > self.aivar[AIV_StateTime])
		{
			if((Npc_GetDistToNpc(self,other) < self.aivar[AIV_Dist]) || (!C_BodyStateContains(other,BS_RUN) && !C_BodyStateContains(other,BS_JUMP)))
			{
				self.aivar[AIV_PursuitEnd] = FALSE;
				Npc_SetStateTime(self,0);
				self.aivar[AIV_StateTime] = 0;
			}
			else
			{
				B_TurnToNpc(self,other);
				self.aivar[AIV_Dist] = Npc_GetDistToNpc(self,other);
				self.aivar[AIV_StateTime] = Npc_GetStateTime(self);
			};
		};
		return LOOP_CONTINUE;
	};
	if(B_GetCurrentAbsolutionLevel(self) > self.aivar[AIV_LastAbsolutionLevel])
	{
		Npc_ClearAIQueue(self);
		AI_Standup(self);
		return LOOP_END;
	};
	if(self.aivar[AIV_MM_FollowInWater] == FALSE)
	{
		if(C_BodyStateContains(other,BS_SWIM) || C_BodyStateContains(other,BS_DIVE))
		{
			Npc_ClearAIQueue(self);
			AI_Standup(self);
			self.aivar[AIV_PursuitEnd] = TRUE;
			return LOOP_END;
		};
	};
	if(self.aivar[AIV_WaitBeforeAttack] >= 1)
	{
		AI_Wait(self,0.8);
		self.aivar[AIV_WaitBeforeAttack] = 0;
	};
	if(self.aivar[AIV_MaxDistToWp] > 0)
	{
		if((Npc_GetDistToWP(self,self.wp) > self.aivar[AIV_MaxDistToWp]) && (Npc_GetDistToWP(other,self.wp) > self.aivar[AIV_MaxDistToWp]))
		{
			self.fight_tactic = FAI_NAILED;
		}
		else
		{
			self.fight_tactic = self.aivar[AIV_OriginalFightTactic];
		};
	};
	if(!C_BodyStateContains(other,BS_RUN) && !C_BodyStateContains(other,BS_JUMP))
	{
		Npc_SetStateTime(self,0);
	};
	if((Npc_GetStateTime(self) > 2) && (self.aivar[AIV_TAPOSITION] == 0))
	{
		B_CallGuards();
		self.aivar[AIV_TAPOSITION] = 1;
	};
	if((Npc_GetStateTime(self) > 8) && (self.aivar[AIV_TAPOSITION] == 1))
	{
		B_CallGuards();
		self.aivar[AIV_TAPOSITION] = 2;
	};
	B_CreateAmmo(self);
	B_SelectWeapon(self,other);
	if(Hlp_IsValidNpc(other) && !C_NpcIsDown(other))
	{
		if(other.aivar[AIV_INVINCIBLE] == FALSE)
		{
			AI_Attack(self);
		}
		else
		{
			Npc_ClearAIQueue(self);
		};
		self.aivar[AIV_LASTTARGET] = Hlp_GetInstanceID(other);
		return LOOP_CONTINUE;
	}
	else
	{
		Npc_ClearAIQueue(self);
		if(Hlp_IsValidNpc(other))
		{
			if(Npc_IsPlayer(other) && C_NpcIsDown(other))
			{
				Npc_SetTempAttitude(self,Npc_GetPermAttitude(self,hero));
			};
		};
		if(self.aivar[AIV_ATTACKREASON] != AR_KILL)
		{
			Npc_PerceiveAll(self);
			Npc_GetNextTarget(self);
		};
		if(Hlp_IsValidNpc(other))
		{
			if(!C_NpcIsDown(other) && ((Npc_GetDistToNpc(self,other) < PERC_DIST_INTERMEDIAT) || Npc_IsPlayer(other)) && (Npc_GetHeightToNpc(self,other) < PERC_DIST_HEIGHT) && (other.aivar[AIV_INVINCIBLE] == FALSE) && !(C_PlayerIsFakeBandit(self,other) && (self.guild == GIL_BDT)))
			{
				if(Wld_GetGuildAttitude(self.guild,other.guild) == ATT_HOSTILE)
				{
					if(!C_NpcIsHero(self))
					{
						self.aivar[AIV_ATTACKREASON] = AR_GuildEnemy;
					};
					if(C_NpcIsHero(other))
					{
						self.aivar[AIV_LastPlayerAR] = AR_GuildEnemy;
						self.aivar[AIV_LastFightAgainstPlayer] = FIGHT_CANCEL;
						self.aivar[AIV_LastFightComment] = FALSE;
					};
				}
				else if((Npc_GetAttitude(self,other) == ATT_HOSTILE) && !C_NpcIsHero(self))
				{
					self.aivar[AIV_ATTACKREASON] = self.aivar[AIV_LastPlayerAR];
				};
				return LOOP_CONTINUE;
			}
			else
			{
				Npc_ClearAIQueue(self);
				if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_CANCEL) && (self.aivar[AIV_LASTTARGET] != Hlp_GetInstanceID(hero)))
				{
					self.aivar[AIV_LastFightComment] = TRUE;
				};
			};
		}
		else
		{
			Npc_ClearAIQueue(self);
			if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_CANCEL) && (self.aivar[AIV_LASTTARGET] != Hlp_GetInstanceID(hero)))
			{
				self.aivar[AIV_LastFightComment] = TRUE;
			};
		};
	};
	return LOOP_END;
};

func void ZS_Attack_End()
{
	var C_Npc target;
	if(C_WantToFlee(self))
	{
		B_Flee();
		return;
	};
	target = Hlp_GetNpc(self.aivar[AIV_LASTTARGET]);
	if(self.aivar[AIV_PursuitEnd] == TRUE)
	{
		if(Hlp_IsValidNpc(target) && C_NpcIsHero(target) && (self.npcType != NPCTYPE_FRIEND))
		{
			Npc_SetTempAttitude(self,ATT_HOSTILE);
		};
		if(self.aivar[AIV_ArenaFight] == AF_RUNNING)
		{
			self.aivar[AIV_ArenaFight] = AF_AFTER;
		};
	}
	else
	{
		if(B_GetCurrentAbsolutionLevel(self) > self.aivar[AIV_LastAbsolutionLevel])
		{
			B_Say(self,target,"$WISEMOVE");
		}
		else
		{
			B_Say_AttackEnd();
		};
	};
	if((target.aivar[AIV_KilledByPlayer] == TRUE) && (Wld_GetGuildAttitude(self.guild,hero.guild) != ATT_HOSTILE))
	{
		B_SetAttitude(self,ATT_FRIENDLY);
	};
	if(Npc_IsInState(target,ZS_Unconscious) && C_NpcHasAttackReasonToKill(self))
	{
		B_FinishingMove(self,target);
	};
	AI_RemoveWeapon(self);
	if(C_WantToRansack(self,target))
	{
		target.aivar[AIV_RANSACKED] = TRUE;
		if(target.guild < GIL_SEPERATOR_HUM)
		{
			AI_StartState(self,ZS_RansackBody,0,"");
			return;
		}
		else if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(AlligatorJack)) && (target.aivar[AIV_MM_REAL_ID] == ID_SWAMPRAT))
		{
			AI_StartState(self,ZS_GetMeat,0,"");
			return;
		};
	};
	if(self.attribute[ATR_HITPOINTS] < (self.attribute[ATR_HITPOINTS_MAX] / 2))
	{
		AI_StartState(self,ZS_HealSelf,0,"");
		return;
	};
};

