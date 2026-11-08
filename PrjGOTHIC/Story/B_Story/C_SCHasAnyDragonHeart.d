
func int C_SCHasAnyDragonHeart(var C_Npc npc)
{
	if(Npc_HasItems(npc,ItAt_IceDragonHeart))
	{
		return TRUE;
	};
	if(Npc_HasItems(npc,ItAt_RockDragonHeart))
	{
		return TRUE;
	};
	if(Npc_HasItems(npc,ItAt_FireDragonHeart))
	{
		return TRUE;
	};
	if(Npc_HasItems(npc,ItAt_SwampDragonHeart))
	{
		return TRUE;
	};
	return FALSE;
};

