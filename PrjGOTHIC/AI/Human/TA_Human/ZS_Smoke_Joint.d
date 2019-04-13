
func void ZS_Smoke_Joint()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	{
		AI_GotoWP(self,self.wp);
	};
	if(Npc_HasItems(self,ItMi_Joint) == 0)
	{
		CreateInvItem(self,ItMi_Joint);
	};
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_Smoke_Joint_loop()
{
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
		AI_UseItemToState(self,ItMi_Joint,0);
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	if((Npc_GetStateTime(self) > 5) && (self.aivar[AIV_TAPOSITION] == ISINPOS))
	{
		AI_PlayAniBS(self,"T_JOINT_RANDOM_1",BS_ITEMINTERACT);
		Npc_SetStateTime(self,0);
	};
	return LOOP_CONTINUE;
};

func void ZS_Smoke_Joint_end()
{
	AI_UseItemToState(self,ItMi_Joint,-1);
};

