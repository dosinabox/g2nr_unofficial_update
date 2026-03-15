
func int C_SCHasAnyFernandoEvidence()
{
	if(Npc_HasItems(hero,ItMw_Addon_BanditTrader))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItRi_Addon_BanditTrader))
	{
		return TRUE;
	};
	if(BanditTrader_Lieferung_Gelesen == TRUE)
	{
		if(Npc_HasItems(hero,ItWr_Addon_BanditTrader))
		{
			return TRUE;
		};
	};
	return FALSE;
};

