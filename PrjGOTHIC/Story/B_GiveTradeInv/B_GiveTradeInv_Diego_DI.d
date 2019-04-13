
var int Diego_DI_ItemsGiven;

func void B_GiveTradeInv_Diego_DI(var C_Npc slf)
{
	if(Diego_DI_ItemsGiven == FALSE)
	{
		CreateInvItems(slf,ItRw_Arrow,150);
		CreateInvItems(slf,ItRw_Bolt,120);
		CreateInvItems(slf,ItKe_Lockpick,20);
		/*CreateInvItems(slf,ItRw_Bow_L_01,1);
		if(Bennet_IsOnBoard != LOG_SUCCESS)
		{
			CreateInvItems(slf,ItRw_Addon_FireArrow,50);
			CreateInvItems(slf,ItRw_Addon_MagicArrow,40);
			CreateInvItems(slf,ItRw_Addon_MagicBolt,30);
		};*/
		Diego_DI_ItemsGiven = TRUE;
	};
};


