
var int Kardif_ItemsGiven_Chapter_1;
var int Kardif_ItemsGiven_Chapter_2;
var int Kardif_ItemsGiven_Chapter_3;
var int Kardif_ItemsGiven_Chapter_4;
var int Kardif_ItemsGiven_Chapter_5;

func void B_GiveTradeInv_Kardif(var C_Npc slf)
{
	if((Kapitel >= 1) && (Kardif_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,80);
		CreateInvItems(slf,ItFo_FishSoup,3);
		CreateInvItems(slf,ItFoMutton,1);
		CreateInvItems(slf,ItFo_Fish,4);
		CreateInvItems(slf,ItFo_Booze,2);
		CreateInvItems(slf,ItFo_Beer,4);
		CreateInvItems(slf,ItFo_Wine,3);
		Kardif_ItemsGiven_Chapter_1 = TRUE;
	};
	if((Kapitel >= 2) && (Kardif_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItFo_Sausage,2);
		CreateInvItems(slf,ItFo_Fish,4);
		CreateInvItems(slf,ItFo_Booze,2);
		CreateInvItems(slf,ItFo_Beer,4);
		CreateInvItems(slf,ItFo_Wine,3);
		if(Knows_SecretSign == TRUE)
		{
			CreateInvItems(self,ItKE_lockpick,20);
		};
		Kardif_ItemsGiven_Chapter_2 = TRUE;
	};
	if((Kapitel >= 3) && (Kardif_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,150);
		CreateInvItems(slf,ItFo_Sausage,2);
		CreateInvItems(slf,ItFo_FishSoup,3);
		CreateInvItems(slf,ItFoMutton,1);
		CreateInvItems(slf,ItFo_Wine,1);
		CreateInvItems(slf,ItFo_Beer,4);
		if(Knows_SecretSign == TRUE)
		{
			CreateInvItems(self,ItKE_lockpick,20);
		};
		Kardif_ItemsGiven_Chapter_3 = TRUE;
	};
	if((Kapitel >= 4) && (Kardif_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,200);
		CreateInvItems(slf,ItFo_Sausage,2);
		CreateInvItems(slf,ItFo_FishSoup,3);
		CreateInvItems(slf,ItFoMutton,1);
		CreateInvItems(slf,ItFo_Fish,4);
		CreateInvItems(slf,ItFo_Wine,1);
		CreateInvItems(slf,ItFo_Booze,2);
		CreateInvItems(slf,ItFo_Beer,4);
		if(Knows_SecretSign == TRUE)
		{
			CreateInvItems(self,ItKE_lockpick,20);
		};
		Kardif_ItemsGiven_Chapter_4 = TRUE;
	};
	if((Kapitel >= 5) && (Kardif_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,300);
		CreateInvItems(slf,ItFo_Sausage,3);
		CreateInvItems(slf,ItFo_FishSoup,5);
		CreateInvItems(slf,ItFoMutton,7);
		CreateInvItems(slf,ItFo_Fish,8);
		CreateInvItems(slf,ItFo_Wine,3);
		CreateInvItems(slf,ItFo_Booze,4);
		CreateInvItems(slf,ItFo_Beer,4);
		if(Knows_SecretSign == TRUE)
		{
			CreateInvItems(self,ItKE_lockpick,20);
		};
		Kardif_ItemsGiven_Chapter_5 = TRUE;
	};
};

