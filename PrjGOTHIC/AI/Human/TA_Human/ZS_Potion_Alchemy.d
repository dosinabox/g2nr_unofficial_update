
func void ZS_Potion_Alchemy()
{
	B_SetLastUsedMobsi(self,MOBSI_PotionAlchemy);
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(!C_NpcIsOnRoutineWP(self))
	{
		AI_GotoWP(self,self.wp);
	};
};

func int ZS_Potion_Alchemy_Loop()
{
	B_UseAvailableMob(self,"LAB");
	return LOOP_CONTINUE;
};

func void ZS_Potion_Alchemy_End()
{
	AI_UseMob(self,"LAB",-1);
};

