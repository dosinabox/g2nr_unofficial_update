
func void ZS_MM_Rtn_Wusel()
{
	Perception_Set_Monster_Rtn();
	AI_SetWalkMode(self,NPC_RUN);
	if(!C_NpcIsOnRoutineWP(self))
	{
		AI_GotoWP(self,self.wp);
	};
	AI_GotoFP(self,"ROAM");
	self.aivar[AIV_StateTime] = Hlp_Random(100) % 8 + 1;
};

func int ZS_MM_Rtn_Wusel_Loop()
{
	if(!Wld_IsTime(self.aivar[AIV_MM_WuselStart],0,self.aivar[AIV_MM_WuselEnd],self.aivar[AIV_StateTime]) && (self.aivar[AIV_MM_WuselStart] != OnlyRoutine))
	{
		AI_StartState(self,ZS_MM_AllScheduler,1,"");
		return LOOP_END;
	};
	if(Npc_GetStateTime(self) >= 1)
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
		self.aivar[AIV_TAPOSITION] = NOTINPOS;
	};
	return LOOP_CONTINUE;
};

func void ZS_MM_Rtn_Wusel_End()
{
};

