
func int B_StopMagicSleep()
{
	Npc_PercDisable(self,PERC_ASSESSDAMAGE);
	B_Say_Overlay(self,other,"$WHATWASSTHAT");
	AI_PlayAni(self,"T_VICTIM_SLE_2_STAND");
};

func void B_AssessMagicSleepTalk()
{
	B_Say(self,other,"$YOUDISTURBEDMYSLUMBER");
	AI_StartState(self,ZS_ObservePlayer,1,"");
};

func void ZS_MagicSleep()
{
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_StopMagicSleep);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessMagicSleepTalk);
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	Npc_SetRefuseTalk(self,0);
	Npc_SetTempAttitude(self,Npc_GetPermAttitude(self,hero));
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
	if(Npc_GetStateTime(self) > SPL_TIME_Sleep)
	{
		Npc_ClearAIQueue(self);
		B_StopMagicSleep();
		return LOOP_END;
	};
};

func void ZS_MagicSleep_End()
{
};

