
func void ZS_Smith_Anvil()
{
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Bennet))
	{
		if(Bennet_flag == 0)
		{
			Bennet_swordraws = Npc_HasItems(self,ItMiSwordraw);
			Bennet_flag = 1;
		};
	}
	else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Huno))
	{
		if(Huno_flag == 0)
		{
			Huno_swordraws = Npc_HasItems(self,ItMiSwordraw);
			Huno_flag = 1;
		};
	}
	else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Bennet_DI))
	{
		if(Bennet_DI_flag == 0)
		{
			Bennet_DI_swordraws = Npc_HasItems(self,ItMiSwordraw);
			Bennet_DI_flag = 1;
		};
	};
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
};

func int ZS_Smith_Anvil_Loop()
{
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_UseMob(self,"BSANVIL",1);
	};
	return LOOP_CONTINUE;
};

func void ZS_Smith_Anvil_End()
{
	AI_UseMob(self,"BSANVIL",-1);
};

