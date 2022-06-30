
var int Miguel_ItemsGiven_Chapter_1;
var int Miguel_ItemsGiven_Chapter_3;

func void B_GiveTradeInv_Addon_Miguel(var C_Npc slf)
{
	if((Kapitel >= 1) && (Miguel_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems(slf,ItPo_Health_01,10);
		CreateInvItems(slf,ItPo_Health_02,4);
		CreateInvItems(slf,ItPo_Health_Addon_04,1);
		CreateInvItems(slf,ItPo_Mana_01,10);
		CreateInvItems(slf,ItPo_Mana_02,4);
		CreateInvItems(slf,ItPl_Forestberry,5);
		CreateInvItems(slf,ItPl_Health_Herb_02,10);
		CreateInvItems(slf,ItPl_Health_Herb_03,10);
		CreateInvItems(slf,ItPl_Mana_Herb_02,10);
		CreateInvItems(slf,ItPl_Mana_Herb_03,10);
		CreateInvItems(slf,ItPl_Temp_Herb,5);
		if(RandomGoblinBerries == FALSE)
		{
			CreateInvItems(slf,ItPl_Dex_Herb_01,1);
		};
		Miguel_ItemsGiven_Chapter_1 = TRUE;
	};
	if((Kapitel >= 3) && (Miguel_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems(slf,ItPo_Health_01,5);
		CreateInvItems(slf,ItPo_Health_02,2);
		CreateInvItems(slf,ItPo_Mana_01,5);
		CreateInvItems(slf,ItPo_Mana_02,2);
		CreateInvItems(slf,ItPl_Planeberry,5);
		CreateInvItems(slf,ItPl_Health_Herb_02,10);
		CreateInvItems(slf,ItPl_Health_Herb_03,10);
		CreateInvItems(slf,ItPl_Mana_Herb_02,10);
		CreateInvItems(slf,ItPl_Mana_Herb_03,10);
		CreateInvItems(slf,ItPl_Temp_Herb,5);
		Miguel_ItemsGiven_Chapter_3 = TRUE;
	};
};

