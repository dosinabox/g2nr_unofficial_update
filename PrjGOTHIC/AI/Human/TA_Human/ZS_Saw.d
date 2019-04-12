
func void ZS_Saw()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
};

func int ZS_Saw_Loop()
{
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BAUMSAEGE"))
	{
		AI_UseMob(self,"BAUMSAEGE",1);
	};
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

