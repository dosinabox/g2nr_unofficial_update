
func void B_MM_AssessWarn()
{
	if(self.guild > GIL_SEPERATOR_ORC)
	{
		if(Npc_IsInState(self,ZS_MM_Attack))
		{
			return;
		};
		if(Wld_GetGuildAttitude(self.guild,other.guild) == ATT_FRIENDLY)
		{
			Npc_ClearAIQueue(self);
			Npc_SetTarget(self,victim);
			B_ClearPerceptions(self);
			AI_StartState(self,ZS_MM_Attack,0,"");
			return;
		};
		return;
	};
	if(other.guild < GIL_SEPERATOR_HUM)
	{
		return;
	};
	if(Npc_GetHeightToNpc(self,other) > PERC_DIST_HEIGHT)
	{
		return;
	};
	if(Npc_IsInState(self,ZS_MM_Attack))
	{
		if(C_PredatorFoundPrey(self,other) && (self.aivar[AIV_MM_PRIORITY] == PRIO_EAT))
		{
			Npc_ClearAIQueue(self);
			Npc_SetTarget(self,other);
		}
		else
		{
			other = Hlp_GetNpc(self.aivar[AIV_LASTTARGET]);
		};
		return;
	};
	if((self.guild == other.guild) && (self.aivar[AIV_MM_Packhunter] == TRUE))
	{
		if((self.guild == GIL_WOLF) && (victim.guild == GIL_WOLF) && Npc_IsPlayer(victim))
		{
			return;
		};
		if(Npc_IsInState(other,ZS_MM_Attack))
		{
			Npc_ClearAIQueue(self);
			Npc_SetTarget(self,victim);
			B_ClearPerceptions(self);
			AI_StartState(self,ZS_MM_Attack,0,"");
			return;
		};
		if(Npc_IsInState(other,ZS_MM_ThreatenEnemy))
		{
			AI_SetWalkMode(self,NPC_RUN);
			AI_GotoNpc(self,victim);
			return;
		};
	};
};

