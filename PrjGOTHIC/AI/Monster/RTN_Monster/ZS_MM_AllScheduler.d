
func void ZS_MM_AllScheduler()
{
	self.aivar[AIV_MM_PRIORITY] = PRIO_EAT;
	if((self.guild == GIL_Stoneguardian) && (RavenIsDead == TRUE))
	{
		B_KillNpc(self);
	};
	if(Wld_IsTime(self.aivar[AIV_MM_SleepStart],0,self.aivar[AIV_MM_SleepEnd],0) || (self.aivar[AIV_MM_SleepStart] == OnlyRoutine))
	{
		AI_StartState(self,ZS_MM_Rtn_Sleep,1,"");
	}
	else if(Wld_IsTime(self.aivar[AIV_MM_RestStart],0,self.aivar[AIV_MM_RestEnd],0) || (self.aivar[AIV_MM_RestStart] == OnlyRoutine))
	{
		AI_StartState(self,ZS_MM_Rtn_Rest,1,"");
	}
	else if(Wld_IsTime(self.aivar[AIV_MM_RoamStart],0,self.aivar[AIV_MM_RoamEnd],0) || (self.aivar[AIV_MM_RoamStart] == OnlyRoutine))
	{
		AI_StartState(self,ZS_MM_Rtn_Roam,1,"");
	}
	else if(Wld_IsTime(self.aivar[AIV_MM_EatGroundStart],0,self.aivar[AIV_MM_EatGroundEnd],0) || (self.aivar[AIV_MM_EatGroundStart] == OnlyRoutine))
	{
		AI_StartState(self,ZS_MM_Rtn_EatGround,1,"");
	}
	else if(Wld_IsTime(self.aivar[AIV_MM_WuselStart],0,self.aivar[AIV_MM_WuselEnd],0) || (self.aivar[AIV_MM_WuselStart] == OnlyRoutine))
	{
		AI_StartState(self,ZS_MM_Rtn_Wusel,1,"");
	}
	else if(Wld_IsTime(self.aivar[AIV_MM_OrcSitStart],0,self.aivar[AIV_MM_OrcSitEnd],0) || (self.aivar[AIV_MM_OrcSitStart] == OnlyRoutine))
	{
		AI_StartState(self,ZS_MM_Rtn_OrcSit,1,"");
	}
	else
	{
		AI_StartState(self,ZS_MM_Rtn_Rest,1,"");
	};
};

