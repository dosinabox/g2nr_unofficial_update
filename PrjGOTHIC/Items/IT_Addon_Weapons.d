
instance ItMW_Addon_Knife01(C_Item)
{
	name = "Волчий нож";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = Value_Wolfsmesser;
	damageTotal = Damage_Wolfsmesser;
	damagetype = DAM_EDGE;
	range = Range_Wolfsmesser;
	on_equip = Equip_1H_03;
	on_unequip = UnEquip_1H_03;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Wolfsmesser;
	visual = "ItMw_012_1h_Knife_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_1H;
	count[4] = Waffenbonus_03;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMW_Addon_Stab01(C_Item)
{
	name = "Посох мага";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = Value_Stab01;
	damageTotal = Damage_Stab01;
	damagetype = DAM_BLUNT;
	range = Range_Stab01;
	on_equip = Equip_2H_03;
	on_unequip = UnEquip_2H_03;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Stab01;
	visual = "ItMW_MageStaff_Good_2H_01.3DS";
	effect = "SPELLFX_MAGESTAFF1";
	description = "Посох мага огня";
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_2H;
	count[4] = Waffenbonus_03;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMW_Addon_Stab02(C_Item)
{
	name = "Магический посох";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = Value_Stab02;
	damageTotal = Damage_Stab02;
	damagetype = DAM_BLUNT;
	range = Range_Stab02;
	on_equip = Equip_Zauberstab;
	on_unequip = UnEquip_Zauberstab;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = Condition_Stab02;
	visual = "ItMW_MageStaff_Good_2H_02.3DS";
	effect = "SPELLFX_MAGESTAFF2";
	description = name;
	text[0] = NAME_Damage;
	count[0] = damageTotal;
	text[2] = NAME_Bonus_Mana;
	count[2] = 20;
	text[3] = NAME_Mana_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Equip_Zauberstab()
{
	if(Npc_IsPlayer(self))
	{
		Npc_ChangeAttribute(self,ATR_MANA_MAX,20);
		Npc_ChangeAttribute(self,ATR_MANA,20);
	};
};

func void UnEquip_Zauberstab()
{
	if(Npc_IsPlayer(self))
	{
		Npc_ChangeAttribute(self,ATR_MANA_MAX,-20);
		if(self.attribute[ATR_MANA] >= 20)
		{
			Npc_ChangeAttribute(self,ATR_MANA,-20);
		}
		else
		{
			self.attribute[ATR_MANA] = 0;
		};
	};
};


instance ItMW_Addon_Stab03(C_Item)
{
	name = "Посох Воды";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = Value_Stab03;
	damageTotal = Damage_Stab03;
	damagetype = DAM_BLUNT;
	range = Range_Stab03;
	on_equip = Equip_2H_04;
	on_unequip = UnEquip_2H_04;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Stab03;
	visual = "ItMW_MageStaff_Blades_2H_01.3DS";
	effect = "SPELLFX_MAGESTAFF3";
	description = "Посох магов воды";
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_2H;
	count[4] = Waffenbonus_04;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMW_Addon_Stab04(C_Item)
{
	name = "Посох Ультара";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = Value_Stab04;
	damageTotal = Damage_Stab04;
	damagetype = DAM_BLUNT;
	range = Range_Stab04;
	on_equip = Equip_2H_04;
	on_unequip = UnEquip_2H_04;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Stab04;
	visual = "ItMW_MageStaff_Good_2H_02.3DS";
	effect = "SPELLFX_MAGESTAFF4";
	description = "Ультар наделил этот посох магической силой";
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_2H;
	count[4] = Waffenbonus_04;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMW_Addon_Stab05(C_Item)
{
	name = "Тайфун";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = Value_Stab05;
	damageTotal = Damage_Stab05;
	damagetype = DAM_BLUNT;
	range = Range_Stab05;
	on_equip = Equip_2H_05;
	on_unequip = UnEquip_2H_05;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Stab05;
	visual = "ItMW_MageStaff_Blades_2H_01.3DS";
	effect = "SPELLFX_MAGESTAFF5";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_2H;
	count[4] = Waffenbonus_05;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMW_Addon_Hacker_1h_01(C_Item)
{
	name = "Мачете";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = Value_Machete;
	damageTotal = Damage_Machete;
	damagetype = DAM_EDGE;
	range = Range_Machete;
	on_equip = Equip_1H_03;
	on_unequip = UnEquip_1H_03;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Machete;
	visual = "ItMw_1H_Machete_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_1H;
	count[4] = Waffenbonus_03;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMW_Addon_Hacker_1h_02(C_Item)
{
	name = "Старое мачете";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = Value_AltMachete;
	damageTotal = Damage_AltMachete;
	damagetype = DAM_EDGE;
	range = Range_AltMachete;
	on_equip = Equip_1H_02;
	on_unequip = UnEquip_1H_02;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_AltMachete;
	visual = "ItMw_1H_Machete_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_1H;
	count[4] = Waffenbonus_02;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMW_Addon_Hacker_2h_01(C_Item)
{
	name = "Гигантское мачете";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = Value_Hacker;
	damageTotal = Damage_Hacker;
	damagetype = DAM_EDGE;
	range = Range_Hacker;
	on_equip = Equip_2H_03;
	on_unequip = UnEquip_2H_03;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Hacker;
	visual = "ItMw_2H_Machete_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_2H;
	count[4] = Waffenbonus_03;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMW_Addon_Hacker_2h_02(C_Item)
{
	name = "Старое гигантское мачете";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = Value_AltHacker;
	damageTotal = Damage_AltHacker;
	damagetype = DAM_EDGE;
	range = Range_AltHacker;
	on_equip = Equip_2H_02;
	on_unequip = UnEquip_2H_02;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_AltHacker;
	visual = "ItMw_2H_Machete_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_2H;
	count[4] = Waffenbonus_02;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMW_Addon_Keule_1h_01(C_Item)
{
	name = "Дубинка ветра";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = Value_Windknecht;
	damageTotal = Damage_Windknecht;
	damagetype = DAM_BLUNT;
	range = Range_Windknecht;
	on_equip = UnEquip_1H_10;
	on_unequip = Equip_1H_10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Windknecht;
	visual = "ItMW_Club_1H_01.3DS";
	description = name;
	text[0] = NAME_Damage;
	count[0] = damageTotal;
	text[2] = NAME_ADDON_MALUS_1H;
	count[2] = Waffenbonus_10;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMW_Addon_Keule_2h_01(C_Item)
{
	name = "Дубинка бури";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = Value_Sturmknecht;
	damageTotal = Damage_Sturmknecht;
	damagetype = DAM_BLUNT;
	range = Range_Sturmknecht;
	on_equip = UnEquip_2H_10;
	on_unequip = Equip_2H_10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Sturmknecht;
	visual = "ItMW_Club_2H_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_MALUS_2H;
	count[4] = Waffenbonus_10;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_FrancisDagger_Mis(C_Item)
{
	name = "Хороший кинжал";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 0;
	damageTotal = Damage_VLKDolch;
	damagetype = DAM_EDGE;
	range = Range_VLKDolch;
	on_equip = Equip_1H_05;
	on_unequip = UnEquip_1H_05;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_VLKDolch;
	visual = "Itmw_005_1h_dagger_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_1H;
	count[4] = Waffenbonus_05;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_RangerStaff_Addon(C_Item)
{
	name = "Посох Кольца воды";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = Value_RangerStaff;
	damageTotal = Damage_RangerStaff;
	damagetype = DAM_BLUNT;
	range = Range_RangerStaff;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_RangerStaff;
	visual = "ItMw_020_2h_Nov_Staff_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_Addon_PIR2hAxe(C_Item)
{
	name = "Крушитель досок";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = Value_PIR2hAxe;
	damageTotal = Damage_PIR2hAxe;
	damagetype = DAM_EDGE;
	range = Range_PIR2hAxe;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_PIR2hAxe;
	visual = "ItMw_070_2h_axe_heavy_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_Addon_PIR2hSword(C_Item)
{
	name = "Абордажная сабля";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = Value_PIR2hSword;
	damageTotal = Damage_PIR2hSword;
	damagetype = DAM_EDGE;
	range = Range_PIR2hAxe;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_PIR2hSword;
	visual = "ItMw_070_2h_sword_09.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_Addon_PIR1hAxe(C_Item)
{
	name = "Абордажная пика";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = Value_PIR1hAxe;
	damageTotal = Damage_PIR1hAxe;
	damagetype = DAM_EDGE;
	range = Range_PIR1hAxe;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_PIR1hAxe;
	visual = "ItMw_030_1h_axe_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_Addon_PIR1hSword(C_Item)
{
	name = "Абордажный нож";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = Value_PIR1hSword;
	damageTotal = Damage_PIR1hSword;
	damagetype = DAM_EDGE;
	range = Range_PIR1hSword;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_PIR1hSword;
	visual = "ItMw_030_1h_sword_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_Addon_BanditTrader(C_Item)
{
	name = "Рапира бандита";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = Value_BanditTrader;
	damageTotal = Damage_VLKSchwert;
	damagetype = DAM_EDGE;
	range = Range_VLKSchwert;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_VLKSchwert;
	visual = "ItMw_018_1h_SwordCane_01.3ds";
	description = name;
	text[1] = "На рукоятке нацарапана буква 'Ф.'";
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_Addon_Betty(C_Item)
{
	name = "Бетти";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Betty;
	damageTotal = Damage_Betty;
	damagetype = DAM_EDGE;
	range = Range_ElBastardo;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_ElBastardo;
	visual = "ItMw_065_1h_sword_bastard_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Addon_MagicArrow(C_Item)
{
	name = "Магическая стрела";
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_BOW | ITEM_MULTI;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ARROW";
	value = Value_Pfeil;
	visual = "ItRw_Arrow.3ds";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Addon_FireArrow(C_Item)
{
	name = "Огненная стрела";
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_BOW | ITEM_MULTI;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_FIREARROW";
	value = Value_Pfeil;
	visual = "ItRw_Arrow.3ds";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Addon_MagicBow(C_Item)
{
	name = "Магический лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = Value_MagicBow;
	damageTotal = Damage_MagicBow;
	damagetype = DAM_MAGIC;
	munition = ItRw_Addon_MagicArrow;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_BOW";
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_MagicBow;
	visual = "ItRw_Bow_H_04.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Addon_FireBow(C_Item)
{
	name = "Огненный лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = Value_FireBow;
	damageTotal = Damage_FireBow;
	damagetype = DAM_MAGIC;
	munition = ItRw_Addon_FireArrow;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_FIREBOW";
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_FireBow;
	visual = "ItRw_Bow_H_04.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Addon_MagicBolt(C_Item)
{
	name = "Магическая арбалетная стрела";
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_CROSSBOW | ITEM_MULTI;
	value = Value_Bolzen;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_BOLT";
	visual = "ItRw_Bolt.3ds";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Addon_MagicCrossbow(C_Item)
{
	name = "Магический арбалет";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_WOOD;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_CROSSBOW";
	value = Value_MagicCrossbow;
	damageTotal = Damage_MagicCrossbow;
	damagetype = DAM_MAGIC;
	munition = ItRw_Addon_MagicBolt;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_MagicCrossbow;
	visual = "ItRw_Crossbow_H_01.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

