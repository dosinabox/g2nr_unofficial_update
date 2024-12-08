
func int B_DetectAndTakeItem(var C_Npc npc,var int category)
{
	Npc_PerceiveAll(npc);
	if(!Wld_DetectItem(npc,category))
	{
		return FALSE;
	};
	if(!Hlp_IsValidItem(item))
	{
		return FALSE;
	};
	if(Npc_GetDistToItem(npc,item) > 500)
	{
		return FALSE;
	};
	AI_TakeItem(npc,item);
	return TRUE;
};

