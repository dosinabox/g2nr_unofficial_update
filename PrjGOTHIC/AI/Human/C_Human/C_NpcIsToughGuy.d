
func int C_NpcIsToughGuy(var C_Npc slf)
{
	if(slf.aivar[AIV_ToughGuy] == TRUE)
	{
		return TRUE;
	};
	if((slf.guild == GIL_SLD) || (slf.guild == GIL_DJG) || (slf.guild == GIL_BDT) || (slf.guild == GIL_PIR))
	{
		return TRUE;
	};
	return FALSE;
};

