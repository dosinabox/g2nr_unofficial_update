
func void B_MM_AssessOthersDamage()
{
	if((self.guild == GIL_STONEGUARDIAN) && (victim.guild == GIL_STONEGUARDIAN))
	{
		B_Awake_StoneGuardian(self);
	};
	if(!Npc_CanSeeNpcFreeLOS(self,victim))
	{
		return;
	};
	if(!Hlp_IsValidNpc(other))
	{
		return;
	};
	if(Npc_GetDistToNpc(self,other) > PERC_DIST_INTERMEDIAT)
	{
		if(Npc_GetDistToNpc(self,victim) > PERC_DIST_INTERMEDIAT)
		{
			return;
		};
	};
	if(Hlp_GetInstanceID(other) == Hlp_GetInstanceID(self))
	{
		return;
	};
	B_SpecialRangedWeaponDamage(other,self,FALSE);
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if(Npc_IsPlayer(victim))
		{
			Npc_ClearAIQueue(self);
			B_ClearPerceptions(self);
			Npc_SetTarget(self,other);
			AI_StartState(self,ZS_MM_Attack,0,"");
			return;
		};
		if(Npc_IsPlayer(other) && !Npc_IsDead(victim))
		{
			Npc_ClearAIQueue(self);
			B_ClearPerceptions(self);
			Npc_SetTarget(self,victim);
			AI_StartState(self,ZS_MM_Attack,0,"");
			return;
		};
	};
	if((self.guild == GIL_WOLF) && (self.aivar[AIV_MM_REAL_ID] != ID_KEILER))
	{
		if((victim.guild == GIL_WOLF) && (victim.aivar[AIV_MM_REAL_ID] != ID_KEILER) && (other.guild == GIL_WOLF) && Npc_IsPlayer(other) && Npc_IsDead(victim))
		{
			Npc_ClearAIQueue(self);
			B_ClearPerceptions(self);
			self.start_aistate = ZS_MM_Rtn_Summoned;
			AI_StartState(self,ZS_MM_Rtn_Summoned,0,"");
			return;
		};
	};
	if((Wld_GetGuildAttitude(self.guild,victim.guild) == ATT_FRIENDLY) && (Wld_GetGuildAttitude(self.guild,other.guild) != ATT_FRIENDLY))
	{
		Npc_ClearAIQueue(self);
		B_ClearPerceptions(self);
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_MM_Attack,0,"");
		return;
	};
	if((Wld_GetGuildAttitude(self.guild,other.guild) == ATT_FRIENDLY) && (Wld_GetGuildAttitude(self.guild,victim.guild) != ATT_FRIENDLY) && !Npc_IsDead(victim))
	{
		Npc_ClearAIQueue(self);
		B_ClearPerceptions(self);
		Npc_SetTarget(self,victim);
		AI_StartState(self,ZS_MM_Attack,0,"");
		return;
	};
};

