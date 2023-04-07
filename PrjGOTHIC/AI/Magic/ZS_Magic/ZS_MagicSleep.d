
func void B_StopMagicSleep()
{
	B_ResetFaceExpression(self);
	AI_Standup(self);
	if(!Npc_IsPlayer(self))
	{
		B_Say_Overlay(self,other,"$WHATWASTHAT");
	}
	else
	{
		B_Say_Overlay(self,self,"$AWAKE");
	};
	AI_ContinueRoutine(self);
};

func void B_AssessMagicSleepTalk()
{
	B_ResetFaceExpression(self);
	AI_StartState(self,ZS_ObservePlayer,1,"");
};

func void ZS_MagicSleep()
{
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_StopMagicSleep);
	Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessMagicSleepTalk);
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	Npc_SetRefuseTalk(self,0);
	Npc_SetTempAttitude(self,Npc_GetPermAttitude(self,hero));
	if(!Npc_IsPlayer(self))
	{
		AI_Wait(self,2);
	};
	B_StopLookAt(self);
	AI_StopPointAt(self);
	if(!Npc_HasBodyFlag(self,BS_FLAG_INTERRUPTABLE))
	{
		AI_Standup(self);
	}
	else
	{
		AI_StandupQuick(self);
	};
	AI_PlayAniBS(self,"T_STAND_2_VICTIM_SLE",BS_LIE);
};

func int ZS_MagicSleep_Loop()
{
	Mdl_StartFaceAni(self,"S_EYESCLOSED",1,-1);
	if(Npc_GetStateTime(self) > SPL_TIME_Sleep)
	{
		Npc_ClearAIQueue(self);
		B_StopMagicSleep();
		return LOOP_END;
	};
	return LOOP_CONTINUE;
};

func void ZS_MagicSleep_End()
{
};

