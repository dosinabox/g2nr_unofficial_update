
func int C_Rod_Defeated()
{
	if(!Npc_IsDead(Rod))
	{
		if(Rod.aivar[AIV_DefeatedByPlayer] == TRUE)
		{
			return TRUE;
		};
	}
	else if(Rod_KilledByPlayer == TRUE)
	{
		return TRUE;
	};
	return FALSE;
};

func int C_Sentenza_Defeated()
{
	if(!Npc_IsDead(Sentenza))
	{
		if(Sentenza.aivar[AIV_DefeatedByPlayer] == TRUE)
		{
			return TRUE;
		};
	}
	else if(Sentenza_KilledByPlayer == TRUE)
	{
		return TRUE;
	};
	return FALSE;
};

func int C_Fester_Defeated()
{
	if(!Npc_IsDead(Fester))
	{
		if(Fester.aivar[AIV_DefeatedByPlayer] == TRUE)
		{
			return TRUE;
		};
	}
	else if(Fester_KilledByPlayer == TRUE)
	{
		return TRUE;
	};
	return FALSE;
};

func int C_Raoul_Defeated()
{
	if(!Npc_IsDead(Raoul))
	{
		if(Raoul.aivar[AIV_DefeatedByPlayer] == TRUE)
		{
			return TRUE;
		};
	}
	else if(Raoul_KilledByPlayer == TRUE)
	{
		return TRUE;
	};
	return FALSE;
};

func int C_Bullco_Defeated()
{
	if(!Npc_IsDead(Bullco))
	{
		if(Bullco.aivar[AIV_DefeatedByPlayer] == TRUE)
		{
			return TRUE;
		};
	}
	else if(Bullco_KilledByPlayer == TRUE)
	{
		return TRUE;
	};
	return FALSE;
};

func int C_SylvioMenDefeated()
{
	var int victories;
	victories = 0;
	if(C_Rod_Defeated())
	{
		victories += 1;
	};
	if(C_Sentenza_Defeated())
	{
		victories += 1;
	};
	if(C_Fester_Defeated())
	{
		victories += 1;
	};
	if(C_Raoul_Defeated())
	{
		victories += 1;
	};
	if(C_Bullco_Defeated())
	{
		victories += 1;
	};
	return victories;
};

