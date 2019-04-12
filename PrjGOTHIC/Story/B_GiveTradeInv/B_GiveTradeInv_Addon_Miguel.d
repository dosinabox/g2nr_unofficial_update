
var int Miguel_ItemsGiven_Chapter_1;
var int Miguel_ItemsGiven_Chapter_2;
var int Miguel_ItemsGiven_Chapter_3;
var int Miguel_ItemsGiven_Chapter_4;
var int Miguel_ItemsGiven_Chapter_5;

func void B_GiveTradeInv_Addon_Miguel(var C_Npc slf)
{
	if((Kapitel >= 1) && (Miguel_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems(slf,ItPo_Mana_01,10);
		CreateInvItems(slf,ItPo_Health_01,10);
		CreateInvItems(slf,ItPo_Mana_02,4);
		CreateInvItems(slf,ItPo_Health_02,4);
		CreateInvItems(slf,ItPo_Health_Addon_04,1);
		Miguel_ItemsGiven_Chapter_1 = TRUE;
	};
	if((Kapitel >= 2) && (Miguel_ItemsGiven_Chapter_2 == FALSE))
	{
		Miguel_ItemsGiven_Chapter_2 = TRUE;
	};
	if((Kapitel >= 3) && (Miguel_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems(slf,ItPo_Mana_01,5);
		CreateInvItems(slf,ItPo_Health_01,5);
		CreateInvItems(slf,ItPo_Mana_02,2);
		CreateInvItems(slf,ItPo_Health_02,2);
		Miguel_ItemsGiven_Chapter_3 = TRUE;
	};
	if((Kapitel >= 4) && (Miguel_ItemsGiven_Chapter_4 == FALSE))
	{
		Miguel_ItemsGiven_Chapter_4 = TRUE;
	};
	if((Kapitel >= 5) && (Miguel_ItemsGiven_Chapter_5 == FALSE))
	{
		Miguel_ItemsGiven_Chapter_5 = TRUE;
	};
};

