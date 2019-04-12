
var int Rosi_ItemsGiven_Chapter_1;
var int Rosi_ItemsGiven_Chapter_2;
var int Rosi_ItemsGiven_Chapter_3;
var int Rosi_ItemsGiven_Chapter_4;
var int Rosi_ItemsGiven_Chapter_5;

func void B_GiveTradeInv_Rosi(var C_Npc slf)
{
	if((Kapitel >= 1) && (Rosi_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItFo_Water,5);
		CreateInvItems(slf,ItFo_Bread,3);
		CreateInvItems(slf,ItRw_Arrow,50);
		CreateInvItems(slf,ItRw_Bolt,30);
		CreateInvItems(slf,ItRw_Bow_L_01,1);
		CreateInvItems(slf,ItRw_Bow_L_04,1);
		CreateInvItems(slf,ItRw_Bow_H_01,1);
		CreateInvItems(slf,ItRw_Crossbow_M_02,1);
		Rosi_ItemsGiven_Chapter_1 = TRUE;
	};
	if((Kapitel >= 2) && (Rosi_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItFo_Cheese,5);
		CreateInvItems(slf,ItFoMutton,2);
		CreateInvItems(slf,ItFo_Stew,5);
		CreateInvItems(slf,ItFo_FishSoup,5);
		CreateInvItems(slf,ItRw_Arrow,70);
		CreateInvItems(slf,ItRw_Bolt,80);
		Rosi_ItemsGiven_Chapter_2 = TRUE;
	};
	if((Kapitel >= 3) && (Rosi_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItFo_Cheese,2);
		CreateInvItems(slf,ItFo_Stew,5);
		CreateInvItems(slf,ItFo_Sausage,5);
		CreateInvItems(slf,ItFo_Booze,5);
		CreateInvItems(slf,ItRw_Arrow,90);
		CreateInvItems(slf,ItRw_Bolt,40);
		Rosi_ItemsGiven_Chapter_3 = TRUE;
	};
	if((Kapitel >= 4) && (Rosi_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,150);
		CreateInvItems(slf,ItFo_Wine,5);
		CreateInvItems(slf,ItFoMutton,5);
		CreateInvItems(slf,ItFo_Stew,5);
		CreateInvItems(slf,ItFo_Bacon,5);
		CreateInvItems(slf,ItRw_Arrow,100);
		CreateInvItems(slf,ItRw_Bolt,130);
		Rosi_ItemsGiven_Chapter_4 = TRUE;
	};
	if((Kapitel >= 5) && (Rosi_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,200);
		CreateInvItems(slf,ItFo_Wine,3);
		CreateInvItems(slf,ItFo_Milk,2);
		CreateInvItems(slf,ItFoMutton,5);
		CreateInvItems(slf,ItFo_Bacon,5);
		CreateInvItems(slf,ItRw_Arrow,150);
		CreateInvItems(slf,ItRw_Bolt,130);
		Rosi_ItemsGiven_Chapter_5 = TRUE;
	};
};

