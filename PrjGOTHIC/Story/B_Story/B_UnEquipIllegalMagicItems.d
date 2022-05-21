
func int C_PredictedMana(var int value)
{
	return self.attribute[ATR_MANA_MAX] - value;
};

func void B_UnEquipIllegalMagicItems(var int value)
{
	if(UnionActivated == TRUE)
	{
		if(C_PredictedMana(value) < (Condition_Stab02 + Zauberstab_ManaBonus))
		{
			B_UnEquipHeroItem(ItMW_Addon_Stab02);
		};
	};
	if(C_PredictedMana(value) < STEP_Firestorm)
	{
		B_UnEquipHeroItem(ItSc_Pyrokinesis);
	};
	if(C_PredictedMana(value) < STEP_ChargeFireball)
	{
		B_UnEquipHeroItem(ItSc_ChargeFireBall);
	};
	if(C_PredictedMana(value) < STEP_WindFist)
	{
		B_UnEquipHeroItem(ItSc_Windfist);
	};
	if(C_PredictedMana(value) < STEP_ChargeZap)
	{
		B_UnEquipHeroItem(ItSc_ThunderBall);
	};
};

func void B_UnEquipAllCircleRunes()
{
	B_UnEquipHeroItem(ItRu_Thunderstorm);
	B_UnEquipHeroItem(ItRu_Whirlwind);
	B_UnEquipHeroItem(ItRu_Geyser);
	B_UnEquipHeroItem(ItRu_Waterfist);
	B_UnEquipHeroItem(ItRu_Icelance);
	B_UnEquipHeroItem(ItRu_Inflate);
	B_UnEquipHeroItem(ItRu_Light);
	B_UnEquipHeroItem(ItRu_FireBolt);
	B_UnEquipHeroItem(ItRu_Zap);
	B_UnEquipHeroItem(ItRu_LightHeal);
	B_UnEquipHeroItem(ItRu_SumGobSkel);
	B_UnEquipHeroItem(ItRu_InstantFireball);
	B_UnEquipHeroItem(ItRu_Icebolt);
	B_UnEquipHeroItem(ItRu_SumWolf);
	B_UnEquipHeroItem(ItRu_Windfist);
	B_UnEquipHeroItem(ItRu_Sleep);
	B_UnEquipHeroItem(ItRu_MediumHeal);
	B_UnEquipHeroItem(ItRu_LightningFlash);
	B_UnEquipHeroItem(ItRu_ChargeFireball);
	B_UnEquipHeroItem(ItRu_SumSkel);
	B_UnEquipHeroItem(ItRu_Fear);
	B_UnEquipHeroItem(ItRu_IceCube);
	B_UnEquipHeroItem(ItRu_ThunderBall);
	B_UnEquipHeroItem(ItRu_SumGol);
	B_UnEquipHeroItem(ItRu_HarmUndead);
	B_UnEquipHeroItem(ItRu_Pyrokinesis);
	B_UnEquipHeroItem(ItRu_Firestorm);
	B_UnEquipHeroItem(ItRu_IceWave);
	B_UnEquipHeroItem(ItRu_SumDemon);
	B_UnEquipHeroItem(ItRu_FullHeal);
	B_UnEquipHeroItem(ItRu_Firerain);
	B_UnEquipHeroItem(ItRu_BreathOfDeath);
	B_UnEquipHeroItem(ItRu_MassDeath);
	B_UnEquipHeroItem(ItRu_MasterOfDisaster);
	B_UnEquipHeroItem(ItRu_ArmyOfDarkness);
	B_UnEquipHeroItem(ItRu_Shrink);
	B_UnEquipHeroItem(ItRu_Deathbolt);
	B_UnEquipHeroItem(ItRu_Deathball);
	B_UnEquipHeroItem(ItRu_Concussionbolt);
};

