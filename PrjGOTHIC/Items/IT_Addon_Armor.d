
const int VALUE_ITAR_PIR_L_Addon = 1100;
const int VALUE_ITAR_PIR_M_Addon = 1300;
const int VALUE_ITAR_PIR_H_Addon = 1500;
const int VALUE_ITAR_Thorus_Addon = 1300;
const int VALUE_ITAR_Raven_Addon = 1300;
const int VALUE_ITAR_OreBaron_Addon = 3000;
const int VALUE_ITAR_RANGER_Addon = 1300;
const int VALUE_ITAR_KDW_L_Addon = 700;
const int VALUE_ITAR_Bloodwyn_Addon = 1300;

instance ITAR_PIR_L_Addon(C_Item)
{
	name = "Одежда пирата";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 40;
	protection[PROT_BLUNT] = 40;
	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 0;	//15;
	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_PIR_L_Addon;
	wear = WEAR_TORSO;
	visual = "ItAr_PIR_L_ADDON.3ds";
	visual_change = "Armor_Pir_L_Addon.ASC";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = Equip_OpenArmor;
	on_unequip = UnEquip_OpenArmor;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_PIR_M_Addon(C_Item)
{
	name = "Доспехи пирата";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 55;
	protection[PROT_BLUNT] = 55;
	protection[PROT_POINT] = 55;
	protection[PROT_FIRE] = 0;	//15;
	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_PIR_M_Addon;
	wear = WEAR_TORSO;
	visual = "ItAr_PIR_M_ADDON.3ds";
	visual_change = "Armor_PIR_M_ADDON.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = Equip_OpenArmor;
	on_unequip = UnEquip_OpenArmor;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_PIR_H_Addon(C_Item)
{
	name = "Одежда капитана";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 60;
	protection[PROT_BLUNT] = 60;
	protection[PROT_POINT] = 60;
	protection[PROT_FIRE] = 0;	//15;
	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_PIR_H_Addon;
	wear = WEAR_TORSO;
	visual = "ItAr_PIR_H_ADDON.3ds";
	visual_change = "Armor_PIR_H_ADDON.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = Equip_ArmorSet;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_Thorus_Addon(C_Item)
{
	name = "Доспехи стражи Ворона";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 70;
	protection[PROT_BLUNT] = 70;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 0;	//20;
	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_Thorus_Addon;
	wear = WEAR_TORSO;
	visual = "ItAr_Thorus_ADDON.3ds";
	visual_change = "Armor_Thorus_ADDON.asc";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	text[0] = PRINT_Addon_BDTArmor;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_Raven_Addon(C_Item)
{
	name = "Доспехи Ворона";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 100;
	protection[PROT_BLUNT] = 100;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 100;
	protection[PROT_MAGIC] = 100;
	value = VALUE_ITAR_Raven_Addon;
	wear = WEAR_TORSO;
	visual = "ItAr_Raven_ADDON.3ds";
	visual_change = "Armor_Raven_ADDON.asc";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_OreBaron_Addon(C_Item)
{
	name = "Доспехи рудного барона";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 80;
	protection[PROT_BLUNT] = 80;
	protection[PROT_POINT] = 80;
	protection[PROT_FIRE] = 5;	//20
	protection[PROT_MAGIC] = 10;
	value = VALUE_ITAR_OreBaron_Addon;
	wear = WEAR_TORSO;
	visual = "ItAr_CHAOS_ADDON.3ds";
	visual_change = "Armor_CHAOS_ADDON.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[0] = PRINT_Addon_BDTArmor;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_RANGER_Addon(C_Item)
{
	name = "Доспехи 'Кольца Воды'";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 50;
	protection[PROT_BLUNT] = 50;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 0;	//15;
	protection[PROT_MAGIC] = 10;
	value = VALUE_ITAR_RANGER_Addon;
	wear = WEAR_TORSO;
	visual = "ItAr_Ranger_ADDON.3ds";
	visual_change = "Armor_Ranger_ADDON.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_Fake_RANGER(C_Item)
{
	name = "Разбитые доспехи";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 50;
	protection[PROT_BLUNT] = 50;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 10;
	value = VALUE_ITAR_RANGER_Addon;
	wear = WEAR_TORSO;
	visual = "ItAr_Ranger_ADDON.3ds";
	visual_change = "Armor_Ranger_ADDON.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_KDW_L_Addon(C_Item)
{
	name = "Легкая мантия мага Воды";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 50;
	protection[PROT_BLUNT] = 50;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 25;
	protection[PROT_MAGIC] = 25;
	value = VALUE_ITAR_KDW_L_Addon;
	wear = WEAR_TORSO;
	visual = "ItAr_KDW_L_ADDON.3ds";
	visual_change = "Armor_KDW_L_ADDON.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_Bloodwyn_Addon(C_Item)
{
	name = "Средние доспехи стражника";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 70;
	protection[PROT_BLUNT] = 70;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 0;	//15;
	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_Bloodwyn_Addon;
	wear = WEAR_TORSO;
	visual = "ItAr_Bloodwyn_ADDON.3ds";
	visual_change = "Armor_Bloodwyn_ADDON.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[0] = PRINT_Addon_BDTArmor;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_MayaZombie_Addon(C_Item)
{
	name = "Доспехи древного воина";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 50;
	protection[PROT_BLUNT] = 50;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 50;
	protection[PROT_MAGIC] = 50;
	value = 0;
	wear = WEAR_TORSO;
	visual = "ItAr_MayaZombie_ADDON.3ds";
	visual_change = "Armor_MayaZombie_Addon.asc";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
//	text[5] = NAME_Value;
//	count[5] = value;
};

instance ITAR_FireArmor_Addon(C_Item)
{
	name = "Магическая мантия";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 100;
	protection[PROT_BLUNT] = 100;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 50;
	protection[PROT_MAGIC] = 50;
	value = VALUE_ITAR_XARDAS;
	wear = WEAR_TORSO | WEAR_EFFECT;
	effect = "SPELLFX_FIREARMOR";
	visual = "ItAr_Xardas.3ds";
	visual_change = "Armor_Xardas.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

