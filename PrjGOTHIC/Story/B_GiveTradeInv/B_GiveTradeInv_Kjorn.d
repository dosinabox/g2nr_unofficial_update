
var int kjorn_itemsgiven_chapter_1;
var int kjorn_itemsgiven_chapter_2;
var int kjorn_itemsgiven_chapter_3;
var int Kjorn_ItemsGiven_Chapter_4;
var int Kjorn_ItemsGiven_Chapter_5;

func void B_GiveTradeInv_Kjorn(var C_Npc slf)
{
	if((Kapitel >= 1) && (KJORN_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItFo_Apple,2);
		CreateInvItems(slf,ItFo_Water,5);
		CreateInvItems(slf,ItFo_Beer,5);
		CreateInvItems(slf,ItFo_Cheese,5);
		KJORN_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((Kapitel >= 2) && (KJORN_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItFo_Cheese,5);
		CreateInvItems(slf,ItFoMutton,5);
		CreateInvItems(slf,ItFo_Stew,5);
		CreateInvItems(slf,ItRi_Prot_Fire_02,1);
		KJORN_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((Kapitel >= 3) && (KJORN_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItFo_Cheese,2);
		CreateInvItems(slf,ItFo_Bacon,2);
		CreateInvItems(slf,ItFoMutton,10);
		CreateInvItems(slf,ItFo_Stew,5);
		CreateInvItems(slf,ItFo_Sausage,5);
		CreateInvItems(slf,ItFo_Booze,5);
		KJORN_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((Kapitel >= 4) && (Kjorn_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,50);
		CreateInvItems(slf,ItFo_Wine,2);
		CreateInvItems(slf,ItFo_Booze,3);
		CreateInvItems(slf,ItFo_Bacon,5);
		CreateInvItems(slf,ItRw_Arrow,65);
		CreateInvItems(slf,ItRw_Bolt,50);
		CreateInvItems(slf,ItPo_Health_01,4);
		CreateInvItems(slf,ItPo_Health_02,2);
		CreateInvItems(slf,ItKe_Lockpick,10);
		Kjorn_ItemsGiven_Chapter_4 = TRUE;
	};
	if((Kapitel >= 5) && (Kjorn_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,50);
		CreateInvItems(slf,ItFo_Wine,2);
		CreateInvItems(slf,ItFo_Booze,3);
		CreateInvItems(slf,ItFo_Bacon,5);
		CreateInvItems(slf,ItRw_Arrow,55);
		CreateInvItems(slf,ItRw_Bolt,55);
		CreateInvItems(slf,ItPo_Health_01,4);
		CreateInvItems(slf,ItPo_Health_02,2);
		Kjorn_ItemsGiven_Chapter_5 = TRUE;
	};
};

