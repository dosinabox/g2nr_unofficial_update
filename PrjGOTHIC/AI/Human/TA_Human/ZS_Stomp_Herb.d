
func void ZS_Stomp_Herb()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(!C_NpcIsOnRoutineWP(self))
	{
		AI_GotoWP(self,self.wp);
	};
};

func int ZS_Stomp_Herb_Loop()
{
	B_UseAvailableMob(self,"HERB");
	return LOOP_CONTINUE;
};

func void ZS_Stomp_Herb_End()
{
	AI_UseMob(self,"HERB",-1);
};

