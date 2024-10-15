
func int B_SelectSpell(var C_Npc slf,var C_Npc oth)
{
	var int dK_Mega;
	if((slf.npcType == NPCTYPE_FRIEND) && Npc_IsPlayer(oth) && (oth.guild < GIL_SEPERATOR_HUM))
	{
		if((slf.guild == GIL_KDF) || (slf.guild == GIL_KDW) || (slf.aivar[AIV_MagicUser] == MAGIC_ALWAYS))
		{
			if(!Npc_HasItems(slf,ItRu_Sleep))
			{
				CreateInvItems(slf,ItRu_Sleep,1);
			};
			B_ReadySpell(slf,SPL_Sleep,SPL_Cost_Sleep);
			return TRUE;
		};
	}
	else if(slf.guild == GIL_DMT)
	{
		if(!Npc_HasItems(slf,ItRu_InstantFireball))
		{
			CreateInvItems(slf,ItRu_InstantFireball,1);
		};
		if(!Npc_HasItems(slf,ItRu_Deathbolt))
		{
			CreateInvItems(slf,ItRu_Deathbolt,1);
		};
		if(!Npc_HasItems(slf,ItRu_Deathball))
		{
			CreateInvItems(slf,ItRu_Deathball,1);
		};
		if(!Npc_HasItems(slf,ItRu_Firerain))
		{
			CreateInvItems(slf,ItRu_Firerain,1);
		};
		if(!Npc_HasItems(slf,ItRu_Thunderstorm))
		{
			CreateInvItems(slf,ItRu_Thunderstorm,1);
		};
		if(!Npc_HasItems(slf,ItRu_LightningFlash))
		{
			CreateInvItems(slf,ItRu_LightningFlash,1);
		};
		if(!Npc_HasItems(slf,ItRu_Firestorm))
		{
			CreateInvItems(slf,ItRu_Firestorm,1);
		};
		if(!Npc_HasItems(slf,ItRu_Skull))
		{
			CreateInvItems(slf,ItRu_Skull,1);
		};
		if(C_IsNpc(slf,DMT_1299_OberDementor_DI))
		{
			B_ReadySpell(slf,SPL_Skull,SPL_Cost_Skull);
			return TRUE;
		};
		if(Npc_IsDrawingWeapon(slf))
		{
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
				B_ReadySpell(slf,SPL_InstantFireball,SPL_COST_InstantFireball);
			}
			else if(Kapitel == 4)
			{
				B_ReadySpell(slf,SPL_Deathbolt,SPL_COST_Deathbolt);
			}
			else
			{
				B_ReadySpell(slf,SPL_Deathball,SPL_COST_Deathball);
			};
		}
		else if(slf.aivar[AIV_SelectSpell] == 10)
		{
			slf.aivar[AIV_SelectSpell] = 11;
			dK_Mega = Hlp_Random(100);
			if(dK_Mega <= 5)
			{
				//TODO применять всегда, но проверять гильдии в C_CanNpcCollideWithSpell
				Npc_PerceiveAll(slf);
				if(!Wld_DetectNpcEx(slf,-1,NOFUNC,GIL_DMT,TRUE))
				{
					if(dK_Mega <= 2)
					{
						B_ReadySpell(slf,SPL_Firerain,SPL_Cost_Firerain);
					}
					else
					{
						B_ReadySpell(slf,SPL_Thunderstorm,SPL_Cost_Thunderstorm);
					};
				}
				else
				{
					B_ReadySpell(slf,SPL_LightningFlash,SPL_Cost_LightningFlash);
				};
			}
			else if(dK_Mega <= 10)
			{
				B_ReadySpell(slf,SPL_LightningFlash,SPL_Cost_LightningFlash);
			}
			else
			{
				if(Kapitel <= 3)
				{
					B_ReadySpell(slf,SPL_Firestorm,SPL_COST_Firestorm);
				}
				else
				{
					//TODO нужно что-то более мощное
					B_ReadySpell(slf,SPL_Deathball,SPL_COST_Deathball);
				};
			};
		}
		else if(slf.aivar[AIV_SelectSpell] == 12)
		{
			slf.aivar[AIV_SelectSpell] = 0;
		};
		return TRUE;
	}
	else if((slf.guild == GIL_KDF) || (slf.guild == GIL_KDW) || (slf.aivar[AIV_MagicUser] == MAGIC_ALWAYS))
	{
		if(!Npc_HasItems(slf,ItRu_Concussionbolt))
		{
			CreateInvItems(slf,ItRu_Concussionbolt,1);
		};
		if(!Npc_HasItems(slf,ItRu_InstantFireball))
		{
			CreateInvItems(slf,ItRu_InstantFireball,1);
		};
		if(!Npc_HasItems(slf,ItRu_Deathball))
		{
			CreateInvItems(slf,ItRu_Deathball,1);
		};
		if(!Npc_HasItems(slf,ItRu_FullHeal))
		{
			CreateInvItems(slf,ItRu_FullHeal,1);
		};
		if(!Npc_HasItems(slf,ItRu_LightningFlash))
		{
			CreateInvItems(slf,ItRu_LightningFlash,1);
		};
		if(!Npc_HasItems(slf,ItRu_Firestorm))
		{
			CreateInvItems(slf,ItRu_Firestorm,1);
		};
		if(!Npc_HasItems(slf,ItRu_ThunderBall))
		{
			CreateInvItems(slf,ItRu_ThunderBall,1);
		};
		if(!Npc_HasItems(slf,ItRu_HarmUndead))
		{
			CreateInvItems(slf,ItRu_HarmUndead,1);
		};
		if((slf.attribute[ATR_HITPOINTS] < 100) && (C_NpcIsDown(oth) || (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_RANGED_OUTER)))
		{
			B_ReadySpell(slf,SPL_FullHeal,SPL_Cost_FullHeal);
			return TRUE;
		};
		if(C_NpcHasAttackReasonToKill(slf))
		{
			if((oth.flags == NPC_FLAG_IMMORTAL) || (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Raven)))
			{
				B_ReadySpell(slf,SPL_Deathball,SPL_COST_Deathball);
			}
			else if(C_NpcIsUndead(oth))
			{
				B_ReadySpell(slf,SPL_DestroyUndead,SPL_Cost_DESTROYUNDEAD);
			}
			else if((slf.guild == GIL_KDW) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Vatras)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Myxir_CITY)))
			{
				if(oth.protection[PROT_MAGIC] < SPL_Damage_ChargeZap)
				{
					B_ReadySpell(slf,SPL_ChargeZap,SPL_COST_ChargeZap);
				}
				else
				{
					B_ReadySpell(slf,SPL_LightningFlash,SPL_Cost_LightningFlash);
				};
			}
			else
			{
				if(oth.protection[PROT_MAGIC] < SPL_DAMAGE_InstantFireball)
				{
					B_ReadySpell(slf,SPL_InstantFireball,SPL_COST_InstantFireball);
				}
				else
				{
					B_ReadySpell(slf,SPL_Firestorm,SPL_Cost_FireStorm);
				};
			};
			return TRUE;
		};
		B_ReadySpell(slf,SPL_ConcussionBolt,SPL_COST_Concussionbolt);
		return TRUE;
	}
	else if(slf.guild == GIL_PAL)
	{
		if(slf.fight_tactic == FAI_NAILED)
		{
			return FALSE;
		};
		if(!Npc_HasItems(slf,ItRu_PalHolyBolt))
		{
			CreateInvItems(slf,ItRu_PalHolyBolt,1);
		};
		if(!Npc_HasItems(slf,ItRu_PalRepelEvil))
		{
			CreateInvItems(slf,ItRu_PalRepelEvil,1);
		};
		if(!Npc_HasItems(slf,ItRu_PalHeal_03))
		{
			CreateInvItems(slf,ItRu_PalHeal_03,1);
		};
		if((slf.attribute[ATR_HITPOINTS] < 100) && (C_NpcIsDown(oth) || (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_RANGED_OUTER)))
		{
			B_ReadySpell(slf,SPL_PalFullHeal,SPL_Cost_PalFullHeal);
			return TRUE;
		};
		if((Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_MELEE) && C_NpcIsEvil(oth))
		{
			if(oth.protection[PROT_MAGIC] < SPL_Damage_PalHolyBolt)
			{
				B_ReadySpell(slf,SPL_PalHolyBolt,SPL_Cost_PalHolyBolt);
			}
			else
			{
				B_ReadySpell(slf,SPL_PalRepelEvil,SPL_Cost_PalRepelEvil);
			};
			return TRUE;
		};
	}
	else if(slf.guild == GIL_SKELETON_MAGE)
	{
		if(!Npc_HasItems(slf,ItRu_SumSkel))
		{
			CreateInvItems(slf,ItRu_SumSkel,1);
		};
		if(!Npc_HasItems(slf,ItRu_IceCube))
		{
			CreateInvItems(slf,ItRu_IceCube,1);
		};
		if(!Npc_HasItems(slf,ItRu_Icebolt))
		{
			CreateInvItems(slf,ItRu_Icebolt,1);
		};
		if(slf.aivar[AIV_SelectSpell] >= 6)
		{
			slf.aivar[AIV_SelectSpell] = 1;
		};
		if(!Npc_IsInState(oth,ZS_MagicFreeze) && (slf.aivar[AIV_SelectSpell] == 0))
		{
			B_ReadySpell(slf,SPL_IceCube,SPL_Cost_IceCube);
			return TRUE;
		};
		if(slf.aivar[AIV_SelectSpell] == 1)
		{
			B_ReadySpell(slf,SPL_SummonSkeleton,SPL_Cost_SummonSkeleton);
			return TRUE;
		};
		B_ReadySpell(slf,SPL_Icebolt,SPL_COST_Icebolt);
		return TRUE;
	}
	else if(slf.guild == GIL_ICEGOLEM)
	{
		if(!Npc_HasItems(slf,ItRu_Icelance))
		{
			CreateInvItems(slf,ItRu_Icelance,1);
		};
		if(!Npc_HasItems(slf,ItRu_IceCube))
		{
			CreateInvItems(slf,ItRu_IceCube,1);
		};
		if(Npc_GetDistToNpc(slf,oth) < FIGHT_DIST_MELEE)
		{
			return FALSE;
		};
		if(Npc_IsInState(oth,ZS_MagicFreeze))
		{
			B_ReadySpell(slf,SPL_Icelance,SPL_Cost_Icelance);
			return TRUE;
		};
		B_ReadySpell(slf,SPL_IceCube,SPL_Cost_IceCube);
		return TRUE;
	}
	else if(slf.guild == GIL_FIREGOLEM)
	{
		if(!Npc_HasItems(slf,ItRu_InstantFireball))
		{
			CreateInvItems(slf,ItRu_InstantFireball,1);
		};
		if(Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_MELEE)
		{
			B_ReadySpell(slf,SPL_InstantFireball,SPL_COST_InstantFireball);
			return TRUE;
		};
	}
	else if((slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_SWAMP) || (slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_ROCK) || (slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_FIRE))
	{
		if(!Npc_HasItems(slf,ItRu_InstantFireball))
		{
			CreateInvItems(slf,ItRu_InstantFireball,1);
		};
		if(Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_DRAGON_MAGIC)
		{
			B_ReadySpell(slf,SPL_InstantFireball,SPL_COST_InstantFireball);
			return TRUE;
		};
	}
	else if(slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_ICE)
	{
		if(IceDragonSpell == SPL_InstantFireball)
		{
			if(!Npc_HasItems(slf,ItRu_InstantFireball))
			{
				CreateInvItems(slf,ItRu_InstantFireball,1);
			};
			if(Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_DRAGON_MAGIC)
			{
				B_ReadySpell(slf,SPL_InstantFireball,SPL_COST_InstantFireball);
				return TRUE;
			};
		}
		else if(IceDragonSpell == SPL_IceLance)
		{
			if(!Npc_HasItems(slf,ItRu_Icelance))
			{
				CreateInvItems(slf,ItRu_Icelance,1);
			};
			if(Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_DRAGON_MAGIC)
			{
				B_ReadySpell(slf,SPL_IceLance,SPL_Cost_IceLance);
				return TRUE;
			};
		}
		else if(IceDragonSpell == SPL_ChargeZap)
		{
			if(!Npc_HasItems(slf,ItRu_ThunderBall))
			{
				CreateInvItems(slf,ItRu_ThunderBall,1);
			};
			if(Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_DRAGON_MAGIC)
			{
				B_ReadySpell(slf,SPL_ChargeZap,SPL_COST_ChargeZap);
				return TRUE;
			};
		}
		else if(IceDragonSpell == SPL_Icebolt)
		{
			if(!Npc_HasItems(slf,ItRu_Icebolt))
			{
				CreateInvItems(slf,ItRu_Icebolt,1);
			};
			if(Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_DRAGON_MAGIC)
			{
				B_ReadySpell(slf,SPL_Icebolt,SPL_COST_Icebolt);
				return TRUE;
			};
		};
	}
	else if(slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_UNDEAD)
	{
		if(!Npc_HasItems(slf,ItRu_Deathball))
		{
			CreateInvItems(slf,ItRu_Deathball,1);
		};
		if(Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_DRAGON_MAGIC)
		{
			B_ReadySpell(slf,SPL_Deathball,SPL_COST_Deathball);
			return TRUE;
		};
	}
	else if(slf.aivar[AIV_MM_REAL_ID] == ID_ORCSHAMAN)
	{
		if(!Npc_HasItems(slf,ItRu_InstantFireball))
		{
			CreateInvItems(slf,ItRu_InstantFireball,1);
		};
		if(Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_MELEE)
		{
			B_ReadySpell(slf,SPL_InstantFireball,SPL_COST_InstantFireball);
			return TRUE;
		};
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Hanna))
	{
		if(!Npc_IsInState(oth,ZS_MagicFreeze) && Npc_HasItems(slf,ItSc_IceCube))
		{
			B_ReadySpell(slf,SPL_IceCube,SPL_Cost_Scroll);
			return TRUE;
		}
		else if(Npc_HasItems(slf,ItSc_Firestorm))
		{
			B_ReadySpell(slf,SPL_Firestorm,SPL_Cost_Scroll);
			return TRUE;
		};
	};
	return FALSE;
};

