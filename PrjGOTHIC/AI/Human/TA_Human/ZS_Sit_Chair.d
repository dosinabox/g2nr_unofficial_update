
func void ZS_Sit_Chair()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	if(!C_BodyStateContains(self,BS_SIT))
	{
		AI_SetWalkMode(self,NPC_WALK);
		if(!C_NpcIsOnRoutineWP(self))
		{
			AI_GotoWP(self,self.wp);
		};
	};
};

func int ZS_Sit_Chair_Loop()
{
	var int random;
	if(!C_BodyStateContains(self,BS_SIT))
	{
		if(Wld_IsMobAvailable(self,"CHAIR"))
		{
			AI_UseMob(self,"CHAIR",1);
		};
	}
	else if(Npc_GetStateTime(self) > 5)
	{
		random = Hlp_Random(10);
		if(random == 0)
		{
			AI_PlayAniBS(self,"R_CHAIR_RANDOM_1",BS_SIT);
		}
		else if(random == 1)
		{
			AI_PlayAniBS(self,"R_CHAIR_RANDOM_2",BS_SIT);
		}
		else if(random == 2)
		{
			AI_PlayAniBS(self,"R_CHAIR_RANDOM_3",BS_SIT);
		}
		else if(random == 3)
		{
			AI_PlayAniBS(self,"R_CHAIR_RANDOM_4",BS_SIT);
		};
		Npc_SetStateTime(self,0);
	};
	return LOOP_CONTINUE;
};

func void ZS_Sit_Chair_End()
{
	AI_UseMob(self,"CHAIR",-1);
};

