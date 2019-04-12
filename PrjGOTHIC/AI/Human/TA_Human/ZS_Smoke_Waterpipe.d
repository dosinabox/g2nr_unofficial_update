
func void ZS_Smoke_Waterpipe()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	{
		AI_GotoWP(self,self.wp);
	};
};

func int ZS_Smoke_Waterpipe_Loop()
{
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"SMOKE"))
	{
		AI_UseMob(self,"SMOKE",1);
	};
	return LOOP_CONTINUE;
};

func void ZS_Smoke_Waterpipe_End()
{
	AI_UseMob(self,"SMOKE",-1);
};

