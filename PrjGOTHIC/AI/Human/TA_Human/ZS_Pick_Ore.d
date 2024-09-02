
func void ZS_Pick_Ore()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(!C_NpcIsOnRoutineWP(self))
	{
		AI_GotoWP(self,self.wp);
	};
	if(!Npc_HasItems(self,ItMw_2H_Axe_L_01))
	{
		CreateInvItem(self,ItMw_2H_Axe_L_01);
	};
};

func int ZS_Pick_Ore_Loop()
{
	B_UseAvailableMob(self,"ORE");
	return LOOP_CONTINUE;
};

func void ZS_Pick_Ore_End()
{
	AI_UseMob(self,"ORE",-1);
};

