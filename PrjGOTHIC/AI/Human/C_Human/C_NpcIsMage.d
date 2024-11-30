
func int C_NpcIsMage(var C_Npc slf)
{
	if(slf.guild == GIL_KDF)
	{
		return TRUE;
	};
	if(slf.guild == GIL_KDW)
	{
		return TRUE;
	};
	if(C_IsNpc(slf,NONE_100_Xardas))
	{
		return TRUE;
	};
	if(C_IsNpc(slf,VLK_439_Vatras))
	{
		return TRUE;
	};
	if(C_IsNpc(slf,KDW_140300_Addon_Myxir_CITY))
	{
		return TRUE;
	};
	if(C_IsNpc(slf,KDF_511_Daron))
	{
		return TRUE;
	};
	return FALSE;
};

