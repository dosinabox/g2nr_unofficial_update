
func void ZS_MM_Rtn_Wusel()
{
	Perception_Set_Monster_Rtn();
	AI_SetWalkMode(self,NPC_RUN);
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
	AI_GotoFP(self,"FP_ROAM");
};

func int ZS_MM_Rtn_Wusel_loop()
{
	if(!Wld_IsTime(self.aivar[AIV_MM_WuselStart],0,self.aivar[AIV_MM_WuselEnd],0) && (self.aivar[AIV_MM_WuselStart] != OnlyRoutine))
	{
		AI_StartState(self,ZS_MM_AllScheduler,1,"");
		return LOOP_END;
	};
	if(Npc_GetStateTime(self) >= 1)
	{
		if(Npc_IsOnFP(self,"FP_ROAM"))
		{
			if(Wld_IsNextFPAvailable(self,"FP_ROAM"))
			{
				Npc_ClearAIQueue(self);
				AI_GotoNextFP(self,"FP_ROAM");
			};
		}
		else if(!C_BodyStateContains(self,BS_WALK) && !C_BodyStateContains(self,BS_RUN))
		{
			AI_GotoFP(self,"FP_ROAM");
		};
		Npc_SetStateTime(self,0);
		self.aivar[AIV_TAPOSITION] = NOTINPOS;
	};
	return LOOP_CONTINUE;
};

func void ZS_MM_Rtn_Wusel_end()
{
};

