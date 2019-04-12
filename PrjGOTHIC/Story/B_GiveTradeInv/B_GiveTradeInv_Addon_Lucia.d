
var int Lucia_ItemsGiven_Chapter_1;
var int Lucia_ItemsGiven_Chapter_2;
var int Lucia_ItemsGiven_Chapter_3;
var int Lucia_ItemsGiven_Chapter_4;
var int Lucia_ItemsGiven_Chapter_5;

func void B_GiveTradeInv_Addon_Lucia(var C_Npc slf)
{
	if((Kapitel >= 1) && (Lucia_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems(slf,ItFo_Booze,5);
		CreateInvItems(slf,ItFo_Addon_Rum,10);
		CreateInvItems(slf,ItFo_Addon_Grog,10);
		CreateInvItems(slf,ItMi_Flask,20);
		CreateInvItems(slf,ItRi_Dex_02,1);
		Lucia_ItemsGiven_Chapter_1 = TRUE;
	};
	if((Kapitel >= 2) && (Lucia_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems(slf,ItFo_Booze,10);
		CreateInvItems(slf,ItFo_Addon_Rum,10);
		CreateInvItems(slf,ItFo_Addon_Grog,10);
		CreateInvItems(slf,ItFo_Beer,4);
		CreateInvItems(slf,ItMi_Flask,20);
		Lucia_ItemsGiven_Chapter_2 = TRUE;
	};
	if((Kapitel >= 3) && (Lucia_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems(slf,ItFo_Booze,10);
		CreateInvItems(slf,ItFo_Addon_Rum,10);
		CreateInvItems(slf,ItFo_Addon_Grog,10);
		CreateInvItems(slf,ItFo_Beer,4);
		CreateInvItems(slf,ItMi_Flask,10);
		Lucia_ItemsGiven_Chapter_3 = TRUE;
	};
	if((Kapitel >= 4) && (Lucia_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems(slf,ItFo_Booze,10);
		CreateInvItems(slf,ItFo_Addon_Rum,10);
		CreateInvItems(slf,ItFo_Addon_Grog,10);
		CreateInvItems(slf,ItFo_Beer,4);
		CreateInvItems(slf,ItMi_Flask,10);
		Lucia_ItemsGiven_Chapter_4 = TRUE;
	};
	if((Kapitel >= 5) && (Lucia_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems(slf,ItFo_Booze,10);
		CreateInvItems(slf,ItFo_Addon_Rum,10);
		CreateInvItems(slf,ItFo_Addon_Grog,10);
		CreateInvItems(slf,ItFo_Beer,4);
		CreateInvItems(slf,ItMi_Flask,10);
		Lucia_ItemsGiven_Chapter_5 = TRUE;
	};
};

