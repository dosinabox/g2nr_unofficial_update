
const string Name_PaladinSpell = "Магия Паладинов";

const int Value_Ru_PalLight = 500;
const int Value_Ru_PalLightHeal = 500;
const int Value_Ru_PalHolyBolt = 500;
const int Value_Ru_PalMediumHeal = 2000;
const int Value_Ru_PalRepelEvil = 2000;
const int Value_Ru_PalFullHeal = 3000;
const int Value_Ru_PalDestroyEvil = 3000;
const int Value_Ru_Light = 500;
const int Value_Ru_Firebolt = 500;
const int Value_Ru_Zap = 500;
const int Value_Ru_LightHeal = 500;
const int Value_Ru_SumGobSkel = 500;
const int Value_Ru_InstantFireball = 1000;
const int Value_Ru_Icebolt = 1000;
const int Value_Ru_SumWolf = 1000;
const int Value_Ru_Windfist = 1000;
const int Value_Ru_Sleep = 1000;
const int Value_Ru_MediumHeal = 1500;
const int Value_Ru_SumSkel = 1500;
const int Value_Ru_Fear = 1500;
const int Value_Ru_IceCube = 1500;
const int Value_Ru_ThunderBall = 1500;
const int Value_Ru_Firestorm = 1500;
const int Value_Ru_SumGol = 2000;
const int Value_Ru_HarmUndead = 2000;
const int Value_Ru_LightningFlash = 2000;
const int Value_Ru_ChargeFireball = 2000;
const int Value_Ru_IceWave = 2500;
const int Value_Ru_SumDemon = 2500;
const int Value_Ru_FullHeal = 2500;
const int Value_Ru_Pyrokinesis = 2500;
const int Value_Ru_Firerain = 3000;
const int Value_Ru_BreathOfDeath = 3000;
const int Value_Ru_MassDeath = 3000;
const int Value_Ru_MasterOfDisaster = 3000;
const int Value_Ru_ArmyOfDarkness = 3000;
const int Value_Ru_Shrink = 3000;
const int Value_Ru_PalTeleportSecret = 500;
const int Value_Ru_TeleportSeaport = 500;
const int Value_Ru_TeleportMonastery = 500;
const int Value_Ru_TeleportFarm = 500;
const int Value_Ru_TeleportXardas = 500;
const int Value_Ru_TeleportPassNW = 500;
const int Value_Ru_TeleportPassOW = 500;
const int Value_Ru_TeleportOC = 500;
const int Value_Ru_TeleportOWDemonTower = 500;
const int Value_Ru_TeleportTaverne = 500;
const int Value_Ru_Teleport_3 = 500;

instance ItRu_PalLight(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_PalLight;
	visual = "ItRu_PalLight.3ds";
	material = MAT_STONE;
	spell = SPL_PalLight;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_PalLight;
	text[0] = Name_PaladinSpell;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_PalLight;
	text[2] = NAME_Duration;
	count[2] = SPL_Duration_PalLIGHT;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_PalLightHeal(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_PalLightHeal;
	visual = "ItRu_PalLightHeal.3ds";
	material = MAT_STONE;
	spell = SPL_PalLightHeal;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_PalLightHeal;
	text[0] = Name_PaladinSpell;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_PalLightHeal;
	text[2] = NAME_HealingPerCast;
	count[2] = SPL_Heal_PalLightHeal;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_PalMediumHeal(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_PalMediumHeal;
	visual = "ItRu_PalMediumHeal.3ds";
	material = MAT_STONE;
	spell = SPL_PalMediumHeal;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_PalMediumHeal;
	text[0] = Name_PaladinSpell;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_PalMediumHeal;
	text[2] = NAME_HealingPerCast;
	count[2] = SPL_Heal_PalMediumHeal;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_PalFullHeal(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_PalFullHeal;
	visual = "ItRu_PalFullHeal.3ds";
	material = MAT_STONE;
	spell = SPL_PalFullHeal;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_PalFullHeal;
	text[0] = Name_PaladinSpell;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_PalFullHeal;
	text[2] = NAME_HealingPerCast;
	count[2] = SPL_Heal_PalFullHeal;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_PalHolyBolt(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_PalHolyBolt;
	visual = "ItRu_PalHolyBolt.3DS";
	material = MAT_STONE;
	spell = SPL_PalHolyBolt;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_PalHolyBolt;
	text[0] = Name_PaladinSpell;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_PalHolyBolt;
	text[2] = NAME_Dam_Magic;
	count[2] = SPL_Damage_PalHolyBolt;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_PalRepelEvil(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_PalRepelEvil;
	visual = "ItRu_PalRepelEvil.3DS";
	material = MAT_STONE;
	spell = SPL_PalRepelEvil;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_PalRepelEvil;
	text[0] = Name_PaladinSpell;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_PalRepelEvil;
	text[2] = NAME_Dam_Magic;
	count[2] = SPL_Damage_PalRepelEvil;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_PalDestroyEvil(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_PalDestroyEvil;
	visual = "ItRu_PalDestroyEvil.3DS";
	material = MAT_STONE;
	spell = SPL_PalDestroyEvil;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_PalDestroyEvil;
	text[0] = Name_PaladinSpell;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_PalDestroyEvil;
	text[2] = NAME_Dam_Magic;
	count[2] = SPL_Damage_PalDestroyEvil;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_PalTeleportSecret(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_PalTeleportSecret;
	visual = "ItRu_PalTeleportSecret.3DS";
	material = MAT_STONE;
	spell = SPL_PalTeleportSecret;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_PalTeleportSecret;
	text[0] = Name_PaladinSpell;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Teleport;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_TeleportSeaport(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_TeleportSeaport;
	visual = "ItRu_TeleportSeaport.3ds";
	material = MAT_STONE;
	spell = SPL_TeleportSeaport;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_TeleportSeaport;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Teleport;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_TeleportMonastery(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_TeleportMonastery;
	visual = "ItRu_TeleportMonastery.3ds";
	material = MAT_STONE;
	spell = SPL_TeleportMonastery;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_TeleportMonastery;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Teleport;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_TeleportFarm(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_TeleportFarm;
	visual = "ItRu_TeleportFarm.3ds";
	material = MAT_STONE;
	spell = SPL_TeleportFarm;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_TeleportFarm;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Teleport;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_TeleportXardas(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_TeleportXardas;
	visual = "ItRu_TeleportXardas.3ds";
	material = MAT_STONE;
	spell = SPL_TeleportXardas;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_TeleportXardas;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Teleport;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_TeleportPassNW(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_TeleportPassNW;
	visual = "ItRu_TeleportPassNW.3ds";
	material = MAT_STONE;
	spell = SPL_TeleportPassNW;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_TeleportPassNW;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Teleport;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_TeleportPassOW(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_TeleportPassOW;
	visual = "ItRu_TeleportPassOW.3ds";
	material = MAT_STONE;
	spell = SPL_TeleportPassOW;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_TeleportPassOW;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Teleport;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_TeleportOC(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_TeleportOC;
	visual = "ItRu_TeleportOC.3ds";
	material = MAT_STONE;
	spell = SPL_TeleportOC;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_TeleportOC;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Teleport;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_TeleportOWDemonTower(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_TeleportOWDemonTower;
	visual = "ItRu_Teleport_2.3ds";
	material = MAT_STONE;
	spell = SPL_TeleportOWDemonTower;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_TeleportOWDemonTower;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Teleport;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_TeleportTaverne(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_TeleportTaverne;
	visual = "ItRu_Teleport_2.3ds";
	material = MAT_STONE;
	spell = SPL_TeleportTaverne;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_TeleportTaverne;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Teleport;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_Teleport_3(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_Teleport_3;
	visual = "ItRu_Teleport_3.3ds";
	material = MAT_STONE;
	spell = SPL_Teleport_3;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_Teleport_3;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Teleport;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_Light(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_Light;
	visual = "ItRu_Light.3ds";
	material = MAT_STONE;
	spell = SPL_Light;
	mag_circle = 1;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_LIGHT;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_LIGHT;
	text[2] = NAME_Duration;
	count[2] = SPL_Duration_LIGHT;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_FireBolt(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_Firebolt;
	visual = "ItRu_FireBolt.3DS";
	material = MAT_STONE;
	spell = SPL_Firebolt;
	mag_circle = 1;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER_YELLOW";
	description = NAME_SPL_Firebolt;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Firebolt;
	text[2] = NAME_Dam_Magic;
	count[2] = SPL_Damage_Firebolt;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_Zap(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_Zap;
	visual = "ItRu_Zap.3DS";
	material = MAT_STONE;
	mag_circle = 1;
	spell = SPL_Zap;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_Zap;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Zap;
	text[2] = NAME_Dam_Magic;
	count[2] = SPL_Damage_Zap;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_LightHeal(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_LightHeal;
	visual = "ItRu_LightHeal.3ds";
	material = MAT_STONE;
	spell = SPL_LightHeal;
	mag_circle = 1;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_LightHeal;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_LightHeal;
	text[2] = NAME_HealingPerCast;
	count[2] = SPL_Heal_LightHeal;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_SumGobSkel(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_SumGobSkel;
	visual = "ItRu_SumGobSkel.3DS";
	material = MAT_STONE;
	spell = SPL_SummonGoblinSkeleton;
	mag_circle = 1;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_SummonGoblinSkeleton;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_SummonGoblinSkeleton;
	text[2] = "Блуждающие кости";
	text[3] = "мертвых гоблинов.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_InstantFireball(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_InstantFireball;
	visual = "ItRu_InstantFireball.3DS";
	material = MAT_STONE;
	mag_circle = 2;
	spell = SPL_InstantFireball;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER_YELLOW";
	description = NAME_SPL_InstantFireball;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_COST_InstantFireball;
	text[2] = NAME_Dam_Magic;
	count[2] = SPL_DAMAGE_InstantFireball;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_Icebolt(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_Icebolt;
	visual = "ItRu_Icebolt.3ds";
	material = MAT_STONE;
	spell = SPL_Icebolt;
	mag_circle = 2;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER_BLUE";
	description = NAME_SPL_Icebolt;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_COST_Icebolt;
	text[2] = NAME_Dam_Magic;
	count[2] = SPL_DAMAGE_Icebolt;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_SumWolf(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_SumWolf;
	visual = "ItRu_SumWolf.3DS";
	material = MAT_STONE;
	spell = SPL_SummonWolf;
	mag_circle = 2;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_SummonWolf;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_SummonWolf;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_Windfist(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_Windfist;
	visual = "ItRu_Windfist.3ds";
	material = MAT_STONE;
	spell = SPL_WindFist;
	mag_circle = 2;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_WINDFIST;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_MinManakosten;
	count[1] = STEP_WindFist;
	text[2] = NAME_ManakostenMax;
	count[2] = SPL_Cost_WindFist;
	text[3] = NAME_Addon_Damage_Min;
	count[3] = SPL_Damage_Windfist;
	text[4] = NAME_Damage_Max;
	count[4] = SPL_Damage_Windfist * 4;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_Sleep(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_Sleep;
	visual = "ItRu_Sleep.3ds";
	material = MAT_STONE;
	spell = SPL_Sleep;
	mag_circle = 2;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_Sleep;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Sleep;
	text[2] = NAME_Sec_Duration;
	count[2] = SPL_TIME_Sleep;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_MediumHeal(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_MediumHeal;
	visual = "ItRu_MediumHeal.3ds";
	material = MAT_STONE;
	spell = SPL_MediumHeal;
	mag_circle = 3;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_MediumHeal;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_MediumHeal;
	text[2] = NAME_HealingPerCast;
	count[2] = SPL_Heal_MediumHeal;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_LightningFlash(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_LightningFlash;
	visual = "ItRu_LightningFlash.3DS";
	material = MAT_STONE;
	mag_circle = 4;
	spell = SPL_LightningFlash;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_LightningFlash;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_LightningFlash;
	text[2] = NAME_Dam_Magic;
	count[2] = SPL_Damage_LightningFlash;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_ChargeFireball(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_ChargeFireball;
	visual = "ItRu_ChargeFireball.3DS";
	material = MAT_STONE;
	mag_circle = 4;
	spell = SPL_ChargeFireball;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER_YELLOW";
	description = NAME_SPL_ChargeFireball;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_MinManakosten;
	count[1] = STEP_ChargeFireball;
	text[2] = NAME_ManakostenMax;
	count[2] = SPL_COST_ChargeFireball;
	text[3] = NAME_Addon_Damage_Min;
	count[3] = SPL_Damage_ChargeFireball;
	text[4] = NAME_Damage_Max;
	count[4] = SPL_Damage_ChargeFireball * 4;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_SumSkel(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_SumSkel;
	visual = "ItRu_SumSkel.3DS";
	material = MAT_STONE;
	spell = SPL_SummonSkeleton;
	mag_circle = 3;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_SummonSkeleton;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_SummonSkeleton;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_Fear(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_Fear;
	visual = "ItRu_Fear.3DS";
	material = MAT_STONE;
	mag_circle = 3;
	spell = SPL_Fear;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_Fear;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Fear;
	text[2] = NAME_Sec_Duration;
	count[2] = SPL_TIME_Fear;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_IceCube(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_IceCube;
	visual = "ItRu_IceCube.3ds";
	material = MAT_STONE;
	spell = SPL_IceCube;
	mag_circle = 3;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER_BLUE";
	description = NAME_SPL_IceCube;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_IceCube;
	text[2] = NAME_Damage;
	count[2] = 60;
	text[3] = NAME_Sec_Duration;
	count[3] = SPL_TIME_FREEZE;
	text[4] = NAME_DamagePerSec;
	count[4] = SPL_FREEZE_DAMAGE;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_ThunderBall(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_ThunderBall;
	visual = "ItRu_ThunderBall.3ds";
	material = MAT_STONE;
	spell = SPL_ChargeZap;
	mag_circle = 3;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_ChargeZap;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_MinManakosten;
	count[1] = STEP_ChargeZap;
	text[2] = NAME_ManakostenMax;
	count[2] = SPL_COST_ChargeZap;
	text[3] = NAME_Addon_Damage_Min;
	count[3] = SPL_Damage_ChargeZap;
	text[4] = NAME_Damage_Max;
	count[4] = SPL_Damage_ChargeZap * 4;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_SumGol(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_SumGol;
	visual = "ItRu_SumGol.3DS";
	material = MAT_STONE;
	spell = SPL_SummonGolem;
	mag_circle = 4;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_SummonGolem;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_SummonGolem;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_HarmUndead(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_HarmUndead;
	visual = "ItRu_HarmUndead.3DS";
	material = MAT_STONE;
	spell = SPL_DestroyUndead;
	mag_circle = 4;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_DestroyUndead;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_DESTROYUNDEAD;
	text[2] = NAME_Dam_Magic;
	count[2] = SPL_Damage_DESTROYUNDEAD;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_Pyrokinesis(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_Pyrokinesis;
	visual = "ItRu_Pyrokinesis.3ds";
	material = MAT_STONE;
	spell = SPL_Pyrokinesis;
	mag_circle = 5;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER_YELLOW";
	description = NAME_SPL_Pyrokinesis;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_MinManakosten;
	count[1] = STEP_Firestorm;
	text[2] = NAME_ManakostenMax;
	count[2] = SPL_COST_Firestorm;
	text[3] = NAME_Addon_Damage_Min;
	count[3] = SPL_Damage_Firestorm;
	text[4] = NAME_Damage_Max;
	count[4] = SPL_Damage_Firestorm * 4;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_Firestorm(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_Firestorm;
	visual = "ItRu_Firestorm.3ds";
	material = MAT_STONE;
	spell = SPL_Firestorm;
	mag_circle = 3;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER_YELLOW";
	description = NAME_SPL_Firestorm;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_InstantFireStorm;
	text[2] = NAME_Dam_Magic;
	count[2] = SPL_Damage_InstantFireStorm;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_IceWave(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_IceWave;
	visual = "ItRu_IceWave.3ds";
	material = MAT_STONE;
	spell = SPL_IceWave;
	mag_circle = 5;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER_BLUE";
	description = NAME_SPL_IceWave;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_IceWave;
	text[2] = NAME_Damage;
	count[2] = 60;
	text[3] = NAME_Sec_Duration;
	count[3] = SPL_TIME_FREEZE;
	text[4] = NAME_DamagePerSec;
	count[4] = SPL_FREEZE_DAMAGE;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_SumDemon(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_SumDemon;
	visual = "ItRu_SumDemon.3DS";
	material = MAT_STONE;
	spell = SPL_SummonDemon;
	mag_circle = 5;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_SummonDemon;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_SummonDemon;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_FullHeal(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_FullHeal;
	visual = "ItRu_FullHeal.3ds";
	material = MAT_STONE;
	spell = SPL_FullHeal;
	mag_circle = 5;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_FullHeal;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_FullHeal;
	text[2] = NAME_HealingPerCast;
	count[2] = SPL_Heal_FullHeal;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_Firerain(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_Firerain;
	visual = "ItRu_Firerain.3ds";
	material = MAT_STONE;
	spell = SPL_Firerain;
	mag_circle = 6;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER_YELLOW";
	description = NAME_SPL_Firerain;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Firerain;
	text[2] = NAME_Dam_Magic;
	count[2] = SPL_Damage_FireRain;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_BreathOfDeath(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_BreathOfDeath;
	visual = "ItRu_BreathOfDeath.3ds";
	material = MAT_STONE;
	spell = SPL_BreathOfDeath;
	mag_circle = 6;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER_RED";
	description = NAME_SPL_BreathOfDeath;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_BreathOfDeath;
	text[2] = NAME_Dam_Magic;
	count[2] = SPL_Damage_BreathOfDeath;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_MassDeath(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = Value_Ru_MassDeath;
	visual = "ItRu_MassDeath.3ds";
	material = MAT_STONE;
	spell = SPL_MassDeath;
	mag_circle = 6;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER_RED";
	description = NAME_SPL_MassDeath;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_MassDeath;
	text[2] = NAME_Dam_Magic;
	count[2] = SPL_Damage_MassDeath;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_MasterOfDisaster(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_MasterOfDisaster;
	visual = "ItRu_MasterOfDesaster.3DS";
	material = MAT_STONE;
	spell = SPL_MasterOfDisaster;
	mag_circle = 6;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER_RED";
	description = NAME_SPL_MasterOfDisaster;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_COST_MasterOfDisaster;
	text[2] = NAME_Dam_Magic;
	count[2] = SPL_DAMAGE_MasterOfDisaster;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_ArmyOfDarkness(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_ArmyOfDarkness;
	visual = "ItRu_ArmyOfDarkness.3DS";
	material = MAT_STONE;
	spell = SPL_ArmyOfDarkness;
	mag_circle = 6;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER_RED";
	description = NAME_SPL_ArmyOfDarkness;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_ArmyOfDarkness;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_Shrink(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_Shrink;
	visual = "ItRu_Shrink.3DS";
	material = MAT_STONE;
	spell = SPL_Shrink;
	mag_circle = 6;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_Shrink;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Shrink;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_Deathbolt(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 0;
	visual = "ItRu_PalRepelEvil.3DS";
	material = MAT_STONE;
	spell = SPL_Deathbolt;
	mag_circle = 6;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = "Стрела смерти";
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_COST_Deathbolt;
	text[2] = NAME_Dam_Magic;
	count[2] = SPL_DAMAGE_Deathbolt;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_Deathball(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 0;
	visual = "ItRu_PalRepelEvil.3DS";
	material = MAT_STONE;
	spell = SPL_Deathball;
	mag_circle = 6;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = "Шар смерти";
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_COST_Deathball;
	text[2] = NAME_Dam_Magic;
	count[2] = SPL_DAMAGE_Deathball;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_Concussionbolt(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 0;
	visual = "ItRu_PalRepelEvil.3DS";
	material = MAT_STONE;
	spell = SPL_ConcussionBolt;
	mag_circle = 6;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = "Стрела сотрясения";
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_COST_Concussionbolt;
	text[2] = NAME_Dam_Magic;
	count[2] = SPL_DAMAGE_Concussionbolt;
	text[5] = NAME_Value;
	count[5] = value;
};

