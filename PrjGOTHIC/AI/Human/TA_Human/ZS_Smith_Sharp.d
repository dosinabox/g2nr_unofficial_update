
func void ZS_Smith_Sharp()
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

func int ZS_Smith_Sharp_Loop()
{
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSSHARP"))
	{
		AI_UseMob(self,"BSSHARP",1);
	};
	return LOOP_CONTINUE;
};

func void ZS_Smith_Sharp_End()
{
	AI_UseMob(self,"BSSHARP",-1);
};

