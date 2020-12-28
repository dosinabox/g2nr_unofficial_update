
func int C_NpcIsEvil(var C_Npc slf)
{
	if((slf.guild == GIL_DMT) || (slf.guild == GIL_DRAGON) || (slf.guild == GIL_ORC) || (slf.guild == GIL_DRACONIAN) || (C_NpcIsDemon(slf)) || (slf.aivar[AIV_MM_REAL_ID] == ID_TROLL_BLACK) || C_NpcIsUndead(slf))
	{
		return TRUE;
	};
	return FALSE;
};

