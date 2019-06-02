
instance ItSe_ErzFisch(C_Item)
{
	name = "Круглая рыба";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 25;
	visual = "ItSe_ErzFisch.3DS";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	on_state[0] = Use_ErzFisch;
	description = name;
	text[0] = PRINT_HiddenInFish;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_ErzFisch()
{
	Snd_Play("CS_IHL_WO_WA");
	B_PlayerFindItem(ItMi_Nugget,1);
};


instance ItSe_GoldFisch(C_Item)
{
	name = "Тяжелая рыба";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 25;
	visual = "ItSe_GoldFisch.3DS";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	on_state[0] = Use_GoldFisch;
	description = name;
	text[0] = PRINT_HiddenInFish;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = 100;
};


func void Use_GoldFisch()
{
	Snd_Play("CS_IHL_WO_WA");
	B_PlayerFindItem(ItMi_Gold,50);
};


instance ItSe_RingFisch(C_Item)
{
	name = "Маленькая рыбка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 25;
	visual = "ItSe_RingFisch.3DS";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	on_state[0] = Use_Ringfisch;
	description = name;
	text[0] = PRINT_HiddenInFish;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = 190;
};


func void Use_Ringfisch()
{
	Snd_Play("CS_IHL_WO_WA");
	B_PlayerFindItem(ItRi_Prot_Fire_01,1);
};


instance ItSe_LockpickFisch(C_Item)
{
	name = "Легкая рыба";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 25;
	visual = "ItFo_SmellyFish.3DS";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	on_state[0] = Use_LockpickFisch;
	description = name;
	text[0] = PRINT_HiddenInFish;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_LockpickFisch()
{
	Snd_Play("CS_IHL_WO_WA");
	B_PlayerFindItem(ItKe_Lockpick,3);
};


instance ItSe_GoldPocket25(C_Item)
{
	name = NAME_Beutel;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 25;
	visual = "ItMi_Pocket.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = GoldPocket25;
	description = name;
	text[0] = "Внутри позванивает несколько монет.";
	text[5] = NAME_Value;
	count[5] = value;
};


func void GoldPocket25()
{
	B_PlayerFindItem(ItMi_Gold,25);
};


instance ItSe_GoldPocket50(C_Item)
{
	name = NAME_Beutel;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItMi_Pocket.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = GoldPocket50;
	description = name;
	text[0] = "Этот кошелек полон монет.";
	text[5] = NAME_Value;
	count[5] = value;
};


func void GoldPocket50()
{
	B_PlayerFindItem(ItMi_Gold,50);
};


instance ItSe_GoldPocket100(C_Item)
{
	name = NAME_Beutel;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 100;
	visual = "ItMi_Pocket.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = GoldPocket100;
	description = name;
	text[0] = "Тяжелый мешочек, полный монет.";
	text[5] = NAME_Value;
	count[5] = value;
};


func void GoldPocket100()
{
	B_PlayerFindItem(ItMi_Gold,100);
};


instance ItSe_HannasBeutel(C_Item)
{
	name = NAME_Beutel;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 100;
	visual = "ItMi_Pocket.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = HannasBeutel;
	description = name;
	text[0] = "Его дала мне Ханна.";
	text[5] = NAME_Value;
	count[5] = value;
};


func void HannasBeutel()
{
	CreateInvItems(hero,ItKe_Lockpick,10);
	CreateInvItems(hero,ItKe_ThiefTreasure,1);
	Print(PRINT_HannasBeutel);
};


