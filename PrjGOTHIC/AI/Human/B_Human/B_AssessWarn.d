
func void B_AssessWarn()
{
	if(Hlp_GetInstanceID(victim) == Hlp_GetInstanceID(self))
	{
		return;
	};
	if(Npc_IsInState(self,ZS_ReactToWeapon) || Npc_IsInState(self,ZS_ObservePlayer))
	{
		return;
	};
	if(other.guild > GIL_SEPERATOR_HUM)
	{
		return;
	};
	if(C_NpcIsGateGuard(self))
	{
		return;
	};
	Npc_ClearAIQueue(self);
	B_ClearPerceptions(self);
	AI_StartState(self,ZS_ObservePlayer,0,"");
};

