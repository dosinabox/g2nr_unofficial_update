
func void ZS_Repair_Hut()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(!C_NpcIsOnRoutineWP(self))
	{
		AI_GotoWP(self,self.wp);
	};
};

func int ZS_Repair_Hut_Loop()
{
	var int random;
	B_UseAvailableMob(self,"REPAIR",BS_MOBINTERACT_INTERRUPT);
	if(Npc_GetStateTime(self) > 5)
	{
		if(C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT))
		{
			random = Hlp_Random(100);
			if(random < 50)
			{
				AI_PlayAniBS(self,"T_REPAIR_RANDOM_1",BS_MOBINTERACT_INTERRUPT);
			};
			Npc_SetStateTime(self,0);
		};
	};
	return LOOP_CONTINUE;
};

func void ZS_Repair_Hut_End()
{
	AI_UseMob(self,"REPAIR",-1);
};

