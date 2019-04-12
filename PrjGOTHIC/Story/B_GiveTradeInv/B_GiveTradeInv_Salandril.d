
var int Salandril_ItemsGiven_Chapter_1;
var int Salandril_ItemsGiven_Chapter_2;
var int Salandril_ItemsGiven_Chapter_3;
var int Salandril_ItemsGiven_Chapter_4;
var int Salandril_ItemsGiven_Chapter_5;

func void B_GiveTradeInv_Salandril(var C_Npc slf)
{
	if((Kapitel >= 1) && (Salandril_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItPo_Mana_02,5);
		CreateInvItems(slf,ItPo_Health_02,5);
		CreateInvItems(slf,ItPo_Mana_03,2);
		CreateInvItems(slf,ItPo_Health_03,2);
		CreateInvItems(slf,ItPl_Speed_Herb_01,2);
		CreateInvItems(slf,ItSc_Firerain,1);
		CreateInvItems(slf,ItSc_Thunderstorm,1);
		CreateInvItems(slf,ItAm_Prot_Fire_01,1);
		Salandril_ItemsGiven_Chapter_1 = TRUE;
	};
	if((Kapitel >= 2) && (Salandril_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItPo_Mana_02,5);
		CreateInvItems(slf,ItPo_Health_02,5);
		CreateInvItems(slf,ItPo_Mana_03,2);
		CreateInvItems(slf,ItPo_Health_03,2);
		Salandril_ItemsGiven_Chapter_2 = TRUE;
	};
	if((Kapitel >= 3) && (Salandril_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItPo_Mana_02,5);
		CreateInvItems(slf,ItPo_Health_02,5);
		CreateInvItems(slf,ItPo_Mana_03,2);
		CreateInvItems(slf,ItPo_Health_03,2);
		Salandril_ItemsGiven_Chapter_3 = TRUE;
	};
	if((Kapitel >= 4) && (Salandril_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,200);
		CreateInvItems(slf,ItPo_Mana_02,2);
		CreateInvItems(slf,ItPo_Health_02,2);
		CreateInvItems(slf,ItPo_Mana_03,5);
		CreateInvItems(slf,ItPo_Health_03,5);
		Salandril_ItemsGiven_Chapter_4 = TRUE;
	};
	if((Kapitel >= 5) && (Salandril_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,300);
		CreateInvItems(slf,ItPo_Mana_02,2);
		CreateInvItems(slf,ItPo_Health_02,2);
		CreateInvItems(slf,ItPo_Mana_03,5);
		CreateInvItems(slf,ItPo_Health_03,5);
		Salandril_ItemsGiven_Chapter_5 = TRUE;
	};
};

