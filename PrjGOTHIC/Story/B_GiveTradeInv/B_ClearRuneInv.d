
func void B_RemoveAllBeliarRunes(var C_Npc npc)
{
	B_RemoveEveryInvItem(npc,ItRu_BeliarsRage);
	B_RemoveEveryInvItem(npc,ItRu_SuckEnergy);
	B_RemoveEveryInvItem(npc,ItRu_GreenTentacle);
	B_RemoveEveryInvItem(npc,ItRu_Swarm);
	B_RemoveEveryInvItem(npc,ItRu_Skull);
	B_RemoveEveryInvItem(npc,ItRu_SummonZombie);
	B_RemoveEveryInvItem(npc,ItRu_SummonGuardian);
};

func void B_RemoveAllPaladinRunes(var C_Npc npc)
{
	B_RemoveEveryInvItem(npc,ItRu_PalHeal_01);
	B_RemoveEveryInvItem(npc,ItRu_PalHeal_02);
	B_RemoveEveryInvItem(npc,ItRu_PalHolyBolt);
	B_RemoveEveryInvItem(npc,ItRu_PalRepelEvil);
	if(!C_IsNpc(npc,PAL_2004_Bruder))
	{
		B_RemoveEveryInvItem(npc,ItRu_PalLight);
	};
	if(!C_IsNpc(npc,OrkElite_AntiPaladinOrkOberst))
	{
		B_RemoveEveryInvItem(npc,ItRu_PalHeal_03);
	};
	if(!C_IsNpc(npc,Skeleton_Lord_Archol))
	{
		B_RemoveEveryInvItem(npc,ItRu_PalDestroyEvil);
	};
};

func void B_RemoveAllCircleRunes(var C_Npc npc)
{
	B_RemoveEveryInvItem(npc,ItRu_Light);
	B_RemoveEveryInvItem(npc,ItRu_FireBolt);
	B_RemoveEveryInvItem(npc,ItRu_Zap);
	B_RemoveEveryInvItem(npc,ItRu_LightHeal);
	B_RemoveEveryInvItem(npc,ItRu_SumGobSkel);
	B_RemoveEveryInvItem(npc,ItRu_InstantFireball);
	B_RemoveEveryInvItem(npc,ItRu_Icebolt);
	B_RemoveEveryInvItem(npc,ItRu_SumWolf);
	B_RemoveEveryInvItem(npc,ItRu_Windfist);
	B_RemoveEveryInvItem(npc,ItRu_Sleep);
	B_RemoveEveryInvItem(npc,ItRu_MediumHeal);
	B_RemoveEveryInvItem(npc,ItRu_LightningFlash);
	B_RemoveEveryInvItem(npc,ItRu_ChargeFireball);
	B_RemoveEveryInvItem(npc,ItRu_SumSkel);
	B_RemoveEveryInvItem(npc,ItRu_Fear);
	B_RemoveEveryInvItem(npc,ItRu_IceCube);
	B_RemoveEveryInvItem(npc,ItRu_ThunderBall);
	B_RemoveEveryInvItem(npc,ItRu_SumGol);
	B_RemoveEveryInvItem(npc,ItRu_HarmUndead);
	B_RemoveEveryInvItem(npc,ItRu_Pyrokinesis);
	B_RemoveEveryInvItem(npc,ItRu_Firestorm);
	B_RemoveEveryInvItem(npc,ItRu_IceWave);
	B_RemoveEveryInvItem(npc,ItRu_SumDemon);
	B_RemoveEveryInvItem(npc,ItRu_FullHeal);
	B_RemoveEveryInvItem(npc,ItRu_Firerain);
	B_RemoveEveryInvItem(npc,ItRu_BreathOfDeath);
	B_RemoveEveryInvItem(npc,ItRu_MassDeath);
	B_RemoveEveryInvItem(npc,ItRu_ArmyOfDarkness);
	B_RemoveEveryInvItem(npc,ItRu_Shrink);
	B_RemoveEveryInvItem(npc,ItRu_Deathbolt);
	B_RemoveEveryInvItem(npc,ItRu_Deathball);
	B_RemoveEveryInvItem(npc,ItRu_Concussionbolt);
	B_RemoveEveryInvItem(npc,ItRu_Thunderstorm);
	B_RemoveEveryInvItem(npc,ItRu_Whirlwind);
	B_RemoveEveryInvItem(npc,ItRu_Geyser);
	B_RemoveEveryInvItem(npc,ItRu_Waterfist);
	B_RemoveEveryInvItem(npc,ItRu_Icelance);
};

func void B_ClearRuneInv(var C_Npc npc)
{
	if(!C_NpcIsHero(npc))
	{
		B_RemoveAllBeliarRunes(npc);
		B_RemoveAllPaladinRunes(npc);
		B_RemoveAllCircleRunes(npc);
	};
};

