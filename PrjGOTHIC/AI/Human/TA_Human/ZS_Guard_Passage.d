
func void ZS_Guard_Passage()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	Npc_SetPercTime(self,0.1);
	AI_Standup(self);
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
	if(Npc_GetDistToNpc(self,hero) > PERC_DIST_DIALOG)
	{
		AI_AlignToWP(self);
	};
	/*else if(!C_BodyStateContains(other,BS_SNEAK))
	{
		AI_TurnToNPC(self,hero);
	};*/
	AI_TurnToNPC(self,hero);
};

func int ZS_Guard_Passage_Loop()
{
	var int random;
	if(Npc_GetStateTime(self) >= 3)
	{
		if(Npc_GetDistToNpc(self,hero) > PERC_DIST_DIALOG)
		{
			random = Hlp_Random(10);
			if(random == 0)
			{
				AI_PlayAni(self,"T_HGUARD_LOOKAROUND");
			}
			else
			{
				AI_AlignToWP(self);
			};
		};
		/*else if(!C_BodyStateContains(other,BS_SNEAK))
		{
			AI_TurnToNPC(self,hero);
		};*/
		AI_TurnToNPC(self,hero);
		Npc_SetStateTime(self,0);
	};
	return LOOP_CONTINUE;
};

func void ZS_Guard_Passage_End()
{
};

