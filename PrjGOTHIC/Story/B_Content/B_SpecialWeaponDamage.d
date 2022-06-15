
var int RavenBlitz;

func void B_SpecialMeleeWeaponDamage(var C_Npc oth,var C_Npc slf)
{
	var int RavenRandy;
	var int DamageRandy;
	var C_Item otherweap;
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Raven))
	{
		Wld_PlayEffect("spellFX_BELIARSRAGE_COLLIDE",slf,slf,0,0,0,FALSE);
		if(RavenBlitz <= 0)
		{
			Wld_PlayEffect("spellFX_BELIARSRAGE",oth,oth,0,0,0,FALSE);
			B_MagicHurtNpc(slf,oth,BeliarSpecialDamage / 2);
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
	else if(Npc_IsPlayer(oth))
	{
		if(!Npc_HasReadiedMeleeWeapon(oth))
		{
			return;
		};
		otherweap = Npc_GetReadiedWeapon(oth);
		if(C_IsItemMeleeBeliarsWeapon(otherweap))
		{
			DamageRandy = Hlp_Random(100);
			if(DamageRandy <= BeliarDamageChance_20)
			{
				Wld_PlayEffect("spellFX_BELIARSRAGE_COLLIDE",oth,oth,0,0,0,FALSE);
				if(DamageRandy <= BeliarDamageChance)
				{
					if(slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_UNDEAD)
					{
						Wld_PlayEffect("spellFX_BELIARSRAGE",oth,oth,0,0,0,FALSE);
						B_MagicHurtNpc(slf,oth,BeliarSpecialDamage);
					}
					else if(slf.flags != NPC_FLAG_IMMORTAL)
					{
						Wld_PlayEffect("spellFX_BELIARSRAGE",slf,slf,0,0,0,FALSE);
						B_MagicHurtNpc(oth,slf,BeliarSpecialDamage);
					};
				};
			};
		}
		else if(Hlp_IsItem(otherweap,Holy_Hammer_MIS))
		{
			if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Magic_Golem))
			{
				Npc_ChangeAttribute(slf,ATR_HITPOINTS,-slf.attribute[ATR_HITPOINTS_MAX]);
				if(!C_BodyStateContains(slf,BS_PARADE))
				{
					Wld_PlayEffect("spellFX_LIGHTSTAR_WHITE",slf,slf,0,0,0,FALSE);
					Snd_Play("MFX_Transform_Cast");
				};
				B_GiveDeathXP(oth,slf);
			};
		}
		else if(Hlp_IsItem(otherweap,ItMw_BeliarWeapon_Fire))
		{
			Wld_PlayEffect("VOB_MAGICBURN",slf,slf,0,0,0,FALSE);
		};
	};
};

func void B_ApplySpecialRangedWeaponDamage(var C_Npc target)
{
	if(target.flags != NPC_FLAG_IMMORTAL)
	{
		Npc_ChangeAttribute(target,ATR_HITPOINTS,-target.protection[PROT_POINT]);
	};
};

func void B_ApplyFireBowDamage(var C_Npc target)
{
	var int damage;
	Wld_PlayEffect("VOB_MAGICBURN",target,target,0,0,0,FALSE);
	if(target.flags != NPC_FLAG_IMMORTAL)
	{
		damage = SpecialDamage_FireBow - target.protection[PROT_FIRE];
		Npc_ChangeAttribute(target,ATR_HITPOINTS,-damage);
		if(target.attribute[ATR_HITPOINTS] <= 0)
		{
			if(target.guild < GIL_SEPERATOR_HUM)
			{
				AI_PlayAni(target,"T_DEAD");
			};
		};
	};
};

func void B_SpecialRangedWeaponDamage(var C_Npc shooter,var C_Npc target,var int directHit)
{
	if(!Npc_HasReadiedRangedWeapon(shooter))
	{
		return;
	};
	var C_Item readyweap;
	readyweap = Npc_GetReadiedWeapon(shooter);
	if(Hlp_IsItem(readyweap,ItRw_Addon_FireBow))
	{
		if(directHit == TRUE)
		{
			Wld_PlayEffect("spellFX_Firestorm_SPREAD",target,target,0,0,0,FALSE);
			B_ApplySpecialRangedWeaponDamage(target);
			B_ApplyFireBowDamage(target);
			if(Npc_GetDistToNpc(target,shooter) <= SpecialDamage_FireBow_Range)
			{
				B_ApplyFireBowDamage(shooter);
			};
		}
		else if(Npc_GetDistToNpc(target,victim) <= SpecialDamage_FireBow_Range)
		{
			B_ApplyFireBowDamage(target);
		};
	}
	else if(Hlp_IsItem(readyweap,ItRw_Addon_MagicBow))
	{
		if(directHit == TRUE)
		{
			Wld_PlayEffect("spellFX_ICEBOLT_COLLIDE",target,target,0,0,0,FALSE);
			B_ApplySpecialRangedWeaponDamage(target);
		};
	}
	else if(Hlp_IsItem(readyweap,ItRw_Addon_MagicCrossbow))
	{
		if(directHit == TRUE)
		{
			Wld_PlayEffect("spellFX_ICEBOLT_COLLIDE",target,target,0,0,0,FALSE);
			B_ApplySpecialRangedWeaponDamage(target);
		};
	};
	if(Npc_IsDead(target))
	{
		B_GiveDeathXP(shooter,target);
	};
};

