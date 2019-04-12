
func void ZS_MM_Hunt()
{
	Perception_Set_Monster_Rtn();
	AI_Standup(self);
	AI_TurnToNPC(self,other);
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoNpc(self,other);
};

func int ZS_MM_Hunt_Loop()
{
	return LOOP_END;
};

func void ZS_MM_Hunt_End()
{
};

