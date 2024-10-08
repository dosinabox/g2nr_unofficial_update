
const int Value_Weed = 0;
const int Value_Beet = 3;
const int HP_Beet = 2;
const int Value_SwampHerb = 10;
const int Value_Mana_Herb_01 = 10;
const int Mana_Mana_Herb_01 = 10;
const int Value_Mana_Herb_02 = 20;
const int Mana_Mana_Herb_02 = 15;
const int Value_Mana_Herb_03 = 30;
const int Mana_Mana_Herb_03 = 20;
const int Value_Health_Herb_01 = 10;
const int HP_Health_Herb_01 = 10;
const int Value_Health_Herb_02 = 20;
const int HP_Health_Herb_02 = 20;
const int Value_Health_Herb_03 = 30;
const int HP_Health_Herb_03 = 30;
const int Value_Dex_Herb_01 = 250;
const int Value_Strength_Herb_01 = 500;
const int Value_Speed_Herb_01 = 100;
const int Speed_Boost = 15000;
const int Value_Mushroom_01 = 10;
const int HP_Mushroom_01 = 5;
const int MushroomManaBonus = 5;
const int MushroomsNeededForBonus = 50;
const int Value_Mushroom_02 = 30;
const int HP_Mushroom_02 = 15;
const int Value_Forestberry = 5;
const int HP_Forestberry = 5;
const int Value_Blueplant = 10;
const int HP_Blueplant = 5;
const int Mana_Blueplant = 5;
const int Value_Planeberry = 5;
const int HP_Planeberry = 5;
const int Value_Temp_Herb = 10;
const int HP_Temp_Herb = 5;
const int Value_Perm_Herb = 500;
const int HP_Perm_Herb = 5;

instance ItPl_Weed(C_Item)
{
	name = "�������";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Weed;
	visual = "ItPl_Weed.3ds";
	material = MAT_LEATHER;
	on_state[0] = Use_Weed;
	scemeName = "FOOD";
	description = name;
};

func void Use_Weed()
{
	B_Say(self,self,"$COUGH");
};

instance ItPl_Beet(C_Item)
{
	name = "����";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Beet;
	visual = "ItPl_Beet.3ds";
	material = MAT_LEATHER;
	on_state[0] = Use_Beet;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Beet;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_Beet()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Beet);
};


instance ItPl_SwampHerb(C_Item)
{
	name = "�������� �����";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_SwampHerb;
	visual = "ItPl_SwampHerb.3ds";
	material = MAT_LEATHER;
	on_state[0] = Use_SwampHerb;
	scemeName = "FOOD";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_SwampHerb()
{
	if(Npc_IsPlayer(self))
	{
		Wld_StopEffect("SLOW_TIME");
		Wld_PlayEffect("SLOW_TIME",self,self,0,0,0,FALSE);
	};
};


instance ItPl_Mana_Herb_01(C_Item)
{
	name = "�������� �������";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Mana_Herb_01;
	visual = "ItPl_Mana_Herb_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Mana_Herb_01;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_Mana;
	count[1] = Mana_Mana_Herb_01;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_Mana_Herb_01()
{
	Npc_ChangeAttribute(self,ATR_MANA,Mana_Mana_Herb_01);
};


instance ItPl_Mana_Herb_02(C_Item)
{
	name = "�������� �����";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Mana_Herb_02;
	visual = "ItPl_Mana_Herb_02.3ds";
	material = MAT_LEATHER;
	on_state[0] = Use_Mana_Herb_02;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_Mana;
	count[1] = Mana_Mana_Herb_02;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_Mana_Herb_02()
{
	Npc_ChangeAttribute(self,ATR_MANA,Mana_Mana_Herb_02);
};


instance ItPl_Mana_Herb_03(C_Item)
{
	name = "�������� ������";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Mana_Herb_03;
	visual = "ItPl_Mana_Herb_03.3ds";
	material = MAT_LEATHER;
	on_state[0] = Use_Mana_Herb_03;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_Mana;
	count[1] = Mana_Mana_Herb_03;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_Mana_Herb_03()
{
	Npc_ChangeAttribute(self,ATR_MANA,Mana_Mana_Herb_03);
};


instance ItPl_Health_Herb_01(C_Item)
{
	name = "�������� �����";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Health_Herb_01;
	visual = "ItPl_Health_Herb_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Health_Herb_01;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Health_Herb_01;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_Health_Herb_01()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Health_Herb_01);
};


instance ItPl_Health_Herb_02(C_Item)
{
	name = "�������� ��������";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Health_Herb_02;
	visual = "ItPl_Health_Herb_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Health_Herb_02;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Health_Herb_02;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_Health_Herb_02()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Health_Herb_02);
};


instance ItPl_Health_Herb_03(C_Item)
{
	name = "�������� ������";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Health_Herb_03;
	visual = "ItPl_Health_Herb_03.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Health_Herb_03;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Health_Herb_03;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_Health_Herb_03()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Health_Herb_03);
};


instance ItPl_Dex_Herb_01(C_Item)
{
	name = "���������� �����";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Dex_Herb_01;
	visual = "ItPl_Dex_Herb_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Dex_Herb_01;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_Dex;
	count[1] = 1;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_Dex_Herb_01()
{
	TotalDexEaten += 1;
	B_RaiseAttributeByPermBonus(self,ATR_DEXTERITY,1);
};


instance ItPl_Strength_Herb_01(C_Item)
{
	name = "�������� ������";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Strength_Herb_01;
	visual = "ItPl_Strength_Herb_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Strength_Herb_01;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_Str;
	count[1] = 1;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_Strength_Herb_01()
{
	TotalStrEaten += 1;
	B_RaiseAttributeByPermBonus(self,ATR_STRENGTH,1);
};


instance ItPl_Speed_Herb_01(C_Item)
{
	name = "�������-�����";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Speed_Herb_01;
	visual = "ItPl_Speed_Herb_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Speed_Herb_01;
	scemeName = "FOOD";
	description = name;
	text[0] = PRINT_Speed;
	text[1] = NAME_Sec_Duration;
	count[1] = Speed_Boost / 1000;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_Speed_Herb_01()
{
	Mdl_ApplyOverlayMdsTimed(self,"Humans_Sprint.mds",Speed_Boost);
};


instance ItPl_Mushroom_01(C_Item)
{
	name = "������ ����";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Mushroom_01;
	visual = "ItPl_Mushroom_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Mushroom_01;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Mushroom_01;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_Mushroom_01()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Mushroom_01);
	if(Npc_IsPlayer(self))
	{
		TotalMushroomsEaten += 1;
		Dunkelpilz_Bonus += 1;
		if(Dunkelpilz_Bonus == MushroomsNeededForBonus)
		{
			B_RaiseAttributeByPermBonus(self,ATR_MANA_MAX,MushroomManaBonus);
			Snd_Play("LEVELUP");
			Dunkelpilz_Bonus = 0;
		};
	};
};


instance ItPl_Mushroom_02(C_Item)
{
	name = "���� ��������";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Mushroom_02;
	visual = "ItPl_Mushroom_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Mushroom_02;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Mushroom_02;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_Mushroom_02()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Mushroom_02);
};


instance ItPl_Blueplant(C_Item)
{
	name = "����� ������";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Blueplant;
	visual = "ItPl_Blueplant.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Blueplant;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Blueplant;
	text[2] = NAME_Bonus_Mana;
	count[2] = Mana_Blueplant;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_Blueplant()
{
	Npc_ChangeAttribute(self,ATR_MANA,Mana_Blueplant);
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Blueplant);
};


instance ItPl_Forestberry(C_Item)
{
	name = "������ �����";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Forestberry;
	visual = "ItPl_Forestberry.3DS";
	material = MAT_LEATHER;
	scemeName = "FOOD";
	on_state[0] = Use_Forestberry;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Forestberry;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_Forestberry()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Forestberry);
};


instance ItPl_Planeberry(C_Item)
{
	name = "������� �����";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Planeberry;
	visual = "ItPl_Planeberry.3DS";
	material = MAT_LEATHER;
	scemeName = "FOOD";
	on_state[0] = Use_Planeberry;
	description = name;
	text[1] = NAME_Bonus_Mana;
	count[1] = HP_Planeberry;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_Planeberry()
{
	Npc_ChangeAttribute(self,ATR_MANA,HP_Planeberry);
};


instance ItPl_Temp_Herb(C_Item)
{
	name = "������� �����";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Temp_Herb;
	visual = "ItPl_Temp_Herb.3ds";
	material = MAT_LEATHER;
	scemeName = "FOOD";
	on_state[0] = Use_Temp_Herb;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Temp_Herb;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_Temp_Herb()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Temp_Herb);
};


instance ItPl_Perm_Herb(C_Item)
{
	name = "������� ������";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Perm_Herb;
	visual = "ItPl_Perm_Herb.3ds";
	material = MAT_LEATHER;
	scemeName = "FOOD";
	on_state[0] = Use_Perm_Herb;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Perm_Herb;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_Perm_Herb()
{
	TotalPermEaten += 1;
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Perm_Herb);
};

