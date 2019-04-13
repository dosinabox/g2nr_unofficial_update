
func void B_MM_Flee()
{
	Npc_ClearAIQueue(self);
	B_ClearPerceptions(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_MM_Flee,0,"");
};
