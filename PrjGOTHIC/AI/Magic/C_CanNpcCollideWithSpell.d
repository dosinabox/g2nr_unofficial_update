
const int COLL_DONOTHING = 0;
const int COLL_DOEVERYTHING = 1;
const int COLL_APPLYDAMAGE = 2;
const int COLL_APPLYHALVEDAMAGE = 4;
const int COLL_APPLYDOUBLEDAMAGE = 8;
const int COLL_APPLYVICTIMSTATE = 16;
const int COLL_DONTKILL = 32;

func int C_CanNpcCollideWithSpell(var int spellType)
{
	if(spellType == SPL_Whirlwind)
	{
		if(C_NpcIsDown(self) || C_BodyStateContains(self,BS_SWIM) || C_BodyStateContains(self,BS_DIVE) || (self.guild == GIL_STONEGOLEM) || (self.guild == GIL_ICEGOLEM) || (self.guild == GIL_FIREGOLEM) || (self.guild == GIL_SUMMONED_GOLEM) || (self.guild == GIL_DEMON) || (self.guild == GIL_SUMMONED_DEMON) || (self.guild == GIL_TROLL) || (self.guild == GIL_SUMMONED_GOLEM) || (self.guild == GIL_DRAGON) || (self.guild == GIL_Stoneguardian) || (self.flags == NPC_FLAG_IMMORTAL) || (self.guild == GIL_SHADOWBEAST) || (self.guild == GIL_Gargoyle))
		{
			return COLL_DONOTHING;
		};
		if(C_NpcIsGateGuard(self) == TRUE)
		{
			return COLL_APPLYDAMAGE;
		};
		return COLL_DOEVERYTHING;
	};
	if(spellType == SPL_IceLance)
	{
		if(C_NpcIsDown(self) || C_BodyStateContains(self,BS_SWIM) || C_BodyStateContains(self,BS_DIVE))
		{
			return COLL_DONOTHING;
		};
		if((self.guild == GIL_ICEGOLEM) || (self.aivar[AIV_MM_REAL_ID] == ID_Icewolf) || (self.aivar[AIV_MM_REAL_ID] == ID_DRAGON_ICE))
		{
			return COLL_APPLYHALVEDAMAGE;
		};
		if((self.guild == GIL_FIREGOLEM) || (self.aivar[AIV_MM_REAL_ID] == ID_FIREWARAN) || (self.aivar[AIV_MM_REAL_ID] == ID_DRAGON_FIRE) || (self.guild == GIL_Gargoyle))
		{
			return COLL_APPLYDOUBLEDAMAGE;
		};
		return COLL_APPLYDAMAGE;
	};
	if(spellType == SPL_Thunderstorm)
	{
		if(C_NpcIsDown(self) || C_BodyStateContains(self,BS_SWIM) || C_BodyStateContains(self,BS_DIVE))
		{
			return COLL_DONOTHING;
		};
		if((self.guild == GIL_ICEGOLEM) || (self.aivar[AIV_MM_REAL_ID] == ID_Icewolf) || (self.aivar[AIV_MM_REAL_ID] == ID_DRAGON_ICE))
		{
			return COLL_APPLYHALVEDAMAGE;
		};
		if((self.guild == GIL_FIREGOLEM) || (self.aivar[AIV_MM_REAL_ID] == ID_FIREWARAN) || (self.aivar[AIV_MM_REAL_ID] == ID_DRAGON_FIRE) || (self.guild == GIL_Gargoyle))
		{
			return COLL_APPLYDOUBLEDAMAGE;
		};
		return COLL_DOEVERYTHING;
	};
	if(spellType == SPL_Geyser)
	{
		if(C_NpcIsDown(self) || C_BodyStateContains(self,BS_SWIM) || C_BodyStateContains(self,BS_DIVE) || (self.guild == GIL_STONEGOLEM) || (self.guild == GIL_ICEGOLEM) || (self.guild == GIL_FIREGOLEM) || (self.guild == GIL_SUMMONED_GOLEM) || (self.guild == GIL_DEMON) || (self.guild == GIL_SUMMONED_DEMON) || (self.guild == GIL_TROLL) || (self.guild == GIL_SUMMONED_GOLEM) || (self.guild == GIL_DRAGON) || (self.guild == GIL_Stoneguardian))
		{
			return COLL_DONOTHING;
		};
		return COLL_APPLYDAMAGE | COLL_DONTKILL;
	};
	if(spellType == SPL_WaterFist)
	{
		if(C_NpcIsDown(self) || C_BodyStateContains(self,BS_SWIM) || C_BodyStateContains(self,BS_DIVE))
		{
			return COLL_DONOTHING;
		};
		if((self.guild == GIL_DRAGON) || (self.guild == GIL_TROLL))
		{
			return COLL_APPLYHALVEDAMAGE;
		};
		if((self.guild == GIL_FIREGOLEM) || (self.aivar[AIV_MM_REAL_ID] == ID_FIREWARAN) || (self.guild == GIL_Gargoyle))
		{
			return COLL_APPLYDOUBLEDAMAGE;
		};
		return COLL_APPLYDAMAGE | COLL_DONTKILL;
	};
	if(spellType == SPL_Energyball)
	{
		if(C_NpcIsDown(self) || C_BodyStateContains(self,BS_SWIM) || C_BodyStateContains(self,BS_DIVE))
		{
			return COLL_DONOTHING;
		};
		if(C_NpcIsUndead(self))
		{
			return COLL_APPLYHALVEDAMAGE;
		};
		return COLL_DOEVERYTHING;
	};
	if(spellType == SPL_SuckEnergy)
	{
		if(C_NpcIsDown(self) || C_BodyStateContains(self,BS_SWIM) || C_BodyStateContains(self,BS_DIVE) || (self.guild > GIL_SEPERATOR_HUM) || (self.flags == NPC_FLAG_IMMORTAL) || (Npc_GetDistToNpc(self,other) > 1000) || (self.guild == GIL_DMT))
		{
			return COLL_DONOTHING;
		};
		return COLL_DOEVERYTHING;
	};
	if(spellType == SPL_GreenTentacle)
	{
		if(C_NpcIsDown(self) || C_BodyStateContains(self,BS_SWIM) || C_BodyStateContains(self,BS_DIVE) || (C_NpcIsGateGuard(self) == TRUE) || (self.guild == GIL_BLOODFLY) || (self.guild == GIL_DEMON) || (self.guild == GIL_TROLL) || (self.guild == GIL_DRAGON) || (self.guild == GIL_HARPY) || (self.aivar[AIV_MM_REAL_ID] == ID_SKELETON_MAGE) || (self.guild == GIL_Gargoyle))
		{
			return COLL_DONOTHING;
		};
		return COLL_DOEVERYTHING;
	};
	if(spellType == SPL_Swarm)
	{
		if(C_NpcIsDown(self) || C_BodyStateContains(self,BS_SWIM) || C_BodyStateContains(self,BS_DIVE) || (self.guild == GIL_STONEGOLEM) || (self.guild == GIL_ICEGOLEM) || (self.guild == GIL_FIREGOLEM) || (self.guild == GIL_SUMMONED_GOLEM) || (self.guild == GIL_DEMON) || (self.guild == GIL_SUMMONED_DEMON) || (self.guild == GIL_TROLL) || (self.guild == GIL_BLOODFLY) || (self.guild == GIL_DRAGON) || (self.guild == GIL_Gargoyle) || (self.guild == GIL_DMT) || (self.guild == GIL_Stoneguardian) || (C_NpcIsUndead(self) == TRUE))
		{
			return COLL_DONOTHING;
		};
		if((self.guild > GIL_SEPERATOR_HUM) || (C_NpcIsGateGuard(self) == TRUE))
		{
			return COLL_APPLYDAMAGE;
		};
		return COLL_DOEVERYTHING;
	};
	if(spellType == SPL_Skull)
	{
		if(C_NpcIsDown(self) || C_BodyStateContains(self,BS_SWIM) || C_BodyStateContains(self,BS_DIVE) || C_NpcIsUndead(self))
		{
			return COLL_DONOTHING;
		};
		return COLL_DOEVERYTHING;
	};
	if(spellType == SPL_WindFist)
	{
		if(Npc_GetDistToNpc(other,self) >= 1000)
		{
			return COLL_DONOTHING;
		};
		return COLL_DOEVERYTHING;
	};
	if((spellType == SPL_Zap) || (spellType == SPL_ChargeZap) || (spellType == SPL_ConcussionBolt))
	{
		if(C_NpcIsDown(self))
		{
			return COLL_DONOTHING;
		};
		return COLL_APPLYDAMAGE | COLL_DONTKILL;
	};
	if(other.guild == GIL_DMT)
	{
		if((spellType == SPL_Firerain) || (spellType == SPL_Thunderstorm) || (spellType == SPL_LightningFlash))
		{
			if(self.guild == GIL_DMT)
			{
				return COLL_DONOTHING;
			}
			else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
			{
				return COLL_APPLYHALVEDAMAGE;
			};
		};
		if((spellType == SPL_Firestorm) && (self.guild == GIL_DMT))
		{
			return COLL_DONOTHING;
		};
	};
	if((spellType == SPL_ChargeFireball) || (spellType == SPL_InstantFireball) || (spellType == SPL_Firerain) || (spellType == SPL_Firebolt) || (spellType == SPL_Firestorm) || (spellType == SPL_Pyrokinesis) || (spellType == SPL_Deathbolt) || (spellType == SPL_Deathball))
	{
		if(C_NpcIsDown(self) || C_BodyStateContains(self,BS_SWIM) || C_BodyStateContains(self,BS_DIVE))
		{
			return COLL_DONOTHING;
		};
		if((self.guild == GIL_FIREGOLEM) || (self.aivar[AIV_MM_REAL_ID] == ID_FIREWARAN) || (self.guild == GIL_Gargoyle) || (self.aivar[AIV_MM_REAL_ID] == ID_DRAGON_FIRE))
		{
			return COLL_APPLYHALVEDAMAGE;
		};
		if((self.guild == GIL_ICEGOLEM) || (self.aivar[AIV_MM_REAL_ID] == ID_DRAGON_ICE) || (self.aivar[AIV_MM_REAL_ID] == ID_Icewolf))
		{
			return COLL_APPLYDOUBLEDAMAGE;
		};
		if((self.guild == GIL_STONEGOLEM) || (self.guild == GIL_SUMMONED_GOLEM) || (self.guild == GIL_DEMON) || (self.guild == GIL_SUMMONED_DEMON) || (self.guild == GIL_TROLL) || (self.guild == GIL_DRAGON))
		{
			return COLL_APPLYDAMAGE;
		};
		return COLL_DOEVERYTHING;
	};
	if((spellType == SPL_IceCube) || (spellType == SPL_IceWave) || (spellType == SPL_Icebolt))
	{
		if(C_NpcIsDown(self) || C_BodyStateContains(self,BS_SWIM) || C_BodyStateContains(self,BS_DIVE))
		{
			return COLL_DONOTHING;
		};
		if((self.guild == GIL_FIREGOLEM) || (self.aivar[AIV_MM_REAL_ID] == ID_FIREWARAN) || (self.guild == GIL_Gargoyle) || (self.aivar[AIV_MM_REAL_ID] == ID_DRAGON_FIRE))
		{
			return COLL_APPLYDOUBLEDAMAGE;
		};
		if((self.guild == GIL_ICEGOLEM) || (self.aivar[AIV_MM_REAL_ID] == ID_DRAGON_ICE) || (self.aivar[AIV_MM_REAL_ID] == ID_Icewolf))
		{
			return COLL_APPLYHALVEDAMAGE;
		};
		if((self.guild == GIL_STONEGOLEM) || (self.guild == GIL_SUMMONED_GOLEM) || (self.guild == GIL_DEMON) || (self.guild == GIL_SUMMONED_DEMON) || (self.guild == GIL_TROLL) || (self.guild == GIL_DRAGON))
		{
			return COLL_APPLYDAMAGE;
		};
		return COLL_DOEVERYTHING;
	};
	if(spellType == SPL_LightningFlash)
	{
		if(C_NpcIsDown(self))
		{
			return COLL_DONOTHING;
		};
		if(C_BodyStateContains(self,BS_SWIM) || C_BodyStateContains(self,BS_DIVE))
		{
			return COLL_APPLYDOUBLEDAMAGE;
		};
		return COLL_DOEVERYTHING;
	};
	if(spellType == SPL_Fear)
	{
		if((self.guild != GIL_FIREGOLEM) && (self.guild != GIL_ICEGOLEM) && (self.guild != GIL_STONEGOLEM) && (self.guild != GIL_SUMMONED_GOLEM) && (self.guild != GIL_SWAMPSHARK) && (self.guild != GIL_TROLL) && !C_NpcIsEvil(self) && (C_NpcIsGateGuard(self) == FALSE))
		{
			return COLL_DOEVERYTHING;
		};
		return COLL_DONOTHING;
	};
	if(spellType == SPL_DestroyUndead)
	{
		if(C_NpcIsUndead(self) && (self.attribute[ATR_HITPOINTS_MAX] <= SPL_Damage_DESTROYUNDEAD))
		{
			return COLL_DOEVERYTHING;
		};
		return COLL_DONOTHING;
	};
	if(spellType == SPL_BreathOfDeath)
	{
		if((Npc_GetDistToNpc(other,self) < 1000) && !C_NpcIsUndead(self))
		{
			if((self.guild == GIL_DRAGON) || (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(hero)))
			{
				return COLL_APPLYHALVEDAMAGE;
			};
			return COLL_DOEVERYTHING;
		};
		return COLL_DONOTHING;
	};
	if(spellType == SPL_MassDeath)
	{
		if(!C_NpcIsUndead(self))
		{
			if(self.guild == GIL_DRAGON)
			{
				return COLL_APPLYHALVEDAMAGE;
			};
			return COLL_DOEVERYTHING;
		};
		return COLL_DONOTHING;
	};
	if(spellType == SPL_MasterOfDisaster)
	{
		if(!C_NpcIsDown(self) && !C_BodyStateContains(self,BS_SWIM) && !C_BodyStateContains(self,BS_DIVE) && C_NpcIsEvil(self))
		{
			return COLL_DOEVERYTHING;
		};
		return COLL_DONOTHING;
	};
	if(spellType == SPL_Shrink)
	{
		if(C_NpcIsDown(self) || C_BodyStateContains(self,BS_SWIM) || C_BodyStateContains(self,BS_DIVE) || (self.guild == GIL_DRAGON))
		{
			return COLL_DONOTHING;
		};
		return COLL_DOEVERYTHING;
	};
	if(spellType == SPL_PalHolyBolt)
	{
		if(C_NpcIsEvil(self))
		{
			return COLL_DOEVERYTHING;
		};
		return COLL_DONOTHING;
	}
	else if(spellType == SPL_PalRepelEvil)
	{
		if(C_NpcIsEvil(self))
		{
			if(self.attribute[ATR_HITPOINTS_MAX] <= SPL_Damage_PalRepelEvil)
			{
				return COLL_DOEVERYTHING;
			}
			else
			{
				return COLL_APPLYHALVEDAMAGE;
			};
		};
		return COLL_DONOTHING;
	}
	else if(spellType == SPL_PalDestroyEvil)
	{
		if(C_NpcIsEvil(self) && (self.attribute[ATR_HITPOINTS_MAX] <= SPL_Damage_PalDestroyEvil))
		{
			return COLL_DOEVERYTHING;
		};
		return COLL_DONOTHING;
	};
	return COLL_DOEVERYTHING;
};

