
func void ZS_Sit_Throne()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	if(!C_BodyStateContains(self,BS_SIT))
	{
		AI_SetWalkMode(self,NPC_WALK);
		if(!C_NpcIsOnRoutineWP(self))
		{
			AI_GotoWP(self,self.wp);
		};
	};
};

func int ZS_Sit_Throne_Loop()
{
	B_UseAvailableMob(self,"THRONE",BS_SIT);
	return LOOP_CONTINUE;
};

func void ZS_Sit_Throne_End()
{
	AI_UseMob(self,"THRONE",-1);
};

