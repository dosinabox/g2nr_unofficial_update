
func void B_FinishingMove(var C_Npc slf,var C_Npc oth)
{
	if(!Npc_IsInFightMode(slf,FMODE_MELEE))
	{
		Npc_SetToFightMode(slf,ItMw_1h_MISC_Sword);
	};
	AI_FinishingMove(slf,oth);
};

