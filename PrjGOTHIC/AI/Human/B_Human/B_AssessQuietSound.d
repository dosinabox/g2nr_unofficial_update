
func void B_AssessQuietSound()
{
	if(!Hlp_IsValidNpc(other))
	{
		return;
	};
	if(Npc_GetHeightToNpc(self,other) > PERC_DIST_HEIGHT)
	{
		return;
	};
	if((Wld_GetPlayerPortalGuild() >= GIL_NONE) && (Npc_GetHeightToNpc(self,other) > PERC_DIST_INDOOR_HEIGHT))
	{
		return;
	};
	if(B_AssessEnterRoom())
	{
		return;
	};
	if(C_NpcIsGateGuard(self))
	{
		return;
	};
	if((Npc_GetAttitude(self,other) != ATT_HOSTILE) && (Npc_CheckInfo(self,1) == FALSE))
	{
		return;
	};
	if((Npc_GetAttitude(self,other) == ATT_HOSTILE) && ((self.aivar[AIV_EnemyOverride] == TRUE) || (C_PlayerIsFakeBandit(self,other) && (self.guild == GIL_BDT))))
	{
		return;
	};
	if(Npc_CanSeeSource(self))
	{
		return;
	};
	Npc_ClearAIQueue(self);
	B_ClearPerceptions(self);
	AI_StartState(self,ZS_ObservePlayer,1,"");
};

