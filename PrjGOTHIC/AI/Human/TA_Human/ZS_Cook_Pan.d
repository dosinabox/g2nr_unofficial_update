
func void ZS_Cook_Pan()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(!C_NpcIsOnRoutineWP(self))
	{
		AI_GotoWP(self,self.wp);
	};
	if(!Npc_HasItems(self,ItFoMuttonRaw))
	{
		CreateInvItem(self,ItFoMuttonRaw);
	};
};

func int ZS_Cook_Pan_Loop()
{
	B_UseAvailableMob(self,"PAN");
	return LOOP_CONTINUE;
};

func void ZS_Cook_Pan_End()
{
	AI_UseMob(self,"PAN",-1);
	AI_UseItem(self,ItFoMutton);
};

