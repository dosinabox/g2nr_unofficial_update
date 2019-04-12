
var int Huno_ItemsGiven_Chapter_1;
var int Huno_ItemsGiven_Chapter_2;
var int Huno_ItemsGiven_Chapter_3;
var int Huno_ItemsGiven_Chapter_4;
var int Huno_ItemsGiven_Chapter_5;

func void B_GiveTradeInv_Addon_Huno(var C_Npc slf)
{
	if((Kapitel >= 1) && (Huno_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems(slf,ItMiSwordraw,3);
		CreateInvItems(slf,ItMi_Nugget,1);
		CreateInvItems(slf,ItMw_Streitaxt1,1);
		CreateInvItems(slf,ItMw_Schwert2,1);
		CreateInvItems(slf,ItMw_Morgenstern,1);
		CreateInvItems(slf,ItMw_2H_Axe_L_01,5);
		CreateInvItems(slf,ItRi_Str_02,1);
		Huno_ItemsGiven_Chapter_1 = TRUE;
	};
	if((Kapitel >= 2) && (Huno_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems(slf,ItMiSwordraw,3);
		CreateInvItems(slf,ItMi_Nugget,1);
		Huno_ItemsGiven_Chapter_2 = TRUE;
	};
	if((Kapitel >= 3) && (Huno_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems(slf,ItMiSwordraw,3);
		CreateInvItems(slf,ItMi_Nugget,1);
		Huno_ItemsGiven_Chapter_3 = TRUE;
	};
	if((Kapitel >= 4) && (Huno_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems(slf,ItMiSwordraw,3);
		CreateInvItems(slf,ItMi_Nugget,1);
		Huno_ItemsGiven_Chapter_4 = TRUE;
	};
	if((Kapitel >= 5) && (Huno_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems(slf,ItMiSwordraw,3);
		CreateInvItems(slf,ItMi_Nugget,1);
		Huno_ItemsGiven_Chapter_5 = TRUE;
	};
};

