
func void ZS_GotoBed()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
	AI_StartState(self,ZS_Sleep,0,"");
};

func void B_AssessSleepTalk()
{
	if(C_BodyStateContains(self,BS_LIE))
	{
		AI_UseMob(self,"BEDHIGH",-1);
	};
	AI_StartState(self,ZS_ObservePlayer,0,"");
};

func void ZS_Sleep()
{
	Npc_PercEnable(self,PERC_ASSESSQUIETSOUND,B_AssessQuietSound);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_AssessDamage);
	Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessSleepTalk);
	AI_SetWalkMode(self,NPC_WALK);
};

func int ZS_Sleep_Loop()
{
	if(!C_BodyStateContains(self,BS_LIE))
	{
		if(Wld_IsMobAvailable(self,"BEDHIGH"))
		{
			AI_UseMob(self,"BEDHIGH",1);
		}
		else if((Player_GetOutOfMyBedComment == FALSE) && C_BodyStateContains(hero,BS_LIE) && (Npc_GetDistToNpc(self,hero) <= 500))
		{
			B_TurnToNpc(self,hero);
			B_Say(self,other,"$GETOUTOFMYBED");
			Player_GetOutOfMyBedComment = TRUE;
		};
	};
	return LOOP_CONTINUE;
};

func void ZS_Sleep_End()
{
	if(!Npc_IsInPlayersRoom(self))
	{
		B_Say(self,self,"$AWAKE");
	};
	AI_UseMob(self,"BEDHIGH",-1);
};

