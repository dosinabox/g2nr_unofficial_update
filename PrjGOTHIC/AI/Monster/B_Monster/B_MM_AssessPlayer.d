
func void B_MM_AssessPlayer()
{
	if(other.aivar[AIV_INVINCIBLE] == TRUE)
	{
		return;
	};
	if(C_NpcIsDown(other))
	{
		return;
	};
	if(self.guild == GIL_MEATBUG)
	{
		if(Npc_GetDistToNpc(self,other) < 100)
		{
			if(C_BodyStateContains(other,BS_WALK) || C_BodyStateContains(other,BS_SNEAK) || C_BodyStateContains(other,BS_RUN) || C_BodyStateContains(other,BS_JUMP))
			{
				Snd_Play("MEATBUG_STOMP");
				B_KillAnimal(self);
				B_GiveDeathXP(other,self);
			};
		};
		return;
	};
	B_AssignDragonTalk(self);
	if((Npc_GetDistToNpc(self,other) <= 700) && Npc_CheckInfo(self,1))
	{
		if((self.guild == GIL_DRAGON) || ((self.guild != GIL_DRAGON) && (Npc_GetDistToNpc(self,other) <= PERC_DIST_DIALOG)))
		{
			if(!C_BodyStateContains(other,BS_FALL) && !C_NpcIsSwimming(other))
			{
				self.aivar[AIV_NpcStartedTalk] = TRUE;
				B_AssessTalk();
				return;
			};
		};
	};
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if((Npc_GetDistToNpc(self,hero) < 500) && !C_BodyStateContains(self,BS_STAND))
		{
			Npc_ClearAIQueue(self);
			AI_Standup(self);
			AI_TurnToNPC(self,hero);
		};
	};
};

