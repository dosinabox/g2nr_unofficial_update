
func void B_StopShortZapped()
{
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	if(Npc_IsPlayer(self))
	{
		Npc_StopAni(self,"S_LIGHTNING_VICTIM");
	};
	Npc_ClearAIQueue(self);
	AI_Standup(self);
	if(C_NpcIsHuman(self))
	{
		B_AssessDamage();
		AI_ContinueRoutine(self);
	}
	else
	{
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_MM_Attack,0,"");
	};
};

func void ZS_ShortZapped()
{
	Npc_PercEnable(self,PERC_ASSESSSTOPMAGIC,B_StopShortZapped);
	if(!Npc_HasBodyFlag(self,BS_FLAG_INTERRUPTABLE))
	{
		AI_Standup(self);
	}
	else
	{
		AI_StandupQuick(self);
	};
	AI_PlayAni(self,"T_STAND_2_LIGHTNING_VICTIM");
};

func int ZS_ShortZapped_Loop()
{
	if(Npc_GetStateTime(self) > 1)
	{
		B_StopShortZapped();
		return LOOP_END;
	};
	return LOOP_CONTINUE;
};

func void ZS_ShortZapped_End()
{
};

