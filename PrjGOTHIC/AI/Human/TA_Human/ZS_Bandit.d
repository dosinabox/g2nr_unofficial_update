
func void ZS_Bandit()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	{
		AI_GotoWP(self,self.wp);
	};
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_Bandit_loop()
{
	var int random;
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		if(!Npc_IsOnFP(self,"CAMPFIRE") && Wld_IsFPAvailable(self,"CAMPFIRE"))
		{
			AI_GotoFP(self,"CAMPFIRE");
			AI_AlignToFP(self);
			AI_PlayAniBS(self,"T_STAND_2_SIT",BS_SIT);
		}
		else if(!Npc_IsOnFP(self,"STAND") && Wld_IsFPAvailable(self,"STAND"))
		{
			AI_GotoFP(self,"STAND");
			AI_AlignToFP(self);
			AI_PlayAni(self,"T_STAND_2_HGUARD");
		}
		else
		{
			AI_AlignToWP(self);
			AI_PlayAni(self,"T_STAND_2_HGUARD");
		};
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	if((Npc_GetStateTime(self) > 5) && (self.aivar[AIV_TAPOSITION] == ISINPOS) && !C_BodyStateContains(self,BS_SIT))
	{
		random = Hlp_Random(3);
		if(random == 0)
		{
			AI_PlayAni(self,"T_HGUARD_LOOKAROUND");
		};
		Npc_SetStateTime(self,0);
	};
	return LOOP_CONTINUE;
};

func void ZS_Bandit_end()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_PlayAniBS(self,"T_SIT_2_STAND",BS_STAND);
	}
	else
	{
		AI_PlayAni(self,"T_HGUARD_2_STAND");
	};
};

