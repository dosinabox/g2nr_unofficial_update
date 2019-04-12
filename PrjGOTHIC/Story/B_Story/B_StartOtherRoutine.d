
func void B_StartOtherRoutine(var C_Npc slf,var string newRoutine)
{
	AI_Standup(slf);
	if(Hlp_GetInstanceID(self) != Hlp_GetInstanceID(slf))
	{
		if(Hlp_IsValidNpc(slf) && !Npc_IsDead(slf))
		{
			Npc_ExchangeRoutine(slf,newRoutine);
			AI_ContinueRoutine(slf);
		};
	}
	else
	{
		Npc_ExchangeRoutine(slf,newRoutine);
	};
};

