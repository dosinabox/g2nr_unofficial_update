
func void B_MM_AssessOthersDamage()
{
	var C_Item readyweap;
	readyweap = Npc_GetReadiedWeapon(other);
	if((Npc_GetDistToNpc(self,victim) > PERC_DIST_INTERMEDIAT) && (Npc_GetDistToNpc(self,other) > PERC_DIST_INTERMEDIAT))
	{
		return;
	};
	if(!Npc_CanSeeNpcFreeLOS(self,victim))
	{
		return;
	};
	//**************************************
	if(Hlp_GetInstanceID(other) == Hlp_GetInstanceID(self))
	{
		return;
	};
	if((Npc_GetDistToNpc(self,victim) <= 600) && (readyweap.munition == ItRw_Addon_FireArrow))
	{
		Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
		if(self.flags == 0)
		{
			if(self.protection[PROT_FIRE] < 40)
			{
				if((self.attribute[ATR_HITPOINTS] + self.protection[PROT_FIRE] - 40) >= 0)
				{
					self.attribute[ATR_HITPOINTS] -= (40 - self.protection[PROT_FIRE]);
				}
				else
				{
					self.attribute[ATR_HITPOINTS] = 0;
				};
			};
		};
		if(Npc_IsDead(self))
		{
			B_GiveDeathXP(other,self);
		};
	};
	//**************************************
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
	if((self.guild == GIL_WOLF) && (self.aivar[AIV_MM_REAL_ID] != ID_Keiler))
	{
		if((victim.guild == GIL_WOLF) && (victim.aivar[AIV_MM_REAL_ID] != ID_Keiler) && (other.guild == GIL_WOLF) && Npc_IsPlayer(other) && Npc_IsDead(victim))
		{
			Npc_ClearAIQueue(self);
			B_ClearPerceptions(self);
			self.start_aistate = ZS_MM_Rtn_Summoned;
			AI_StartState(self,ZS_MM_Rtn_Summoned,0,"");
			return;
		};
	};
	if((self.guild == GIL_Stoneguardian) && (victim.guild == GIL_Stoneguardian) && (self.aivar[AIV_EnemyOverride] == TRUE))
	{
		b_awake_stoneguardian(self);
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

