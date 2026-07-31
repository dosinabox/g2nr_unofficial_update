
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
	var int random;
	B_UseAvailableMob(self,"BAUMSAEGE",BS_MOBINTERACT_INTERRUPT);
	if(Npc_GetStateTime(self) > 15)
	{
		if(C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT))
		{
			random = Hlp_Random(100);
			if(random < 50)
			{
				AI_PlayAniBS(self,"T_BAUMSAEGE_RANDOM_1",BS_MOBINTERACT_INTERRUPT);
			};
			Npc_SetStateTime(self,0);
		};
	};
	return LOOP_CONTINUE;
};

func void ZS_Saw_End()
{
	AI_UseMob(self,"BAUMSAEGE",-1);
};

