
var int Bennet_DI_ItemsGiven;

func void B_GiveTradeInv_Bennet_DI(var C_Npc slf)
{
	if(Bennet_DI_ItemsGiven == FALSE)
	{
//		CreateInvItems(slf,ItMi_Gold,700);
		CreateInvItems(slf,ItMiSwordraw,3);
		CreateInvItems(slf,ItRw_Arrow,140);
		CreateInvItems(slf,ItRw_Bolt,140);
		CreateInvItems(slf,ItMw_1H_Mace_L_04,1);
		CreateInvItems(slf,ItMw_ElBastardo,1);
		CreateInvItems(slf,ItMw_Folteraxt,1);
		CreateInvItems(slf,ItMw_Zweihaender4,1);
		CreateInvItems(slf,ItMw_Barbarenstreitaxt,1);
//		CreateInvItems(slf,ItMw_Berserkeraxt,1);
		CreateInvItems(slf,ItMw_Warrioraxt,1);
		CreateInvItems(slf,ItMi_Nugget,4);
		CreateInvItems(slf,ItBe_Addon_STR_10,1);
		CreateInvItems(slf,ItBe_Addon_Prot_EDGE,1);
		if(Npc_HasItems(hero,ItRw_Addon_FireBow))
		{
			CreateInvItems(slf,ItRw_Addon_FireArrow,20);
		};
		if(Npc_HasItems(hero,ItRw_Addon_MagicBow))
		{
			CreateInvItems(slf,ItRw_Addon_MagicArrow,20);
		};
		if(Npc_HasItems(hero,ItRw_Addon_MagicCrossbow))
		{
			CreateInvItems(slf,ItRw_Addon_MagicBolt,10);
		};
		if(Bennet_NW_ItMi_Swordraw_Count > 0)
		{
			CreateInvItems(slf,ItMiSwordraw,Bennet_NW_ItMi_Swordraw_Count);
		};
		if(Bennet_NW_ItMi_Nugget_Count > 0)
		{
			CreateInvItems(slf,ItMi_Nugget,Bennet_NW_ItMi_Nugget_Count);
		};
		Bennet_DI_ItemsGiven = TRUE;
	};
};

