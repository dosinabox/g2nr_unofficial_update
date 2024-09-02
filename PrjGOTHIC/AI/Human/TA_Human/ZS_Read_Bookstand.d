
func void ZS_Read_Bookstand()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(!C_NpcIsOnRoutineWP(self))
	{
		AI_GotoWP(self,self.wp);
	};
};

func int ZS_Read_Bookstand_Loop()
{
	B_UseAvailableMob(self,"BOOK");
	return LOOP_CONTINUE;
};

func void ZS_Read_Bookstand_End()
{
	AI_UseMob(self,"BOOK",-1);
};

