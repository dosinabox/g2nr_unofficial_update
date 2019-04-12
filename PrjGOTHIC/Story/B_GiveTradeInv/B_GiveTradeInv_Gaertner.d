
var int Gaertner_ItemsGiven_Chapter_1;
var int Gaertner_ItemsGiven_Chapter_2;
var int Gaertner_ItemsGiven_Chapter_3;
var int Gaertner_ItemsGiven_Chapter_4;
var int Gaertner_ItemsGiven_Chapter_5;

func void B_GiveTradeInv_Gaertner(var C_Npc slf)
{
	if((Kapitel >= 1) && (Gaertner_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,50);
		CreateInvItems(slf,ItPl_Mana_Herb_01,5);
		CreateInvItems(slf,ItPl_Mana_Herb_02,3);
		Gaertner_ItemsGiven_Chapter_1 = TRUE;
	};
	if((Kapitel >= 2) && (Gaertner_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,50);
		CreateInvItems(slf,ItPl_Mana_Herb_01,5);
		CreateInvItems(slf,ItPl_Mana_Herb_02,5);
		Gaertner_ItemsGiven_Chapter_2 = TRUE;
	};
	if((Kapitel >= 3) && (Gaertner_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,50);
		CreateInvItems(slf,ItPl_Mana_Herb_01,5);
		CreateInvItems(slf,ItPl_Mana_Herb_02,3);
		CreateInvItems(slf,ItPl_Mana_Herb_03,3);
		Gaertner_ItemsGiven_Chapter_3 = TRUE;
	};
	if((Kapitel >= 4) && (Gaertner_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,50);
		CreateInvItems(slf,ItPl_Mana_Herb_01,5);
		CreateInvItems(slf,ItPl_Mana_Herb_02,3);
		CreateInvItems(slf,ItPl_Mana_Herb_03,3);
		Gaertner_ItemsGiven_Chapter_4 = TRUE;
	};
	if((Kapitel >= 5) && (Gaertner_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,50);
		CreateInvItems(slf,ItPl_Mana_Herb_01,5);
		CreateInvItems(slf,ItPl_Mana_Herb_02,3);
		CreateInvItems(slf,ItPl_Mana_Herb_03,3);
		Gaertner_ItemsGiven_Chapter_5 = TRUE;
	};
};

