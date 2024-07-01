
func void ZS_MM_Rtn_Rest()
{
	Perception_Set_Monster_Rtn();
	AI_SetWalkMode(self,NPC_WALK);
	B_MM_DeSynchronize();
	if(!C_NpcIsOnRoutineWP(self))
	{
		AI_GotoWP(self,self.wp);
	};
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
	self.aivar[AIV_StateTime] = Hlp_Random(100) % 8 + 1;
};

func int ZS_MM_Rtn_Rest_Loop()
{
	if((self.guild == GIL_STONEGUARDIAN) && (RavenIsDead == TRUE))
	{
		B_KillNpc(self);
		return LOOP_END;
	};
	if(!Wld_IsTime(self.aivar[AIV_MM_RestStart],0,self.aivar[AIV_MM_RestEnd],self.aivar[AIV_StateTime]) && (self.aivar[AIV_MM_RestStart] != OnlyRoutine))
	{
		AI_StartState(self,ZS_MM_AllScheduler,1,"");
		return LOOP_END;
	};
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		if(Wld_IsFPAvailable(self,"ROAM"))
		{
			AI_GotoFP(self,"ROAM");
		};
		if(Npc_IsOnFP(self,"ROAM"))
		{
			self.aivar[AIV_TAPOSITION] = ISINPOS;
		};
	}
	else if(Hlp_Random(1000) <= 5)
	{
		B_PlayRandomRoamAni();
	};
	return LOOP_CONTINUE;
};

func void ZS_MM_Rtn_Rest_End()
{
};

