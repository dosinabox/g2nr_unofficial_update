
var int Sengrath_ItemsGiven_Chapter_1;
var int Sengrath_ItemsGiven_Chapter_2;
var int Sengrath_ItemsGiven_Chapter_3;
var int Sengrath_ItemsGiven_Chapter_4;
var int Sengrath_ItemsGiven_Chapter_5;

func void B_GiveTradeInv_Sengrath(var C_Npc slf)
{
	if((Kapitel >= 1) && (Sengrath_ItemsGiven_Chapter_1 == FALSE))
	{
		Sengrath_ItemsGiven_Chapter_1 = TRUE;
	};
	if((Kapitel >= 2) && (Sengrath_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,200);
		CreateInvItems(slf,ItPo_Mana_01,10);
		CreateInvItems(slf,ItPo_Mana_02,5);
		CreateInvItems(slf,ItSc_Zap,3);
		CreateInvItems(slf,ItSc_SumWolf,1);
		CreateInvItems(slf,ItSc_Sleep,2);
		CreateInvItems(slf,ItSc_IceCube,2);
		CreateInvItems(slf,ItSc_Windfist,3);
		CreateInvItems(slf,ItSc_MediumHeal,5);
		CreateInvItems(slf,ItSc_LightningFlash,2);
		CreateInvItems(slf,ItRi_Prot_Fire_02,1);
		CreateInvItems(slf,ItBe_Addon_STR_10,1);
		CreateInvItems(slf,ItBe_Addon_Prot_FIRE,1);
		Sengrath_ItemsGiven_Chapter_2 = TRUE;
	};
	if((Kapitel >= 3) && (Sengrath_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItPo_Mana_01,10);
		CreateInvItems(slf,ItPo_Mana_02,5);
		Sengrath_ItemsGiven_Chapter_3 = TRUE;
	};
	if((Kapitel >= 4) && (Sengrath_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,150);
		CreateInvItems(slf,ItPo_Mana_01,10);
		CreateInvItems(slf,ItPo_Mana_02,5);
		Sengrath_ItemsGiven_Chapter_4 = TRUE;
	};
	if((Kapitel >= 5) && (Sengrath_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,200);
		CreateInvItems(slf,ItPo_Mana_01,10);
		CreateInvItems(slf,ItPo_Mana_02,5);
		Sengrath_ItemsGiven_Chapter_5 = TRUE;
	};
};

