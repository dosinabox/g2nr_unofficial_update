
func void ZS_Cook_Cauldron()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(!C_NpcIsOnRoutineWP(self))
	{
		AI_GotoWP(self,self.wp);
	};
	if(!Npc_HasItems(self,ItMi_Scoop))
	{
		CreateInvItem(self,ItMi_Scoop);
	};
};

func int ZS_Cook_Cauldron_Loop()
{
	B_UseAvailableMob(self,"CAULDRON");
	return LOOP_CONTINUE;
};

func void ZS_Cook_Cauldron_End()
{
	AI_UseMob(self,"CAULDRON",-1);
};

