
func void ZS_Practice_Magic()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	{
		AI_GotoWP(self,self.wp);
	};
};

func int ZS_Practice_Magic_Loop()
{
	var int zufall;
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
	if((Npc_GetStateTime(self) > 7) && (self.aivar[AIV_TAPOSITION] == NOTINPOS))
	{
		zufall = Hlp_Random(100);
		if(zufall <= 25)
		{
			AI_PlayAni(self,"T_PRACTICEMAGIC");
		}
		else if(zufall <= 50)
		{
			AI_PlayAni(self,"T_PRACTICEMAGIC2");
		}
		else if(zufall <= 70)
		{
			AI_PlayAni(self,"T_PRACTICEMAGIC3");
		}
		else if(zufall <= 90)
		{
			AI_PlayAni(self,"T_PRACTICEMAGIC4");
		}
		else
		{
			AI_PlayAni(self,"R_SCRATCHHEAD");
		};
		Npc_SetStateTime(self,0);
	};
	return LOOP_CONTINUE;
};

func void ZS_Practice_Magic_End()
{
};

