
func void ZS_Saw()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(!C_NpcIsOnRoutineWP(self))
	{
		AI_GotoWP(self,self.wp);
	};
};

func int ZS_Saw_Loop()
{
	B_UseAvailableMob(self,"BAUMSAEGE");
	if((Npc_GetStateTime(self) > 15) && C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT))
	{
		Npc_SetStateTime(self,0);
	};
	return LOOP_CONTINUE;
};

func void ZS_Saw_End()
{
	AI_UseMob(self,"BAUMSAEGE",-1);
};

