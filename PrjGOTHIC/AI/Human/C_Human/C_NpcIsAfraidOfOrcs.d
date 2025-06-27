
func int C_NpcIsAfraidOfOrcs(var C_Npc slf)
{
	if(C_NpcIsMage(slf))
	{
		return FALSE;
	};
	if(C_NpcIsPaladin(slf))
	{
		return FALSE;
	};
	if(C_IsNpc(slf,NONE_101_Mario))
	{
		return FALSE;
	};
	if(C_IsNpc(slf,PC_Thief_NW))
	{
		return FALSE;
	};
	if(C_IsNpc(slf,VLK_449_Lares))
	{
		return FALSE;
	};
	if(C_IsNpc(slf,VLK_440_Bartok))
	{
		return FALSE;
	};
	if(C_IsNpc(slf,PC_Psionic))
	{
		return FALSE;
	};
	if(C_IsNpc(slf,BAU_4300_Addon_Cavalorn))
	{
		return FALSE;
	};
	return TRUE;
};

