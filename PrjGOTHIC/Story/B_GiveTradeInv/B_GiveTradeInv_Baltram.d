
var int Baltram_ItemsGiven_Chapter_1;
var int Baltram_ItemsGiven_Chapter_2;
var int Baltram_ItemsGiven_Chapter_3;
var int Baltram_ItemsGiven_Chapter_4;
var int Baltram_ItemsGiven_Chapter_5;

func void B_GiveTradeInv_Baltram(var C_Npc slf)
{
	if((Kapitel >= 1) && (Baltram_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItFo_Water,5);
		CreateInvItems(slf,ItFo_Bread,3);
		CreateInvItems(slf,ItFo_Cheese,2);
		CreateInvItems(slf,ItAm_Hp_01,1);
		Baltram_ItemsGiven_Chapter_1 = TRUE;
	};
	if((Kapitel >= 2) && (Baltram_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItFo_Cheese,5);
		CreateInvItems(slf,ItFoMutton,5);
		CreateInvItems(slf,ItFo_Stew,5);
		CreateInvItems(slf,ItFo_FishSoup,5);
		Baltram_ItemsGiven_Chapter_2 = TRUE;
	};
	if((Kapitel >= 3) && (Baltram_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItFo_Cheese,2);
		CreateInvItems(slf,ItFo_Bacon,2);
		CreateInvItems(slf,ItFoMutton,10);
		CreateInvItems(slf,ItFo_Stew,5);
		CreateInvItems(slf,ItFo_Sausage,5);
		CreateInvItems(slf,ItFo_Booze,5);
		Baltram_ItemsGiven_Chapter_3 = TRUE;
	};
	if((Kapitel >= 4) && (Baltram_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,150);
		CreateInvItems(slf,ItFo_Wine,5);
		CreateInvItems(slf,ItFo_Milk,10);
		CreateInvItems(slf,ItFoMutton,5);
		CreateInvItems(slf,ItFo_Stew,5);
		CreateInvItems(slf,ItFo_Sausage,5);
		CreateInvItems(slf,ItFo_Bacon,5);
		Baltram_ItemsGiven_Chapter_4 = TRUE;
	};
	if((Kapitel >= 5) && (Baltram_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,200);
		CreateInvItems(slf,ItFo_Wine,2);
		CreateInvItems(slf,ItFo_Milk,5);
		CreateInvItems(slf,ItFoMutton,5);
		CreateInvItems(slf,ItFo_Stew,5);
		CreateInvItems(slf,ItFo_Sausage,5);
		CreateInvItems(slf,ItFo_Bacon,5);
		Baltram_ItemsGiven_Chapter_5 = TRUE;
	};
};

