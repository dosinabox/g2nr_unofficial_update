
var int Coragon_ItemsGiven_Chapter_1;
var int Coragon_ItemsGiven_Chapter_2;
var int Coragon_ItemsGiven_Chapter_3;
var int Coragon_ItemsGiven_Chapter_4;
var int Coragon_ItemsGiven_Chapter_5;

func void B_GiveTradeInv_Coragon(var C_Npc slf)
{
	if((Kapitel >= 1) && (Coragon_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,50);
		CreateInvItems(slf,ItFo_Wine,6);
		CreateInvItems(slf,ItFo_Booze,3);
		CreateInvItems(slf,ItFo_Beer,5);
		CreateInvItems(slf,ItFo_Apple,5);
		CreateInvItems(slf,ItFo_Stew,5);
		Coragon_ItemsGiven_Chapter_1 = TRUE;
	};
	if((Kapitel >= 2) && (Coragon_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,50);
		CreateInvItems(slf,ItFo_Wine,4);
		CreateInvItems(slf,ItFo_Booze,3);
		CreateInvItems(slf,ItFo_Beer,5);
		CreateInvItems(slf,ItFo_Cheese,5);
		CreateInvItems(slf,ItFo_Bacon,5);
		CreateInvItems(slf,ItFo_Sausage,5);
		CreateInvItems(slf,ItFo_Honey,5);
		Coragon_ItemsGiven_Chapter_2 = TRUE;
	};
	if((Kapitel >= 3) && (Coragon_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,50);
		CreateInvItems(slf,ItFo_Wine,4);
		CreateInvItems(slf,ItFo_Booze,5);
		CreateInvItems(slf,ItFo_Beer,6);
		CreateInvItems(slf,ItFo_Bacon,5);
		CreateInvItems(slf,ItFo_Sausage,5);
		CreateInvItems(slf,ItFo_Honey,5);
		Coragon_ItemsGiven_Chapter_3 = TRUE;
	};
	if((Kapitel >= 4) && (Coragon_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,150);
		CreateInvItems(slf,ItFo_Wine,7);
		CreateInvItems(slf,ItFo_Booze,4);
		CreateInvItems(slf,ItFo_Beer,6);
		CreateInvItems(slf,ItFo_Apple,5);
		CreateInvItems(slf,ItFo_Stew,5);
		Coragon_ItemsGiven_Chapter_4 = TRUE;
	};
	if((Kapitel >= 5) && (Coragon_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,150);
		CreateInvItems(slf,ItFo_Wine,5);
		CreateInvItems(slf,ItFo_Booze,4);
		CreateInvItems(slf,ItFo_Beer,5);
		CreateInvItems(slf,ItFo_Apple,5);
		CreateInvItems(slf,ItFo_Stew,5);
		CreateInvItems(slf,ItFo_Bacon,5);
		CreateInvItems(slf,ItFo_Sausage,5);
		CreateInvItems(slf,ItFo_Honey,5);
		Coragon_ItemsGiven_Chapter_5 = TRUE;
	};
};

