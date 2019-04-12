
func void ZS_Read_Bookstand()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
};

func int ZS_Read_Bookstand_Loop()
{
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BOOK"))
	{
		AI_UseMob(self,"BOOK",1);
	};
	return LOOP_CONTINUE;
};

func void ZS_Read_Bookstand_End()
{
	AI_UseMob(self,"BOOK",-1);
};

