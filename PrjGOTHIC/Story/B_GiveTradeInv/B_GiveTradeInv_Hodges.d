
var int Hodges_ItemsGiven_Chapter_1;
var int Hodges_ItemsGiven_Chapter_2;
var int Hodges_ItemsGiven_Chapter_3;
var int Hodges_ItemsGiven_Chapter_4;
var int Hodges_ItemsGiven_Chapter_5;

func void B_GiveTradeInv_Hodges(var C_Npc slf)
{
	if((Kapitel >= 1) && (Hodges_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems(slf,ItMw_Sense,1);
		CreateInvItems(slf,ItMw_ShortSword2,1);
		CreateInvItems(slf,ItMw_1H_Mace_L_04,1);
		CreateInvItems(slf,ItMw_1h_Sld_Axe,1);
		CreateInvItems(slf,ItMw_1h_Sld_Sword,1);
		CreateInvItems(slf,ItMw_Nagelknueppel,1);
		CreateInvItems(slf,ItMw_2h_Sld_Sword,1);
		CreateInvItems(slf,ItMw_1H_Sword_L_03,1);
		Hodges_ItemsGiven_Chapter_1 = TRUE;
	};
	if((Kapitel >= 2) && (Hodges_ItemsGiven_Chapter_2 == FALSE))
	{
		Hodges_ItemsGiven_Chapter_2 = TRUE;
	};
	if((Kapitel >= 3) && (Hodges_ItemsGiven_Chapter_3 == FALSE))
	{
		Hodges_ItemsGiven_Chapter_3 = TRUE;
	};
	if((Kapitel >= 4) && (Hodges_ItemsGiven_Chapter_4 == FALSE))
	{
		Hodges_ItemsGiven_Chapter_4 = TRUE;
	};
	if((Kapitel >= 5) && (Hodges_ItemsGiven_Chapter_5 == FALSE))
	{
		Hodges_ItemsGiven_Chapter_5 = TRUE;
	};
};

