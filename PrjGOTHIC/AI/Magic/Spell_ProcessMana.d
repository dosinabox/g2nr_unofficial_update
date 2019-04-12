
func int Spell_ProcessMana(var int manaInvested)
{
	var int activeSpell;
	activeSpell = Npc_GetActiveSpell(self);
	if(activeSpell == SPL_PalLight)
	{
		return Spell_Logic_PalLight(manaInvested);
	};
	if(activeSpell == SPL_PalLightHeal)
	{
		return Spell_Logic_PalLightHeal(manaInvested);
	};
	if(activeSpell == SPL_PalHolyBolt)
	{
		return Spell_Logic_PalHolyBolt(manaInvested);
	};
	if(activeSpell == SPL_PalMediumHeal)
	{
		return Spell_Logic_PalMediumHeal(manaInvested);
	};
	if(activeSpell == SPL_PalRepelEvil)
	{
		return Spell_Logic_PalRepelEvil(manaInvested);
	};
	if(activeSpell == SPL_PalFullHeal)
	{
		return Spell_Logic_PalFullHeal(manaInvested);
	};
	if(activeSpell == SPL_PalDestroyEvil)
	{
		return Spell_Logic_PalDestroyEvil(manaInvested);
	};
	if(activeSpell == SPL_PalTeleportSecret)
	{
		return Spell_Logic_PalTeleportSecret(manaInvested);
	};
	if(activeSpell == SPL_TeleportSeaport)
	{
		return Spell_Logic_TeleportSeaport(manaInvested);
	};
	if(activeSpell == SPL_TeleportMonastery)
	{
		return Spell_Logic_TeleportMonastery(manaInvested);
	};
	if(activeSpell == SPL_TeleportFarm)
	{
		return Spell_Logic_TeleportFarm(manaInvested);
	};
	if(activeSpell == SPL_TeleportXardas)
	{
		return Spell_Logic_TeleportXardas(manaInvested);
	};
	if(activeSpell == SPL_TeleportPassNW)
	{
		return Spell_Logic_TeleportPassNW(manaInvested);
	};
	if(activeSpell == SPL_TeleportPassOW)
	{
		return Spell_Logic_TeleportPassOW(manaInvested);
	};
	if(activeSpell == SPL_TeleportOC)
	{
		return Spell_Logic_TeleportOC(manaInvested);
	};
	if(activeSpell == SPL_TeleportOWDemonTower)
	{
		return Spell_Logic_TeleportOWDemonTower(manaInvested);
	};
	if(activeSpell == SPL_TeleportTaverne)
	{
		return Spell_Logic_TeleportTaverne(manaInvested);
	};
	if(activeSpell == SPL_Light)
	{
		return Spell_Logic_Light(manaInvested);
	};
	if(activeSpell == SPL_Firebolt)
	{
		return Spell_Logic_Firebolt(manaInvested);
	};
	if(activeSpell == SPL_Icebolt)
	{
		return Spell_Logic_IceBolt(manaInvested);
	};
	if(activeSpell == SPL_Zap)
	{
		return Spell_Logic_Zap(manaInvested);
	};
	if(activeSpell == SPL_LightHeal)
	{
		return Spell_Logic_LightHeal(manaInvested);
	};
	if(activeSpell == SPL_SummonGoblinSkeleton)
	{
		return Spell_Logic_SummonGoblinSkeleton(manaInvested);
	};
	if(activeSpell == SPL_InstantFireball)
	{
		return Spell_Logic_InstantFireball(manaInvested);
	};
	if(activeSpell == SPL_SummonWolf)
	{
		return Spell_Logic_SummonWolf(manaInvested);
	};
	if(activeSpell == SPL_WindFist)
	{
		return Spell_Logic_WindFist(manaInvested);
	};
	if(activeSpell == SPL_Sleep)
	{
		return Spell_Logic_Sleep(manaInvested);
	};
	if(activeSpell == SPL_MediumHeal)
	{
		return Spell_Logic_MediumHeal(manaInvested);
	};
	if(activeSpell == SPL_LightningFlash)
	{
		return Spell_Logic_LightningFlash(manaInvested);
	};
	if(activeSpell == SPL_ChargeFireball)
	{
		return Spell_Logic_ChargeFireball(manaInvested);
	};
	if(activeSpell == SPL_ChargeZap)
	{
		return Spell_Logic_ChargeZap(manaInvested);
	};
	if(activeSpell == SPL_SummonSkeleton)
	{
		return Spell_Logic_SummonSkeleton(manaInvested);
	};
	if(activeSpell == SPL_Fear)
	{
		return Spell_Logic_Fear(manaInvested);
	};
	if(activeSpell == SPL_IceCube)
	{
		return Spell_Logic_IceCube(manaInvested);
	};
	if(activeSpell == SPL_ChargeZap)
	{
		return Spell_Logic_ChargeZap(manaInvested);
	};
	if(activeSpell == SPL_SummonGolem)
	{
		return Spell_Logic_SummonGolem(manaInvested);
	};
	if(activeSpell == SPL_DestroyUndead)
	{
		return Spell_Logic_DestroyUndead(manaInvested);
	};
	if(activeSpell == SPL_Pyrokinesis)
	{
		return Spell_Logic_Pyrokinesis(manaInvested);
	};
	if(activeSpell == SPL_Firestorm)
	{
		return Spell_Logic_Firestorm(manaInvested);
	};
	if(activeSpell == SPL_IceWave)
	{
		return Spell_Logic_IceWave(manaInvested);
	};
	if(activeSpell == SPL_SummonDemon)
	{
		return Spell_Logic_SummonDemon(manaInvested);
	};
	if(activeSpell == SPL_FullHeal)
	{
		return Spell_Logic_FullHeal(manaInvested);
	};
	if(activeSpell == SPL_Firerain)
	{
		return Spell_Logic_Firerain(manaInvested);
	};
	if(activeSpell == SPL_BreathOfDeath)
	{
		return Spell_Logic_BreathOfDeath(manaInvested);
	};
	if(activeSpell == SPL_MassDeath)
	{
		return Spell_Logic_Massdeath(manaInvested);
	};
	if(activeSpell == SPL_ArmyOfDarkness)
	{
		return Spell_Logic_ArmyOfDarkness(manaInvested);
	};
	if(activeSpell == SPL_Shrink)
	{
		return Spell_Logic_Shrink(manaInvested);
	};
	if(activeSpell == SPL_TrfSheep)
	{
		return Spell_Logic_TrfSheep(manaInvested);
	};
	if(activeSpell == SPL_TrfScavenger)
	{
		return Spell_Logic_TrfScavenger(manaInvested);
	};
	if(activeSpell == SPL_TrfGiantRat)
	{
		return Spell_Logic_TrfGiantRat(manaInvested);
	};
	if(activeSpell == SPL_TrfGiantBug)
	{
		return Spell_Logic_TrfGiantBug(manaInvested);
	};
	if(activeSpell == SPL_TrfWolf)
	{
		return Spell_Logic_TrfWolf(manaInvested);
	};
	if(activeSpell == SPL_TrfWaran)
	{
		return Spell_Logic_TrfWaran(manaInvested);
	};
	if(activeSpell == SPL_TrfSnapper)
	{
		return Spell_Logic_TrfSnapper(manaInvested);
	};
	if(activeSpell == SPL_TrfWarg)
	{
		return Spell_Logic_TrfWarg(manaInvested);
	};
	if(activeSpell == SPL_TrfFireWaran)
	{
		return Spell_Logic_TrfFireWaran(manaInvested);
	};
	if(activeSpell == SPL_TrfLurker)
	{
		return Spell_Logic_TrfLurker(manaInvested);
	};
	if(activeSpell == SPL_TrfShadowbeast)
	{
		return Spell_Logic_TrfShadowbeast(manaInvested);
	};
	if(activeSpell == SPL_TrfDragonSnapper)
	{
		return Spell_Logic_TrfDragonSnapper(manaInvested);
	};
	if(activeSpell == SPL_Charm)
	{
		return Spell_Logic_Charm(manaInvested);
	};
	if(activeSpell == SPL_MasterOfDisaster)
	{
		return Spell_Logic_MasterOfDisaster(manaInvested);
	};
	if(activeSpell == SPL_ConcussionBolt)
	{
		return Spell_Logic_Concussionbolt(manaInvested);
	};
	if(activeSpell == SPL_Deathbolt)
	{
		return Spell_Logic_Deathbolt(manaInvested);
	};
	if(activeSpell == SPL_Deathball)
	{
		return Spell_Logic_Deathball(manaInvested);
	};
	if(activeSpell == SPL_Thunderstorm)
	{
		return Spell_Logic_Thunderstorm(manaInvested);
	};
	if(activeSpell == SPL_WaterFist)
	{
		return Spell_Logic_Waterfist(manaInvested);
	};
	if(activeSpell == SPL_Whirlwind)
	{
		return Spell_Logic_Whirlwind(manaInvested);
	};
	if(activeSpell == SPL_Geyser)
	{
		return Spell_Logic_Geyser(manaInvested);
	};
	if(activeSpell == SPL_Inflate)
	{
		return Spell_Logic_Inflate(manaInvested);
	};
	if(activeSpell == SPL_IceLance)
	{
		return Spell_Logic_Icelance(manaInvested);
	};
	if(activeSpell == SPL_Swarm)
	{
		return Spell_Logic_Swarm(manaInvested);
	};
	if(activeSpell == SPL_GreenTentacle)
	{
		return Spell_Logic_Greententacle(manaInvested);
	};
	if(activeSpell == SPL_SummonGuardian)
	{
		return Spell_Logic_SummonGuardian(manaInvested);
	};
	if(activeSpell == SPL_Energyball)
	{
		return Spell_Logic_EnergyBall(manaInvested);
	};
	if(activeSpell == SPL_SuckEnergy)
	{
		return Spell_Logic_SuckEnergy(manaInvested);
	};
	if(activeSpell == SPL_Skull)
	{
		return Spell_Logic_Skull(manaInvested);
	};
	if(activeSpell == SPL_SummonZombie)
	{
		return Spell_Logic_SummonZombie(manaInvested);
	};
	if(activeSpell == SPL_SummonMud)
	{
		return Spell_Logic_SummonMud(manaInvested);
	};
};

