
func void ZS_Pray_Sleeper()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(!C_NpcIsOnRoutineWP(self))
	{
		AI_GotoWP(self,self.wp);
	};
};

func int ZS_Pray_Sleeper_Loop()
{
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"IDOL"))
	{
		AI_UseMob(self,"IDOL",1);
	};
	return LOOP_CONTINUE;
};

func void ZS_Pray_Sleeper_End()
{
	AI_UseMob(self,"IDOL",-1);
};

