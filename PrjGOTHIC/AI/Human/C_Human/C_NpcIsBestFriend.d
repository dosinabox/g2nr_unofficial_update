
func int C_NpcIsBestFriend(var C_Npc slf)
{
	if(C_IsNpc(slf,PC_ThiefOW))
	{
		return TRUE;
	};
	if(C_IsNpc(slf,PC_Thief_NW))
	{
		return TRUE;
	};
	if(C_IsNpc(slf,PC_Thief_DI))
	{
		return TRUE;
	};
	if(C_IsNpc(slf,PC_Psionic))
	{
		return TRUE;
	};
	if(C_IsNpc(slf,PC_Psionic_DI))
	{
		return TRUE;
	};
	if(C_IsNpc(slf,PC_Mage_OW))
	{
		return TRUE;
	};
	if(C_IsNpc(slf,PC_Mage_NW))
	{
		return TRUE;
	};
	if(C_IsNpc(slf,PC_Mage_DI))
	{
		return TRUE;
	};
	if(C_IsNpc(slf,PC_Fighter_OW))
	{
		return TRUE;
	};
	if(C_IsNpc(slf,PC_Fighter_NW_vor_DJG))
	{
		return TRUE;
	};
	if(C_IsNpc(slf,PC_Fighter_DJG))
	{
		return TRUE;
	};
	if(C_IsNpc(slf,PC_Fighter_NW_nach_DJG))
	{
		return TRUE;
	};
	if(C_IsNpc(slf,PC_Fighter_DI))
	{
		return TRUE;
	};
	if(C_IsNpc(slf,DJG_705_Angar))
	{
		return TRUE;
	};
	if(C_IsNpc(slf,DJG_705_Angar_NW))
	{
		return TRUE;
	};
	if(C_IsNpc(slf,DJG_705_Angar_DI))
	{
		return TRUE;
	};
	if(C_IsNpc(slf,NONE_100_Xardas))
	{
		return TRUE;
	};
	if(C_IsNpc(slf,PIR_1300_Addon_Greg_NW))
	{
		return TRUE;
	};
	return FALSE;
};

