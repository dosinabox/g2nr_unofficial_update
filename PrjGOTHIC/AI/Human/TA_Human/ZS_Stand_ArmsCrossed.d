
func void ZS_Stand_ArmsCrossed()
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

func int ZS_Stand_ArmsCrossed_Loop()
{
	var int random;
	var int Eventrandy;
	if(Npc_IsOnFP(self,"STAND"))
	{
		AI_AlignToFP(self);
		if(self.aivar[AIV_TAPOSITION] == NOTINPOS_WALK)
		{
			self.aivar[AIV_TAPOSITION] = NOTINPOS;
		};
	}
	else if(Wld_IsFPAvailable(self,"STAND"))
	{
		AI_GotoFP(self,"STAND");
		AI_Standup(self);
		AI_AlignToFP(self);
		self.aivar[AIV_TAPOSITION] = NOTINPOS_WALK;
	}
	else
	{
		AI_AlignToWP(self);
		if(self.aivar[AIV_TAPOSITION] == NOTINPOS_WALK)
		{
			self.aivar[AIV_TAPOSITION] = NOTINPOS;
		};
	};
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		AI_Standup(self);
		AI_PlayAni(self,"T_STAND_2_LGUARD");
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	if((Npc_GetStateTime(self) > 5) && (self.aivar[AIV_TAPOSITION] == ISINPOS))
	{
		random = Hlp_Random(12);
		if(random == 0)
		{
			AI_PlayAni(self,"T_LGUARD_SCRATCH");
		}
		else if(random == 1)
		{
			AI_PlayAni(self,"T_LGUARD_STRETCH");
		}
		else if(random == 2)
		{
			AI_PlayAni(self,"T_LGUARD_CHANGELEG");
		}
		else if(random == 3)
		{
			AI_PlayAni(self,"R_SCRATCHLSHOULDER");
		}
		else if(random == 4)
		{
			AI_PlayAni(self,"R_SCRATCHRSHOULDER");
		};
		if((CurrentLevel == ADDONWORLD_ZEN) && (RavenIsDead == FALSE) && (self.guild != GIL_PIR))
		{
			Eventrandy = Hlp_Random(200);
			if(Eventrandy == 1)
			{
				B_Event_Portal_EarthQuake();
			};
		};
		Npc_SetStateTime(self,0);
	};
	return LOOP_CONTINUE;
};

func void ZS_Stand_ArmsCrossed_End()
{
	AI_PlayAni(self,"T_LGUARD_2_STAND");
};

