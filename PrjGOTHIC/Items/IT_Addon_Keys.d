
instance ITKE_PORTALTEMPELWALKTHROUGH_ADDON(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = "Ржавый ключ";
	text[0] = "Открывает дверь в древнем храме, за которой";
	text[1] = "находится телепортационный камень.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITKE_Greg_ADDON_MIS(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Ключ от хижины";
	text[1] = "капитана Грега.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITKE_Addon_Tavern_01(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = "Ключ Лу";
	text[0] = "Открывает таверну";
	text[1] = "в бандитском лагере.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITKE_ADDON_ESTEBAN(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = "Ключ Эстебана";
	text[0] = "Открывает сундук в";
	text[1] = "его убежище.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITKE_ORLAN_TELEPORTSTATION(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = "Ключ Орлана";
	text[0] = "Открывает дверь в пещеру";
	text[1] = "к югу от его таверны.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITKE_CANYONLIBRARY_HIERARCHY_BOOKS_ADDON(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Принадлежал шаману в лагере орков";
	text[1] = "перед библиотекой ученых.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITKE_ADDON_BUDDLER_01(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = "Ключ от сундука";
	text[0] = "из лагеря бандитов.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITKE_ADDON_SKINNER(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
//	description = "Ключ от сундука";
	description = "Ключ Скиннера";
//	text[2] = "бандита Скиннера.";
	text[0] = "Открывает его сундук.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITKE_Addon_Thorus(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = "Ключ Торуса";
	text[0] = "Открывает его сундук.";
	text[5] = NAME_Value;
	count[5] = value;
};

