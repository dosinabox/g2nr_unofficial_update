
instance DIA_Ambient_NEWS(C_Info)
{
	nr = 1;
	condition = DIA_Ambient_NEWS_Condition;
	information = DIA_Ambient_NEWS_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Ambient_NEWS_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		if(B_GetPlayerCrime(self) != CRIME_NONE)
		{
			if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Garwig))
			{
				if(!Npc_HasItems(other,Holy_Hammer_MIS))
				{
					return TRUE;
				};
			}
			else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Randolph))
			{
				if(NpcObsessedByDMT_Randolph == FALSE)
				{
					return TRUE;
				};
			}
			else
			{
				return TRUE;
			};
		}
		else if(self.aivar[AIV_CommentedPlayerCrime] == TRUE)
		{
			return TRUE;
		};
	};
};

func void DIA_Ambient_NEWS_Info()
{
	if(B_GetPlayerCrime(self) != CRIME_NONE)
	{
		if(B_GetPlayerCrime(self) == CRIME_SHEEPKILLER)
		{
			B_Say(self,other,"$SHEEPKILLER_CRIME");
		};
		if(B_GetPlayerCrime(self) == CRIME_ATTACK)
		{
			B_Say(self,other,"$ATTACK_CRIME");
		};
		if(B_GetPlayerCrime(self) == CRIME_THEFT)
		{
			B_Say(self,other,"$THEFT_CRIME");
		};
		if(C_NpcBelongsToCity(self))
		{
			if((other.guild == GIL_PAL) && (Hagen_Schulden <= 0))
			{
				B_Say(self,other,"$PAL_CITY_CRIME");
			}
			else if((other.guild == GIL_MIL) && (Andre_Schulden <= 0))
			{
				B_Say(self,other,"$MIL_CITY_CRIME");
			}
			else if(Andre_Schulden <= 0)
			{
				B_Say(self,other,"$CITY_CRIME");
			};
		};
		if(C_NpcBelongsToMonastery(self) && (Parlan_Schulden <= 0) && C_CommentMonasteryCrimes(self))
		{
			B_Say(self,other,"$MONA_CRIME");
			self.aivar[AIV_CommentedPlayerCrime] = TRUE;
		};
		if(C_NpcBelongsToFarm(self) && (Lee_Schulden <= 0))
		{
			B_Say(self,other,"$FARM_CRIME");
			self.aivar[AIV_CommentedPlayerCrime] = TRUE;
		};
		if(C_NpcBelongsToOldCamp(self) && (Garond_Schulden <= 0))
		{
			B_Say(self,other,"$OC_CRIME");
			self.aivar[AIV_CommentedPlayerCrime] = TRUE;
		};
		AI_StopProcessInfos(self);
	}
	else if(self.aivar[AIV_CommentedPlayerCrime] == TRUE)
	{
		if(C_NpcBelongsToMonastery(self))
		{
			B_Say(self,other,"$ABS_MONASTERY");
			B_Say(self,other,"$ABS_GOOD");
		}
		else if(C_NpcBelongsToFarm(self))
		{
			B_Say(self,other,"$ABS_FARM");
			B_Say(self,other,"$ABS_GOOD");
		}
		else if(C_NpcBelongsToOldCamp(self))
		{
			B_Say(self,other,"$ABS_COMMANDER");
			B_Say(self,other,"$ABS_GOOD");
		};
		self.aivar[AIV_CommentedPlayerCrime] = FALSE;	
	};
};

func void B_AssignAmbientNEWS(var C_Npc slf)
{
	DIA_Ambient_NEWS.npc = Hlp_GetInstanceID(slf);
};

