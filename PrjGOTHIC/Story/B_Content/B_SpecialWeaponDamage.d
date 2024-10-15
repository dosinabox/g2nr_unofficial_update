
var int RavenBlitz;

func void B_SpecialMeleeWeaponDamage(var C_Npc attacker,var C_Npc target)
{
	var int RavenRandy;
	var int DamageRandy;
	var C_Item ReadyWeap;
	if(!Hlp_IsValidNpc(attacker))
	{
		return;
	};
	if(Hlp_GetInstanceID(target) == Hlp_GetInstanceID(Raven))
	{
		Wld_PlayEffect("spellFX_BELIARSRAGE_COLLIDE",target,target,0,0,0,FALSE);
		if(RavenBlitz <= 0)
		{
			Wld_PlayEffect("spellFX_BELIARSRAGE",attacker,attacker,0,0,0,FALSE);
			B_MagicHurtNpc(target,attacker,BeliarSpecialDamage / 2);
			RavenBlitz += 1;
		}
		else if(RavenBlitz >= 3)
		{
			RavenRandy = Hlp_Random(100);
			if(RavenRandy <= 50)
			{
				RavenBlitz = 0;
			};
		}
		else
		{
			RavenBlitz += 1;
		};
	}
	else if(Npc_IsPlayer(attacker))
	{
		if(!Npc_HasReadiedMeleeWeapon(attacker))
		{
			return;
		};
		ReadyWeap = Npc_GetReadiedWeapon(attacker);
		if(C_IsItemMeleeBeliarsWeapon(ReadyWeap))
		{
			DamageRandy = Hlp_Random(100);
			if(DamageRandy <= BeliarDamageChance_20)
			{
				Wld_PlayEffect("spellFX_BELIARSRAGE_COLLIDE",attacker,attacker,0,0,0,FALSE);
				if(DamageRandy <= BeliarDamageChance)
				{
					if(target.aivar[AIV_MM_REAL_ID] == ID_DRAGON_UNDEAD)
					{
						Wld_PlayEffect("spellFX_BELIARSRAGE",attacker,attacker,0,0,0,FALSE);
						B_MagicHurtNpc(target,attacker,BeliarSpecialDamage);
					}
					else if(target.flags != NPC_FLAG_IMMORTAL)
					{
						Wld_PlayEffect("spellFX_BELIARSRAGE",target,target,0,0,0,FALSE);
						B_MagicHurtNpc(attacker,target,BeliarSpecialDamage);
					};
				};
			};
		}
		else if(Hlp_IsItem(ReadyWeap,Holy_Hammer_MIS))
		{
			if(Hlp_GetInstanceID(target) == Hlp_GetInstanceID(Magic_Golem))
			{
				Npc_ChangeAttribute(target,ATR_HITPOINTS,-target.attribute[ATR_HITPOINTS_MAX]);
				if(!C_BodyStateContains(target,BS_PARADE))
				{
					Wld_PlayEffect("spellFX_LIGHTSTAR_WHITE",target,target,0,0,0,FALSE);
					Snd_Play("MFX_Transform_Cast");
				};
				B_GiveDeathXP(attacker,target);
			};
		}
		else if(Hlp_IsItem(ReadyWeap,ItMw_BeliarWeapon_Fire))
		{
			Wld_PlayEffect("VOB_MAGICBURN",target,target,0,0,0,FALSE);
		};
	};
};

func void B_ApplySpecialRangedWeaponDamage(var C_Npc target)
{
	if((target.flags != NPC_FLAG_IMMORTAL) && (target.protection[PROT_POINT] > 0))
	{
		Npc_ChangeAttribute(target,ATR_HITPOINTS,-target.protection[PROT_POINT]);
	};
};

func void B_ApplyFireBowDamage(var C_Npc attacker,var C_Npc target,var int damage)
{
	Wld_PlayEffect("VOB_MAGICBURN",target,target,0,0,0,FALSE);
	B_FireHurtNpc(attacker,target,damage);
	if(Npc_IsDead(target))
	{
		if(target.guild < GIL_SEPERATOR_HUM)
		{
			AI_PlayAni(target,"T_DEAD");
		};
	};
};

func void B_SpecialRangedWeaponDamage(var C_Npc attacker,var C_Npc target,var int directHit)
{
	var C_Item ReadyWeap;
	if(!Hlp_IsValidNpc(attacker))
	{
		return;
	};
	if(!Npc_HasReadiedRangedWeapon(attacker))
	{
		return;
	};
	ReadyWeap = Npc_GetReadiedWeapon(attacker);
	if(Hlp_IsItem(ReadyWeap,ItRw_Addon_FireBow))
	{
		if(directHit == TRUE)
		{
			Wld_PlayEffect("spellFX_Firestorm_SPREAD",target,target,0,0,0,FALSE);
			B_ApplySpecialRangedWeaponDamage(target);
			B_ApplyFireBowDamage(attacker,target,SpecialDamage_FireBow);
			if(Npc_GetDistToNpc(target,attacker) <= SpecialDamage_FireBow_Range)
			{
				B_ApplyFireBowDamage(attacker,attacker,SpecialDamage_FireBow);
			};
		}
		else if(Npc_GetDistToNpc(target,victim) <= SpecialDamage_FireBow_Range)
		{
			B_ApplyFireBowDamage(attacker,target,SpecialDamage_FireBow);
		};
	}
	else if(Hlp_IsItem(ReadyWeap,ItRw_Addon_MagicBow))
	{
		if(directHit == TRUE)
		{
			Wld_PlayEffect("spellFX_ICEBOLT_COLLIDE",target,target,0,0,0,FALSE);
			B_ApplySpecialRangedWeaponDamage(target);
		};
	}
	else if(Hlp_IsItem(ReadyWeap,ItRw_Addon_MagicCrossbow))
	{
		if(directHit == TRUE)
		{
			Wld_PlayEffect("spellFX_ICEBOLT_COLLIDE",target,target,0,0,0,FALSE);
			B_ApplySpecialRangedWeaponDamage(target);
		};
	};
	if(Npc_IsDead(target))
	{
		B_GiveDeathXP(attacker,target);
	};
};

