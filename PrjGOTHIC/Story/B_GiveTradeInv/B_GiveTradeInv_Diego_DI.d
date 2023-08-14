
var int Diego_DI_ItemsGiven;

func void B_GiveTradeInv_Diego_DI(var C_Npc slf)
{
	if(Diego_DI_ItemsGiven == FALSE)
	{
		CreateInvItems(slf,ItRw_Arrow,150);
		CreateInvItems(slf,ItRw_Bolt,120);
		CreateInvItems(slf,ItKe_Lockpick,20);
		CreateInvItems(slf,ItBe_Addon_DEX_10,1);
		Diego_DI_ItemsGiven = TRUE;
	};
};


