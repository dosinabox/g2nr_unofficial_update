
var int RavenBlitz;

func void B_BeliarsWeaponSpecialDamage(var C_Npc oth,var C_Npc slf)
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
		if(C_ScHasReadiedBeliarsWeapon())
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
		};
	};
	if(Npc_HasReadiedWeapon(oth))
	{
		otherweap = Npc_GetReadiedWeapon(oth);
		if(Hlp_IsItem(otherweap,ItMw_BeliarWeapon_Fire))
		{
			Wld_PlayEffect("VOB_MAGICBURN",slf,slf,0,0,0,FALSE);
		}
		else if(Hlp_IsItem(otherweap,ItRw_Addon_FireBow))
		{
			//Wld_PlayEffect("spellFX_FIREBOLT_COLLIDE",slf,slf,0,0,0,FALSE);
			//���-�� ��� �� ���
			if(slf.flags != NPC_FLAG_IMMORTAL)
			{
				Npc_ChangeAttribute(slf,ATR_HITPOINTS,-slf.protection[PROT_POINT]);
			};
			if(Npc_IsDead(slf))
			{
				B_GiveDeathXP(oth,slf);
			};
		}
		else if(Hlp_IsItem(otherweap,ItRw_Addon_MagicBow))
		{
			Wld_PlayEffect("spellFX_ICEBOLT_COLLIDE",slf,slf,0,0,0,FALSE);
			if(slf.flags != NPC_FLAG_IMMORTAL)
			{
				Npc_ChangeAttribute(slf,ATR_HITPOINTS,-slf.protection[PROT_POINT]);
			};
			if(Npc_IsDead(slf))
			{
				B_GiveDeathXP(oth,slf);
			};
		}
		else if(Hlp_IsItem(otherweap,ItRw_Addon_MagicCrossbow))
		{
			Wld_PlayEffect("spellFX_BELIARSRAGE_COLLIDE",slf,slf,0,0,0,FALSE);
			if(slf.flags != NPC_FLAG_IMMORTAL)
			{
				Npc_ChangeAttribute(slf,ATR_HITPOINTS,-slf.protection[PROT_POINT]);
			};
			if(Npc_IsDead(slf))
			{
				B_GiveDeathXP(oth,slf);
			};
		};
	};
};

