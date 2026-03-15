
func int C_SCHasGregsItems()
{
	if(Npc_HasItems(hero,ItAm_Addon_Greg) && Npc_HasItems(hero,ItMi_GregsSilverPlate) && Npc_HasItems(hero,ItMi_GoldChalice))
	{
		if(Npc_HasItems(hero,ItSe_GoldPocket100))
		{
			return TRUE;
		};
		if(Npc_HasItems(hero,ItMi_Gold) < 100)
		{
			return TRUE;
		};
	};
	return FALSE;
};

