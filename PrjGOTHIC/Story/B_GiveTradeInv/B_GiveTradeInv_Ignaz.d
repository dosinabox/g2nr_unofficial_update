
var int Ignaz_ItemsGiven_Chapter_1;
var int Ignaz_ItemsGiven_Chapter_2;
var int Ignaz_ItemsGiven_Chapter_3;
var int Ignaz_ItemsGiven_Chapter_4;
var int Ignaz_ItemsGiven_Chapter_5;

func void B_GiveTradeInv_Ignaz(var C_Npc slf)
{
	if((Kapitel >= 1) && (Ignaz_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItPo_Mana_01,1);
		CreateInvItems(slf,ItPo_Health_01,1);
		CreateInvItems(slf,ItPo_Speed,1);
		CreateInvItems(slf,ItPo_Health_Addon_04,3);
		CreateInvItems(slf,ItPo_Mana_Addon_04,3);
		CreateInvItems(slf,ItMi_Flask,10);
		CreateInvItems(slf,ItSc_TrfSheep,1);
		CreateInvItems(slf,ItSc_TrfScavenger,1);
		CreateInvItems(slf,ItSc_TrfGiantRat,1);
		CreateInvItems(slf,ItSc_TrfGiantBug,1);
		CreateInvItems(slf,ItSc_TrfWolf,3);
		CreateInvItems(slf,ItSc_TrfLurker,1);
		CreateInvItems(slf,ItSc_TrfWaran,1);
		CreateInvItems(slf,ItSc_TrfSnapper,3);
		CreateInvItems(slf,ItSc_TrfWarg,1);
		CreateInvItems(slf,ItSc_TrfShadowbeast,1);
		CreateInvItems(slf,ItSc_TrfDragonSnapper,1);
		CreateInvItems(slf,ItSc_TrfFireWaran,1);
		CreateInvItems(slf,ItSc_Charm,5);
		CreateInvItems(slf,ItSc_Sleep,1);
		Ignaz_ItemsGiven_Chapter_1 = TRUE;
	};
	if((Kapitel >= 2) && (Ignaz_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,200);
		CreateInvItems(slf,ItPo_Health_Addon_04,3);
		CreateInvItems(slf,ItPo_Mana_Addon_04,3);
		CreateInvItems(slf,ItPo_Mana_01,2);
		CreateInvItems(slf,ItPo_Health_01,2);
		CreateInvItems(slf,ItPo_Speed,2);
		CreateInvItems(slf,ItSc_Charm,5);
		CreateInvItems(slf,ItMi_Flask,10);
		Ignaz_ItemsGiven_Chapter_2 = TRUE;
	};
	if((Kapitel >= 3) && (Ignaz_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,300);
		CreateInvItems(slf,ItPo_Health_Addon_04,3);
		CreateInvItems(slf,ItPo_Mana_Addon_04,3);
		CreateInvItems(slf,ItPo_Mana_01,3);
		CreateInvItems(slf,ItPo_Health_01,3);
		CreateInvItems(slf,ItPo_Speed,3);
		CreateInvItems(slf,ItSc_Charm,5);
		CreateInvItems(slf,ItMi_Flask,10);
		Ignaz_ItemsGiven_Chapter_3 = TRUE;
	};
	if((Kapitel >= 4) && (Ignaz_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,400);
		CreateInvItems(slf,ItPo_Health_Addon_04,3);
		CreateInvItems(slf,ItPo_Mana_Addon_04,3);
		CreateInvItems(slf,ItPo_Mana_01,4);
		CreateInvItems(slf,ItPo_Health_01,4);
		CreateInvItems(slf,ItPo_Speed,4);
		CreateInvItems(slf,ItSc_Charm,5);
		CreateInvItems(slf,ItMi_Flask,10);
		Ignaz_ItemsGiven_Chapter_4 = TRUE;
	};
	if((Kapitel >= 5) && (Ignaz_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,500);
		CreateInvItems(slf,ItPo_Mana_01,5);
		CreateInvItems(slf,ItPo_Health_01,5);
		CreateInvItems(slf,ItPo_Speed,5);
		CreateInvItems(slf,ItSc_Charm,5);
		CreateInvItems(slf,ItMi_Flask,10);
		Ignaz_ItemsGiven_Chapter_5 = TRUE;
	};
};

