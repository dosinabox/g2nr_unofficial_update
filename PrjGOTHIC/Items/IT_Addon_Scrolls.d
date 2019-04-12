
const int Value_Sc_Water = 1;
const int Value_Sc_IceLance = 100;
const int Value_Sc_Whirlwind = 200;
const int Value_Sc_Geyser = 100;
const int Value_Sc_Thunderstorm = 200;
const int Value_Sc_Waterfist = 100;

instance ItSc_Geyser(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_Geyser;
	visual = "ItSc_Water01.3DS";
	material = MAT_LEATHER;
	spell = SPL_Geyser;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_Geyser;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll;
	text[2] = NAME_Damage;
	count[2] = SPL_DAMAGE_Geyser;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_Icelance(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_IceLance;
	visual = "ItSc_Water04.3DS";
	material = MAT_LEATHER;
	spell = SPL_IceLance;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_IceLance;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll;
	text[2] = NAME_Damage;
	count[2] = SPL_DAMAGE_Icelance;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_Waterfist(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_Waterfist;
	visual = "ItSc_Water03.3DS";
	material = MAT_LEATHER;
	spell = SPL_WaterFist;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_WaterFist;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll;
	text[2] = NAME_Damage;
	count[2] = SPL_DAMAGE_Waterfist;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_Thunderstorm(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_Thunderstorm;
	visual = "ItSc_Water05.3DS";
	material = MAT_LEATHER;
	spell = SPL_Thunderstorm;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_Thunderstorm;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll;
	text[2] = NAME_Damage;
	count[2] = SPL_DAMAGE_Thunderstorm;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_Whirlwind(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_Whirlwind;
	visual = "ItSc_Water02.3DS";
	material = MAT_LEATHER;
	spell = SPL_Whirlwind;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_Whirlwind;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll;
	text[2] = NAME_Sec_Duration;
	count[2] = SPL_TIME_WHIRLWIND;
	text[5] = NAME_Value;
	count[5] = value;
};

