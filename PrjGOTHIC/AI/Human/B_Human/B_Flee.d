
func void B_Flee()
{
		if(C_NpcIsHero(other))
		{
			self.aivar[AIV_LastFightAgainstPlayer] = FIGHT_LOST;
			self.aivar[AIV_LastFightComment] = FALSE;
		};
		Npc_ClearAIQueue(self);
		B_ClearPerceptions(self);
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_Flee,0,"");
};
