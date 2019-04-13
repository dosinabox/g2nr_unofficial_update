
var int Rupert_ItemsGiven_Chapter_1;

func void B_GiveTradeInv_Rupert(var C_Npc slf)
{
	if((Kapitel >= 1) && (Rupert_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems(slf,ItFo_Apple,12);
		CreateInvItems(slf,ItFo_Bread,5);
		CreateInvItems(slf,ItFo_Milk,5);
		Rupert_ItemsGiven_Chapter_1 = TRUE;
	};
};

