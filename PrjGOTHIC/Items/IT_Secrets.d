
instance ItSe_ErzFisch(C_Item)
{
	name = "Рыба-шар";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 25;
	visual = "ItFo_Fish.3DS";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	on_state[0] = Use_ErzFisch;
	description = name;
	text[2] = "В этой рыбе что-то спрятано.";
};


func void Use_ErzFisch()
{
	B_PlayerFindItem(ItMi_Nugget,1);
};


instance ItSe_GoldFisch(C_Item)
{
	name = "Тяжелая рыба";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 25;
	visual = "ItFo_Fish.3DS";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	on_state[0] = Use_GoldFisch;
	description = name;
	text[2] = "В этой рыбе что-то спрятано.";
};


func void Use_GoldFisch()
{
	B_PlayerFindItem(ItMi_Gold,50);
};


instance ItSe_Ringfisch(C_Item)
{
	name = "Маленькая рыбка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 25;
	visual = "ItFo_Fish.3DS";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	on_state[0] = Use_Ringfisch;
	description = name;
	text[2] = "В этой рыбе что-то спрятано.";
};


func void Use_Ringfisch()
{
	B_PlayerFindItem(ItRi_Prot_Fire_01,1);
};


instance ItSe_LockpickFisch(C_Item)
{
	name = "Легкая рыба";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 25;
	visual = "ItFo_Fish.3DS";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	on_state[0] = Use_LockpickFisch;
	description = name;
	text[2] = "В этой рыбе что-то спрятано.";
};


func void Use_LockpickFisch()
{
	B_PlayerFindItem(ItKE_lockpick,3);
};


instance ItSe_GoldPocket25(C_Item)
{
	name = "Кожаный кошелек";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 25;
	visual = "ItMi_Pocket.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = GoldPocket25;
	description = "Кожаный мешочек.";
	text[0] = "";
	text[1] = "";
	text[2] = "Внутри позванивает несколько монет.";
	text[3] = "";
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
};


func void GoldPocket25()
{
	B_PlayerFindItem(ItMi_Gold,25);
};


instance ItSe_GoldPocket50(C_Item)
{
	name = "Кожаный кошелек";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItMi_Pocket.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = GoldPocket50;
	description = "Кожаный мешочек.";
	text[0] = "";
	text[1] = "";
	text[2] = "Этот кошелек полон монет.";
	text[3] = "";
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
};


func void GoldPocket50()
{
	B_PlayerFindItem(ItMi_Gold,50);
};


instance ItSe_GoldPocket100(C_Item)
{
	name = "Кожаный кошелек";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 100;
	visual = "ItMi_Pocket.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = GoldPocket100;
	description = "Кожаный мешочек.";
	text[0] = "";
	text[1] = "";
	text[2] = "Тяжелый мешочек,";
	text[3] = "полный золотых монет.";
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
};


func void GoldPocket100()
{
	B_PlayerFindItem(ItMi_Gold,100);
};


instance ItSe_HannasBeutel(C_Item)
{
	name = "Кожаный кошелек";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 100;
	visual = "ItMi_Pocket.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = HannasBeutel;
	description = "Кожаный мешочек.";
	text[0] = "";
	text[1] = "";
	text[2] = "Его дала мне Ханна.";
	text[3] = "";
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
};


func void HannasBeutel()
{
	CreateInvItems(hero,ItKE_lockpick,10);
	CreateInvItems(hero,ItKe_ThiefTreasure,1);
	Print(PRINT_HannasBeutel);
};

