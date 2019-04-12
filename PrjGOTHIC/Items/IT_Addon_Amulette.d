
const int Value_ItAm_Addon_Franco = 1200;
const int HP_ItAm_Addon_Franco = 40;
const int STR_Franco = 4;
const int DEX_Franco = 4;
const int Value_ItRi_Addon_Health_01 = 400;
const int Value_ItAm_Addon_Health = 800;
const int Value_ItRi_Addon_Mana_01 = 1000;
const int Value_ItAm_Addon_Mana = 2000;
const int Value_ItRi_Addon_STR_01 = 500;
const int Value_ItAm_Addon_STR = 1000;
const int HP_Ring_Solo_Bonus = 20;
const int HP_Ring_Double_Bonus = 60;
const int HP_Amulett_Solo_Bonus = 40;
const int HP_Amulett_EinRing_Bonus = 80;
const int HP_Amulett_Artefakt_Bonus = 160;
const int MA_Ring_Solo_Bonus = 5;
const int MA_Ring_Double_Bonus = 15;
const int MA_Amulett_Solo_Bonus = 10;
const int MA_Amulett_EinRing_Bonus = 20;
const int MA_Amulett_Artefakt_Bonus = 40;
const int STR_Ring_Solo_Bonus = 5;
const int STR_Ring_Double_Bonus = 15;
const int STR_Amulett_Solo_Bonus = 10;
const int STR_Amulett_EinRing_Bonus = 20;
const int STR_Amulett_Artefakt_Bonus = 40;

instance ItAm_Addon_Franco(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = Value_ItAm_Addon_Franco;
	visual = "ItAm_Hp_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItAm_Addon_Franco;
	on_unequip = UnEquip_ItAm_Addon_Franco;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Амулет Франко";
	text[2] = NAME_Bonus_Str;
	count[2] = STR_Franco;
	text[3] = NAME_Bonus_Dex;
	count[3] = DEX_Franco;
	text[4] = NAME_Bonus_HP;
	count[4] = HP_ItAm_Addon_Franco;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void Equip_ItAm_Addon_Franco()
{
	self.attribute[ATR_STRENGTH] += STR_Franco;
	self.attribute[ATR_DEXTERITY] += DEX_Franco;
	self.attribute[ATR_HITPOINTS_MAX] += HP_ItAm_Addon_Franco;
	self.attribute[ATR_HITPOINTS] += HP_ItAm_Addon_Franco;
};

func void UnEquip_ItAm_Addon_Franco()
{
	self.attribute[ATR_STRENGTH] -= STR_Franco;
	self.attribute[ATR_DEXTERITY] -= DEX_Franco;
	self.attribute[ATR_HITPOINTS_MAX] -= HP_ItAm_Addon_Franco;
	if(self.attribute[ATR_HITPOINTS] > (HP_ItAm_Addon_Franco + 2))
	{
		self.attribute[ATR_HITPOINTS] -= HP_ItAm_Addon_Franco;
	}
	else
	{
		self.attribute[ATR_HITPOINTS] = 2;
	};
};


instance ItAm_Addon_Health(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = Value_ItAm_Addon_Health;
	visual = "ItAm_Hp_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItAm_Addon_Health;
	on_unequip = UnEquip_ItAm_Addon_Health;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Амулет целителей";
	text[2] = NAME_Bonus_HP;
	count[2] = HP_Amulett_Solo_Bonus;
	text[3] = PRINT_Addon_KUMU_01;
	text[4] = PRINT_Addon_KUMU_02;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void Equip_ItAm_Addon_Health()
{
	var int OldValue;
	var int NewValue;
	OldValue = C_HP_ArtefaktValue();
	HP_Amulett_Equipped = TRUE;
	NewValue = C_HP_ArtefaktValue();
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + (NewValue - OldValue);
};

func void UnEquip_ItAm_Addon_Health()
{
	var int OldValue;
	var int NewValue;
	OldValue = C_HP_ArtefaktValue();
	HP_Amulett_Equipped = FALSE;
	NewValue = C_HP_ArtefaktValue();
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + (NewValue - OldValue);
};


instance ItRi_Addon_Health_01(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = Value_ItRi_Addon_Health_01;
	visual = "ItRi_Prot_Total_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Addon_Health_01;
	on_unequip = UnEquip_ItRi_Addon_Health_01;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Кольцо целителей";
	text[2] = NAME_Bonus_HP;
	count[2] = HP_Ring_Solo_Bonus;
	text[3] = PRINT_Addon_KUMU_01;
	text[4] = PRINT_Addon_KUMU_02;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_ItRi_Addon_Health_01()
{
	var int OldValue;
	var int NewValue;
	OldValue = C_HP_ArtefaktValue();
	HP_Ring_1_Equipped = TRUE;
	NewValue = C_HP_ArtefaktValue();
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + (NewValue - OldValue);
};

func void UnEquip_ItRi_Addon_Health_01()
{
	var int OldValue;
	var int NewValue;
	OldValue = C_HP_ArtefaktValue();
	HP_Ring_1_Equipped = FALSE;
	NewValue = C_HP_ArtefaktValue();
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + (NewValue - OldValue);
};


instance ItRi_Addon_Health_02(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = Value_ItRi_Addon_Health_01;
	visual = "ItRi_Prot_Total_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Addon_Health_02;
	on_unequip = UnEquip_ItRi_Addon_Health_02;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Кольцо целителей";
	text[2] = NAME_Bonus_HP;
	count[2] = HP_Ring_Solo_Bonus;
	text[3] = PRINT_Addon_KUMU_01;
	text[4] = PRINT_Addon_KUMU_02;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_ItRi_Addon_Health_02()
{
	var int OldValue;
	var int NewValue;
	OldValue = C_HP_ArtefaktValue();
	HP_Ring_2_Equipped = TRUE;
	NewValue = C_HP_ArtefaktValue();
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + (NewValue - OldValue);
};

func void UnEquip_ItRi_Addon_Health_02()
{
	var int OldValue;
	var int NewValue;
	OldValue = C_HP_ArtefaktValue();
	HP_Ring_2_Equipped = FALSE;
	NewValue = C_HP_ArtefaktValue();
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + (NewValue - OldValue);
};


instance ItAm_Addon_MANA(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = Value_ItAm_Addon_Mana;
	visual = "ItAm_Hp_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItAm_Addon_MANA;
	on_unequip = UnEquip_ItAm_Addon_MANA;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Амулет жрецов";
	text[2] = NAME_Bonus_Mana;
	count[2] = MA_Amulett_Solo_Bonus;
	text[3] = PRINT_Addon_KUMU_01;
	text[4] = PRINT_Addon_KUMU_02;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void Equip_ItAm_Addon_MANA()
{
	var int OldValue;
	var int NewValue;
	OldValue = C_MA_ArtefaktValue();
	MA_Amulett_Equipped = TRUE;
	NewValue = C_MA_ArtefaktValue();
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + (NewValue - OldValue);
};

func void UnEquip_ItAm_Addon_MANA()
{
	var int OldValue;
	var int NewValue;
	OldValue = C_MA_ArtefaktValue();
	MA_Amulett_Equipped = FALSE;
	NewValue = C_MA_ArtefaktValue();
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + (NewValue - OldValue);
};


instance ItRi_Addon_MANA_01(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = Value_ItRi_Addon_Mana_01;
	visual = "ItRi_Prot_Total_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Addon_MANA_01;
	on_unequip = UnEquip_ItRi_Addon_MANA_01;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Кольцо жрецов";
	text[2] = NAME_Bonus_Mana;
	count[2] = MA_Ring_Solo_Bonus;
	text[3] = PRINT_Addon_KUMU_01;
	text[4] = PRINT_Addon_KUMU_02;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_ItRi_Addon_MANA_01()
{
	var int OldValue;
	var int NewValue;
	OldValue = C_MA_ArtefaktValue();
	MA_Ring_1_Equipped = TRUE;
	NewValue = C_MA_ArtefaktValue();
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + (NewValue - OldValue);
};

func void UnEquip_ItRi_Addon_MANA_01()
{
	var int OldValue;
	var int NewValue;
	OldValue = C_MA_ArtefaktValue();
	MA_Ring_1_Equipped = FALSE;
	NewValue = C_MA_ArtefaktValue();
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + (NewValue - OldValue);
};


instance ItRi_Addon_MANA_02(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = Value_ItRi_Addon_Mana_01;
	visual = "ItRi_Prot_Total_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Addon_MANA_02;
	on_unequip = UnEquip_ItRi_Addon_MANA_02;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Кольцо жрецов";
	text[2] = NAME_Bonus_Mana;
	count[2] = MA_Ring_Solo_Bonus;
	text[3] = PRINT_Addon_KUMU_01;
	text[4] = PRINT_Addon_KUMU_02;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_ItRi_Addon_MANA_02()
{
	var int OldValue;
	var int NewValue;
	OldValue = C_MA_ArtefaktValue();
	MA_Ring_2_Equipped = TRUE;
	NewValue = C_MA_ArtefaktValue();
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + (NewValue - OldValue);
};

func void UnEquip_ItRi_Addon_MANA_02()
{
	var int OldValue;
	var int NewValue;
	OldValue = C_MA_ArtefaktValue();
	MA_Ring_2_Equipped = FALSE;
	NewValue = C_MA_ArtefaktValue();
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + (NewValue - OldValue);
};


instance ItAm_Addon_STR(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = Value_ItAm_Addon_STR;
	visual = "ItAm_Hp_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItAm_Addon_STR;
	on_unequip = UnEquip_ItAm_Addon_STR;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Амулет воинов";
	text[2] = NAME_Prot_Edge;
	count[2] = STR_Amulett_Solo_Bonus;
	text[3] = PRINT_Addon_KUMU_01;
	text[4] = PRINT_Addon_KUMU_02;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void Equip_ItAm_Addon_STR()
{
	var int OldValue;
	var int NewValue;
	OldValue = C_STR_ArtefaktValue();
	STR_Amulett_Equipped = TRUE;
	NewValue = C_STR_ArtefaktValue();
	self.protection[PROT_EDGE] += NewValue - OldValue;
	self.protection[PROT_BLUNT] += NewValue - OldValue;
};

func void UnEquip_ItAm_Addon_STR()
{
	var int OldValue;
	var int NewValue;
	OldValue = C_STR_ArtefaktValue();
	STR_Amulett_Equipped = FALSE;
	NewValue = C_STR_ArtefaktValue();
	self.protection[PROT_EDGE] += NewValue - OldValue;
	self.protection[PROT_BLUNT] += NewValue - OldValue;
};


instance ItRi_Addon_STR_01(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = Value_ItRi_Addon_STR_01;
	visual = "ItRi_Prot_Total_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Addon_STR_01;
	on_unequip = UnEquip_ItRi_Addon_STR_01;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Кольцо воинов";
	text[2] = NAME_Prot_Edge;
	count[2] = STR_Ring_Solo_Bonus;
	text[3] = PRINT_Addon_KUMU_01;
	text[4] = PRINT_Addon_KUMU_02;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_ItRi_Addon_STR_01()
{
	var int OldValue;
	var int NewValue;
	OldValue = C_STR_ArtefaktValue();
	STR_Ring_1_Equipped = TRUE;
	NewValue = C_STR_ArtefaktValue();
	self.protection[PROT_EDGE] += NewValue - OldValue;
	self.protection[PROT_BLUNT] += NewValue - OldValue;
};

func void UnEquip_ItRi_Addon_STR_01()
{
	var int OldValue;
	var int NewValue;
	OldValue = C_STR_ArtefaktValue();
	STR_Ring_1_Equipped = FALSE;
	NewValue = C_STR_ArtefaktValue();
	self.protection[PROT_EDGE] += NewValue - OldValue;
	self.protection[PROT_BLUNT] += NewValue - OldValue;
};


instance ItRi_Addon_STR_02(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = Value_ItRi_Addon_STR_01;
	visual = "ItRi_Prot_Total_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Addon_STR_02;
	on_unequip = UnEquip_ItRi_Addon_STR_02;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Кольцо воинов";
	text[2] = NAME_Prot_Edge;
	count[2] = STR_Ring_Solo_Bonus;
	text[3] = PRINT_Addon_KUMU_01;
	text[4] = PRINT_Addon_KUMU_02;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_ItRi_Addon_STR_02()
{
	var int OldValue;
	var int NewValue;
	OldValue = C_STR_ArtefaktValue();
	STR_Ring_2_Equipped = TRUE;
	NewValue = C_STR_ArtefaktValue();
	self.protection[PROT_EDGE] += NewValue - OldValue;
	self.protection[PROT_BLUNT] += NewValue - OldValue;
};

func void UnEquip_ItRi_Addon_STR_02()
{
	var int OldValue;
	var int NewValue;
	OldValue = C_STR_ArtefaktValue();
	STR_Ring_2_Equipped = FALSE;
	NewValue = C_STR_ArtefaktValue();
	self.protection[PROT_EDGE] += NewValue - OldValue;
	self.protection[PROT_BLUNT] += NewValue - OldValue;
};

