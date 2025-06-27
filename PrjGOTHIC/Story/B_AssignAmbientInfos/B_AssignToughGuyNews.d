
instance DIA_ToughGuy_NEWS(C_Info)
{
	nr = 1;
	condition = DIA_ToughGuy_NEWS_Condition;
	information = DIA_ToughGuy_NEWS_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_ToughGuy_NEWS_Condition()
{
	if(C_IsNpc(self,BDT_1020_Bandit_L))
	{
		return FALSE;
	};
	if(C_IsNpc(self,DJG_700_Sylvio))
	{
		if(Npc_KnowsInfo(other,DIA_SylvioDJG_WHATNEXT))
		{
			return FALSE;
		};
	};
	if(C_IsNpc(self,DJG_701_Bullco))
	{
		if(!Npc_KnowsInfo(other,DIA_Bullco_SYLVIODEAD) && Npc_IsDead(DJG_Sylvio))
		{
			return FALSE;
		};
	};
	if(C_IsNpc(self,SLD_810_Dar))
	{
		if(!Npc_KnowsInfo(other,DIA_Dar_FIGHTAGAINSTPALOVER) && (Dar_FightAgainstPaladin == TRUE))
		{
			return FALSE;
		};
		if(!Npc_KnowsInfo(other,DIA_Dar_Kameradenschwein) && (Dar_LostAgainstCipher == TRUE))
		{
			return FALSE;
		};
	};
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE) && (self.aivar[AIV_LastFightComment] == FALSE))
	{
		if(!C_IsNpc(self,SLD_814_Sentenza))
		{
			return TRUE;
		}
		else
		{
			if(Npc_KnowsInfo(other,DIA_Sentenza_Hello))
			{
				return TRUE;
			};
		};
	};
};

func void DIA_ToughGuy_NEWS_Info()
{
	if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		B_Say(self,other,"$TOUGHGUY_ATTACKLOST");
	}
	else if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	{
		B_Say(self,other,"$TOUGHGUY_ATTACKWON");
	}
	else
	{
		B_Say(self,other,"$TOUGHGUY_PLAYERATTACK");
	};
	self.aivar[AIV_LastFightComment] = TRUE;
	if(C_IsNpc(self,BDT_1082_Addon_Skinner))
	{
		AI_Output(self,other,"DIA_Addon_Skinner_ToughguyNews_08_00");	//...но я не хочу говорить с тобой...
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_NONE,1);
	};
};

func void B_AssignToughGuyNEWS(var C_Npc slf)
{
	DIA_ToughGuy_NEWS.npc = Hlp_GetInstanceID(slf);
};

