
var int Karras_ItemsGiven_Chapter_1;
var int Karras_ItemsGiven_Chapter_2;
var int Karras_ItemsGiven_Chapter_3;
var int Karras_ItemsGiven_Chapter_4;
var int Karras_ItemsGiven_Chapter_5;

func void B_GiveTradeInv_Karras(var C_Npc slf)
{
	if((Kapitel >= 1) && (Karras_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItSc_SumGobSkel,1);
		CreateInvItems(slf,ItRi_Prot_Total_01,1);
		Karras_ItemsGiven_Chapter_1 = TRUE;
	};
	if((Kapitel >= 2) && (EnterOW_Kapitel2 == TRUE) && (Karras_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItSc_TrfSheep,1);
		CreateInvItems(slf,ItSc_TrfScavenger,1);
		CreateInvItems(slf,ItSc_TrfGiantRat,1);
		CreateInvItems(slf,ItSc_TrfGiantBug,1);
		CreateInvItems(slf,ItSc_TrfWolf,1);
		CreateInvItems(slf,ItSc_SumGobSkel,1);
		CreateInvItems(slf,ItSc_SumWolf,1);
		Karras_ItemsGiven_Chapter_2 = TRUE;
	};
	if((Kapitel >= 3) && (Karras_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItSc_TrfSheep,3);
		CreateInvItems(slf,ItSc_TrfScavenger,3);
		CreateInvItems(slf,ItSc_TrfGiantRat,3);
		CreateInvItems(slf,ItSc_TrfGiantBug,3);
		CreateInvItems(slf,ItSc_TrfWolf,3);
		CreateInvItems(slf,ItSc_TrfWaran,3);
		CreateInvItems(slf,ItSc_TrfSnapper,3);
		CreateInvItems(slf,ItSc_SumGobSkel,1);
		CreateInvItems(slf,ItSc_SumWolf,1);
		CreateInvItems(slf,ItSc_SumSkel,1);
		Karras_ItemsGiven_Chapter_3 = TRUE;
	};
	if((Kapitel >= 4) && (Karras_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,150);
		CreateInvItems(slf,ItSc_TrfSheep,4);
		CreateInvItems(slf,ItSc_TrfScavenger,4);
		CreateInvItems(slf,ItSc_TrfGiantRat,4);
		CreateInvItems(slf,ItSc_TrfGiantBug,2);
		CreateInvItems(slf,ItSc_TrfWolf,2);
		CreateInvItems(slf,ItSc_TrfWaran,2);
		CreateInvItems(slf,ItSc_TrfSnapper,2);
		CreateInvItems(slf,ItSc_TrfWarg,2);
		CreateInvItems(slf,ItSc_TrfFireWaran,2);
		CreateInvItems(slf,ItSc_SumGobSkel,1);
		CreateInvItems(slf,ItSc_SumWolf,1);
		CreateInvItems(slf,ItSc_SumSkel,1);
		CreateInvItems(slf,ItSc_SumGol,1);
		Karras_ItemsGiven_Chapter_4 = TRUE;
	};
	if((Kapitel >= 5) && (Karras_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,200);
		CreateInvItems(slf,ItSc_TrfSheep,4);
		CreateInvItems(slf,ItSc_TrfScavenger,4);
		CreateInvItems(slf,ItSc_TrfGiantRat,4);
		CreateInvItems(slf,ItSc_TrfGiantBug,2);
		CreateInvItems(slf,ItSc_TrfWolf,2);
		CreateInvItems(slf,ItSc_TrfWaran,2);
		CreateInvItems(slf,ItSc_TrfSnapper,2);
		CreateInvItems(slf,ItSc_TrfWarg,2);
		CreateInvItems(slf,ItSc_TrfFireWaran,2);
		CreateInvItems(slf,ItSc_TrfLurker,2);
		CreateInvItems(slf,ItSc_TrfShadowbeast,2);
		CreateInvItems(slf,ItSc_TrfDragonSnapper,2);
		CreateInvItems(slf,ItSc_SumGobSkel,1);
		CreateInvItems(slf,ItSc_SumWolf,1);
		CreateInvItems(slf,ItSc_SumSkel,1);
		CreateInvItems(slf,ItSc_SumGol,1);
		CreateInvItems(slf,ItSc_SumDemon,1);
		CreateInvItems(slf,ItSc_ArmyOfDarkness,1);
		Karras_ItemsGiven_Chapter_5 = TRUE;
	};
};

