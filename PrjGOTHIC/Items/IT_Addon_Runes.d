
const int Value_Ru_Icelance = 1000;
const int Value_Ru_Whirlwind = 1000;
const int Value_Ru_Thunderstorm = 1500;
const int Value_Ru_Geyser = 1500;
const int Value_Ru_Waterfist = 2000;
const int Value_Ru_Greententacle = 2500;
const int Value_Ru_Swarm = 1500;
const int Value_Ru_Energyball = 3500;
const int Value_Ru_SuckEnergy = 3500;
const int Value_Ru_Skull = 2000;
const int Value_Ru_SummonGuardian = 2000;
const int Value_Ru_SummonZombie = 2000;
const int Value_Ru_Beliar = 100;
const int Value_Ru_Water = 200;

instance ItRu_Thunderstorm(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_Thunderstorm;
	visual = "ItRu_Water05.3DS";
	material = MAT_STONE;
	spell = SPL_Thunderstorm;
	mag_circle = 3;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER_BLUE";
	description = NAME_SPL_Thunderstorm;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Thunderstorm;
	text[2] = NAME_Damage;
	count[2] = SPL_DAMAGE_Thunderstorm;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_Whirlwind(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_Whirlwind;
	visual = "ItRu_Water02.3DS";
	material = MAT_STONE;
	spell = SPL_Whirlwind;
	mag_circle = 2;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER_BLUE";
	description = NAME_SPL_Whirlwind;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Whirlwind;
	text[2] = NAME_Sec_Duration;
	count[2] = SPL_TIME_WHIRLWIND;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_Geyser(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_Geyser;
	visual = "ItRu_Water01.3DS";
	material = MAT_STONE;
	spell = SPL_Geyser;
	mag_circle = 3;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER_BLUE";
	description = NAME_SPL_Geyser;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Geyser;
	text[2] = NAME_Damage;
	count[2] = SPL_DAMAGE_Geyser;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_Waterfist(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_Waterfist;
	visual = "ItRu_Water03.3DS";
	material = MAT_STONE;
	spell = SPL_WaterFist;
	mag_circle = 4;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER_BLUE";
	description = NAME_SPL_WaterFist;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Waterfist;
	text[2] = NAME_Damage;
	count[2] = SPL_DAMAGE_Waterfist;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_Icelance(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_Icelance;
	visual = "ItRu_Water04.3DS";
	material = MAT_STONE;
	spell = SPL_IceLance;
	mag_circle = 2;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER_BLUE";
	description = NAME_SPL_IceLance;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Icelance;
	text[2] = NAME_Damage;
	count[2] = SPL_DAMAGE_Icelance;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_BeliarsRage(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_Energyball;
	visual = "ItRu_Beliar04.3DS";
	material = MAT_STONE;
	spell = SPL_Energyball;
	mag_circle = 3;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER_RED";
	description = NAME_SPL_BeliarsRage;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Energyball;
	text[2] = NAME_Damage;
	count[2] = SPL_DAMAGE_Energyball;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_SuckEnergy(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_SuckEnergy;
	visual = "ItRu_Beliar01.3DS";
	material = MAT_STONE;
	spell = SPL_SuckEnergy;
	mag_circle = 2;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER_RED";
	description = NAME_SPL_SuckEnergy;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_SuckEnergy;
	text[2] = NAME_Damage;
	count[2] = SPL_SuckEnergy_Damage;
	text[3] = NAME_Sec_Duration;
	count[3] = SPL_TIME_SuckEnergy;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_GreenTentacle(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_Greententacle;
	visual = "ItRu_Beliar03.3DS";
	material = MAT_STONE;
	spell = SPL_GreenTentacle;
	mag_circle = 1;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER_RED";
	description = NAME_SPL_GreenTentacle;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Greententacle;
	text[2] = NAME_Sec_Duration;
	count[2] = SPL_TIME_Greententacle;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_Swarm(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_Swarm;
	visual = "ItRu_Beliar02.3DS";
	material = MAT_STONE;
	spell = SPL_Swarm;
	mag_circle = 4;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER_RED";
	description = NAME_SPL_Swarm;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Swarm;
	text[2] = NAME_Damage;
	count[2] = SPL_Swarm_Damage;
	text[3] = NAME_Sec_Duration;
	count[3] = SPL_TIME_Swarm;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_Skull(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_Skull;
	visual = "ItRu_Beliar05.3DS";
	material = MAT_STONE;
	spell = SPL_Skull;
	mag_circle = 5;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER_RED";
	description = NAME_SPL_Skull;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_MinManakosten;
	count[1] = SPL_Cost_Skull;
	text[2] = NAME_Addon_NeedsAllMana;
	text[4] = NAME_Damage;
	count[4] = SPL_Damage_Skull;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_SummonZombie(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_SummonZombie;
	visual = "ItRu_Beliar07.3DS";
	material = MAT_STONE;
	spell = SPL_SummonZombie;
	mag_circle = 4;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER_RED";
	description = NAME_SPL_SummonZombie;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_SummonZombie;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_SummonGuardian(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_SummonGuardian;
	visual = "ItRu_Beliar06.3DS";
	material = MAT_STONE;
	spell = SPL_SummonGuardian;
	mag_circle = 3;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER_RED";
	description = NAME_SPL_SummonGuardian;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_SummonGuardian;
	text[5] = NAME_Value;
	count[5] = value;
};

