
func void ZS_MM_Rtn_DragonRest()
{
	Npc_SetPercTime(self,1);
	self.aivar[AIV_MM_PRIORITY] = PRIO_EAT;
	/*if(Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Dragon_Testmodell))
	{
		Perception_Set_Monster_Rtn();
		Npc_PercEnable(self,PERC_ASSESSPLAYER,B_MM_AssessPlayer);
	};*/
	Perception_Set_Monster_Rtn();
	Npc_PercEnable(self,PERC_ASSESSPLAYER,B_MM_AssessPlayer);
	Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessTalk);
	AI_SetWalkMode(self,NPC_WALK);
	B_MM_DeSynchronize();
	if(!C_NpcIsOnRoutineWP(self))
	{
		AI_GotoWP(self,self.wp);
	};
	if(Wld_IsFPAvailable(self,"FP_ROAM"))
	{
		AI_GotoFP(self,"FP_ROAM");
	}
	else
	{
		AI_AlignToWP(self);
	};
	self.aivar[AIV_TAPOSITION] = 0;
	self.aivar[AIV_StateTime] = Hlp_Random(100) % 8 + 1;
};

func int ZS_MM_Rtn_DragonRest_Loop()
{
	var int randomMove;
	if(!Wld_IsTime(self.aivar[AIV_MM_RestStart],0,self.aivar[AIV_MM_RestEnd],self.aivar[AIV_StateTime]) && (self.aivar[AIV_MM_RestStart] != OnlyRoutine))
	{
		AI_StartState(self,ZS_MM_AllScheduler,1,"");
		return LOOP_END;
	};
	if(self.guild == GIL_DRAGON)
	{
		B_DragonHeal(self);
	};
	if(Hlp_Random(1000) <= 5)
	{
		if(self.guild != GIL_DRAGON)
		{
			AI_Standup(self);
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
	return LOOP_CONTINUE;
};

func void ZS_MM_Rtn_DragonRest_End()
{
	AI_PlayAni(self,"T_REST_2_STAND");
};

