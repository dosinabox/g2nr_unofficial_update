
func void B_PlayRandomRoamAni()
{
	var int randomMove;
	if((self.guild != GIL_Stoneguardian) && (self.guild != GIL_HARPY) && (self.guild != GIL_SKELETON) && (self.guild != GIL_SWAMPSHARK) && (self.guild != GIL_BLOODFLY) && (self.guild != GIL_MEATBUG))
	{
		randomMove = Hlp_Random(3);
		if(randomMove == 0)
		{
			AI_PlayAni(self,"R_ROAM1");
		}
		else if(randomMove == 1)
		{
			AI_PlayAni(self,"R_ROAM2");
		}
		else
		{
			AI_PlayAni(self,"R_ROAM3");
		};
	};
};

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
	if((self.guild == GIL_Stoneguardian) && (RavenIsDead == TRUE))
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

