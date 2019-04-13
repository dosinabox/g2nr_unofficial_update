
func void ZS_MM_Rtn_Roam()
{
	Perception_Set_Monster_Rtn();
	AI_SetWalkMode(self,NPC_WALK);
	B_MM_DeSynchronize();
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_MM_Rtn_Roam_loop()
{
	var int wanderTime;
	var int randomMove;
	if(!Wld_IsTime(self.aivar[AIV_MM_RoamStart],0,self.aivar[AIV_MM_RoamEnd],0) && (self.aivar[AIV_MM_RoamStart] != OnlyRoutine))
	{
		AI_StartState(self,ZS_MM_AllScheduler,1,"");
		return LOOP_END;
	};
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		wanderTime = Hlp_Random(5);
		Npc_SetStateTime(self,0);
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	if(Npc_GetStateTime(self) > wanderTime)
	{
		if(Wld_IsNextFPAvailable(self,"FP_ROAM"))
		{
			AI_GotoNextFP(self,"FP_ROAM");
		};
		self.aivar[AIV_TAPOSITION] = NOTINPOS;
	}
	else if(Hlp_Random(1000) <= 5)
	{
		randomMove = Hlp_Random(3);
		if(randomMove == 0)
		{
			AI_PlayAni(self,"R_ROAM1");
		};
		if(randomMove == 1)
		{
			AI_PlayAni(self,"R_ROAM2");
		};
		if(randomMove == 2)
		{
			AI_PlayAni(self,"R_ROAM3");
		};
	};
	return LOOP_CONTINUE;
};

func void ZS_MM_Rtn_Roam_end()
{
};

