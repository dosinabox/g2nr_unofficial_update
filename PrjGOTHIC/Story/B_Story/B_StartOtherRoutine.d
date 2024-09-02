
func void B_StartOtherRoutine(var C_Npc slf,var string newRoutine)
{
	if(Hlp_GetInstanceID(self) != Hlp_GetInstanceID(slf))
	{
		if(Hlp_IsValidNpc(slf))
		{
			if(!Npc_IsDead(slf))
			{
				AI_Standup(slf);
				Npc_ExchangeRoutine(slf,newRoutine);
				AI_ContinueRoutine(slf);
			};
		};
	}
	else
	{
		AI_Standup(slf);
		Npc_ExchangeRoutine(slf,newRoutine);
	};
};

