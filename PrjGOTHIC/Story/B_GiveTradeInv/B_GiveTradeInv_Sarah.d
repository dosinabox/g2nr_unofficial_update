
var int Sarah_ItemsGiven_Chapter_1;
var int Sarah_ItemsGiven_Chapter_2;
var int Sarah_ItemsGiven_Chapter_3;
var int Sarah_ItemsGiven_Chapter_4;
var int Sarah_ItemsGiven_Chapter_5;

func void B_GiveTradeInv_Sarah(var C_Npc slf)
{
	if((Kapitel >= 1) && (Sarah_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,20);
		CreateInvItems(slf,ItLsTorch,20);
		CreateInvItems(slf,ItRw_Arrow,50);
		CreateInvItems(slf,ItMw_ShortSword3,1);
		CreateInvItems(slf,ItMw_ShortSword4,1);
		CreateInvItems(slf,ItMw_ShortSword5,1);
		CreateInvItems(slf,ItMw_Kriegshammer1,1);
		CreateInvItems(slf,ItMw_Stabkeule,1);
		CreateInvItems(slf,ItMw_Steinbrecher,1);
		CreateInvItems(slf,ItMw_Schwert2,1);
		CreateInvItems(slf,ItMw_Bartaxt,1);
		CreateInvItems(slf,ItMw_1h_Vlk_Sword,1);
		CreateInvItems(slf,ItMw_1h_Nov_Mace,1);
		CreateInvItems(slf,ItMw_Zweihaender2,1);
		CreateInvItems(slf,ItMw_Schwert5,1);
		CreateInvItems(slf,ItMw_Inquisitor,1);
		CreateInvItems(slf,ItMw_Kriegshammer2,1);
		CreateInvItems(slf,ItMw_Zweihaender4,1);
		CreateInvItems(slf,ItMw_Krummschwert,1);
		CreateInvItems(slf,ItRi_HP_01,1);
		Sarah_ItemsGiven_Chapter_1 = TRUE;
	};
	if((Kapitel >= 2) && (Sarah_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,20);
		CreateInvItems(slf,ItLsTorch,5);
		CreateInvItems(slf,ItRw_Arrow,50);
		Sarah_ItemsGiven_Chapter_2 = TRUE;
	};
	if((Kapitel >= 3) && (Sarah_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,25);
		CreateInvItems(slf,ItRw_Arrow,50);
		Sarah_ItemsGiven_Chapter_3 = TRUE;
	};
	if((Kapitel >= 4) && (Sarah_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItRw_Arrow,50);
		Sarah_ItemsGiven_Chapter_4 = TRUE;
	};
	if((Kapitel >= 5) && (Sarah_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,200);
		CreateInvItems(slf,ItRw_Arrow,50);
		Sarah_ItemsGiven_Chapter_5 = TRUE;
	};
};

