
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
		if(C_NpcIsDown(self) || C_NpcIsSwimming(self) || C_NpcIsGolem(self) || (self.guild == GIL_WISP) || C_NpcIsDemon(self) || (self.guild == GIL_TROLL) || (self.guild == GIL_DRAGON) || C_NpcIsImmortal(self) || (self.guild == GIL_SHADOWBEAST) || (self.guild == GIL_SHADOWBEAST_SKELETON) || (self.guild == GIL_SHADOWBEAST_FIRE))
		{
			return COLL_DONOTHING;
		};
		if(C_NpcIsGateGuard(self))
		{
			return COLL_APPLYDAMAGE;
		};
		return COLL_DOEVERYTHING;
	};
	if((spellType == SPL_IceLance) || (spellType == SPL_Icebolt))
	{
		if(C_NpcIsDown(self) || C_NpcIsSwimming(self))
		{
			return COLL_DONOTHING;
		};
		if(C_NpcIsIceCreature(self))
		{
			return COLL_APPLYHALVEDAMAGE;
		};
		if(C_NpcIsFireCreature(self))
		{
			return COLL_APPLYDOUBLEDAMAGE;
		};
		return COLL_APPLYDAMAGE;
	};
	if(spellType == SPL_Thunderstorm)
	{
		if(C_NpcIsDown(self) || C_NpcIsSwimming(self))
		{
			return COLL_DONOTHING;
		};
		if(C_NpcIsIceCreature(self))
		{
			return COLL_APPLYHALVEDAMAGE;
		};
		if(C_NpcIsFireCreature(self))
		{
			return COLL_APPLYDOUBLEDAMAGE;
		};
		return COLL_DOEVERYTHING;
	};
	if(spellType == SPL_Geyser)
	{
		if(C_NpcIsFireCreature(self))
		{
			return COLL_APPLYDOUBLEDAMAGE;
		};
		if(C_NpcIsDown(self) || C_NpcIsSwimming(self) || C_NpcIsGolem(self) || (self.guild == GIL_WISP) || C_NpcIsDemon(self) || (self.guild == GIL_TROLL) || (self.guild == GIL_DRAGON))
		{
			return COLL_DONOTHING;
		};
		return COLL_APPLYDAMAGE | COLL_DONTKILL;
	};
	if(spellType == SPL_WaterFist)
	{
		if(C_NpcIsDown(self) || C_NpcIsSwimming(self) || (self.guild == GIL_WISP))
		{
			return COLL_DONOTHING;
		};
		if(C_NpcIsFireCreature(self))
		{
			return COLL_APPLYDOUBLEDAMAGE;
		};
		if((self.guild == GIL_DRAGON) || (self.guild == GIL_TROLL))
		{
			return COLL_APPLYHALVEDAMAGE;
		};
		return COLL_APPLYDAMAGE | COLL_DONTKILL;
	};
	if(spellType == SPL_Energyball)
	{
		if(C_NpcIsDown(self) || C_NpcIsSwimming(self))
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
		if(C_NpcIsDown(self) || C_NpcIsSwimming(self) || (self.guild > GIL_SEPERATOR_HUM) || C_NpcIsImmortal(self) || (Npc_GetDistToNpc(self,other) > FIGHT_DIST_RANGED_OUTER) || (self.guild == GIL_DMT))
		{
			return COLL_DONOTHING;
		};
		return COLL_DOEVERYTHING | COLL_DONTKILL;
	};
	if(spellType == SPL_GreenTentacle)
	{
		if(C_NpcIsDown(self) || C_NpcIsSwimming(self) || C_NpcIsGateGuard(self) || C_NpcIsDemon(self) || (self.guild == GIL_BLOODFLY) || (self.guild == GIL_WISP) || (self.guild == GIL_TROLL) || (self.guild == GIL_DRAGON) || (self.guild == GIL_HARPY) || (self.aivar[AIV_MM_REAL_ID] == ID_SKELETON_MAGE) || (self.guild == GIL_SHADOWBEAST_FIRE))
		{
			return COLL_DONOTHING;
		};
		return COLL_DOEVERYTHING;
	};
	if(spellType == SPL_Swarm)
	{
		if(C_NpcIsDown(self) || C_NpcIsSwimming(self) || C_NpcIsGolem(self) || C_NpcIsDemon(self) || C_NpcIsUndead(self) || (self.guild == GIL_TROLL) || (self.guild == GIL_BLOODFLY) || (self.guild == GIL_WISP) || (self.guild == GIL_DRAGON) || (self.guild == GIL_SHADOWBEAST_FIRE) || (self.guild == GIL_DMT))
		{
			return COLL_DONOTHING;
		};
		if((self.guild > GIL_SEPERATOR_HUM) || C_NpcIsGateGuard(self))
		{
			return COLL_APPLYDAMAGE;
		};
		return COLL_DOEVERYTHING;
	};
	if(spellType == SPL_Skull)
	{
		if(C_NpcIsDown(self) || C_NpcIsSwimming(self) || C_NpcIsUndead(self))
		{
			return COLL_DONOTHING;
		};
		return COLL_DOEVERYTHING;
	};
	if(spellType == SPL_WindFist)
	{
		if(C_NpcIsDown(self) || (self.guild == GIL_WISP) || (Npc_GetDistToNpc(other,self) >= FIGHT_DIST_RANGED_OUTER) || (self.protection[PROT_FLY] == IMMUNE))
		{
			return COLL_DONOTHING;
		};
		if(C_NpcIsGolem(self) || C_NpcIsDemon(self) || (self.guild == GIL_TROLL) || (self.guild == GIL_DRAGON))
		{
			return COLL_APPLYDAMAGE;
		};
		self.aivar[AIV_LastHitByWindFist] = TRUE;
		return COLL_DOEVERYTHING;
	};
	if(spellType == SPL_ConcussionBolt)
	{
		if(C_NpcIsDown(self))
		{
			return COLL_DONOTHING;
		};
		return COLL_APPLYDAMAGE | COLL_DONTKILL;
	};
	if((spellType == SPL_Zap) || (spellType == SPL_ChargeZap))
	{
		if(C_NpcIsDown(self))
		{
			return COLL_DONOTHING;
		};
		if(C_NpcIsSwimming(self))
		{
			return COLL_APPLYDOUBLEDAMAGE;
		};
		return COLL_APPLYDAMAGE | COLL_DONTKILL;
	};
	if(spellType == SPL_LightningFlash)
	{
		if((self.protection[PROT_MAGIC] == IMMUNE) || C_NpcIsDown(self))
		{
			return COLL_DONOTHING;
		};
		if(C_NpcIsSwimming(self))
		{
			return COLL_APPLYDOUBLEDAMAGE;
		};
		return COLL_DOEVERYTHING;
	};
	if(other.guild == GIL_DMT)
	{
		if((spellType == SPL_Firerain) || (spellType == SPL_Thunderstorm) || (spellType == SPL_LightningFlash))
		{
			if(self.guild == GIL_DMT)
			{
				return COLL_DONOTHING;
			};
			if(Npc_IsPlayer(self))
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
		if(C_NpcIsDown(self) || C_NpcIsSwimming(self))
		{
			return COLL_DONOTHING;
		};
		if(C_NpcIsFireCreature(self))
		{
			return COLL_APPLYHALVEDAMAGE;
		};
		if(C_NpcIsIceCreature(self))
		{
			return COLL_APPLYDOUBLEDAMAGE;
		};
		if(C_NpcIsGolem(self) || C_NpcIsDemon(self) || (self.guild == GIL_TROLL) || (self.guild == GIL_DRAGON))
		{
			return COLL_APPLYDAMAGE;
		};
		return COLL_DOEVERYTHING;
	};
	if((spellType == SPL_IceCube) || (spellType == SPL_IceWave))
	{
		if(C_NpcIsDown(self) || C_NpcIsSwimming(self))
		{
			return COLL_DONOTHING;
		};
		if(C_NpcIsFireCreature(self))
		{
			return COLL_APPLYDOUBLEDAMAGE;
		};
		if(C_NpcIsIceCreature(self))
		{
			return COLL_APPLYHALVEDAMAGE;
		};
		if((self.guild == GIL_STONEGUARDIAN) || (self.guild == GIL_SUMMONED_STONEGUARDIAN))
		{
			return COLL_DOEVERYTHING;
		};
		if(C_NpcIsGolem(self) || C_NpcIsDemon(self) || (self.guild == GIL_TROLL) || (self.guild == GIL_DRAGON))
		{
			return COLL_APPLYDAMAGE;
		};
		return COLL_DOEVERYTHING;
	};
	if(spellType == SPL_DestroyUndead)
	{
		if(C_NpcIsUndead(self))
		{
			if(self.attribute[ATR_HITPOINTS_MAX] <= SPL_Damage_DESTROYUNDEAD)
			{
				return COLL_DOEVERYTHING;
			};
			return COLL_APPLYHALVEDAMAGE;
		};
		return COLL_DONOTHING;
	};
	if(spellType == SPL_BreathOfDeath)
	{
		if((Npc_GetDistToNpc(other,self) < FIGHT_DIST_RANGED_OUTER) && !C_NpcIsUndead(self))
		{
			if((self.guild == GIL_DRAGON) || Npc_IsPlayer(self))
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
		if(!C_NpcIsDown(self) && !C_NpcIsSwimming(self) && C_NpcIsEvil(self))
		{
			return COLL_DOEVERYTHING;
		};
		return COLL_DONOTHING;
	};
	if(spellType == SPL_Shrink)
	{
		if(C_NpcIsDown(self) || C_NpcIsSwimming(self) || (self.guild < GIL_SEPERATOR_HUM))
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
	};
	if(spellType == SPL_PalRepelEvil)
	{
		if(C_NpcIsEvil(self))
		{
			if(self.attribute[ATR_HITPOINTS_MAX] <= SPL_Damage_PalRepelEvil)
			{
				return COLL_DOEVERYTHING;
			};
			return COLL_APPLYHALVEDAMAGE;
		};
		return COLL_DONOTHING;
	};
	if(spellType == SPL_PalDestroyEvil)
	{
		if(C_NpcIsEvil(self))
		{
			if(self.attribute[ATR_HITPOINTS_MAX] <= SPL_Damage_PalDestroyEvil)
			{
				return COLL_DOEVERYTHING;
			};
			return COLL_APPLYHALVEDAMAGE;
		};
		return COLL_DONOTHING;
	};
	return COLL_DOEVERYTHING;
};

