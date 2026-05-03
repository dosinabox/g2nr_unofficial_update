
/*func void B_StopPyro()
{
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_ClearAIQueue(self);
	AI_Standup(self);
	if(C_NpcIsHuman(self))
	{
		B_AssessDamage();
	}
	else
	{
		Npc_SetTempAttitude(self,ATT_HOSTILE);
	};
	AI_ContinueRoutine(self);
};

func void ZS_Pyro()
{
	Npc_PercEnable(self,PERC_ASSESSSTOPMAGIC,B_StopPyro);
	if(!Npc_HasBodyFlag(self,BS_FLAG_INTERRUPTABLE))
	{
		AI_Standup(self);
	}
	else
	{
		AI_StandupQuick(self);
	};
	if(C_NpcIsHuman(self))
	{
		AI_PlayAni(self,"T_STAND_2_LIGHTNING_VICTIM");
	};
};

func int ZS_Pyro_Loop()
{
	if(Npc_GetStateTime(self) >= 1)
	{
		Npc_SetStateTime(self,0);
		B_MagicHurtNpc(other,self,SPL_PYRO_DAMAGE_PER_SEC);
		if(self.attribute[ATR_HITPOINTS] <= 0)
		{
			Npc_ClearAIQueue(self);
			AI_Standup(self);
			return LOOP_END;
		};
	};
	return LOOP_CONTINUE;
};

func void ZS_Pyro_End()
{
};*/

