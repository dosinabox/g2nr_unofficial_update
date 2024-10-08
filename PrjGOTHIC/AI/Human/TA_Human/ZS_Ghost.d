
func void ZS_Ghost()
{
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Quarhodron))
	{
		if(Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
		{
			Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessTalk);
		};
	}
	else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Rhademes))
	{
		if(Rhademes_Fertig == TRUE)
		{
			Npc_PercEnable(self,PERC_ASSESSPLAYER,B_AssessPlayer);
		};
		if(SC_TalkedToRhademAfter == FALSE)
		{
			Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessTalk);
		};
	};
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_AssessDamage);
	B_ResetAll(self);
	Npc_SetPercTime(self,0.1);
	AI_Standup(self);
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
};

func int ZS_Ghost_Loop()
{
	if(Npc_GetStateTime(self) >= 5)
	{
		if(Npc_GetDistToNpc(self,hero) > PERC_DIST_DIALOG)
		{
			Npc_SetStateTime(self,0);
		};
		B_RemoveGhost();
	};
	return LOOP_CONTINUE;
};

func void ZS_Ghost_End()
{
};

func void ZS_GhostWusel()
{
	Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessTalk);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_AssessDamage);
	B_ResetAll(self);
	AI_Standup(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(!C_NpcIsOnRoutineWP(self))
	{
		AI_GotoWP(self,self.wp);
	};
	AI_GotoFP(self,"ROAM");
};

func int ZS_GhostWusel_Loop()
{
	if(Npc_GetStateTime(self) >= 3)
	{
		if(Npc_IsOnFP(self,"ROAM"))
		{
			if(Wld_IsNextFPAvailable(self,"ROAM"))
			{
				Npc_ClearAIQueue(self);
				AI_GotoNextFP(self,"ROAM");
			};
		}
		else if(!C_BodyStateContains(self,BS_WALK) && !C_BodyStateContains(self,BS_RUN))
		{
			AI_GotoFP(self,"ROAM");
		};
		Npc_SetStateTime(self,0);
	};
	return LOOP_CONTINUE;
};

func void ZS_GhostWusel_End()
{
};

