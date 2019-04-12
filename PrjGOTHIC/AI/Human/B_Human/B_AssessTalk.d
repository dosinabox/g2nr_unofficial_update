
func void B_AssessTalk()
{
	var C_Npc pcl;
	var C_Npc pcr;
	var int rnd;
	pcl = Hlp_GetNpc(PC_Levelinspektor);
	pcr = Hlp_GetNpc(PC_Rockefeller);
	if((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(pcl)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(pcr)))
	{
		PrintScreen(ConcatStrings("Voice:",IntToString(self.voice)),-1,70,FONT_Screen,2);
		PrintScreen("NO HERO!",-1,-1,FONT_Screen,2);
		PrintScreen(IntToString(self.aivar[AIV_FollowDist]),-1,70,FONT_Screen,2);
		if(C_NpcIsInQuarter(self) == Q_KASERNE)
		{
			PrintScreen("Q_BARRACKS",-1,30,FONT_Screen,2);
		};
		if(C_NpcIsInQuarter(self) == Q_GALGEN)
		{
			PrintScreen("Q_GALLOWS",-1,30,FONT_Screen,2);
		};
		if(C_NpcIsInQuarter(self) == Q_MARKT)
		{
			PrintScreen("Q_MARKET",-1,30,FONT_Screen,2);
		};
		if(C_NpcIsInQuarter(self) == Q_TEMPEL)
		{
			PrintScreen("Q_TEMPLE",-1,30,FONT_Screen,2);
		};
		if(C_NpcIsInQuarter(self) == Q_UNTERSTADT)
		{
			PrintScreen("Q_LOWER CITY",-1,30,FONT_Screen,2);
		};
		if(C_NpcIsInQuarter(self) == Q_HAFEN)
		{
			PrintScreen("Q_HARBOR",-1,30,FONT_Screen,2);
		};
		if(C_NpcIsInQuarter(self) == Q_OBERSTADT)
		{
			PrintScreen("Q_UPPER CITY",-1,30,FONT_Screen,2);
		};
		return;
	};
	if(self.guild > GIL_SEPERATOR_HUM)
	{
		if(Npc_CheckInfo(self,1) == FALSE)
		{
			if(Npc_CheckInfo(self,0) == FALSE)
			{
				return;
			};
		};
	};
	if(self.guild < GIL_SEPERATOR_HUM)
	{
		if(B_AssessEnemy())
		{
			return;
		};
		if((B_GetPlayerCrime(self) == CRIME_MURDER) && C_WantToAttackMurder(self,other))
		{
			B_Attack(self,other,AR_HumanMurderedHuman,0);
			return;
		};
		if((C_PlayerIsFakeBandit(self,other) == TRUE) && (self.guild != GIL_BDT))
		{
			B_Attack(self,other,AR_GuildEnemy,0);
			return;
		};
		if(C_RefuseTalk(self,other))
		{
			if(C_PlayerHasFakeGuild(self,other))
			{
				Npc_ClearAIQueue(self);
				AI_StartState(self,ZS_CommentFakeGuild,1,"");
				return;
			}
			else
			{
				B_Say(self,other,"$NOTNOW");
				return;
			};
		};
	};
	if(self.aivar[AIV_NpcStartedTalk] == FALSE)
	{
		if(C_BodyStateContains(self,BS_WALK) || C_BodyStateContains(self,BS_RUN))
		{
			B_Say(other,self,"$SC_HEYWAITASECOND");
		}
		else if(!Npc_CanSeeNpc(self,other))
		{
			rnd = Hlp_Random(100);
			if(rnd <= 25)
			{
				B_Say(other,self,"$SC_HEYTURNAROUND");
			}
			else if(rnd <= 50)
			{
				B_Say(other,self,"$SC_HEYTURNAROUND02");
			}
			else if(rnd <= 75)
			{
				B_Say(other,self,"$SC_HEYTURNAROUND03");
			}
			else if(rnd <= 99)
			{
				B_Say(other,self,"$SC_HEYTURNAROUND04");
			};
		};
	};
	Npc_ClearAIQueue(self);
	B_ClearPerceptions(self);
	if(C_BodyStateContains(self,BS_SIT))
	{
		if(self.aivar[AIV_NpcStartedTalk] == TRUE)
		{
			AI_StandupQuick(other);
		}
		else
		{
			AI_Standup(other);
		};
		if(Npc_CanSeeNpc(self,other))
		{
			AI_StartState(self,ZS_Talk,0,"");
		}
		else
		{
			if(Npc_IsInState(self,ZS_ObservePlayer))
			{
				AI_Standup(self);
			};
			AI_StartState(self,ZS_Talk,1,"");
		};
		return;
	}
	else
	{
		if(self.aivar[AIV_NpcStartedTalk] == TRUE)
		{
			AI_StandupQuick(self);
			AI_StandupQuick(other);
		}
		else
		{
			AI_Standup(self);
			AI_Standup(other);
		};
		AI_StartState(self,ZS_Talk,0,"");
		return;
	};
};

