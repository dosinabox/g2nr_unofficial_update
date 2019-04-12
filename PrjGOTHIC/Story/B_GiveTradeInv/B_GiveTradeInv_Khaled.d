
var int Khaled_ItemsGiven_Chapter_1;
var int Khaled_ItemsGiven_Chapter_2;
var int Khaled_ItemsGiven_Chapter_3;
var int Khaled_ItemsGiven_Chapter_4;
var int Khaled_ItemsGiven_Chapter_5;

func void B_GiveTradeInv_Khaled(var C_Npc slf)
{
	if((Kapitel >= 1) && (Khaled_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItMw_Nagelkeule2,1);
		CreateInvItems(slf,ItMw_Streitaxt1,1);
		CreateInvItems(slf,ItMw_Schwert3,1);
		CreateInvItems(slf,ItMw_Streitkolben,1);
		CreateInvItems(slf,ItMw_Zweihaender2,1);
		CreateInvItems(slf,ItMw_Streitaxt2,1);
		CreateInvItems(slf,ItMw_Zweihaender4,1);
		CreateInvItems(slf,ItMw_Barbarenstreitaxt,1);
		CreateInvItems(slf,ItMw_Berserkeraxt,1);
		CreateInvItems(slf,ItRw_Bow_L_01,1);
		CreateInvItems(slf,ItRw_Bow_L_03,1);
		CreateInvItems(slf,ItRw_Bow_M_03,1);
		CreateInvItems(slf,ItRw_Bow_H_02,1);
		CreateInvItems(slf,ItRw_Bow_H_04,1);
		CreateInvItems(slf,ItRw_Crossbow_M_02,1);
		CreateInvItems(slf,ItRw_Crossbow_H_02,1);
		CreateInvItems(slf,ItRw_Arrow,30);
		CreateInvItems(slf,ItBE_Addon_Leather_01,1);
		Khaled_ItemsGiven_Chapter_1 = TRUE;
	};
	if((Kapitel >= 2) && (Khaled_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,250);
		CreateInvItems(slf,ItRw_Arrow,50);
		CreateInvItems(slf,ItRw_Bolt,30);
		Khaled_ItemsGiven_Chapter_2 = TRUE;
	};
	if((Kapitel >= 3) && (Khaled_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,450);
		CreateInvItems(slf,ItRw_Arrow,70);
		CreateInvItems(slf,ItRw_Bolt,50);
		CreateInvItems(slf,ItBe_Addon_Prot_Point,1);
		CreateInvItems(slf,ItMi_Nugget,1);
		Khaled_ItemsGiven_Chapter_3 = TRUE;
	};
	if((Kapitel >= 4) && (Khaled_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,700);
		CreateInvItems(slf,ItMiSwordraw,1);
		CreateInvItems(slf,ItRw_Arrow,80);
		CreateInvItems(slf,ItRw_Bolt,60);
		CreateInvItems(slf,ItBe_Addon_Prot_EDGE,1);
		CreateInvItems(slf,ItBe_Addon_Prot_EdgPoi,1);
		CreateInvItems(slf,ItMi_Nugget,2);
		Khaled_ItemsGiven_Chapter_4 = TRUE;
	};
	if((Kapitel >= 5) && (Khaled_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,1100);
		CreateInvItems(slf,ItRw_Arrow,100);
		CreateInvItems(slf,ItRw_Bolt,70);
		Khaled_ItemsGiven_Chapter_5 = TRUE;
	};
};

