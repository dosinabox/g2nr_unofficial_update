
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
	}
	else if(self.aivar[AIV_PASSGATE] == FALSE)
	{
		if(!C_BodyStateContains(hero,BS_SNEAK))
		{
			AI_TurnToNPC(self,hero);
		};
	};
};

func int ZS_Guard_Passage_Loop()
{
	var int random;
	if(Npc_GetStateTime(self) >= 3)
	{
		if(Npc_GetDistToNpc(self,hero) > PERC_DIST_DIALOG)
		{
			random = Hlp_Random(70);
			if(random == 0)
			{
				AI_PlayAni(self,"T_HGUARD_LOOKAROUND");
			}
			else if(random == 1)
			{
				AI_PlayAni(self,"T_BORINGKICK");
			}
			else if(random == 2)
			{
				AI_PlayAni(self,"R_SCRATCHLSHOULDER");
			}
			else if(random == 3)
			{
				AI_PlayAni(self,"R_SCRATCHRSHOULDER");
			}
			else if(random == 4)
			{
				AI_PlayAni(self,"R_SCRATCHEGG");
			}
			else if(random == 5)
			{
				AI_PlayAni(self,"R_SCRATCHHEAD");
			}
			else if(random == 6)
			{
				AI_PlayAni(self,"R_LEGSHAKE");
			}
			else
			{
				AI_AlignToWP(self);
			};
		}
		else if(self.aivar[AIV_PASSGATE] == FALSE)
		{
			if(!C_BodyStateContains(hero,BS_SNEAK))
			{
				AI_TurnToNPC(self,hero);
			};
		};
		Npc_SetStateTime(self,0);
	};
	return LOOP_CONTINUE;
};

func void ZS_Guard_Passage_End()
{
};

