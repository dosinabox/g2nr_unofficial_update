
func void B_AssessTalk()
{
	var int rnd;
	if(self.guild > GIL_SEPERATOR_HUM)
	{
		if(!Npc_CheckInfo(self,1))
		{
			if(!Npc_CheckInfo(self,0))
			{
				return;
			};
		};
	}
	else if(self.guild < GIL_SEPERATOR_HUM)
	{
		if(C_NpcIsLevelinspektor(other) || C_NpcIsRockefeller(other))
		{
			PrintScreen(ConcatStrings("Голос: ",IntToString(self.voice)),-1,70,FONT_Screen,2);
			PrintScreen("Нет героя!",-1,-1,FONT_Screen,2);
			PrintScreen(IntToString(self.aivar[AIV_FollowDist]),-1,65,FONT_Screen,2);
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
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Baltram))
		{
			B_BaltramRangerCheck(other);
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Rengaru))
		{
			if(Npc_KnowsInfo(other,DIA_Rengaru_HALLODIEB) && !Npc_KnowsInfo(other,DIA_Rengaru_GOTYOU))
			{
				if(Npc_GetDistToWP(self,"NW_CITY_HABOUR_KASERN_05_01") > 1000)
				{
					return;
				};
			};
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Meldor))
		{
			if(C_LawArmorEquipped(other))
			{
				Meldor_Busted = TRUE;
			};
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Kardif))
		{
			if(C_LawArmorEquipped(other) && !Npc_KnowsInfo(other,DIA_Kardif_Zeichen))
			{
				Kardif_Busted = TRUE;
			};
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Greg_NW))
		{
			PlayerTalkedToGregNW = TRUE;
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skip_NW))
		{
			PlayerTalkedToSkipNW = TRUE;
		}
		else if(MIS_Andre_REDLIGHT == LOG_Running)
		{
			if(C_LawArmorEquipped(other))
			{
				if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Borka))
				{
					Undercover_Failed_Borka = TRUE;
					B_CheckRedLightUndercover();
				}
				else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Nadja))
				{
					Undercover_Failed_Nadja = TRUE;
					B_CheckRedLightUndercover();
				};
			};
		};
		if((self.guild == GIL_VLK) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Canthar)))
		{
			if(CurrentLevel == NEWWORLD_ZEN)
			{
				B_PlayerEnteredCity();
			};
		};
		if(B_AssessEnemy())
		{
			return;
		};
		if((B_GetPlayerCrime(self) == CRIME_MURDER) && C_WantToAttackMurder(self,other))
		{
			B_Attack(self,other,AR_HumanMurderedHuman,0);
			return;
		};
		if(C_IAmThiefFromSewer(self))
		{
			DG_gefunden = TRUE;
			if(SewerThieves_KilledByPlayer == TRUE)
			{
				B_Attack(self,other,AR_KILL,0);
				return;
			};
		};
		if(C_PlayerIsFakeBandit(self,other) && (self.guild != GIL_BDT))
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
		if(self.guild == GIL_NOV)
		{
			if(Parlan_DontTalkToNovice == LOG_Running)
			{
				if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Feger1))
				{
					if(Npc_GetDistToWP(self,"NW_MONASTERY_CELLAR_08") > 900)
					{
						Parlan_DontTalkToNovice = LOG_FAILED;
					};
				}
				else if((Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Garwig)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Pedro)))
				{
					Parlan_DontTalkToNovice = LOG_FAILED;
				};
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
		B_TurnToNpc(other,self);
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

