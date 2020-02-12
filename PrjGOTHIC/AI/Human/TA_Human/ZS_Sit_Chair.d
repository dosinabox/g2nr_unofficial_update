
func void ZS_Sit_Chair()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	if(!C_BodyStateContains(self,BS_SIT))
	{
		AI_SetWalkMode(self,NPC_WALK);
		if(!Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
		{
			AI_GotoWP(self,self.wp);
		};
	};
};

func int ZS_Sit_Chair_Loop()
{
	var int random;
	if(!C_BodyStateContains(self,BS_SIT) && Wld_IsMobAvailable(self,"CHAIR"))
	{
		AI_UseMob(self,"CHAIR",1);
	};
	if(C_BodyStateContains(self,BS_SIT) && (Npc_GetStateTime(self) > 5))
	{
		random = Hlp_Random(10);
		if(random <= 0)
		{
			AI_PlayAniBS(self,"R_CHAIR_RANDOM_1",BS_SIT);
			AI_Wait(self,1.9);
		};
		if(random <= 1)
		{
			AI_PlayAniBS(self,"R_CHAIR_RANDOM_2",BS_SIT);
			AI_Wait(self,2.2);
		};
		if(random <= 2)
		{
			AI_PlayAniBS(self,"R_CHAIR_RANDOM_3",BS_SIT);
			AI_Wait(self,3.0);
		};
		if(random <= 3)
		{
			AI_PlayAniBS(self,"R_CHAIR_RANDOM_4",BS_SIT);
			AI_Wait(self,2.0);
		};
		Npc_SetStateTime(self,0);
	};
	return LOOP_CONTINUE;
};

func void ZS_Sit_Chair_End()
{
	AI_UseMob(self,"CHAIR",-1);
};

