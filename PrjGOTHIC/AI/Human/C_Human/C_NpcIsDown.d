
func int C_NpcIsDown(var C_Npc slf)
{
	if(Npc_IsInState(slf,ZS_Unconscious) || Npc_IsInState(slf,ZS_MagicSleep) || Npc_IsDead(slf))
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

