
func int C_SCHasBlessedSword()
{
	if(Npc_HasItems(hero,ItMw_1H_Blessed_02))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItMw_1H_Blessed_03))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItMw_2H_Blessed_02))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItMw_2H_Blessed_03))
	{
		return TRUE;
	};
	return FALSE;
};

