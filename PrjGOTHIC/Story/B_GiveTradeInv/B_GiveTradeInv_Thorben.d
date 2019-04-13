
var int Thorben_ItemsGiven_Chapter_1;
var int Thorben_ItemsGiven_Chapter_2;
var int Thorben_ItemsGiven_Chapter_3;
var int Thorben_ItemsGiven_Chapter_4;
var int Thorben_ItemsGiven_Chapter_5;

func void B_GiveTradeInv_Thorben(var C_Npc slf)
{
	if((Kapitel >= 1) && (Thorben_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems(slf,ItKe_Lockpick,12);
		Thorben_ItemsGiven_Chapter_1 = TRUE;
	};
	if((Kapitel >= 2) && (Thorben_ItemsGiven_Chapter_2 == FALSE))
	{
		Thorben_ItemsGiven_Chapter_2 = TRUE;
	};
	if((Kapitel >= 3) && (Thorben_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems(slf,ItKe_Lockpick,12);
		Thorben_ItemsGiven_Chapter_3 = TRUE;
	};
	if((Kapitel >= 4) && (Thorben_ItemsGiven_Chapter_4 == FALSE))
	{
		Thorben_ItemsGiven_Chapter_4 = TRUE;
	};
	if((Kapitel >= 5) && (Thorben_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems(slf,ItKe_Lockpick,12);
		Thorben_ItemsGiven_Chapter_5 = TRUE;
	};
};

