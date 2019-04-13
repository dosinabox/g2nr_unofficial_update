
var int Diego_DI_ItemsGiven;

func void B_GiveTradeInv_Diego_DI(var C_Npc slf)
{
	if(Diego_DI_ItemsGiven == FALSE)
	{
		CreateInvItems(slf,ItRw_Arrow,160);
		CreateInvItems(slf,ItRw_Bolt,120);
		CreateInvItems(slf,ItKE_lockpick,20);
		CreateInvItems(slf,ItRw_Bow_L_01,1);
		Diego_DI_ItemsGiven = TRUE;
	};
};

