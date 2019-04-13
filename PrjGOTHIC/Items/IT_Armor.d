
const int VALUE_ITAR_Governor = 1100;
const int VALUE_ITAR_Judge = 0;
const int VALUE_ITAR_Smith = 0;
const int VALUE_ITAR_Barkeeper = 0;
const int VALUE_ITAR_Vlk_L = 100;	//120
const int VALUE_ITAR_Vlk_M = 120;
const int VALUE_ITAR_Vlk_H = 150;	//120
const int VALUE_ITAR_VlkBabe_L = 0;
const int VALUE_ITAR_VlkBabe_M = 0;
const int VALUE_ITAR_VlkBabe_H = 0;
const int VALUE_ITAR_MIL_L = 600;
const int VALUE_ITAR_MIL_M = 2500;
const int VALUE_ITAR_PAL_M = 5000;
const int VALUE_ITAR_PAL_H = 20000;
const int VALUE_ITAR_Bau_L = 80;
const int VALUE_ITAR_Bau_M = 100;
const int VALUE_ITAR_BauBabe_L = 0;
const int VALUE_ITAR_BauBabe_M = 0;
const int VALUE_ITAR_SLD_L = 500;
const int VALUE_ITAR_SLD_M = 1000;
const int VALUE_ITAR_DJG_Crawler = 1500;
const int VALUE_ITAR_SLD_S = 2000;	//Цена новой брони наемника
const int VALUE_ITAR_SLD_H = 2500;
const int VALUE_ITAR_NOV_L = 280;
const int VALUE_ITAR_KDF_L = 500;
const int VALUE_ITAR_KDF_H = 3000;
const int VALUE_ITAR_Leather_L = 250;
const int VALUE_ITAR_BDT_M = 550;
const int VALUE_ITAR_BDT_H = 2100;
const int VALUE_ITAR_DJG_L = 3000;
const int VALUE_ITAR_DJG_M = 12000;
const int VALUE_ITAR_DJG_H = 20000;
const int VALUE_ITAR_DJG_Babe = 0;
const int VALUE_ITAR_Xardas = 15000;
const int VALUE_ITAR_Lester = 300;
const int VALUE_ITAR_Diego = 450;
const int VALUE_ITAR_CorAngar = 600;
const int VALUE_ITAR_Dementor = 500;
const int VALUE_ITAR_KDW_H = 450;
const int VALUE_ITAR_Prisoner = 10;

instance ITAR_Governor(C_Item)
{
	name = "Изысканный дублет";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 40;
	protection[PROT_BLUNT] = 40;
	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 15;	//0;
	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_Governor;
	wear = WEAR_TORSO;
	visual = "ItAr_Governor.3ds";
	visual_change = "Armor_Governor.asc";
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

instance ITAR_Judge(C_Item)
{
	name = "Мантия судьи";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 10;
	protection[PROT_BLUNT] = 10;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 15;	//0;
	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_Judge;
	wear = WEAR_TORSO;
	visual = "ItAr_Governor.3DS";
	visual_change = "Armor_Judge.asc";
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

instance ITAR_Smith(C_Item)
{
	name = "Одежда кузнеца";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 15;
	protection[PROT_BLUNT] = 15;
	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 15;	//5;
	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_Smith;
	wear = WEAR_TORSO;
	visual = "ItAr_Smith.3DS";
	visual_change = "Armor_Smith.asc";
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

instance ITAR_Barkeeper(C_Item)
{
	name = "Одежда трактирщика";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 10;
	protection[PROT_BLUNT] = 10;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 15;	//0;
	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_Barkeeper;
	wear = WEAR_TORSO;
	visual = "ItAr_Wirt.3DS";
	visual_change = "Armor_Barkeeper.asc";
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

instance ITAR_Vlk_L(C_Item)
{
	name = "Простой городской костюм";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 10;
	protection[PROT_BLUNT] = 10;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 15;	//0;
	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_Vlk_L;
	wear = WEAR_TORSO;
	visual = "ItAr_VLK_L.3DS";
	visual_change = "Armor_Vlk_L.asc";
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

instance ITAR_Vlk_M(C_Item)
{
	name = "Хороший городской костюм";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 15;
	protection[PROT_BLUNT] = 15;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 15;	//0;
	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_Vlk_M;
	wear = WEAR_TORSO;
	visual = "ItAr_VLK_M.3DS";
	visual_change = "Armor_Vlk_M.asc";
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

instance ITAR_Vlk_H(C_Item)
{
	name = "Добротный городской костюм";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 15;
	protection[PROT_BLUNT] = 15;
	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 15;	//0;
	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_Vlk_H;
	wear = WEAR_TORSO;
	visual = "ItAr_VLK_H.3DS";
	visual_change = "Armor_Vlk_H.asc";
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

instance ITAR_VlkBabe_L(C_Item)
{
	name = "Простое городское платье";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 10;
	protection[PROT_BLUNT] = 10;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 15;	//0;
	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_VlkBabe_L;
	wear = WEAR_TORSO;
	visual = "ItAr_VLKBabe.3DS";
	visual_change = "Armor_VlkBabe_L.asc";
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

instance ITAR_VlkBabe_M(C_Item)
{
	name = "Хорошее городское платье";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 15;
	protection[PROT_BLUNT] = 15;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 15;	//0;
	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_VlkBabe_M;
	wear = WEAR_TORSO;
	visual = "ItAr_VLKBabe.3DS";
	visual_change = "Armor_VlkBabe_M.asc";
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

instance ITAR_VlkBabe_H(C_Item)
{
	name = "Добротное городское платье";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 15;
	protection[PROT_BLUNT] = 15;
	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 15;	//0;
	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_VlkBabe_H;
	wear = WEAR_TORSO;
	visual = "ItAr_VLKBabe.3DS";
	visual_change = "Armor_VlkBabe_H.asc";
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

instance ITAR_MIL_L(C_Item)
{
	name = "Легкие доспехи ополчения";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 40;
	protection[PROT_BLUNT] = 40;
	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 15;	//0;
	protection[PROT_MAGIC] = 5;	//0;
	value = VALUE_ITAR_MIL_L;
	wear = WEAR_TORSO;
	visual = "ItAr_MIL_L.3DS";
	visual_change = "Armor_Mil_L.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = Equip_ITAR_MIL_L;
	on_unequip = UnEquip_ITAR_MIL_L;
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


func void Equip_ITAR_MIL_L()
{
	if(Npc_IsPlayer(self))
	{
		Mdl_SetVisualBody(self,"hum_body_Naked0",1,0,"Hum_Head_Pony",Face_N_Player,0,NO_ARMOR);
		MILArmor_Equipped = TRUE;
		if(MIL01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] += BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
			self.protection[PROT_MAGIC] += BA_Bonus01;
			self.protection[PROT_FIRE] += BA_Bonus01;
		};
	};
};

func void UnEquip_ITAR_MIL_L()
{
	if(Npc_IsPlayer(self))
	{
		Mdl_SetVisualBody(self,"hum_body_Naked0",9,0,"Hum_Head_Pony",Face_N_Player,0,NO_ARMOR);
		MILArmor_Equipped = FALSE;
		if(MIL01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
			self.protection[PROT_MAGIC] -= BA_Bonus01;
			self.protection[PROT_FIRE] -= BA_Bonus01;
		};
	};
};


instance ITAR_MIL_M(C_Item)
{
	name = "Тяжелые доспехи ополчения";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 70;
	protection[PROT_BLUNT] = 70;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 20;	//10;
	protection[PROT_MAGIC] = 10;
	value = VALUE_ITAR_MIL_M;
	wear = WEAR_TORSO;
	visual = "ItAr_MIL_M.3DS";
	visual_change = "Armor_MIL_M.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = Equip_ITAR_MIL_M;
	on_unequip = UnEquip_ITAR_MIL_M;
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


func void Equip_ITAR_MIL_M()
{
	if(Npc_IsPlayer(self))
	{
		Mdl_SetVisualBody(hero,"hum_body_Naked0",1,0,"Hum_Head_Pony",Face_N_Player,0,NO_ARMOR);
		MILArmor_Equipped = TRUE;
		if(MIL01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] += BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
			self.protection[PROT_MAGIC] += BA_Bonus01;
			self.protection[PROT_FIRE] += BA_Bonus01;
		};
	};
};

func void UnEquip_ITAR_MIL_M()
{
	if(Npc_IsPlayer(self))
	{
		Mdl_SetVisualBody(hero,"hum_body_Naked0",9,0,"Hum_Head_Pony",Face_N_Player,0,NO_ARMOR);
		MILArmor_Equipped = FALSE;
		if(MIL01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
			self.protection[PROT_MAGIC] -= BA_Bonus01;
			self.protection[PROT_FIRE] -= BA_Bonus01;
		};
	};
};


instance ITAR_PAL_M(C_Item)
{
	name = "Доспехи рыцаря";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 100;
	protection[PROT_BLUNT] = 100;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 25;	//50;
	protection[PROT_MAGIC] = 25;
	value = VALUE_ITAR_PAL_M;
	wear = WEAR_TORSO;
	visual = "ItAr_Pal_M.3ds";
	visual_change = "Armor_Pal_M.asc";
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

instance ITAR_PAL_H(C_Item)
{
	name = "Доспехи паладина";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 150;
	protection[PROT_BLUNT] = 150;
	protection[PROT_POINT] = 150;
	protection[PROT_FIRE] = 50;	//100;
	protection[PROT_MAGIC] = 50;
	value = VALUE_ITAR_PAL_H;
	wear = WEAR_TORSO;
	visual = "ItAr_Pal_H.3ds";
	visual_change = "Armor_Pal_H.asc";
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

instance ITAR_Bau_L(C_Item)
{
	name = "Рабочая одежда";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 15;
	protection[PROT_BLUNT] = 15;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 15;	//0;
	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_Bau_L;
	wear = WEAR_TORSO;
	visual = "ItAr_Bau_L.3DS";
	visual_change = "Armor_Bau_L.asc";
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

instance ITAR_Bau_M(C_Item)
{
	name = "Крестьянский костюм";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 15;
	protection[PROT_BLUNT] = 15;
	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 15;	//0;
	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_Bau_M;
	wear = WEAR_TORSO;
	visual = "ItAr_Bau_M.3ds";
	visual_change = "Armor_Bau_M.asc";
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

instance ITAR_BauBabe_L(C_Item)
{
	name = "Простое крестьянское платье";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 15;
	protection[PROT_BLUNT] = 15;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 15;	//0;
	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_BauBabe_L;
	wear = WEAR_TORSO;
	visual = "ItAr_VLKBabe.3DS";
	visual_change = "Armor_BauBabe_L.asc";
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

instance ITAR_BauBabe_M(C_Item)
{
	name = "Хорошее крестьянское платье";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 15;
	protection[PROT_BLUNT] = 15;
	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 15;	//0;
	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_BauBabe_M;
	wear = WEAR_TORSO;
	visual = "ItAr_VLKBabe.3DS";
	visual_change = "Armor_BauBabe_M.asc";
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

instance ITAR_SLD_L(C_Item)
{
	name = "Легкие доспехи наемника";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 30;
	protection[PROT_BLUNT] = 30;
	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 15;	//0;
	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_SLD_L;
	wear = WEAR_TORSO;
	visual = "ItAr_Sld_L.3ds";
	visual_change = "Armor_Sld_L.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = Equip_ITAR_SLD_L;
	on_unequip = UnEquip_ITAR_SLD_L;
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


func void Equip_ITAR_SLD_L()
{
	if(Npc_IsPlayer(self))
	{
		SLDArmor_Equipped = TRUE;
		if(SLD01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] += BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
			self.protection[PROT_MAGIC] += BA_Bonus01;
			self.protection[PROT_FIRE] += BA_Bonus01;
		};
	};
};

func void UnEquip_ITAR_SLD_L()
{
	if(Npc_IsPlayer(self))
	{
		SLDArmor_Equipped = FALSE;
		if(SLD01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
			self.protection[PROT_MAGIC] -= BA_Bonus01;
			self.protection[PROT_FIRE] -= BA_Bonus01;
		};
	};
};


instance ITAR_SLD_M(C_Item)
{
	name = "Средние доспехи наемника";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 50;
	protection[PROT_BLUNT] = 50;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 20;	//0;
	protection[PROT_MAGIC] = 5;
	value = VALUE_ITAR_SLD_M;
	wear = WEAR_TORSO;
	visual = "ItAr_Sld_M.3ds";
	visual_change = "Armor_Sld_M.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = Equip_ITAR_SLD_M;
	on_unequip = UnEquip_ITAR_SLD_M;
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


func void Equip_ITAR_SLD_M()
{
	if(Npc_IsPlayer(self))
	{
		SLDArmor_Equipped = TRUE;
		if(SLD01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] += BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
			self.protection[PROT_MAGIC] += BA_Bonus01;
			self.protection[PROT_FIRE] += BA_Bonus01;
		};
	};
};

func void UnEquip_ITAR_SLD_M()
{
	if(Npc_IsPlayer(self))
	{
		SLDArmor_Equipped = FALSE;
		if(SLD01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
			self.protection[PROT_MAGIC] -= BA_Bonus01;
			self.protection[PROT_FIRE] -= BA_Bonus01;
		};
	};
};


instance ITAR_SLD_H(C_Item)
{
	name = "Тяжелые доспехи наемника";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 80;
	protection[PROT_BLUNT] = 80;
	protection[PROT_POINT] = 80;
	protection[PROT_FIRE] = 20;	//5;
	protection[PROT_MAGIC] = 10;
	value = VALUE_ITAR_SLD_H;
	wear = WEAR_TORSO;
	visual = "ItAr_Sld_H.3ds";
	visual_change = "Armor_Sld_H.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = Equip_ITAR_SLD_H;
	on_unequip = UnEquip_ITAR_SLD_H;
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


func void Equip_ITAR_SLD_H()
{
	if(Npc_IsPlayer(self))
	{
		SLDArmor_Equipped = TRUE;
		if(SLD01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] += BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
			self.protection[PROT_MAGIC] += BA_Bonus01;
			self.protection[PROT_FIRE] += BA_Bonus01;
		};
	};
};

func void UnEquip_ITAR_SLD_H()
{
	if(Npc_IsPlayer(self))
	{
		SLDArmor_Equipped = FALSE;
		if(SLD01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
			self.protection[PROT_MAGIC] -= BA_Bonus01;
			self.protection[PROT_FIRE] -= BA_Bonus01;
		};
	};
};

// Спасибо Zorres за новую броню наемника!
instance ITAR_SLD_S(C_Item)
{
	name = "Старые доспехи наемника";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 65;
	protection[PROT_BLUNT] = 65;
	protection[PROT_POINT] = 65;
	protection[PROT_FIRE] = 15;	//5;
	protection[PROT_MAGIC] = 5;
	value = VALUE_ITAR_SLD_S;
	wear = WEAR_TORSO;
	visual = "ItAr_Sld_S.3ds";
	visual_change = "Armor_Sld_S.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = Equip_ITAR_SLD_H;
	on_unequip = UnEquip_ITAR_SLD_H;
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


instance ITAR_DJG_Crawler(C_Item)
{
	name = "Доспехи из панцирей краулеров";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 70;
	protection[PROT_BLUNT] = 70;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 15;
	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_DJG_Crawler;
	wear = WEAR_TORSO;
	visual = "ItAr_Djg_Crawler.3ds";
	visual_change = "Armor_Djg_Crawler.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = Equip_ITAR_DJG_Crawler;
	on_unequip = UnEquip_ITAR_DJG_Crawler;
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


func void Equip_ITAR_DJG_Crawler()
{
	if(Npc_IsPlayer(self))
	{
		MCArmor_Equipped = TRUE;
		if(MC_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] += BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
			self.protection[PROT_MAGIC] += BA_Bonus01;
			self.protection[PROT_FIRE] += BA_Bonus01;
		};
	};
};

func void UnEquip_ITAR_DJG_Crawler()
{
	if(Npc_IsPlayer(self))
	{
		MCArmor_Equipped = FALSE;
		if(MC_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
			self.protection[PROT_MAGIC] -= BA_Bonus01;
			self.protection[PROT_FIRE] -= BA_Bonus01;
		};
	};
};


instance ITAR_DJG_L(C_Item)
{
	name = "Легкие доспехи охотника на драконов";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 100;
	protection[PROT_BLUNT] = 100;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 25;	//50;
	protection[PROT_MAGIC] = 25;
	value = VALUE_ITAR_DJG_L;
	wear = WEAR_TORSO;
	visual = "ItAr_Djg_L.3ds";
	visual_change = "Armor_Djg_L.asc";
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

instance ITAR_DJG_M(C_Item)
{
	name = "Средние доспехи охотника на драконов";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 120;
	protection[PROT_BLUNT] = 120;
	protection[PROT_POINT] = 120;
	protection[PROT_FIRE] = 35;	//75;
	protection[PROT_MAGIC] = 35;
	value = VALUE_ITAR_DJG_M;
	wear = WEAR_TORSO;
	visual = "ItAr_Djg_M.3ds";
	visual_change = "Armor_Djg_M.asc";
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

instance ITAR_DJG_H(C_Item)
{
	name = "Тяжелые доспехи охотника на драконов";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 150;
	protection[PROT_BLUNT] = 150;
	protection[PROT_POINT] = 150;
	protection[PROT_FIRE] = 50;	//100;
	protection[PROT_MAGIC] = 50;
	value = VALUE_ITAR_DJG_H;
	wear = WEAR_TORSO;
	visual = "ItAr_Djg_H.3ds";
	visual_change = "Armor_Djg_H.asc";
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

instance ITAR_DJG_Babe(C_Item)
{
	name = "Доспехи охотницы на драконов";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 60;
	protection[PROT_BLUNT] = 60;
	protection[PROT_POINT] = 60;
	protection[PROT_FIRE] = 30;
	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_DJG_Babe;
	wear = WEAR_TORSO;
	visual = "ItAr_Djg_L.3DS";
	visual_change = "Armor_Djg_Babe.asc";
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

instance ITAR_NOV_L(C_Item)
{
	name = "Роба послушника";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 25;
	protection[PROT_BLUNT] = 25;
	protection[PROT_POINT] = 25;
	protection[PROT_FIRE] = 15;	//0;
	protection[PROT_MAGIC] = 10;
	value = VALUE_ITAR_NOV_L;
	wear = WEAR_TORSO;
	visual = "ItAr_Nov_L.3ds";
	visual_change = "Armor_Nov_L.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = Equip_ITAR_NOV_L;
	on_unequip = UnEquip_ITAR_NOV_L;
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


func void Equip_ITAR_NOV_L()
{
	if(Npc_IsPlayer(self))
	{
		Mdl_SetVisualBody(self,"hum_body_Naked0",1,0,"Hum_Head_Pony",Face_N_Player,0,NO_ARMOR);
		NOVArmor_Equipped = TRUE;
		if(NOV01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] += BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
			self.protection[PROT_MAGIC] += BA_Bonus01;
			self.protection[PROT_FIRE] += BA_Bonus01;
		};
	};
};

func void UnEquip_ITAR_NOV_L()
{
	if(Npc_IsPlayer(self))
	{
		Mdl_SetVisualBody(self,"hum_body_Naked0",9,0,"Hum_Head_Pony",Face_N_Player,0,NO_ARMOR);
		NOVArmor_Equipped = FALSE;
		if(NOV01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
			self.protection[PROT_MAGIC] -= BA_Bonus01;
			self.protection[PROT_FIRE] -= BA_Bonus01;
		};
	};
};


instance ITAR_KDF_L(C_Item)
{
	name = "Легкая мантия мага Огня";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 40;
	protection[PROT_BLUNT] = 40;
	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 20;
	value = VALUE_ITAR_KDF_L;
	wear = WEAR_TORSO;
	visual = "ItAr_KdF_L.3ds";
	visual_change = "Armor_Kdf_L.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = Equip_ITAR_KDF_L;
	on_unequip = UnEquip_ITAR_KDF_L;
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


func void Equip_ITAR_KDF_L()
{
	if(Npc_IsPlayer(self))
	{
		KDFArmor_Equipped = TRUE;
		if(KDF01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] += BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
			self.protection[PROT_MAGIC] += BA_Bonus01;
			self.protection[PROT_FIRE] += BA_Bonus01;
		};
	};
};

func void UnEquip_ITAR_KDF_L()
{
	if(Npc_IsPlayer(self))
	{
		KDFArmor_Equipped = FALSE;
		if(KDF01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
			self.protection[PROT_MAGIC] -= BA_Bonus01;
			self.protection[PROT_FIRE] -= BA_Bonus01;
		};
	};
};


instance ITAR_KDF_H(C_Item)
{
	name = "Тяжелая мантия мага Огня";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 100;
	protection[PROT_BLUNT] = 100;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 50;
	protection[PROT_MAGIC] = 50;
	value = VALUE_ITAR_KDF_H;
	wear = WEAR_TORSO;
	visual = "ItAr_KdF_H.3ds";
	visual_change = "Armor_Kdf_H.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = Equip_ITAR_KDF_H;
	on_unequip = UnEquip_ITAR_KDF_H;
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


func void Equip_ITAR_KDF_H()
{
	if(Npc_IsPlayer(self))
	{
		KDFArmor_Equipped = TRUE;
		if(KDF01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] += BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
			self.protection[PROT_MAGIC] += BA_Bonus01;
			self.protection[PROT_FIRE] += BA_Bonus01;
		};
	};
};

func void UnEquip_ITAR_KDF_H()
{
	if(Npc_IsPlayer(self))
	{
		KDFArmor_Equipped = FALSE;
		if(KDF01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
			self.protection[PROT_MAGIC] -= BA_Bonus01;
			self.protection[PROT_FIRE] -= BA_Bonus01;
		};
	};
};


instance ITAR_Leather_L(C_Item)
{
	name = "Кожаные доспехи";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 25;
	protection[PROT_BLUNT] = 25;
	protection[PROT_POINT] = 20;
	protection[PROT_FIRE] = 15;	//5;
	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_Leather_L;
	wear = WEAR_TORSO;
	visual = "ItAr_Leather_L.3ds";
	visual_change = "Armor_Leather_L.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = Equip_ITAR_Leather_L;
	on_unequip = UnEquip_ITAR_Leather_L;
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


func void Equip_ITAR_Leather_L()
{
	if(Npc_IsPlayer(self))
	{
		LeatherArmor_Equipped = TRUE;
		if(Leather01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] += BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
			self.protection[PROT_MAGIC] += BA_Bonus01;
			self.protection[PROT_FIRE] += BA_Bonus01;
		};
	};
};

func void UnEquip_ITAR_Leather_L()
{
	if(Npc_IsPlayer(self))
	{
		LeatherArmor_Equipped = FALSE;
		if(Leather01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
			self.protection[PROT_MAGIC] -= BA_Bonus01;
			self.protection[PROT_FIRE] -= BA_Bonus01;
		};
	};
};


instance ITAR_BDT_M(C_Item)
{
	name = "Средние доспехи бандита";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 35;
	protection[PROT_BLUNT] = 35;
	protection[PROT_POINT] = 35;
	protection[PROT_FIRE] = 15;	//0;
	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_BDT_M;
	wear = WEAR_TORSO;
	visual = "ItAr_Bdt_M.3ds";
	visual_change = "Armor_Bdt_M.asc";
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

instance ITAR_BDT_H(C_Item)
{
	name = "Тяжелые доспехи бандита";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 50;
	protection[PROT_BLUNT] = 50;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 15;	//0;
	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_BDT_H;
	wear = WEAR_TORSO;
	visual = "ItAr_Bdt_H.3ds";
	visual_change = "Armor_Bdt_H.asc";
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

instance ITAR_Xardas(C_Item)
{
	name = "Мантия некроманта";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 100;
	protection[PROT_BLUNT] = 100;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 50;
	protection[PROT_MAGIC] = 50;
	value = VALUE_ITAR_Xardas;
	wear = WEAR_TORSO;
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

instance ITAR_Lester(C_Item)
{
	name = "Тяжелая роба послушника";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 25;
	protection[PROT_BLUNT] = 25;
	protection[PROT_POINT] = 25;
	protection[PROT_FIRE] = 15;	//0;
	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_Lester;
	wear = WEAR_TORSO;
	visual = "ItAr_Lester.3ds";
	visual_change = "Armor_Lester.asc";
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

instance ITAR_Diego(C_Item)
{
	name = "Тяжелые доспехи призрака";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 30;
	protection[PROT_BLUNT] = 30;
	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 15;	//0;
	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_Diego;
	wear = WEAR_TORSO;
	visual = "ItAr_Diego.3ds";
	visual_change = "Armor_Diego.asc";
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

instance ITAR_CorAngar(C_Item)
{
	name = "Тяжелые доспехи храмовника";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 100;
	protection[PROT_BLUNT] = 100;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 25;	//50;
	protection[PROT_MAGIC] = 25;
	value = VALUE_ITAR_CorAngar;
	wear = WEAR_TORSO;
	visual = "ItAr_CorAngar.3ds";
	visual_change = "Armor_CorAngar.asc";
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

instance ITAR_Dementor(C_Item)
{
	name = "Мантия ищущих";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 130;
	protection[PROT_BLUNT] = 130;
	protection[PROT_POINT] = 130;
	protection[PROT_FIRE] = 65;
	protection[PROT_MAGIC] = 65;
	value = VALUE_ITAR_Dementor;
	wear = WEAR_TORSO;
	visual = "ItAr_Xardas.3ds";
	visual_change = "Armor_Dementor.asc";
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

instance ITAR_KDW_H(C_Item)
{
	name = "Тяжелая мантия мага Воды";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 100;
	protection[PROT_BLUNT] = 100;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 50;
	protection[PROT_MAGIC] = 50;
	value = VALUE_ITAR_KDW_H;
	wear = WEAR_TORSO;
	visual = "ItAr_KdW_H.3ds";
	visual_change = "Armor_KdW_H.asc";
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

instance ITAR_Prisoner(C_Item)
{
	name = "Штаны рудокопа";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 20;
	protection[PROT_BLUNT] = 20;
	protection[PROT_POINT] = 5; //20
	protection[PROT_FIRE] = 10;	//0;
	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_Prisoner;
	wear = WEAR_TORSO;
	visual = "ItAr_Prisoner.3ds";
	visual_change = "Armor_Prisoner.asc";
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

instance ITAR_Dementor_Boss(C_Item)
{
	name = "Мантия черного мага";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 100;
	protection[PROT_BLUNT] = 100;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 65;	//50;
	protection[PROT_MAGIC] = 65;	//50;
	value = VALUE_ITAR_Xardas;
	wear = WEAR_TORSO;
	visual = "ItAr_Xardas.3ds";
	visual_change = "Armor_Dementor_Boss.asc";
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

