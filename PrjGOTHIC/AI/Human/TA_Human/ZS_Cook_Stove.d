
func void ZS_Cook_Stove()
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

func int ZS_Cook_Stove_Loop()
{
	var int random;
	B_UseAvailableMob(self,"STOVE",BS_MOBINTERACT_INTERRUPT);
	if(Npc_GetStateTime(self) > 15)
	{
		if(C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT))
		{
			random = Hlp_Random(100);
			if(random < 50)
			{
				AI_PlayAniBS(self,"T_STOVE_RANDOM_1",BS_MOBINTERACT_INTERRUPT);
			};
			Npc_SetStateTime(self,0);
		};
	};
	return LOOP_CONTINUE;
};

func void ZS_Cook_Stove_End()
{
	AI_UseMob(self,"STOVE",-1);
	if(Npc_HasItems(self,ItFoMutton))
	{
		Npc_RemoveInvItems(self,ItFoMutton,1);
	};
};

