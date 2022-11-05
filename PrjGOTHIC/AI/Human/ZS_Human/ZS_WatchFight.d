
func void B_CheerFight()
{
	var int zufall;
	if(Npc_GetStateTime(self) <= 2)
	{
		return;
	};
	if((other.guild > GIL_SEPERATOR_HUM) || (victim.guild > GIL_SEPERATOR_HUM))
	{
		return;
	};
	Npc_SetStateTime(self,0);
	if(C_NpcIsToughGuy(self))
	{
		zufall = Hlp_Random(3);
		if((Npc_GetAttitude(self,victim) == ATT_FRIENDLY) && (Npc_GetAttitude(self,other) != ATT_FRIENDLY))
		{
			if(zufall == 0)
			{
				B_Say_Overlay(self,self,"$OOH01");
			}
			else if(zufall == 1)
			{
				B_Say_Overlay(self,self,"$OOH02");
			}
			else
			{
				B_Say_Overlay(self,self,"$OOH03");
			};
			AI_PlayAni(self,"T_WATCHFIGHT_OHNO");
		}
		else
		{
			if(zufall == 0)
			{
				B_Say_Overlay(self,self,"$CHEERFRIEND01");
				AI_PlayAni(self,"T_WATCHFIGHT_YEAH");
			}
			else if(zufall == 1)
			{
				B_Say_Overlay(self,self,"$CHEERFRIEND02");
				AI_PlayAni(self,"T_WATCHFIGHT_YEAH");
			}
			else
			{
				B_Say_Overlay(self,self,"$CHEERFRIEND03");
				AI_PlayAni(self,"T_GETLOST2");
			};
		};
	}
	else
	{
		if(C_NpcBelongsToCity(self))
		{
			B_Say_Overlay(self,self,"$GETOUTOFHERE");
		}
		else if(C_NpcBelongsToFarm(self))
		{
			B_Say_Overlay(self,self,"$YOUDAREHITME");
		}
		else if(C_NpcBelongsToMonastery(self))
		{
			B_Say_Overlay(self,self,"$WILLYOUSTOPFIGHTING");
		}
		else if(C_NpcBelongsToOldCamp(self))
		{
			B_Say_Overlay(self,self,"$WILLYOUSTOPFIGHTING");
		};
		AI_PlayAni(self,"T_WATCHFIGHT_OHNO");
	};
};

func void B_AssessDefeat()
{
	Npc_ClearAIQueue(self);
	if(C_NpcIsToughGuy(self) || (Npc_IsPlayer(other) && (self.npcType == NPCTYPE_FRIEND)))
	{
		if(Npc_GetAttitude(self,other) == ATT_FRIENDLY)
		{
			B_Say(self,other,"$GOODVICTORY");
		}
		else
		{
			B_Say(self,other,"$NOTBAD");
		};
	}
	else if(victim.aivar[AIV_ATTACKREASON] != AR_NONE)
	{
		B_Say(self,other,"$OHMYGODHESDOWN");
		if(victim.guild != GIL_SLD)
		{
			B_MemorizePlayerCrime(self,other,CRIME_ATTACK);
		};
	}
	else
	{
		B_Say(self,other,"$NOTBAD");
	};
};

func void ZS_WatchFight()
{
	Perception_Set_Minimal();
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,B_AssessDefeat);
	Npc_PercEnable(self,PERC_ASSESSOTHERSDAMAGE,B_CheerFight);
	AI_Standup(self);
	B_TurnToNpc(self,victim);
	AI_RemoveWeapon(self);
	if(((Npc_GetDistToNpc(self,other) < PERC_DIST_INTERMEDIAT) || (Npc_GetDistToNpc(self,victim) < PERC_DIST_INTERMEDIAT)) && !Npc_IsInState(other,ZS_Unconscious) && !Npc_IsInState(victim,ZS_Unconscious) && ((other.guild < GIL_SEPERATOR_HUM) && (victim.guild < GIL_SEPERATOR_HUM)))
	{
		if(C_NpcIsToughGuy(self))
		{
			B_Say(self,other,"$THERESAFIGHT");
		}
		else
		{
			B_Say(self,other,"$OHMYGODITSAFIGHT");
		};
	};
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
	self.aivar[AIV_StateTime] = 0;
};

func int ZS_WatchFight_Loop()
{
	if((Npc_GetDistToNpc(self,other) > WATCHFIGHT_DIST_MAX) && (Npc_GetDistToNpc(self,victim) > WATCHFIGHT_DIST_MAX))
	{
		Npc_ClearAIQueue(self);
		return LOOP_END;
	};
	if(!(Npc_IsInState(other,ZS_Attack) || Npc_IsInState(other,ZS_ReactToDamage)) && !(Npc_IsInState(victim,ZS_Attack) || Npc_IsInState(victim,ZS_ReactToDamage)) && (Npc_GetStateTime(self) > 0))
	{
		if(Npc_IsInState(other,ZS_Unconscious) || Npc_IsInState(victim,ZS_Unconscious) || Npc_IsInState(other,ZS_Dead) || Npc_IsInState(victim,ZS_Dead))
		{
			if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
			{
				self.aivar[AIV_TAPOSITION] = ISINPOS;
				return LOOP_CONTINUE;
			}
			else
			{
				Npc_ClearAIQueue(self);
				return LOOP_END;
			};
		}
		else
		{
			Npc_ClearAIQueue(self);
			return LOOP_END;
		};
	};
/*	if(C_NpcIsToughGuy(self))
	{
	}; */
	if((Npc_GetDistToNpc(self,other) <= WATCHFIGHT_DIST_MIN) || (Npc_GetDistToNpc(self,victim) <= WATCHFIGHT_DIST_MIN))
	{
		Npc_ClearAIQueue(self);
		if(Npc_GetDistToNpc(self,other) <= Npc_GetDistToNpc(self,victim))
		{
			B_TurnToNpc(self,victim);
		}
		else
		{
			B_TurnToNpc(self,other);
		};
		AI_SetWalkMode(self,NPC_WALK);
		AI_Dodge(self);
	}
	else if(Npc_GetStateTime(self) != self.aivar[AIV_StateTime])
	{
		if(Npc_GetDistToNpc(self,other) <= Npc_GetDistToNpc(self,victim))
		{
			B_TurnToNpc(self,other);
		}
		else
		{
			B_TurnToNpc(self,victim);
		};
		self.aivar[AIV_StateTime] = Npc_GetStateTime(self);
	};
	return LOOP_CONTINUE;
};

func void ZS_WatchFight_End()
{
};

