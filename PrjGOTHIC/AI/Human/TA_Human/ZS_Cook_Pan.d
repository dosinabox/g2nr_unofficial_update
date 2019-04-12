
func void ZS_Cook_Pan()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
	if(Npc_HasItems(self,ItFoMuttonRaw) == 0)
	{
		CreateInvItem(self,ItFoMuttonRaw);
	};
};

func int ZS_Cook_Pan_Loop()
{
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"PAN"))
	{
		AI_UseMob(self,"PAN",1);
	};
	return LOOP_CONTINUE;
};

func void ZS_Cook_Pan_End()
{
	AI_UseMob(self,"PAN",-1);
	AI_UseItem(self,ItFoMutton);
};

