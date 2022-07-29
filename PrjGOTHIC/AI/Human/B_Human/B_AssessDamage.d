
func void B_AssessDamage()
{
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Greg_NW))
	{
		if((B_Greg_ComesToDexter_OneTime == TRUE) && Npc_IsPlayer(other) && !Npc_KnowsInfo(other,DIA_Addon_Greg_NW_CaughtDexter) && !Npc_KnowsInfo(other,DIA_Addon_Greg_NW_CaughtDexter2) && !Npc_KnowsInfo(other,DIA_Addon_Greg_NW_WodennNu))
		{
			return;
		};
	};
	B_SpecialRangedWeaponDamage(other,self,TRUE);
	if(Npc_IsInState(self,ZS_ReactToDamage))
	{
		B_Attack(self,other,AR_ReactToDamage,0);
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Quarhodron)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Rhademes)))
	{
		B_GhostSpecialDamage(other,self);
		return;
	};
	if(Npc_IsPlayer(other) && (self.guild == GIL_FRIENDLY_ORC))
	{
		B_SetAttitude(self,ATT_HOSTILE);
	};
	B_SpecialMeleeWeaponDamage(other,self);
	if(self.aivar[AIV_ArenaFight] == AF_AFTER)
	{
		self.aivar[AIV_ArenaFight] = AF_AFTER_PLUS_DAMAGE;
	};
	if(self.aivar[AIV_EnemyOverride] == TRUE)
	{
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Raven))
		{
			self.aivar[AIV_EnemyOverride] = FALSE;
			Npc_ExchangeRoutine(self,"WaitForPlayer");
			Raven_Awaken = TRUE;
		};
	};
	if(Npc_IsInState(self,ZS_Attack))
	{
		if(Npc_IsPlayer(other))
		{
			if(self.npcType == NPCTYPE_FRIEND)
			{
				return;
			};
			if(self.aivar[AIV_PARTYMEMBER] == TRUE)
			{
				return;
			};
		};
		if(Hlp_GetInstanceID(other) != self.aivar[AIV_LASTTARGET])
		{
			if((self.aivar[AIV_HitByOtherNpc] == Hlp_GetInstanceID(other)) || !Npc_IsPlayer(other))
			{
				Npc_SetTarget(self,other);
			}
			else
			{
				self.aivar[AIV_HitByOtherNpc] = Hlp_GetInstanceID(other);
			};
		};
		return;
	};
	if(B_AssessEnemy())
	{
		return;
	};
	if(!Npc_IsPlayer(other) && (other.aivar[AIV_ATTACKREASON] == AR_NONE))
	{
		B_Attack(self,other,AR_NONE,0);
		return;
	};
	if(Npc_IsInFightMode(other,FMODE_MELEE) || Npc_IsInFightMode(other,FMODE_FIST) || Npc_IsInFightMode(other,FMODE_NONE))
	{
		if((Npc_GetAttitude(self,other) == ATT_FRIENDLY) || ((self.npcType == NPCTYPE_FRIEND) && Npc_IsPlayer(other)))
		{
			if(!Npc_IsInState(self,ZS_ReactToDamage))
			{
				Npc_ClearAIQueue(self);
				B_ClearPerceptions(self);
				AI_StartState(self,ZS_ReactToDamage,0,"");
				return;
			};
		};
	};
	B_Attack(self,other,AR_ReactToDamage,0);
};

func void B_AssessOthersDamage()
{
	B_SpecialRangedWeaponDamage(other,self,FALSE);
};

