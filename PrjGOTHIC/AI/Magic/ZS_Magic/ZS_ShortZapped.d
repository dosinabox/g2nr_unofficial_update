
func void B_StopShortZapped()
{
	/*Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_ClearAIQueue(self);
	AI_Standup(self);
	if(self.guild < GIL_SEPERATOR_HUM)
	{
		B_AssessDamage();
		AI_ContinueRoutine(self);
	}
	else
	{
		Npc_SetTempAttitude(self,ATT_HOSTILE);
		AI_ContinueRoutine(self);
	};*/
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	if(Npc_IsPlayer(self))
	{
		Npc_StopAni(self,"S_LIGHTNING_VICTIM");
	};
	Npc_ClearAIQueue(self);
	AI_Standup(self);
	if(self.guild < GIL_SEPERATOR_HUM)
	{
		B_AssessDamage();
		AI_ContinueRoutine(self);
	}
	else
	{
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_MM_Attack,0,"");
		//надо ли return?
		return;
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
	/*if(self.guild < GIL_SEPERATOR_HUM)
	{
		AI_PlayAni(self,"T_STAND_2_LIGHTNING_VICTIM");
	};*/
	AI_PlayAni(self,"T_STAND_2_LIGHTNING_VICTIM");
};

func int ZS_ShortZapped_Loop()
{
	//if(Npc_GetStateTime(self) > SPL_TIME_SHORTZAPPED)
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

