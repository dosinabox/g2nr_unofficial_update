
func void B_ClearRuneInv(var C_Npc slf)
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) != Hlp_GetInstanceID(her))
	{
		Npc_RemoveInvItems(slf,ItRu_PalLightHeal,Npc_HasItems(slf,ItRu_PalLightHeal));
		Npc_RemoveInvItems(slf,ItRu_PalMediumHeal,Npc_HasItems(slf,ItRu_PalMediumHeal));
		Npc_RemoveInvItems(slf,ItRu_PalFullHeal,Npc_HasItems(slf,ItRu_PalFullHeal));
		Npc_RemoveInvItems(slf,ItRu_PalHolyBolt,Npc_HasItems(slf,ItRu_PalHolyBolt));
		Npc_RemoveInvItems(slf,ItRu_PalRepelEvil,Npc_HasItems(slf,ItRu_PalRepelEvil));
		Npc_RemoveInvItems(slf,ItRu_PalDestroyEvil,Npc_HasItems(slf,ItRu_PalDestroyEvil));
		Npc_RemoveInvItems(slf,ItRu_PalTeleportSecret,Npc_HasItems(slf,ItRu_PalTeleportSecret));
		Npc_RemoveInvItems(slf,ItRu_Light,Npc_HasItems(slf,ItRu_PalLight));
		Npc_RemoveInvItems(slf,ItRu_PalLight,Npc_HasItems(slf,ItRu_Light));
		Npc_RemoveInvItems(slf,ItRu_FireBolt,Npc_HasItems(slf,ItRu_FireBolt));
		Npc_RemoveInvItems(slf,ItRu_Zap,Npc_HasItems(slf,ItRu_Zap));
		Npc_RemoveInvItems(slf,ItRu_LightHeal,Npc_HasItems(slf,ItRu_LightHeal));
		Npc_RemoveInvItems(slf,ItRu_SumGobSkel,Npc_HasItems(slf,ItRu_SumGobSkel));
		Npc_RemoveInvItems(slf,ItRu_InstantFireball,Npc_HasItems(slf,ItRu_InstantFireball));
		Npc_RemoveInvItems(slf,ItRu_Icebolt,Npc_HasItems(slf,ItRu_Icebolt));
		Npc_RemoveInvItems(slf,ItRu_SumWolf,Npc_HasItems(slf,ItRu_SumWolf));
		Npc_RemoveInvItems(slf,ItRu_Windfist,Npc_HasItems(slf,ItRu_Windfist));
		Npc_RemoveInvItems(slf,ItRu_Sleep,Npc_HasItems(slf,ItRu_Sleep));
		Npc_RemoveInvItems(slf,ItRu_MediumHeal,Npc_HasItems(slf,ItRu_MediumHeal));
		Npc_RemoveInvItems(slf,ItRu_LightningFlash,Npc_HasItems(slf,ItRu_LightningFlash));
		Npc_RemoveInvItems(slf,ItRu_ChargeFireball,Npc_HasItems(slf,ItRu_ChargeFireball));
		Npc_RemoveInvItems(slf,ItRu_SumSkel,Npc_HasItems(slf,ItRu_SumSkel));
		Npc_RemoveInvItems(slf,ItRu_Fear,Npc_HasItems(slf,ItRu_Fear));
		Npc_RemoveInvItems(slf,ItRu_IceCube,Npc_HasItems(slf,ItRu_IceCube));
		Npc_RemoveInvItems(slf,ItRu_ThunderBall,Npc_HasItems(slf,ItRu_ThunderBall));
		Npc_RemoveInvItems(slf,ItRu_SumGol,Npc_HasItems(slf,ItRu_SumGol));
		Npc_RemoveInvItems(slf,ItRu_HarmUndead,Npc_HasItems(slf,ItRu_HarmUndead));
		Npc_RemoveInvItems(slf,ItRu_Pyrokinesis,Npc_HasItems(slf,ItRu_Pyrokinesis));
		Npc_RemoveInvItems(slf,ItRu_Firestorm,Npc_HasItems(slf,ItRu_Firestorm));
		Npc_RemoveInvItems(slf,ItRu_IceWave,Npc_HasItems(slf,ItRu_IceWave));
		Npc_RemoveInvItems(slf,ItRu_SumDemon,Npc_HasItems(slf,ItRu_SumDemon));
		Npc_RemoveInvItems(slf,ItRu_FullHeal,Npc_HasItems(slf,ItRu_FullHeal));
		Npc_RemoveInvItems(slf,ItRu_Firerain,Npc_HasItems(slf,ItRu_Firerain));
		Npc_RemoveInvItems(slf,ItRu_BreathOfDeath,Npc_HasItems(slf,ItRu_BreathOfDeath));
		Npc_RemoveInvItems(slf,ItRu_MassDeath,Npc_HasItems(slf,ItRu_MassDeath));
		Npc_RemoveInvItems(slf,ItRu_ArmyOfDarkness,Npc_HasItems(slf,ItRu_ArmyOfDarkness));
		Npc_RemoveInvItems(slf,ItRu_Shrink,Npc_HasItems(slf,ItRu_Shrink));
		Npc_RemoveInvItems(slf,ItRu_Deathbolt,Npc_HasItems(slf,ItRu_Deathbolt));
		Npc_RemoveInvItems(slf,ItRu_Deathball,Npc_HasItems(slf,ItRu_Deathball));
		Npc_RemoveInvItems(slf,ItRu_Concussionbolt,Npc_HasItems(slf,ItRu_Concussionbolt));
		Npc_RemoveInvItems(slf,Fakescroll,Npc_HasItems(slf,Fakescroll));
		Npc_RemoveInvItems(slf,Fakescroll_Addon,Npc_HasItems(slf,Fakescroll_Addon));
		Npc_RemoveInvItems(slf,ItRu_Thunderstorm,Npc_HasItems(slf,ItRu_Thunderstorm));
		Npc_RemoveInvItems(slf,ItRu_Whirlwind,Npc_HasItems(slf,ItRu_Whirlwind));
		Npc_RemoveInvItems(slf,ItRu_Geyser,Npc_HasItems(slf,ItRu_Geyser));
		Npc_RemoveInvItems(slf,ItRu_Waterfist,Npc_HasItems(slf,ItRu_Waterfist));
		Npc_RemoveInvItems(slf,ItRu_Icelance,Npc_HasItems(slf,ItRu_Icelance));
		Npc_RemoveInvItems(slf,ItRu_BeliarsRage,Npc_HasItems(slf,ItRu_BeliarsRage));
		Npc_RemoveInvItems(slf,ItRu_SuckEnergy,Npc_HasItems(slf,ItRu_SuckEnergy));
		Npc_RemoveInvItems(slf,ItRu_GreenTentacle,Npc_HasItems(slf,ItRu_GreenTentacle));
		Npc_RemoveInvItems(slf,ItRu_Swarm,Npc_HasItems(slf,ItRu_Swarm));
		Npc_RemoveInvItems(slf,ItRu_Skull,Npc_HasItems(slf,ItRu_Skull));
		Npc_RemoveInvItems(slf,ItRu_SummonZombie,Npc_HasItems(slf,ItRu_SummonZombie));
		Npc_RemoveInvItems(slf,ItRu_SummonGuardian,Npc_HasItems(slf,ItRu_SummonGuardian));
	};
};

