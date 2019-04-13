
const string Name_PaladinScroll = "Магия Паладинов";

const int Value_Sc_PalLight = 50;
const int Value_Sc_PalLightHeal = 100;
const int Value_Sc_PalHolyBolt = 200;
const int Value_Sc_PalMediumHeal = 400;
const int Value_Sc_PalRepelEvil = 600;
const int Value_Sc_PalFullHeal = 800;
const int Value_Sc_PalDestroyEvil = 1000;
const int Value_Sc_Light = 10;
const int Value_Sc_Firebolt = 25;
const int Value_Sc_Charm = 100;
const int Value_Sc_Icebolt = 25;
const int Value_Sc_LightHeal = 25;
const int Value_Sc_SumGobSkel = 75;
const int Value_Sc_InstantFireball = 50;
const int Value_Sc_Zap = 60;
const int Value_Sc_SumWolf = 75;
const int Value_Sc_Windfist = 60;
const int Value_Sc_Sleep = 100;
const int Value_Sc_MediumHeal = 60;
const int Value_Sc_LightningFlash = 125;
const int Value_Sc_ChargeFireball = 60;
const int Value_Sc_SumSkel = 75;
const int Value_Sc_Fear = 75;
const int Value_Sc_IceCube = 100;
const int Value_Sc_ThunderBall = 75;
const int Value_Sc_SumGol = 150;
const int Value_Sc_HarmUndead = 75;
const int Value_Sc_Pyrokinesis = 150;
const int Value_Sc_Firestorm = 100;
const int Value_Sc_IceWave = 200;
const int Value_Sc_SumDemon = 200;
const int Value_Sc_FullHeal = 200;
const int Value_Sc_Firerain = 250;
const int Value_Sc_BreathOfDeath = 250;
const int Value_Sc_MassDeath = 250;
const int Value_Sc_ArmyOfDarkness = 250;
const int Value_Sc_Shrink = 250;
const int Value_Sc_TrfSheep = 25;
const int Value_Sc_TrfScavenger = 50;
const int Value_Sc_TrfGiantRat = 50;
const int Value_Sc_TrfGiantBug = 60;
const int Value_Sc_TrfWolf = 75;
const int Value_Sc_TrfWaran = 80;
const int Value_Sc_TrfSnapper = 125;
const int Value_Sc_TrfWarg = 125;
const int Value_Sc_TrfFireWaran = 200;
const int Value_Sc_TrfLurker = 80;
const int Value_Sc_TrfShadowbeast = 200;
const int Value_Sc_TrfDragonSnapper = 200;

instance ItSc_PalLight(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_PalLight;
	visual = "ItSc_PalLight.3DS";
	material = MAT_LEATHER;
	spell = SPL_PalLight;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_PalLight;
	text[0] = Name_PaladinScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll;
	text[2] = NAME_Duration;
	count[2] = SPL_Duration_PalLIGHT;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_PalLightHeal(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_PalLightHeal;
	visual = "ItSc_PalLightHeal.3DS";
	material = MAT_LEATHER;
	spell = SPL_PalLightHeal;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_PalLightHeal;
	text[0] = Name_PaladinScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll;
	text[2] = NAME_HealingPerCast;
	count[2] = SPL_Heal_PalLightHeal;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_PalHolyBolt(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_PalHolyBolt;
	visual = "ItSc_PalHolyBolt.3DS";
	material = MAT_LEATHER;
	spell = SPL_PalHolyBolt;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_PalHolyBolt;
	text[0] = Name_PaladinScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll;
	text[2] = NAME_Dam_Magic;
	count[2] = SPL_Damage_PalHolyBolt;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_PalMediumHeal(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_PalMediumHeal;
	visual = "ItSc_PalMediumHeal.3DS";
	material = MAT_LEATHER;
	spell = SPL_PalMediumHeal;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_PalMediumHeal;
	text[0] = Name_PaladinScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll;
	text[2] = NAME_HealingPerCast;
	count[2] = SPL_Heal_PalMediumHeal;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_PalRepelEvil(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_PalRepelEvil;
	visual = "ItSc_PalRepelEvil.3DS";
	material = MAT_LEATHER;
	spell = SPL_PalRepelEvil;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_PalRepelEvil;
	text[0] = Name_PaladinScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll;
	text[2] = NAME_Dam_Magic;
	count[2] = SPL_Damage_PalRepelEvil;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_PalFullHeal(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_PalFullHeal;
	visual = "ItSc_PalFullHeal.3DS";
	material = MAT_LEATHER;
	spell = SPL_PalFullHeal;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_PalFullHeal;
	text[0] = Name_PaladinScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll;
	text[2] = NAME_HealingPerCast;
	count[2] = SPL_Heal_PalFullHeal;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_PalDestroyEvil(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_PalDestroyEvil;
	visual = "ItSc_PalDestroyEvil.3DS";
	material = MAT_LEATHER;
	spell = SPL_PalDestroyEvil;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_PalDestroyEvil;
	text[0] = Name_PaladinScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll;
	text[2] = NAME_Dam_Magic;
	count[2] = SPL_Damage_PalDestroyEvil;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_Light(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_Light;
	visual = "ItSc_Light.3DS";
	material = MAT_LEATHER;
	spell = SPL_Light;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_LIGHT;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll;
	text[2] = NAME_Duration;
	count[2] = SPL_Duration_LIGHT;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_Firebolt(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_Firebolt;
	visual = "ItSc_Firebolt.3DS";
	material = MAT_LEATHER;
	spell = SPL_Firebolt;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_Firebolt;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll;
	text[2] = NAME_Dam_Magic;
	count[2] = SPL_Damage_Firebolt;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_Icebolt(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_Icebolt;
	visual = "ItSc_Icebolt.3DS";
	material = MAT_LEATHER;
	spell = SPL_Icebolt;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER_BLUE";
	description = NAME_SPL_Icebolt;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll;
	text[2] = NAME_Dam_Magic;
	count[2] = SPL_DAMAGE_Icebolt;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_LightHeal(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_LightHeal;
	visual = "ItSc_LightHeal.3DS";
	material = MAT_LEATHER;
	spell = SPL_LightHeal;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_LightHeal;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll;
	text[2] = NAME_HealingPerCast;
	count[2] = SPL_Heal_LightHeal;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_SumGobSkel(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_SumGobSkel;
	visual = "ItSc_SumGobSkel.3DS";
	material = MAT_LEATHER;
	spell = SPL_SummonGoblinSkeleton;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_SummonGoblinSkeleton;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_InstantFireball(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_InstantFireball;
	visual = "ItSc_InstantFireball.3DS";
	material = MAT_LEATHER;
	spell = SPL_InstantFireball;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER_YELLOW";
	description = NAME_SPL_InstantFireball;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll;
	text[2] = NAME_Dam_Magic;
	count[2] = SPL_DAMAGE_InstantFireball;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_Zap(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_Zap;
	visual = "ItSc_Zap.3DS";
	material = MAT_LEATHER;
	spell = SPL_Zap;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_Zap;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll;
	text[2] = NAME_Dam_Magic;
	count[2] = SPL_Damage_Zap;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_SumWolf(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_SumWolf;
	visual = "ItSc_SumWolf.3DS";
	material = MAT_LEATHER;
	spell = SPL_SummonWolf;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_SummonWolf;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_Windfist(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_Windfist;
	visual = "ItSc_Windfist.3DS";
	material = MAT_LEATHER;
	spell = SPL_WindFist;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = STEP_WindFist;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_WINDFIST;
	text[0] = NAME_MageScroll;
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

instance ItSc_Sleep(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_Sleep;
	visual = "ItSc_Sleep.3DS";
	material = MAT_LEATHER;
	spell = SPL_Sleep;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_Sleep;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll;
	text[2] = NAME_Sec_Duration;
	count[2] = SPL_TIME_Sleep;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_Charm(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_Charm;
	visual = "ItSc_Sleep.3DS";
	material = MAT_LEATHER;
	spell = SPL_Charm;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_Charm;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_MediumHeal(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_MediumHeal;
	visual = "ItSc_MediumHeal.3DS";
	material = MAT_LEATHER;
	spell = SPL_MediumHeal;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_MediumHeal;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll;
	text[2] = NAME_HealingPerCast;
	count[2] = SPL_Heal_MediumHeal;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_LightningFlash(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_LightningFlash;
	visual = "ItSc_LightningFlash.3DS";
	material = MAT_LEATHER;
	spell = SPL_LightningFlash;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_LightningFlash;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll;
	text[2] = NAME_Dam_Magic;
	count[2] = SPL_Damage_LightningFlash;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_ChargeFireBall(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_ChargeFireball;
	visual = "ItSc_ChargeFireball.3DS";
	material = MAT_LEATHER;
	spell = SPL_ChargeFireball;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = STEP_ChargeFireball;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER_YELLOW";
	description = NAME_SPL_ChargeFireball;
	text[0] = NAME_MageScroll;
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

instance ItSc_SumSkel(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_SumSkel;
	visual = "ItSc_SumSkel.3DS";
	material = MAT_LEATHER;
	spell = SPL_SummonSkeleton;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_SummonSkeleton;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_Fear(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_Fear;
	visual = "ItSc_Fear.3DS";
	material = MAT_LEATHER;
	spell = SPL_Fear;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_Fear;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll;
	text[2] = NAME_Sec_Duration;
	count[2] = SPL_TIME_Fear;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_IceCube(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_IceCube;
	visual = "ItSc_IceCube.3DS";
	material = MAT_LEATHER;
	spell = SPL_IceCube;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER_BLUE";
	description = NAME_SPL_IceCube;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll;
	text[2] = NAME_Damage;
	count[2] = 60;
	text[3] = NAME_Sec_Duration;
	count[3] = SPL_TIME_FREEZE;
	text[4] = NAME_DamagePerSec;
	count[4] = SPL_FREEZE_DAMAGE;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_ThunderBall(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_ThunderBall;
	visual = "ItSc_ThunderBall.3DS";
	material = MAT_LEATHER;
	spell = SPL_ChargeZap;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = STEP_ChargeZap;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_ChargeZap;
	text[0] = NAME_MageScroll;
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

instance ItSc_SumGol(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_SumGol;
	visual = "ItSc_SumGol.3DS";
	material = MAT_LEATHER;
	spell = SPL_SummonGolem;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_SummonGolem;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_HarmUndead(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_HarmUndead;
	visual = "ItSc_HarmUndead.3DS";
	material = MAT_LEATHER;
	spell = SPL_DestroyUndead;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_DestroyUndead;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll;
	text[2] = NAME_Dam_Magic;
	count[2] = SPL_Damage_DESTROYUNDEAD;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_Pyrokinesis(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_Pyrokinesis;
	visual = "ItSc_Pyrokinesis.3DS";
	material = MAT_LEATHER;
	spell = SPL_Pyrokinesis;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = STEP_Firestorm;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER_YELLOW";
	description = NAME_SPL_Pyrokinesis;
	text[0] = NAME_MageScroll;
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

instance ItSc_Firestorm(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_Firestorm;
	visual = "ItSc_Firestorm.3DS";
	material = MAT_LEATHER;
	spell = SPL_Firestorm;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER_YELLOW";
	description = NAME_SPL_Firestorm;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll;
	text[2] = NAME_Dam_Magic;
	count[2] = SPL_Damage_InstantFireStorm;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_IceWave(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_IceWave;
	visual = "ItSc_IceWave.3DS";
	material = MAT_LEATHER;
	spell = SPL_IceWave;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER_BLUE";
	description = NAME_SPL_IceWave;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll;
	text[2] = NAME_Damage;
	count[2] = 60;
	text[3] = NAME_Sec_Duration;
	count[3] = SPL_TIME_FREEZE;
	text[4] = NAME_DamagePerSec;
	count[4] = SPL_FREEZE_DAMAGE;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_SumDemon(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_SumDemon;
	visual = "ItSc_SumDemon.3DS";
	material = MAT_LEATHER;
	spell = SPL_SummonDemon;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_SummonDemon;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_FullHeal(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_FullHeal;
	visual = "ItSc_FullHeal.3DS";
	material = MAT_LEATHER;
	spell = SPL_FullHeal;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_FullHeal;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll;
	text[2] = NAME_HealingPerCast;
	count[2] = SPL_Heal_FullHeal;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_Firerain(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_Firerain;
	visual = "ItSc_Firerain.3DS";
	material = MAT_LEATHER;
	spell = SPL_Firerain;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER_YELLOW";
	description = NAME_SPL_Firerain;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll;
	text[2] = NAME_Dam_Fire;
	count[2] = SPL_Damage_FireRain;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_BreathOfDeath(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_BreathOfDeath;
	visual = "ItSc_BreathOfDeath.3ds";
	material = MAT_LEATHER;
	spell = SPL_BreathOfDeath;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER_RED";
	description = NAME_SPL_BreathOfDeath;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll;
	text[2] = NAME_Dam_Magic;
	count[2] = SPL_Damage_BreathOfDeath;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_MassDeath(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_MassDeath;
	visual = "ItSc_MassDeath.3ds";
	material = MAT_LEATHER;
	spell = SPL_MassDeath;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER_RED";
	description = NAME_SPL_MassDeath;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll;
	text[2] = NAME_Dam_Magic;
	count[2] = SPL_Damage_MassDeath;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_ArmyOfDarkness(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_ArmyOfDarkness;
	visual = "ItSc_ArmyOfDarkness.3DS";
	material = MAT_LEATHER;
	spell = SPL_ArmyOfDarkness;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER_RED";
	description = NAME_SPL_ArmyOfDarkness;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_Shrink(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_Shrink;
	visual = "ItSc_Shrink.3DS";
	material = MAT_LEATHER;
	spell = SPL_Shrink;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_Shrink;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_TrfSheep(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_TrfSheep;
	visual = "ItSc_TrfSheep.3DS";
	material = MAT_LEATHER;
	spell = SPL_TrfSheep;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_TrfSheep;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_TrfScavenger(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_TrfScavenger;
	visual = "ItSc_TrfScavenger.3DS";
	material = MAT_LEATHER;
	spell = SPL_TrfScavenger;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_TrfScavenger;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_TrfGiantRat(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_TrfGiantRat;
	visual = "ItSc_TrfGiantRat.3DS";
	material = MAT_LEATHER;
	spell = SPL_TrfGiantRat;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_TrfGiantRat;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_TrfGiantBug(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_TrfGiantBug;
	visual = "ItSc_TrfGiantBug.3DS";
	material = MAT_LEATHER;
	spell = SPL_TrfGiantBug;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_TrfGiantBug;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_TrfWolf(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_TrfWolf;
	visual = "ItSc_TrfWolf.3DS";
	material = MAT_LEATHER;
	spell = SPL_TrfWolf;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_TrfWolf;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_TrfWaran(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_TrfWaran;
	visual = "ItSc_TrfWaran.3DS";
	material = MAT_LEATHER;
	spell = SPL_TrfWaran;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_TrfWaran;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_TrfSnapper(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_TrfSnapper;
	visual = "ItSc_TrfSnapper.3DS";
	material = MAT_LEATHER;
	spell = SPL_TrfSnapper;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_TrfSnapper;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_TrfWarg(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_TrfWarg;
	visual = "ItSc_TrfWarg.3DS";
	material = MAT_LEATHER;
	spell = SPL_TrfWarg;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_TrfWarg;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_TrfFireWaran(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_TrfFireWaran;
	visual = "ItSc_TrfFireWaran.3DS";
	material = MAT_LEATHER;
	spell = SPL_TrfFireWaran;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_TrfFireWaran;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_TrfLurker(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_TrfLurker;
	visual = "ItSc_TrfLurker.3DS";
	material = MAT_LEATHER;
	spell = SPL_TrfLurker;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_TrfLurker;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_TrfShadowbeast(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_TrfShadowbeast;
	visual = "ItSc_TrfShadowbeast.3DS";
	material = MAT_LEATHER;
	spell = SPL_TrfShadowbeast;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_TrfShadowbeast;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_TrfDragonSnapper(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_TrfDragonSnapper;
	visual = "ItSc_TrfDragonSnapper.3DS";
	material = MAT_LEATHER;
	spell = SPL_TrfDragonSnapper;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_TrfDragonSnapper;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll;
	text[5] = NAME_Value;
	count[5] = value;
};

