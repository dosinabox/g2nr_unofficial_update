
func void ZS_MM_Rtn_OrcSit()
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

func int ZS_MM_Rtn_OrcSit_Loop()
{
	if(!Wld_IsTime(self.aivar[AIV_MM_OrcSitStart],0,self.aivar[AIV_MM_OrcSitEnd],self.aivar[AIV_StateTime]) && (self.aivar[AIV_MM_OrcSitStart] != OnlyRoutine))
	{
		AI_StartState(self,ZS_MM_AllScheduler,1,"");
		return LOOP_END;
	};
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		if(Wld_IsFPAvailable(self,"CAMPFIRE"))
		{
			AI_GotoFP(self,"CAMPFIRE");
		};
		if(Npc_IsOnFP(self,"CAMPFIRE"))
		{
			AI_PlayAniBS(self,"T_STAND_2_GUARDSLEEP",BS_SIT);
			self.aivar[AIV_TAPOSITION] = ISINPOS;
		};
	};
	return LOOP_CONTINUE;
};

func void ZS_MM_Rtn_OrcSit_End()
{
	AI_PlayAniBS(self,"T_GUARDSLEEP_2_STAND",BS_STAND);
};

