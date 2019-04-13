
const int Value_Rum = 20;
const int Mana_Rum = 10;
const int Value_Grog = 10;
const int HP_Grog = 10;
const int Value_SchnellerHering = 30;
const int Value_LousHammer = 30;
const int Mana_LousHammer = 1;
const int Value_SchlafHammer = 60;
const int Value_BonusFood = 40;
const int STR_FireStew = 1;
const int HP_FireStew = 5;
const int STR_MeatSoup = 1;
const int HP_Shellflesh = 20;

instance ItFo_Addon_Shellflesh(C_Item)
{
	name = "Мясо моллюска";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Meatbugflesh;
	visual = "ItAt_Shellflesh.3DS";
	material = MAT_LEATHER;
	scemeName = "FOODHUGE";
	on_state[0] = Use_Shellflesh;
	description = name;
	text[0] = "Сочное мясо моллюска. Можно есть сырым.";
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Shellflesh;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = 190;
};


func void Use_Shellflesh()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Shellflesh);
};


instance ItFo_Addon_Rum(C_Item)
{
	name = "Ром";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Rum;
	visual = "ItMi_Rum_01.3ds";
	material = MAT_STONE;
	on_state[0] = UseRum;
	scemeName = "POTIONFAST";
	description = name;
	text[0] = "Белый ром.";
	text[1] = NAME_Bonus_Mana;
	count[1] = Mana_Rum;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseRum()
{
	Npc_ChangeAttribute(self,ATR_MANA,Mana_Rum);
	B_NpcSetDrunk(50);
};


instance ItFo_Addon_Grog(C_Item)
{
	name = "Грог";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Grog;
	visual = "ItMi_Rum_02.3ds";
	material = MAT_STONE;
	on_state[0] = UseGrog;
	scemeName = "POTIONFAST";
	description = name;
	text[0] = "Настоящий грог моряков.";
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Grog;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseGrog()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Grog);
	B_NpcSetDrunk(40);
};


var int Hammer_Once;

instance ItFo_Addon_LousHammer(C_Item)
{
	name = "Молот Лу";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_LousHammer;
	visual = "ItMi_Rum_04.3ds";
	material = MAT_STONE;
	on_state[0] = UseLouHammer;
	scemeName = "POTIONFAST";
	description = name;
//	text[0] = PRINT_UnknownEffect;
	text[1] = TEXT_LousHammer_Setting;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseLouHammer()
{
	if(Hammer_Once == FALSE)
	{
		B_RaiseAttribute(self,ATR_MANA_MAX,Mana_LousHammer);
		Npc_ChangeAttribute(self,ATR_MANA,Mana_LousHammer);
		TEXT_LousHammer_Setting = PRINT_LousHammerNoEffect;
		Hammer_Once = TRUE;
	};
//	B_NpcSetDrunk(60);
	if(Npc_IsPlayer(self))
	{
		Mdl_ApplyOverlayMdsTimed(self,"Humans_Drunken.mds",70000);
	};
};


instance ItFo_Addon_SchlafHammer(C_Item)
{
	name = "Двойной Молот Лу";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_SchlafHammer;
	visual = "ItMi_Rum_05.3ds";
	material = MAT_STONE;
	on_state[0] = UseSchlafHammer;
	scemeName = "POTIONFAST";
	description = name;
	text[0] = "Свалит с ног даже бывалого пьяницу...";
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseSchlafHammer()
{
	if(self.attribute[ATR_HITPOINTS] > 2)
	{
		self.attribute[ATR_HITPOINTS] /= 2;
	};
	if(Npc_IsPlayer(self))
	{
		AI_StartState(self,ZS_MagicSleep,1,"");
	};
};


const int Time_SchnellerHering = 120000;

instance ItFo_Addon_SchnellerHering(C_Item)
{
	name = "Быстрая селедка";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_SchnellerHering;
	visual = "ItMi_Rum_03.3ds";
	material = MAT_STONE;
	on_state[0] = UseSchnellerHering;
	scemeName = "POTIONFAST";
	description = name;
//	text[1] = "Выглядит подозрительно!";
//	text[2] = "Эффект неизвестен.";
//	text[3] = "Возможны побочные эффекты.";
	text[0] = "Временно повышает скорость.";
	text[1] = NAME_Duration;
	count[1] = Time_SchnellerHering / 60000;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseSchnellerHering()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		Mdl_ApplyOverlayMdsTimed(self,"HUMANS_SPRINT.MDS",Time_SchnellerHering);
	};
	Player_KnowsSchnellerHering = TRUE;
};


instance ItFo_Addon_Pfeffer_01(C_Item)
{
	name = "Мешочек с перцем";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 100;
	visual = "ItMi_FoodPocket.3ds";
	material = MAT_LEATHER;
	description = name;
	text[0] = "Красный жгучий перец";
	text[1] = "с южных островов.";
	text[3] = "ОСТОРОЖНО, ЖГУЧИЙ!";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = 190;
};

instance ItFo_Addon_FireStew(C_Item)
{
	name = "Пламенная нарезка";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_BonusFood;
	visual = "ItFo_FireStew.3ds";
	material = MAT_WOOD;
	scemeName = "RICE";
	on_state[0] = Use_FireStew;
	description = name;
	text[1] = NAME_Bonus_Str;
	count[1] = STR_FireStew;
	text[2] = NAME_Bonus_HpMax;
	count[2] = HP_FireStew;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_FireStew()
{
	var string concatText;
	B_RaiseAttribute(self,ATR_STRENGTH,STR_FireStew);
	Npc_ChangeAttribute(self,ATR_HITPOINTS_MAX,HP_FireStew);
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_FireStew);
	concatText = ConcatStrings(PRINT_Learnhitpoints_MAX,IntToString(HP_FireStew));
	PrintScreen(concatText,-1,53,FONT_Screen,2);
};


instance ItFo_Addon_Meatsoup(C_Item)
{
	name = "Мясная похлебка";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_BonusFood;
	visual = "ItFo_MeatSoup.3ds";
	material = MAT_WOOD;
	scemeName = "RICE";
	on_state[0] = Use_MeatSoup;
	description = name;
	text[0] = "Дымящаяся мясная похлебка.";
	text[1] = NAME_Bonus_Str;
	count[1] = STR_MeatSoup;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_MeatSoup()
{
	B_RaiseAttribute(self,ATR_STRENGTH,STR_MeatSoup);
};

