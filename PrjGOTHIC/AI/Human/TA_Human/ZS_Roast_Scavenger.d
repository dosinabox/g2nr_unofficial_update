
func void ZS_Roast_Scavenger()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(!C_NpcIsOnRoutineWP(self))
	{
		AI_GotoWP(self,self.wp);
	};
};

func int ZS_Roast_Scavenger_Loop()
{
	B_UseAvailableMob(self,"BARBQ");
	return LOOP_CONTINUE;
};

func void ZS_Roast_Scavenger_End()
{
	AI_UseMob(self,"BARBQ",-1);
};

