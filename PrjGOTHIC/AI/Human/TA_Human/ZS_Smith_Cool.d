
func void ZS_Smith_Cool()
{
	B_SetLastUsedMobsi(self,MOBSI_SmithWeapon);
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(!C_NpcIsOnRoutineWP(self))
	{
		AI_GotoWP(self,self.wp);
	};
};

func int ZS_Smith_Cool_Loop()
{
	B_UseAvailableMob(self,"BSCOOL");
	return LOOP_CONTINUE;
};

func void ZS_Smith_Cool_End()
{
	AI_UseMob(self,"BSCOOL",-1);
};

