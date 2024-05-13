
/*func void ZS_Pray_Innos()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(!C_NpcIsOnRoutineWP(self))
	{
		AI_GotoWP(self,self.wp);
	};
};

func int ZS_Pray_Innos_Loop()
{
	B_UseAvailableMob(self,"INNOS");
	if((Npc_GetStateTime(self) > 5) && C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT))
	{
		Npc_SetStateTime(self,0);
	};
	return LOOP_CONTINUE;
};

func void ZS_Pray_Innos_End()
{
	AI_UseMob(self,"INNOS",-1);
};*/

