
func int B_SelectSpell(var C_Npc slf,var C_Npc oth)
{
	var int dK_Mega;
	if((slf.npcType == NPCTYPE_FRIEND) && Npc_IsPlayer(oth) && C_NpcIsHuman(oth))
	{
		if(C_NpcIsMage(slf) || (slf.aivar[AIV_MagicUser] == MAGIC_ALWAYS))
		{
			B_ReadyRune(slf,ItRu_Sleep,SPL_Cost_Sleep);
			return TRUE;
		};
	}
	else if(slf.guild == GIL_DMT)
	{
		if(C_IsNpc(slf,DMT_1299_OberDementor_DI))
		{
			B_ReadyRune(slf,ItRu_Skull,SPL_Cost_Skull);
			return TRUE;
		};
		if(slf.aivar[AIV_SelectSpell] <= 0)
		{
			slf.aivar[AIV_SelectSpell] = Hlp_Random(9) + 1;
		};
		if(slf.aivar[AIV_SelectSpell] < 10)
		{
			if(Kapitel <= 3)
			{
				B_ReadyRune(slf,ItRu_InstantFireball,SPL_Cost_InstantFireball);
			}
			else if(Kapitel == 4)
			{
				B_ReadyRune(slf,ItRu_Deathbolt,SPL_Cost_Deathbolt);
			}
			else
			{
				B_ReadyRune(slf,ItRu_Deathball,SPL_Cost_Deathball);
			};
		}
		else if(slf.aivar[AIV_SelectSpell] == 10)
		{
			slf.aivar[AIV_SelectSpell] = 11;
			dK_Mega = Hlp_Random(100);
			if(dK_Mega <= 2)
			{
				B_ReadyRune(slf,ItRu_Firerain,SPL_Cost_Firerain);
			}
			else if(dK_Mega <= 5)
			{
				B_ReadyRune(slf,ItRu_Thunderstorm,SPL_Cost_Thunderstorm);
			}
			else if(dK_Mega <= 10)
			{
				if(Kapitel <= 3)
				{
					B_ReadyRune(slf,ItRu_LightningFlash,SPL_Cost_LightningFlash);
				}
				else if(Kapitel == 4)
				{
					B_ReadyRune(slf,ItRu_Deathball,SPL_Cost_Deathball);
				}
				else
				{
					B_ReadyRune(slf,ItRu_Thunderstorm,SPL_Cost_Thunderstorm);
				};
			}
			else
			{
				if(Kapitel <= 3)
				{
					B_ReadyRune(slf,ItRu_Firestorm,SPL_Cost_Firestorm);
				}
				else
				{
					B_ReadyRune(slf,ItRu_Deathball,SPL_Cost_Deathball);
				};
			};
		}
		else if(slf.aivar[AIV_SelectSpell] == 12)
		{
			slf.aivar[AIV_SelectSpell] = 0;
		};
		return TRUE;
	}
	else if(C_NpcIsMage(slf) || (slf.aivar[AIV_MagicUser] == MAGIC_ALWAYS))
	{
		if((slf.attribute[ATR_HITPOINTS] < 100) && (C_NpcIsDown(oth) || (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_RANGED_OUTER)))
		{
			B_ReadyRune(slf,ItRu_FullHeal,SPL_Cost_FullHeal);
			return TRUE;
		};
		if(C_NpcHasAttackReasonToKill(slf))
		{
			if(C_NpcIsImmortal(oth) || C_IsNpc(oth,BDT_1090_Addon_Raven))
			{
				B_ReadyRune(slf,ItRu_Deathball,SPL_Cost_Deathball);
			}
			else if(C_NpcIsUndead(oth))
			{
				B_ReadyRune(slf,ItRu_HarmUndead,SPL_Cost_DESTROYUNDEAD);
			}
			else if(C_NpcIsWaterMage(slf))
			{
				if(oth.protection[PROT_MAGIC] < SPL_Damage_ChargeZap)
				{
					B_ReadyRune(slf,ItRu_ThunderBall,SPL_Cost_ChargeZap);
				}
				else
				{
					B_ReadyRune(slf,ItRu_LightningFlash,SPL_Cost_LightningFlash);
				};
			}
			else
			{
				if(oth.protection[PROT_MAGIC] < SPL_Damage_InstantFireball)
				{
					B_ReadyRune(slf,ItRu_InstantFireball,SPL_Cost_InstantFireball);
				}
				else
				{
					B_ReadyRune(slf,ItRu_Firestorm,SPL_Cost_Firestorm);
				};
			};
			return TRUE;
		};
		B_ReadyRune(slf,ItRu_Concussionbolt,SPL_Cost_Concussionbolt);
		return TRUE;
	}
	else if(slf.guild == GIL_PAL)
	{
		if(slf.fight_tactic == FAI_NAILED)
		{
			return FALSE;
		};
		if((slf.attribute[ATR_HITPOINTS] < 100) && (C_NpcIsDown(oth) || (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_RANGED_OUTER)))
		{
			B_ReadyRune(slf,ItRu_PalHeal_03,SPL_Cost_PalFullHeal);
			return TRUE;
		};
		if((Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_MELEE) && C_NpcIsEvil(oth))
		{
			if(oth.protection[PROT_MAGIC] < SPL_Damage_PalHolyBolt)
			{
				B_ReadyRune(slf,ItRu_PalHolyBolt,SPL_Cost_PalHolyBolt);
			}
			else
			{
				B_ReadyRune(slf,ItRu_PalRepelEvil,SPL_Cost_PalRepelEvil);
			};
			return TRUE;
		};
	}
	else if(slf.guild == GIL_SKELETON_MAGE)
	{
		if(slf.aivar[AIV_SelectSpell] >= 6)
		{
			slf.aivar[AIV_SelectSpell] = 1;
		};
		if(!Npc_IsInState(oth,ZS_MagicFreeze) && (slf.aivar[AIV_SelectSpell] == 0))
		{
			B_ReadyRune(slf,ItRu_IceCube,SPL_Cost_IceCube);
			return TRUE;
		};
		if(slf.aivar[AIV_SelectSpell] == 1)
		{
			B_ReadyRune(slf,ItRu_SumSkel,SPL_Cost_SummonSkeleton);
			return TRUE;
		};
		B_ReadyRune(slf,ItRu_Icebolt,SPL_Cost_Icebolt);
		return TRUE;
	}
	else if(slf.guild == GIL_ICEGOLEM)
	{
		if(Npc_GetDistToNpc(slf,oth) < FIGHT_DIST_MELEE)
		{
			return FALSE;
		};
		if(Npc_IsInState(oth,ZS_MagicFreeze))
		{
			B_ReadyRune(slf,ItRu_Icelance,SPL_Cost_Icelance);
			return TRUE;
		};
		B_ReadyRune(slf,ItRu_IceCube,SPL_Cost_IceCube);
		return TRUE;
	}
	else if(slf.guild == GIL_FIREGOLEM)
	{
		if(Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_MELEE)
		{
			B_ReadyRune(slf,ItRu_InstantFireball,SPL_Cost_InstantFireball);
			return TRUE;
		};
	}
	else if((slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_SWAMP) || (slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_ROCK) || (slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_FIRE))
	{
		if(Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_DRAGON_MAGIC)
		{
			B_ReadyRune(slf,ItRu_InstantFireball,SPL_Cost_InstantFireball);
			return TRUE;
		};
	}
	else if(slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_ICE)
	{
		if(IceDragonSpell == SPL_InstantFireball)
		{
			if(Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_DRAGON_MAGIC)
			{
				B_ReadyRune(slf,ItRu_InstantFireball,SPL_Cost_InstantFireball);
				return TRUE;
			};
		}
		else if(IceDragonSpell == SPL_IceLance)
		{
			if(Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_DRAGON_MAGIC)
			{
				B_ReadyRune(slf,ItRu_Icelance,SPL_Cost_Icelance);
				return TRUE;
			};
		}
		else if(IceDragonSpell == SPL_ChargeZap)
		{
			if(Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_DRAGON_MAGIC)
			{
				B_ReadyRune(slf,ItRu_ThunderBall,SPL_Cost_ChargeZap);
				return TRUE;
			};
		}
		else if(IceDragonSpell == SPL_Icebolt)
		{
			if(Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_DRAGON_MAGIC)
			{
				B_ReadyRune(slf,ItRu_Icebolt,SPL_Cost_Icebolt);
				return TRUE;
			};
		};
	}
	else if(slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_UNDEAD)
	{
		if(Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_DRAGON_MAGIC)
		{
			B_ReadyRune(slf,ItRu_Deathball,SPL_Cost_Deathball);
			return TRUE;
		};
	}
	else if(slf.aivar[AIV_MM_REAL_ID] == ID_ORCSHAMAN)
	{
		if(Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_MELEE)
		{
			B_ReadyRune(slf,ItRu_InstantFireball,SPL_Cost_InstantFireball);
			return TRUE;
		};
	}
	else if(C_IsNpc(slf,VLK_414_Hanna))
	{
		if(!Npc_IsInState(oth,ZS_MagicFreeze) && Npc_HasItems(slf,ItSc_IceCube))
		{
			B_ReadyScroll(slf,ItSc_IceCube);
			return TRUE;
		}
		else if(Npc_HasItems(slf,ItSc_Firestorm))
		{
			B_ReadyScroll(slf,ItSc_Firestorm);
			return TRUE;
		};
	};
	return FALSE;
};

