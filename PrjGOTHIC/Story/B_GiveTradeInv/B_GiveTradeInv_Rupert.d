
var int Rupert_ItemsGiven_Chapter_1;
var int Rupert_ItemsGiven_Chapter_2;
var int Rupert_ItemsGiven_Chapter_3;
var int Rupert_ItemsGiven_Chapter_4;
var int Rupert_ItemsGiven_Chapter_5;

func void B_GiveTradeInv_Rupert(var C_Npc slf)
{
	if((Kapitel >= 1) && (Rupert_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems(slf,ItFo_Apple,12);
		CreateInvItems(slf,ItFo_Bread,5);
		CreateInvItems(slf,ItFo_Milk,5);
		Rupert_ItemsGiven_Chapter_1 = TRUE;
	};
	if((Kapitel >= 2) && (Rupert_ItemsGiven_Chapter_2 == FALSE))
	{
		Rupert_ItemsGiven_Chapter_2 = TRUE;
	};
	if((Kapitel >= 3) && (Rupert_ItemsGiven_Chapter_3 == FALSE))
	{
		Rupert_ItemsGiven_Chapter_3 = TRUE;
	};
	if((Kapitel >= 4) && (Rupert_ItemsGiven_Chapter_4 == FALSE))
	{
		Rupert_ItemsGiven_Chapter_4 = TRUE;
	};
	if((Kapitel >= 5) && (Rupert_ItemsGiven_Chapter_5 == FALSE))
	{
		Rupert_ItemsGiven_Chapter_5 = TRUE;
	};
};

