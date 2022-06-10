
func void B_MM_AssessDamage()
{
	var C_Item OthWeap;
	self.aivar[AIV_MM_PRIORITY] = PRIO_ATTACK;
	B_BeliarsWeaponSpecialDamage(other,self);
	B_ArrowBonusDamage(other,self);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Magic_Golem))
	{
		if(Npc_HasReadiedWeapon(other))
		{
			OthWeap = Npc_GetReadiedWeapon(other);
			if(Hlp_IsItem(OthWeap,Holy_Hammer_MIS))
			{
				Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
				if(!C_BodyStateContains(self,BS_PARADE))
				{
					Wld_PlayEffect("spellFX_LIGHTSTAR_WHITE",self,self,0,0,0,FALSE);
					Snd_Play("MFX_Transform_Cast");
				};
				B_GiveDeathXP(other,self);
				return;
			};
		};
	}
	else if(self.guild == GIL_WISP)
	{
		Wld_PlayEffect("spellFX_ICEBOLT_COLLIDE",self,self,0,0,0,FALSE);
		Snd_Play("WSP_WHOSH4");
	}
	else if(self.guild == GIL_Stoneguardian)
	{
		if(self.aivar[AIV_EnemyOverride] == TRUE)
		{
			b_awake_stoneguardian(self);
		};
	};
	if(C_PredatorFoundPrey(other,self))
	{
		Npc_ClearAIQueue(self);
		Npc_SetTarget(self,other);
		B_ClearPerceptions(self);
		AI_StartState(self,ZS_MM_Flee,0,"");
		return;
	};
	if(Npc_IsInState(self,ZS_MM_Attack))
	{
		if(Npc_IsPlayer(other) && (self.aivar[AIV_PARTYMEMBER] == TRUE))
		{
			return;
		};
		if((self.aivar[AIV_MM_REAL_ID] == ID_SKELETON) && (other.aivar[AIV_MM_REAL_ID] == ID_SKELETON_MAGE))
		{
			return;
		};
		if(Hlp_GetInstanceID(other) != self.aivar[AIV_LASTTARGET])
		{
			if(self.aivar[AIV_HitByOtherNpc] == Hlp_GetInstanceID(other))
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
	Npc_ClearAIQueue(self);
	Npc_SetTarget(self,other);
	B_ClearPerceptions(self);
	AI_StartState(self,ZS_MM_Attack,0,"");
};

