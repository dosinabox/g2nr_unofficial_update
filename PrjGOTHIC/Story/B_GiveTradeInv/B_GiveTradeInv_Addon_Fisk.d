
var int Fisk_ItemsGiven_Chapter_1;
var int Fisk_ItemsGiven_Chapter_2;
var int Fisk_ItemsGiven_Chapter_3;
var int Fisk_ItemsGiven_Chapter_4;
var int Fisk_ItemsGiven_Chapter_5;

func void B_GiveTradeInv_Addon_Fisk(var C_Npc slf)
{
	if((Kapitel >= 1) && (Fisk_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems(slf,ItMi_GoldNugget_Addon,2);
		CreateInvItems(slf,ItFo_Booze,5);
		CreateInvItems(slf,ItFo_Apple,5);
		CreateInvItems(slf,ItFo_Bread,5);
		CreateInvItems(slf,ItPl_Mana_Herb_02,10);
		CreateInvItems(slf,ItPl_Mana_Herb_03,5);
		CreateInvItems(slf,ItPl_Health_Herb_02,10);
		CreateInvItems(slf,ItPl_Health_Herb_03,5);
		CreateInvItems(slf,ItPl_Temp_Herb,3);
		CreateInvItems(slf,ItPl_Beet,3);
		CreateInvItems(slf,ItPo_Mana_01,5);
		CreateInvItems(slf,ItPo_Health_01,5);
		CreateInvItems(slf,ItPo_Mana_02,4);
		CreateInvItems(slf,ItPo_Health_02,4);
		CreateInvItems(slf,ItPo_Mana_03,3);
		CreateInvItems(slf,ItPo_Health_03,3);
		CreateInvItems(slf,ItPo_Mana_Addon_04,1);
		CreateInvItems(slf,ItPo_Health_Addon_04,1);
		CreateInvItems(slf,ItAt_Sting,5);
		CreateInvItems(slf,ItRw_Arrow,100);
		CreateInvItems(slf,ItRw_Bolt,100);
		CreateInvItems(slf,ItMW_Addon_Keule_1h_01,1);
		CreateInvItems(slf,ItMW_Addon_Keule_2h_01,1);
		CreateInvItems(slf,ItRi_Prot_Edge_02,1);
		Fisk_ItemsGiven_Chapter_1 = TRUE;
	};
	if((Kapitel >= 2) && (Fisk_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems(slf,ItFo_Booze,5);
		CreateInvItems(slf,ItFo_Apple,5);
		CreateInvItems(slf,ItFo_Bread,5);
		CreateInvItems(slf,ItPl_Mana_Herb_02,10);
		CreateInvItems(slf,ItPl_Mana_Herb_03,5);
		CreateInvItems(slf,ItPl_Health_Herb_02,10);
		CreateInvItems(slf,ItPl_Health_Herb_03,5);
		CreateInvItems(slf,ItPl_Temp_Herb,3);
		CreateInvItems(slf,ItPl_Beet,3);
		CreateInvItems(slf,ItPo_Mana_01,5);
		CreateInvItems(slf,ItPo_Health_01,5);
		CreateInvItems(slf,ItPo_Mana_02,4);
		CreateInvItems(slf,ItPo_Health_02,4);
		CreateInvItems(slf,ItPo_Mana_03,3);
		CreateInvItems(slf,ItPo_Health_03,3);
		CreateInvItems(slf,ItPo_Mana_Addon_04,1);
		CreateInvItems(slf,ItPo_Health_Addon_04,1);
		CreateInvItems(slf,ItAt_Sting,5);
		CreateInvItems(slf,ItRw_Arrow,100);
		CreateInvItems(slf,ItRw_Bolt,100);
		Fisk_ItemsGiven_Chapter_2 = TRUE;
	};
	if((Kapitel >= 3) && (Fisk_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems(slf,ItFo_Booze,5);
		CreateInvItems(slf,ItFo_Apple,5);
		CreateInvItems(slf,ItFo_Bread,5);
		CreateInvItems(slf,ItPl_Mana_Herb_02,10);
		CreateInvItems(slf,ItPl_Mana_Herb_03,5);
		CreateInvItems(slf,ItPl_Health_Herb_02,10);
		CreateInvItems(slf,ItPl_Health_Herb_03,5);
		CreateInvItems(slf,ItPl_Temp_Herb,3);
		CreateInvItems(slf,ItPl_Beet,3);
		CreateInvItems(slf,ItPo_Mana_01,5);
		CreateInvItems(slf,ItPo_Health_01,5);
		CreateInvItems(slf,ItPo_Mana_02,4);
		CreateInvItems(slf,ItPo_Health_02,4);
		CreateInvItems(slf,ItPo_Mana_03,3);
		CreateInvItems(slf,ItPo_Health_03,3);
		CreateInvItems(slf,ItPo_Mana_Addon_04,1);
		CreateInvItems(slf,ItPo_Health_Addon_04,1);
		CreateInvItems(slf,ItAt_Sting,5);
		CreateInvItems(slf,ItRw_Arrow,100);
		CreateInvItems(slf,ItRw_Bolt,100);
		Fisk_ItemsGiven_Chapter_3 = TRUE;
	};
	if((Kapitel >= 4) && (Fisk_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems(slf,ItFo_Booze,5);
		CreateInvItems(slf,ItFo_Apple,5);
		CreateInvItems(slf,ItFo_Bread,5);
		CreateInvItems(slf,ItPl_Mana_Herb_02,10);
		CreateInvItems(slf,ItPl_Mana_Herb_03,5);
		CreateInvItems(slf,ItPl_Health_Herb_02,10);
		CreateInvItems(slf,ItPl_Health_Herb_03,5);
		CreateInvItems(slf,ItPl_Temp_Herb,3);
		CreateInvItems(slf,ItPo_Mana_01,5);
		CreateInvItems(slf,ItPo_Health_01,5);
		CreateInvItems(slf,ItPo_Mana_02,4);
		CreateInvItems(slf,ItPo_Health_02,4);
		CreateInvItems(slf,ItPo_Mana_03,3);
		CreateInvItems(slf,ItPo_Health_03,3);
		CreateInvItems(slf,ItPo_Mana_Addon_04,1);
		CreateInvItems(slf,ItPo_Health_Addon_04,1);
		CreateInvItems(slf,ItRw_Arrow,100);
		CreateInvItems(slf,ItRw_Bolt,100);
		Fisk_ItemsGiven_Chapter_4 = TRUE;
	};
	if((Kapitel >= 5) && (Fisk_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems(slf,ItFo_Booze,5);
		CreateInvItems(slf,ItFo_Apple,5);
		CreateInvItems(slf,ItFo_Bread,5);
		CreateInvItems(slf,ItPl_Mana_Herb_02,10);
		CreateInvItems(slf,ItPl_Mana_Herb_03,5);
		CreateInvItems(slf,ItPl_Health_Herb_02,10);
		CreateInvItems(slf,ItPl_Health_Herb_03,5);
		CreateInvItems(slf,ItPl_Temp_Herb,3);
		CreateInvItems(slf,ItPo_Mana_01,5);
		CreateInvItems(slf,ItPo_Health_01,5);
		CreateInvItems(slf,ItPo_Mana_02,4);
		CreateInvItems(slf,ItPo_Health_02,4);
		CreateInvItems(slf,ItPo_Mana_03,3);
		CreateInvItems(slf,ItPo_Health_03,3);
		CreateInvItems(slf,ItPo_Mana_Addon_04,1);
		CreateInvItems(slf,ItPo_Health_Addon_04,1);
		CreateInvItems(slf,ItRw_Arrow,100);
		CreateInvItems(slf,ItRw_Bolt,100);
		Fisk_ItemsGiven_Chapter_5 = TRUE;
	};
};

