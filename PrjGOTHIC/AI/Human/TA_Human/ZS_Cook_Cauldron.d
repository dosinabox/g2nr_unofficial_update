
func void ZS_Cook_Cauldron()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
	if(Npc_HasItems(self,ItMi_Scoop) == 0)
	{
		CreateInvItem(self,ItMi_Scoop);
	};
};

func int ZS_Cook_Cauldron_Loop()
{
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"CAULDRON"))
	{
		AI_UseMob(self,"CAULDRON",1);
	};
	return LOOP_CONTINUE;
};

func void ZS_Cook_Cauldron_End()
{
	AI_UseMob(self,"CAULDRON",-1);
};

