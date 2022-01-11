
const int Value_HpEssenz = 25;
const int HP_Essenz = 50;
const int Value_HpExtrakt = 35;
const int HP_Extrakt = 70;
const int Value_HpElixier = 50;
const int HP_Elixier = 100;
const int Value_ManaEssenz = 25;
const int Mana_Essenz = 50;
const int Value_ManaExtrakt = 40;
const int Mana_Extrakt = 75;
const int Value_ManaElixier = 60;
const int Mana_Elixier = 100;
const int Value_StrElixier = 1600;
const int STR_Elixier = 3;
const int Value_DexElixier = 1600;
const int DEX_Elixier = 3;
const int Value_HpMaxElixier = 1500;
const int HPMax_Elixier = 20;
const int Value_ManaMaxElixier = 1500;
const int ManaMax_Elixier = 5;
const int Value_MegaDrink = 1800;
const int STRorDEX_MegaDrink = 15;
const int Value_Speed = 200;
const int Time_Speed = 300000;
const int Value_ManaTrunk = 200;
const int Value_HpTrunk = 150;

instance ItPo_Mana_01(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = Value_ManaEssenz;
	visual = "ItPo_Mana_01.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_Mana_01;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_MANAPOTION";
	description = NAME_Mana_Essenz;
	text[1] = NAME_Bonus_Mana;
	count[1] = Mana_Essenz;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseItPo_Mana_01()
{
	Npc_ChangeAttribute(self,ATR_MANA,Mana_Essenz);
};


instance ItPo_Mana_02(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = Value_ManaExtrakt;
	visual = "ItPo_Mana_02.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_Mana_02;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_MANAPOTION";
	description = NAME_Mana_Extrakt;
	text[1] = NAME_Bonus_Mana;
	count[1] = Mana_Extrakt;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseItPo_Mana_02()
{
	Npc_ChangeAttribute(self,ATR_MANA,Mana_Extrakt);
};


instance ItPo_Mana_03(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = Value_ManaElixier;
	visual = "ItPo_Mana_03.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_Mana_03;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_MANAPOTION";
	description = NAME_Mana_Elixier;
	text[1] = NAME_Bonus_Mana;
	count[1] = Mana_Elixier;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseItPo_Mana_03()
{
	Npc_ChangeAttribute(self,ATR_MANA,Mana_Elixier);
};


instance ItPo_Health_01(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = Value_HpEssenz;
	visual = "ItPo_Health_01.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_Health_01;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_HEALTHPOTION";
	description = NAME_HP_Essenz;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Essenz;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseItPo_Health_01()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Essenz);
};


instance ItPo_Health_02(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = Value_HpExtrakt;
	visual = "ItPo_Health_02.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_Health_02;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_HEALTHPOTION";
	description = NAME_HP_Extrakt;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Extrakt;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseItPo_Health_02()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Extrakt);
};


instance ItPo_Health_03(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = Value_HpElixier;
	visual = "ItPo_Health_03.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_Health_03;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_HEALTHPOTION";
	description = NAME_HP_Elixier;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Elixier;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseItPo_Health_03()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Elixier);
};


instance ItPo_Perm_STR(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = Value_StrElixier;
	visual = "ItPo_Perm_STR.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_Perm_STR;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = NAME_STR_Elixier;
	text[1] = NAME_Bonus_Str;
	count[1] = STR_Elixier;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseItPo_Perm_STR()
{
	B_RaiseAttributeByPermBonus(self,ATR_STRENGTH,STR_Elixier);
};


instance ItPo_Perm_DEX(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = Value_DexElixier;
	visual = "ItPo_Perm_DEX.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_Perm_DEX;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = NAME_DEX_Elixier;
	text[1] = NAME_Bonus_Dex;
	count[1] = DEX_Elixier;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseItPo_Perm_DEX()
{
	B_RaiseAttributeByPermBonus(self,ATR_DEXTERITY,DEX_Elixier);
};


instance ItPo_Perm_Health(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = Value_HpMaxElixier;
	visual = "ItPo_Perm_Health.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_Perm_Health;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_HEALTHPOTION";
	description = NAME_HPMax_Elixier;
	text[1] = NAME_Bonus_HpMax;
	count[1] = HPMax_Elixier;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseItPo_Perm_Health()
{
	B_RaiseAttributeByPermBonus(self,ATR_HITPOINTS_MAX,HPMax_Elixier);
};


instance ItPo_Perm_Mana(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = Value_ManaMaxElixier;
	visual = "ItPo_Perm_Mana.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_Perm_Mana;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_MANAPOTION";
	description = NAME_ManaMax_Elixier;
	text[1] = NAME_Bonus_ManaMax;
	count[1] = ManaMax_Elixier;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseItPo_Perm_Mana()
{
	B_RaiseAttributeByPermBonus(self,ATR_MANA_MAX,ManaMax_Elixier);
};


instance ItPo_Speed(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = Value_Speed;
	visual = "ItPo_Speed.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_Speed;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = NAME_Speed_Elixier;
	text[0] = PRINT_Speed;
	text[1] = NAME_Duration;
	count[1] = Time_Speed / 60000;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseItPo_Speed()
{
	Mdl_ApplyOverlayMdsTimed(self,"Humans_Sprint.mds",Time_Speed);
};


instance ItPo_MegaDrink(C_Item)
{
	name = NAME_MegaDrink;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = Value_MegaDrink;
	visual = "ItPo_Special_01.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_MegaDrink;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = name;
	text[0] = TEXT_MegaDrink_Setting_Desc;
	text[1] = TEXT_MegaDrink_Setting;
	count[1] = COUNT_MegaDrink_Setting;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseItPo_MegaDrink()
{
	if(self.attribute[ATR_STRENGTH] < self.attribute[ATR_DEXTERITY])
	{
		B_RaiseAttributeByPermBonus(self,ATR_DEXTERITY,STRorDEX_MegaDrink);
	}
	else
	{
		B_RaiseAttributeByPermBonus(self,ATR_STRENGTH,STRorDEX_MegaDrink);
	};
	self.attribute[ATR_MANA] = 0;
	Snd_Play("DEM_Warn");
	TEXT_MegaDrink_Setting_Desc = TEXT_MegaDrink_Setting_Desc_Print;
	TEXT_MegaDrink_Setting = TEXT_MegaDrink_Setting_Print;
	COUNT_MegaDrink_Setting = STRorDEX_MegaDrink;
	MegaDrink_Used = TRUE;
};

instance ItPo_Perm_MushroomMana(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = 1700;
	visual = "ItPo_Perm_MushroomMana.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_MushroomMana;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_MANAPOTION";
	description = NAME_MushroomMana;
	text[1] = NAME_Bonus_ManaMax;
	count[1] = MushroomManaBonus;
	text[2] = NAME_Bonus_Mana_Full;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseItPo_MushroomMana()
{
	B_RaiseAttributeByPermBonus(self,ATR_MANA_MAX,MushroomManaBonus);
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
};

instance ItPo_Perm_AppleSTR(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = 600;
	visual = "ItPo_Perm_AppleSTR.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_Perm_AppleSTR;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_MANAPOTION";
	description = NAME_AppleSTR;
	text[1] = NAME_Bonus_Str;
	count[1] = AppleSTRBonus;
	text[2] = NAME_Bonus_HP_Full;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseItPo_Perm_AppleSTR()
{
	B_RaiseAttributeByPermBonus(self,ATR_STRENGTH,AppleSTRBonus);
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
};

