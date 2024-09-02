
func void ZS_Bandit()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	if(C_BodyStateContains(self,BS_SIT))
	{
		if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
		{
			AI_StandUp(self);
		}
		else
		{
			self.aivar[AIV_TAPOSITION] = ISINPOS;
			return;
		};
	};
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_Bandit_Loop()
{
	if(self.aivar[AIV_TAPOSITION] == ISINPOS)
	{
		if(!C_BodyStateContains(self,BS_SIT))
		{
			if(Npc_GetStateTime(self) > self.aivar[AIV_STATETIME])
			{
				AI_PlayAni(self,"T_HGUARD_LOOKAROUND");
				self.aivar[AIV_StateTime] = Hlp_Random(100) % 8 + 10; // от 10 до 17 секунд.
				Npc_SetStateTime(self,0);
			};
		};
		AI_Wait(self,1);
		return LOOP_CONTINUE;
	};
	if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	{
		AI_StandUp(self);
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,self.wp);
		return LOOP_CONTINUE;
	};
	if(Wld_IsFPAvailable(self,"CAMPFIRE"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_Wait(self,0.5);
		AI_GotoFP(self,"CAMPFIRE");
		AI_Wait(self,0.5);
		AI_PlayAniBS(self,"T_STAND_2_SIT",BS_SIT);
		self.aivar[AIV_TAPOSITION] = ISINPOS;
		return LOOP_CONTINUE;
	};
	self.aivar[AIV_StateTime] = Hlp_Random(100) % 5 + 5; // от 5 до 9 секунд.
	Npc_SetStateTime(self,0);
	if(Wld_IsFPAvailable(self,"STAND"))
	{
		AI_StandUp(self);
		AI_SetWalkMode(self,NPC_WALK);
		AI_Wait(self,0.5);
		AI_GotoFP(self,"STAND");
		AI_SetWalkMode(self,NPC_RUN);
		AI_Wait(self,0.5);
		AI_PlayAni(self,"T_STAND_2_HGUARD");
		self.aivar[AIV_TAPOSITION] = ISINPOS;
		return LOOP_CONTINUE;
	};
	AI_StandUp(self);
	AI_AlignToWP(self);
	AI_SetWalkMode(self,NPC_RUN);
	AI_Wait(self,0.5);
	AI_PlayAni(self,"T_STAND_2_HGUARD");
	self.aivar[AIV_TAPOSITION] = ISINPOS;
	return LOOP_CONTINUE;
};

func void ZS_Bandit_End()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_PlayAniBS(self,"T_SIT_2_STAND",BS_STAND);
	}
	else
	{
		AI_PlayAni(self,"T_HGUARD_2_STAND");
	};
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
	self.aivar[AIV_StateTime] = 0;
};

