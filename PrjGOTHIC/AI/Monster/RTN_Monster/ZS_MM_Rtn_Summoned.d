
func void B_SummonedAssessTalk()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
};

func void ZS_MM_Rtn_Summoned()
{
	Npc_SetPercTime(self,1);
	Npc_PercEnable(self,PERC_ASSESSPLAYER,B_MM_AssessPlayer);
	Npc_PercEnable(self,PERC_ASSESSENEMY,B_MM_AssessEnemy);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_MM_AssessDamage);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,B_MM_AssessOthersDamage);
	if(C_IsNpc(self,Wisp_Detector))
	{
		Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessTalk);
	}
	else
	{
		Npc_PercEnable(self,PERC_ASSESSTALK,B_SummonedAssessTalk);
	};
	B_SetAttitude(self,ATT_FRIENDLY);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_Standup(self);
	AI_SetWalkMode(self,NPC_RUN);
};

func int ZS_MM_Rtn_Summoned_Loop()
{
	if(C_IsNpc(self,Wisp_Detector))
	{
		B_MM_WispDetect();
	};
	if(Npc_GetDistToNpc(self,hero) > 500)
	{
		AI_GotoNpc(self,hero);
	}
	else if(Npc_GetStateTime(self) >= 1)
	{
		if(!Npc_CanSeeNpc(self,hero))
		{
			AI_TurnToNPC(self,hero);
		};
		self.aivar[AIV_SummonTime] += Npc_GetStateTime(self);
		if(((self.aivar[AIV_SummonTime] >= MONSTER_SUMMON_TIME) && (self.guild != GIL_WOLF)) || (hero.attribute[ATR_HITPOINTS] <= 0) || (Npc_GetDistToNpc(self,hero) > 3000))
		{
			Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
		};
		Npc_SetStateTime(self,0);
	};
	if((hero.guild != GIL_WOLF) && Npc_IsPlayer(hero) && (self.guild == GIL_WOLF) && (self.aivar[AIV_MM_REAL_ID] != ID_KEILER))
	{
		return LOOP_END;
	};
	self.wp = Npc_GetNearestWP(self);
	return LOOP_CONTINUE;
};

func void ZS_MM_Rtn_Summoned_End()
{
	Npc_ClearAIQueue(self);
	B_ClearPerceptions(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	B_SetAttitude(self,ATT_HOSTILE);
	AI_StartState(self,ZS_MM_AllScheduler,0,"");
};

