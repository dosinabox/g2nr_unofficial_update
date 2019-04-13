
func void B_AssessDamage()
{
	var C_Npc Quarho;
	var C_Npc Rhadem;
	var C_Npc rav;
	Quarho = Hlp_GetNpc(NONE_ADDON_111_Quarhodron);
	Rhadem = Hlp_GetNpc(NONE_ADDON_112_Rhademes);
	B_ArrowBonusDamage(other,self);
	if(Npc_IsInState(self,ZS_ReactToDamage))
	{
		B_Attack(self,other,AR_ReactToDamage,0);
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Quarho)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Rhadem)))
	{
		B_GhostSpecialDamage(other,self);
		return;
	};
	if(Npc_IsPlayer(other) && (self.guild == GIL_FRIENDLY_ORC))
	{
		B_SetAttitude(self,ATT_HOSTILE);
	};
	B_BeliarsWeaponSpecialDamage(other,self);
	if(self.aivar[AIV_ArenaFight] == AF_AFTER)
	{
		self.aivar[AIV_ArenaFight] = AF_AFTER_PLUS_DAMAGE;
	};
	if(self.aivar[AIV_EnemyOverride] == TRUE)
	{
		rav = Hlp_GetNpc(BDT_1090_Addon_Raven);
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(rav))
		{
			self.aivar[AIV_EnemyOverride] = FALSE;
		};
	};
	if(Npc_IsInState(self,ZS_Attack))
	{
		if(Npc_IsPlayer(other) && (self.npcType == NPCTYPE_FRIEND))
		{
			return;
		};
		if(Npc_IsPlayer(other) && (self.aivar[AIV_PARTYMEMBER] == TRUE))
		{
			return;
		};
		if(Hlp_GetInstanceID(other) != self.aivar[AIV_LASTTARGET])
		{
			if((self.aivar[AIV_HitByOtherNpc] == Hlp_GetInstanceID(other)) || (Hlp_GetInstanceID(other) != Hlp_GetInstanceID(hero)))
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
	var C_Item readyweap;
	readyweap = Npc_GetReadiedWeapon(other);
	if(readyweap.munition == ItRw_Addon_FireArrow)
	{
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
			if(self.aivar[AIV_PARTYMEMBER] == TRUE)
			{
				if(Npc_IsPlayer(victim))
				{
					Npc_ClearAIQueue(self);
					B_ClearPerceptions(self);
					Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_AssessDamage);
					Npc_PercEnable(self,PERC_ASSESSOTHERSDAMAGE,B_AssessOthersDamage);
					Npc_SetTarget(self,other);
					AI_StartState(self,ZS_Attack,0,"");
					return;
				};
				if(Npc_IsPlayer(other) && !Npc_IsDead(victim))
				{
					Npc_ClearAIQueue(self);
					B_ClearPerceptions(self);
					Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_AssessDamage);
					Npc_PercEnable(self,PERC_ASSESSOTHERSDAMAGE,B_AssessOthersDamage);
					Npc_SetTarget(self,victim);
					AI_StartState(self,ZS_Attack,0,"");
					return;
				};
			};
			if(Wld_GetGuildAttitude(self.guild,other.guild) != ATT_FRIENDLY)
			{
				Npc_ClearAIQueue(self);
				B_ClearPerceptions(self);
				Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_AssessDamage);
				Npc_PercEnable(self,PERC_ASSESSOTHERSDAMAGE,B_AssessOthersDamage);
				B_Attack(self,other,AR_ReactToDamage,0);
				return;
			};
		};
		if(Npc_IsInState(self,ZS_Attack))
		{
			return;
		};
	};
	return;
};

