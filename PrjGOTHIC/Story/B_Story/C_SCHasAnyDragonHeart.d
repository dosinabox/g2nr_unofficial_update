
func int C_SCHasAnyDragonHeart(var C_Npc npc)
{
	if(Npc_HasItems(npc,ItAt_IcedragonHeart))
	{
		return TRUE;
	};
	if(Npc_HasItems(npc,ItAt_RockdragonHeart))
	{
		return TRUE;
	};
	if(Npc_HasItems(npc,ItAt_FiredragonHeart))
	{
		return TRUE;
	};
	if(Npc_HasItems(npc,ItAt_SwampdragonHeart))
	{
		return TRUE;
	};
	return FALSE;
};

