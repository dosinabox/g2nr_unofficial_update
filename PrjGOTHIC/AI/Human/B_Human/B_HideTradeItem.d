
func void B_HideTradeItem(var C_Npc npc,var int itm)
{
	if(Npc_HasItems(npc,itm))
	{
		npc.aivar[AIV_HiddenTradeItem] = itm;
		Npc_RemoveInvItem(npc,itm);
	};
};

func void B_RestoreHiddenTradeItem(var C_Npc npc)
{
	var int itm;
	itm = npc.aivar[AIV_HiddenTradeItem];
	if(itm == 0)
	{
		return;
	};
	if(itm == npc.aivar[AIV_ItemToSteal])
	{
		if(npc.aivar[AIV_PlayerHasPickedMyPocket] == TRUE)
		{
			return;
		};
	};
	if(!Npc_HasItems(npc,itm))
	{
		CreateInvItem(npc,itm);
	};
	npc.aivar[AIV_HiddenTradeItem] = 0;
};

