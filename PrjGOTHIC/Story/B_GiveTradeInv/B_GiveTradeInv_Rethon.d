
var int Rethon_ItemsGiven_Chapter_1;
var int Rethon_ItemsGiven_Chapter_2;
var int Rethon_ItemsGiven_Chapter_3;
var int Rethon_ItemsGiven_Chapter_4;
var int Rethon_ItemsGiven_Chapter_5;

func void B_GiveTradeInv_Rethon(var C_Npc slf)
{
	if(Rethon_ItemsGiven_Chapter_4 == FALSE)
	{
		CreateInvItems(slf,ItMw_Inquisitor,1);
		CreateInvItems(slf,ItMw_Streitaxt2,1);
		CreateInvItems(slf,ItMw_Kriegshammer2,1);
		CreateInvItems(slf,ItMw_Orkschlaechter,1);
		CreateInvItems(slf,ItMw_Folteraxt,1);
		CreateInvItems(slf,ItMw_Krummschwert,1);
		CreateInvItems(slf,ItMw_Barbarenstreitaxt,1);
		CreateInvItems(slf,ItMw_Berserkeraxt,1);
		Rethon_ItemsGiven_Chapter_4 = TRUE;
	};
};

