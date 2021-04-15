
var int OHTHelmet_Equipped;
var int DHTHelmet_Equipped;
var int DJGMHelmet_Equipped;
var int DJGHHelmet_Equipped;
var int PALMHelmet_Equipped;
var int PALHHelmet_Equipped;

func void Equip_Helmet()
{
	if(Npc_IsPlayer(self))
	{
		B_UnEquipHeroItem(ITAR_PAL_M);
		B_UnEquipHeroItem(ITAR_PAL_H);
		B_UnEquipHeroItem(ITAR_DJG_M);
		B_UnEquipHeroItem(ITAR_DJG_H);
		B_UnEquipHeroItem(ITAR_PIR_H_Addon);
		B_UnEquipHeroItem(ITAR_PAL_Skel);
		B_UnEquipHeroItem(ITAR_Dementor);
		B_UnEquipHeroItem(ITAR_Judge);
	};
};

INSTANCE ITHE_OHT(C_Item)
{
	name = "Шлем охотника на орков";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 5;
	protection[PROT_BLUNT] = 5;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 5;
	value = 1000;
	wear = WEAR_Head;
	visual = "ITHE_OHT.3ds";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = Equip_ITHE_OHT;
	on_unequip = UnEquip_ITHE_OHT;
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


func void Equip_ITHE_OHT()
{
	Equip_Helmet();
	OHTHelmet_Equipped = TRUE;
};

func void UnEquip_ITHE_OHT()
{
	OHTHelmet_Equipped = FALSE;
};

INSTANCE ITHE_DHT(C_Item)
{
	name = "Шлем охотника на демонов";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 5;
	protection[PROT_BLUNT] = 5;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 5;
	value = 1000;
	wear = WEAR_Head;
	visual = "ITHE_DHT.3ds";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = Equip_ITHE_DHT;
	on_unequip = UnEquip_ITHE_DHT;
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


func void Equip_ITHE_DHT()
{
	Equip_Helmet();
	DHTHelmet_Equipped = TRUE;
};

func void UnEquip_ITHE_DHT()
{
	DHTHelmet_Equipped = FALSE;
};

INSTANCE ITHE_DJG_M(C_Item)
{
	name = "Шлем охотника на драконов";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 5;
	protection[PROT_BLUNT] = 5;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 5;
	value = 1000;
	wear = WEAR_Head;
	visual = "ITHE_DJG_M.3ds";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = Equip_ITHE_DJG_M;
	on_unequip = UnEquip_ITHE_DJG_M;
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


func void Equip_ITHE_DJG_M()
{
	Equip_Helmet();
	DJGMHelmet_Equipped = TRUE;
};

func void UnEquip_ITHE_DJG_M()
{
	DJGMHelmet_Equipped = FALSE;
};

INSTANCE ITHE_DJG_H(C_Item)
{
	name = "Крепкий шлем охотника на драконов";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 10;
	protection[PROT_BLUNT] = 10;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 10;
	value = 2000;
	wear = WEAR_Head;
	visual = "ITHE_DJG_H.3ds";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = Equip_ITHE_DJG_H;
	on_unequip = UnEquip_ITHE_DJG_H;
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


func void Equip_ITHE_DJG_H()
{
	Equip_Helmet();
	DJGHHelmet_Equipped = TRUE;
};

func void UnEquip_ITHE_DJG_H()
{
	DJGHHelmet_Equipped = FALSE;
};

INSTANCE ITHE_PAL_M(C_Item)
{
	name = "Кольчужный капюшон";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 5;
	protection[PROT_BLUNT] = 5;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 5;
	value = 1000;
	wear = WEAR_Head;
	visual = "ITHE_PAL_M.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ITHE_PAL_M;
	on_unequip = UnEquip_ITHE_PAL_M;
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
	inv_zbias = 130;
};


func void Equip_ITHE_PAL_M()
{
	Equip_Helmet();
	PALMHelmet_Equipped = TRUE;
};

func void UnEquip_ITHE_PAL_M()
{
	PALMHelmet_Equipped = FALSE;
};

INSTANCE ITHE_PAL_H(C_Item)
{
	name = "Шлем паладина";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 10;
	protection[PROT_BLUNT] = 10;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 10;
	value = 2000;
	wear = WEAR_Head;
	visual = "ITHE_PAL_H.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ITHE_PAL_H;
	on_unequip = UnEquip_ITHE_PAL_H;
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
	inv_zbias = 130;
};


func void Equip_ITHE_PAL_H()
{
	Equip_Helmet();
	PALHHelmet_Equipped = TRUE;
};

func void UnEquip_ITHE_PAL_H()
{
	PALHHelmet_Equipped = FALSE;
};

