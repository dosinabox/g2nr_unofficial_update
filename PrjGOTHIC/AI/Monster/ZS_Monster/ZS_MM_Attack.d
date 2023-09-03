
func void B_MM_AssessSurprise()
{
	Npc_SetTarget(self,other);
};

func void B_MM_RemoveWeapon()
{
	if(C_NpcIsMonsterMage(self) || (self.guild == GIL_SKELETON) || (self.guild == GIL_SUMMONED_SKELETON))
	{
		B_ClearPerceptions(self);
		self.aivar[AIV_INVINCIBLE] = TRUE;
		Npc_SetTrueGuild(self,GIL_NONE);
		AI_StopLookAt(self);
		AI_RemoveWeapon(self);
		if(Npc_HasReadiedWeapon(self))
		{
			AI_RemoveWeapon(self);
		};
	};
};


func void ZS_MM_Attack()
{
	Npc_SetPercTime(self,1);
	Npc_PercEnable(self,PERC_ASSESSBODY,B_MM_AssessBody);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_MM_AssessDamage);
	Npc_PercEnable(self,PERC_ASSESSWARN,B_MM_AssessWarn);
	Npc_PercEnable(self,PERC_ASSESSSURPRISE,B_MM_AssessSurprise);
	B_ValidateOther();
	if(C_WantToFlee(self))
	{
		B_MM_Flee();
		return;
	};
	if(self.guild != GIL_DRAGON)
	{
		AI_Standup(self);
	};
	AI_SetWalkMode(self,NPC_RUN);
	Npc_SendPassivePerc(self,PERC_ASSESSWARN,other,self);
	self.aivar[AIV_PursuitEnd] = FALSE;
	self.aivar[AIV_StateTime] = 0;
	self.aivar[AIV_HitByOtherNpc] = 0;
	self.aivar[AIV_SelectSpell] = 0;
	self.aivar[AIV_TAPOSITION] = 0;
};

func int ZS_MM_Attack_Loop()
{
	Npc_GetTarget(self);
	if(C_WantToFlee(self))
	{
		return LOOP_END;
	};
	if(self.guild == GIL_DRAGON)
	{
		B_DragonHeal(self);
		//костыли для перехода из режима ближнего боя к магии: начало
		if(Npc_IsInFightMode(self,FMODE_FIST) && (Npc_GetDistToNpc(self,other) > FIGHT_DIST_DRAGON_MAGIC))
		{
			AI_RemoveWeapon(self);
		};
	};
	if((self.aivar[AIV_MM_REAL_ID] == ID_FIREGOLEM) || (self.aivar[AIV_MM_REAL_ID] == ID_ICEGOLEM) || (self.aivar[AIV_MM_REAL_ID] == ID_SKELETON_MAGE) || (self.aivar[AIV_MM_REAL_ID] == ID_ORCSHAMAN))
	{
		if((Npc_IsInFightMode(self,FMODE_FIST) || Npc_IsInFightMode(self,FMODE_MELEE)) && (Npc_GetDistToNpc(self,other) > FIGHT_DIST_MELEE))
		{
			AI_RemoveWeapon(self);
		};
	};
	//костыли для перехода из режима ближнего боя к магии: конец
	if((self.guild == GIL_Stoneguardian) && (RavenIsDead == TRUE))
	{
		B_KillNpc(self);
		return LOOP_END;
	};
	if(CurrentLevel == OLDWORLD_ZEN)
	{
		if(Npc_GetDistToWP(self,"OC_RAMP_06") <= 100)
		{
			Npc_ClearAIQueue(self);
			if(self.guild != GIL_DRAGON)
			{
				AI_Standup(self);
			};
			AI_PlayAni(self,"T_WARN");
			self.aivar[AIV_PursuitEnd] = TRUE;
			return LOOP_END;
		};
	};
	if(Npc_GetDistToNpc(self,other) > FIGHT_DIST_CANCEL)
	{
		Npc_ClearAIQueue(self);
		if(self.guild != GIL_DRAGON)
		{
			AI_Standup(self);
		};
		self.aivar[AIV_PursuitEnd] = TRUE;
		B_MM_RemoveWeapon();
		return LOOP_END;
	};
	if((Npc_GetStateTime(self) > self.aivar[AIV_MM_FollowTime]) && (self.aivar[AIV_PursuitEnd] == FALSE))
	{
		Npc_ClearAIQueue(self);
		if(self.guild != GIL_DRAGON)
		{
			AI_Standup(self);
		};
		self.aivar[AIV_PursuitEnd] = TRUE;
		self.aivar[AIV_Dist] = Npc_GetDistToNpc(self,other);
		self.aivar[AIV_StateTime] = Npc_GetStateTime(self);
		AI_PlayAni(self,"T_WARN");
	};
	if(self.aivar[AIV_PursuitEnd] == TRUE)
	{
		if(Npc_GetDistToNpc(self,other) > self.senses_range)
		{
			B_MM_RemoveWeapon();
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
				AI_TurnToNPC(self,other);
				self.aivar[AIV_Dist] = Npc_GetDistToNpc(self,other);
				self.aivar[AIV_StateTime] = Npc_GetStateTime(self);
			};
		};
		return LOOP_CONTINUE;
	};
	if((C_BodyStateContains(other,BS_SWIM) || C_BodyStateContains(other,BS_DIVE)) && (self.aivar[AIV_MM_FollowInWater] == FALSE))
	{
		Npc_ClearAIQueue(self);
		if(self.guild != GIL_DRAGON)
		{
			AI_Standup(self);
		};
		B_MM_RemoveWeapon();
		return LOOP_END;
	};
	if(self.aivar[AIV_WaitBeforeAttack] == 1)
	{
		AI_Wait(self,0.8);
		self.aivar[AIV_WaitBeforeAttack] = 0;
	};
	if(C_NpcIsSummon(self))
	{
		if(Npc_GetStateTime(self) > self.aivar[AIV_StateTime])
		{
			self.aivar[AIV_SummonTime] += 1;
			self.aivar[AIV_StateTime] = Npc_GetStateTime(self);
		};
		if((self.aivar[AIV_SummonTime] >= MONSTER_SUMMON_TIME) || (hero.attribute[ATR_HITPOINTS] <= 0) || (Npc_GetDistToNpc(self,hero) > 3000))
		{
			Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
		};
	};
	if(!C_BodyStateContains(other,BS_RUN) && !C_BodyStateContains(other,BS_JUMP) && (Npc_GetStateTime(self) > 0))
	{
		Npc_SetStateTime(self,0);
		self.aivar[AIV_StateTime] = 0;
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
	if(C_NpcIsMonsterMage(self) || (self.guild == GIL_SKELETON) || (self.guild == GIL_SUMMONED_SKELETON) || (self.guild > GIL_SEPERATOR_ORC))
	{
		B_CreateAmmo(self);
		Npc_ChangeAttribute(self,ATR_MANA,ATR_MANA_MAX);
		B_SelectWeapon(self,other);
	};
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
		if((self.aivar[AIV_MM_PRIORITY] == PRIO_EAT) && C_WantToEat(self,other))
		{
			Npc_ClearAIQueue(self);
			if(self.guild != GIL_DRAGON)
			{
				AI_Standup(self);
			};
			return LOOP_END;
		};
		Npc_PerceiveAll(self);
		Npc_GetNextTarget(self);
		if(Hlp_IsValidNpc(other))
		{
			if(!C_NpcIsDown(other) && ((Npc_GetDistToNpc(self,other) < PERC_DIST_INTERMEDIAT) || Npc_IsPlayer(other)) && (other.aivar[AIV_INVINCIBLE] == FALSE))
			{
				self.aivar[AIV_LASTTARGET] = Hlp_GetInstanceID(other);
				return LOOP_CONTINUE;
			};
		};
		Npc_ClearAIQueue(self);
		if(self.guild != GIL_DRAGON)
		{
			AI_Standup(self);
		};
		B_MM_RemoveWeapon();
	};
	return LOOP_END;
};

func void ZS_MM_Attack_End()
{
	var C_Npc target;
	if(self.guild > GIL_SEPERATOR_ORC)
	{
		AI_RemoveWeapon(self);
		if(Npc_HasReadiedWeapon(self))
		{
			AI_RemoveWeapon(self);
		};
	}
	else
	{
		B_MM_RemoveWeapon();
	};
	if(self.aivar[AIV_INVINCIBLE] == TRUE)
	{
		Npc_SetTrueGuild(self,self.guild);
		Npc_ClearAIQueue(self);
		B_ClearPerceptions(self);
		if(self.guild != GIL_DRAGON)
		{
			AI_Standup(self);
		};
		AI_Wait(self,0.5);
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
	if(C_WantToFlee(self))
	{
		B_MM_Flee();
		return;
	};
	target = Hlp_GetNpc(self.aivar[AIV_LASTTARGET]);
	if(Npc_IsDead(target) && C_WantToEat(self,target))
	{
		Npc_ClearAIQueue(self);
		AI_StartState(self,ZS_MM_EatBody,0,"");
		return;
	};
};

