
func void ZS_MM_Flee()
{
	if((self.guild == GIL_DRAGON) || (self.guild == GIL_TROLL) || C_NpcIsGolem(other) || C_NpcIsUndead(other))
	{
		AI_ContinueRoutine(self);
		return;
	};
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	B_ValidateOther();
	AI_Standup(self);
	AI_SetWalkMode(self,NPC_RUN);
	Npc_SendPassivePerc(self,PERC_ASSESSWARN,other,self);
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
	B_MM_DeSynchronize();
};

func int ZS_MM_Flee_Loop()
{
	Npc_GetTarget(self);
	if(Npc_GetDistToNpc(self,other) < 2000)
	{
		if(Npc_GetStateTime(self) > 0)
		{
			Npc_SendPassivePerc(self,PERC_ASSESSWARN,other,self);
			Npc_SetStateTime(self,0);
		};
		AI_Flee(self);
		return LOOP_CONTINUE;
	}
	else
	{
		Npc_ClearAIQueue(self);
		return LOOP_END;
	};
};

func void ZS_MM_Flee_End()
{
};

