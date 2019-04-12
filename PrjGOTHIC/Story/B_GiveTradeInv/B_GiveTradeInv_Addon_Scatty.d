
var int Scatty_ItemsGiven_Chapter_1;
var int Scatty_ItemsGiven_Chapter_2;
var int Scatty_ItemsGiven_Chapter_3;
var int Scatty_ItemsGiven_Chapter_4;
var int Scatty_ItemsGiven_Chapter_5;

func void B_GiveTradeInv_Addon_Scatty(var C_Npc slf)
{
	if((Kapitel >= 1) && (Scatty_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems(slf,ItMi_GoldNugget_Addon,7);
		CreateInvItems(slf,ItMw_2H_Axe_L_01,2);
		CreateInvItems(slf,ItFo_Cheese,5);
		CreateInvItems(slf,ItFo_Bread,5);
		CreateInvItems(slf,ItFo_Water,5);
		CreateInvItems(slf,ItFo_Stew,5);
		CreateInvItems(slf,ItPo_Mana_02,4);
		CreateInvItems(slf,ItPo_Health_02,4);
		CreateInvItems(slf,ItRw_Arrow,50);
		CreateInvItems(slf,ItRw_Bolt,50);
		CreateInvItems(slf,ItMw_Schwert2,1);
		CreateInvItems(slf,ItMw_Zweihaender1,1);
		CreateInvItems(slf,ItRw_Crossbow_L_02,1);
		CreateInvItems(slf,ItMw_Schwert5,1);
		CreateInvItems(slf,ItMw_Streitaxt2,1);
		CreateInvItems(slf,ItMw_Inquisitor,1);
		Scatty_ItemsGiven_Chapter_1 = TRUE;
	};
	if((Kapitel >= 2) && (Scatty_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems(slf,ItMw_2H_Axe_L_01,2);
		CreateInvItems(slf,ItFo_Cheese,5);
		CreateInvItems(slf,ItFo_Bread,5);
		CreateInvItems(slf,ItFo_Water,5);
		CreateInvItems(slf,ItFo_Stew,5);
		CreateInvItems(slf,ItPo_Mana_02,4);
		CreateInvItems(slf,ItPo_Health_02,4);
		CreateInvItems(slf,ItRw_Arrow,50);
		CreateInvItems(slf,ItRw_Bolt,50);
		Scatty_ItemsGiven_Chapter_2 = TRUE;
	};
	if((Kapitel >= 3) && (Scatty_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems(slf,ItMw_2H_Axe_L_01,2);
		CreateInvItems(slf,ItFo_Cheese,5);
		CreateInvItems(slf,ItFo_Bread,5);
		CreateInvItems(slf,ItFo_Water,5);
		CreateInvItems(slf,ItFo_Stew,5);
		CreateInvItems(slf,ItPo_Mana_02,4);
		CreateInvItems(slf,ItPo_Health_02,4);
		CreateInvItems(slf,ItRw_Arrow,50);
		CreateInvItems(slf,ItRw_Bolt,50);
		Scatty_ItemsGiven_Chapter_3 = TRUE;
	};
	if((Kapitel >= 4) && (Scatty_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems(slf,ItMw_2H_Axe_L_01,2);
		CreateInvItems(slf,ItFo_Cheese,5);
		CreateInvItems(slf,ItFo_Bread,5);
		CreateInvItems(slf,ItFo_Water,5);
		CreateInvItems(slf,ItFo_Stew,5);
		CreateInvItems(slf,ItPo_Mana_02,4);
		CreateInvItems(slf,ItPo_Health_02,4);
		CreateInvItems(slf,ItRw_Arrow,50);
		CreateInvItems(slf,ItRw_Bolt,50);
		Scatty_ItemsGiven_Chapter_4 = TRUE;
	};
	if((Kapitel >= 5) && (Scatty_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems(slf,ItMw_2H_Axe_L_01,2);
		CreateInvItems(slf,ItFo_Cheese,5);
		CreateInvItems(slf,ItFo_Bread,5);
		CreateInvItems(slf,ItFo_Water,5);
		CreateInvItems(slf,ItFo_Stew,5);
		CreateInvItems(slf,ItPo_Mana_02,4);
		CreateInvItems(slf,ItPo_Health_02,4);
		CreateInvItems(slf,ItRw_Arrow,50);
		CreateInvItems(slf,ItRw_Bolt,50);
		Scatty_ItemsGiven_Chapter_5 = TRUE;
	};
};

