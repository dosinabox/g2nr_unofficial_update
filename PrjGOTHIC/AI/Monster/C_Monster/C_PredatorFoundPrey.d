
func int C_PredatorFoundPrey(var C_Npc slf,var C_Npc oth)
{
	if((slf.guild == GIL_WOLF) && (slf.aivar[AIV_MM_REAL_ID] != ID_KEILER))
	{
		if(oth.guild == GIL_SHEEP)
		{
			return TRUE;
		};
		if(oth.guild == GIL_GIANT_RAT)
		{
			return TRUE;
		};
		if(oth.guild == GIL_MOLERAT)
		{
			return TRUE;
		};
		if((oth.guild == GIL_SCAVENGER) && (oth.aivar[AIV_MM_REAL_ID] != ID_ORCBITER))
		{
			return TRUE;
		};
	};
	if(slf.guild == GIL_LURKER)
	{
		if(oth.guild == GIL_GOBBO)
		{
			return TRUE;
		};
	};
	if(slf.guild == GIL_SNAPPER)
	{
		if(C_NpcIsHuman(oth))
		{
			return TRUE;
		};
		if(oth.guild == GIL_GOBBO)
		{
			return TRUE;
		};
		if(oth.guild == GIL_SHEEP)
		{
			return TRUE;
		};
		if(oth.guild == GIL_GIANT_RAT)
		{
			return TRUE;
		};
		if(oth.guild == GIL_MOLERAT)
		{
			return TRUE;
		};
		if((oth.guild == GIL_SCAVENGER) && (oth.aivar[AIV_MM_REAL_ID] != ID_ORCBITER))
		{
			return TRUE;
		};
	};
	if(slf.guild == GIL_SHADOWBEAST)
	{
		if(C_NpcIsHuman(oth))
		{
			return TRUE;
		};
		if(C_NpcIsOrc(oth))
		{
			return TRUE;
		};
		if(oth.guild == GIL_SHEEP)
		{
			return TRUE;
		};
		if(oth.guild == GIL_GIANT_RAT)
		{
			return TRUE;
		};
		if(oth.guild == GIL_MOLERAT)
		{
			return TRUE;
		};
		if((oth.guild == GIL_SCAVENGER) && (oth.aivar[AIV_MM_REAL_ID] != ID_ORCBITER))
		{
			return TRUE;
		};
	};
	return FALSE;
};

