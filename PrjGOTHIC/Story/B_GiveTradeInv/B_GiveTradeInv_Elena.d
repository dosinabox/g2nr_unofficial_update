
var int Elena_ItemsGiven_Chapter_1;
var int Elena_ItemsGiven_Chapter_2;
var int Elena_ItemsGiven_Chapter_3;
var int Elena_ItemsGiven_Chapter_4;
var int Elena_ItemsGiven_Chapter_5;

func void B_GiveTradeInv_Elena(var C_Npc slf)
{
	if((Kapitel >= 1) && (Elena_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItFo_Apple,2);
		CreateInvItems(slf,ItFo_Water,3);
		CreateInvItems(slf,ItFo_Cheese,5);
		CreateInvItems(slf,ItFo_Bacon,3);
		CreateInvItems(slf,ItFo_Milk,5);
		Elena_ItemsGiven_Chapter_1 = TRUE;
	};
	if((Kapitel >= 2) && (Elena_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItFo_Cheese,5);
		CreateInvItems(slf,ItFoMutton,3);
		CreateInvItems(slf,ItFo_Stew,5);
		CreateInvItems(slf,ItFo_FishSoup,5);
		CreateInvItems(slf,ItFo_Milk,3);
		Elena_ItemsGiven_Chapter_2 = TRUE;
	};
	if((Kapitel >= 3) && (Elena_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItFo_Cheese,2);
		CreateInvItems(slf,ItFo_Bacon,2);
		CreateInvItems(slf,ItFoMutton,3);
		CreateInvItems(slf,ItFo_Stew,5);
		CreateInvItems(slf,ItFo_Sausage,3);
		CreateInvItems(slf,ItFo_Milk,5);
		Elena_ItemsGiven_Chapter_3 = TRUE;
	};
	if((Kapitel >= 4) && (Elena_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,150);
		CreateInvItems(slf,ItFo_Wine,5);
		CreateInvItems(slf,ItFo_Milk,10);
		CreateInvItems(slf,ItFoMutton,5);
		CreateInvItems(slf,ItFo_Stew,1);
		CreateInvItems(slf,ItFo_Sausage,5);
		CreateInvItems(slf,ItFo_Bacon,5);
		Elena_ItemsGiven_Chapter_4 = TRUE;
	};
	if((Kapitel >= 5) && (Elena_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,200);
		CreateInvItems(slf,ItFo_Wine,2);
		CreateInvItems(slf,ItFo_Milk,5);
		CreateInvItems(slf,ItFoMutton,5);
		CreateInvItems(slf,ItFo_Stew,3);
		CreateInvItems(slf,ItFo_Sausage,5);
		CreateInvItems(slf,ItFo_Bacon,3);
		CreateInvItems(slf,ItFo_Milk,5);
		Elena_ItemsGiven_Chapter_5 = TRUE;
	};
};

