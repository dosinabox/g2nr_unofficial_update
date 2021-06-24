
var int Garett_ItemsGiven_Chapter_1;
var int Garett_ItemsGiven_Chapter_2;
var int Garett_ItemsGiven_Chapter_3;
var int Garett_ItemsGiven_Chapter_4;

func void B_GiveTradeInv_Addon_Garett(var C_Npc slf)
{
	if((Kapitel >= 1) && (Garett_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems(slf,ItRw_Arrow,50);
		CreateInvItems(slf,ItRw_Bolt,50);
		CreateInvItems(slf,ItFo_Addon_Rum,1);
		CreateInvItems(slf,ItPo_Health_Addon_04,1);
		CreateInvItems(slf,ItRw_Mil_Crossbow,1);
		CreateInvItems(slf,ItAm_Prot_Fire_01,1);
		CreateInvItems(slf,ItRi_Prot_Mage_02,1);
		if(ClassicMeleeWeaponsTraders == FALSE)
		{
			CreateInvItems(slf,ItMw_ShortSword3,1);
			CreateInvItems(slf,ItMw_2H_Axe_L_01,1);
			CreateInvItems(slf,ItMw_Schiffsaxt,1);
		}
		else
		{
			CreateInvItems(slf,ItMw_ShortSword3,1);
			CreateInvItems(slf,ItMw_2H_Axe_L_01,1);
			CreateInvItems(slf,ItMw_Schiffsaxt,1);
			CreateInvItems(slf,ItMw_Streitaxt1,1);
			CreateInvItems(slf,ItMw_Zweihaender4,1);
			CreateInvItems(slf,ItMw_Orkschlaechter,1);
			CreateInvItems(slf,ItMW_Addon_Hacker_1h_01,1);
			CreateInvItems(slf,ItMW_Addon_Hacker_1h_02,1);
			CreateInvItems(slf,ItMW_Addon_Hacker_2h_01,1);
			CreateInvItems(slf,ItMW_Addon_Hacker_2h_02,1);
			CreateInvItems(slf,ItMw_Piratensaebel,1);
		};
		Garett_ItemsGiven_Chapter_1 = TRUE;
	};
	if((Kapitel >= 2) && (Garett_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems(slf,ItRw_Arrow,50);
		CreateInvItems(slf,ItRw_Bolt,50);
		CreateInvItems(slf,ItMi_Joint,1);
		CreateInvItems(slf,ItMiSwordraw,2);
		CreateInvItems(slf,ItMi_DarkPearl,1);
		CreateInvItems(slf,ItRw_Crossbow_M_01,1);
		CreateInvItems(slf,ItRw_Crossbow_H_01,1);
		if(ClassicMeleeWeaponsTraders == FALSE)
		{
			CreateInvItems(slf,ItMw_Streitaxt1,1);
			CreateInvItems(slf,ItMW_Addon_Hacker_1h_02,1);
			CreateInvItems(slf,ItMW_Addon_Hacker_2h_02,1);
			CreateInvItems(slf,ItMw_2H_Hammer_01,1);
		};
		Garett_ItemsGiven_Chapter_2 = TRUE;
	};
	if((Kapitel >= 3) && (Garett_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems(slf,ItRw_Arrow,50);
		CreateInvItems(slf,ItRw_Bolt,50);
		if(ClassicMeleeWeaponsTraders == FALSE)
		{
			CreateInvItems(slf,ItMw_Orkschlaechter,1);
			CreateInvItems(slf,ItMW_Addon_Hacker_1h_01,1);
			CreateInvItems(slf,ItMW_Addon_Hacker_2h_01,1);
		};
		Garett_ItemsGiven_Chapter_3 = TRUE;
	};
	if((Kapitel >= 4) && (Garett_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems(slf,ItRw_Arrow,50);
		CreateInvItems(slf,ItRw_Bolt,50);
		if(ClassicMeleeWeaponsTraders == FALSE)
		{
			CreateInvItems(slf,ItMw_Zweihaender4,1);
		};
		Garett_ItemsGiven_Chapter_4 = TRUE;
	};
};

