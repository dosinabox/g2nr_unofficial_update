
func int C_WantToEat(var C_Npc slf,var C_Npc oth)
{
	if(slf.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return FALSE;
	};
	if(Npc_IsInState(slf,ZS_MM_ThreatenEnemy))
	{
		return FALSE;
	};
	if(Npc_IsInState(slf,ZS_MM_Attack))
	{
		return FALSE;
	};
	if(Npc_IsInState(slf,ZS_MM_Flee))
	{
		return FALSE;
	};
	if(!Npc_IsDead(hero))
	{
		if(Npc_GetDistToNpc(slf,hero) <= 300)
		{
			return FALSE;
		};
		if(Npc_GetDistToNpc(hero,oth) <= 300)
		{
			return FALSE;
		};
	};
	if(slf.guild == GIL_SCAVENGER)
	{
		if(oth.guild < GIL_SEPERATOR_HUM)
		{
			return TRUE;
		};
		if(oth.guild > GIL_SEPERATOR_ORC)
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
		if(oth.guild == GIL_HARPY)
		{
			return TRUE;
		};
		if(oth.guild == GIL_WOLF)
		{
			return TRUE;
		};
		if(oth.guild == GIL_SUMMONED_WOLF)
		{
			return TRUE;
		};
		if(oth.guild == GIL_SHADOWBEAST)
		{
			return TRUE;
		};
		if(oth.guild == GIL_GOBBO)
		{
			return TRUE;
		};
		if(oth.guild == GIL_WARAN)
		{
			return TRUE;
		};
		if(oth.guild == GIL_LURKER)
		{
			return TRUE;
		};
		if(oth.guild == GIL_SNAPPER)
		{
			return TRUE;
		};
		if(oth.guild == GIL_MEATBUG)
		{
			return TRUE;
		};
		if(oth.guild == GIL_GIANT_BUG)
		{
			return TRUE;
		};
		if(oth.guild == GIL_BLOODFLY)
		{
			return TRUE;
		};
		if(oth.guild == GIL_MINECRAWLER)
		{
			return TRUE;
		};
	}
	else if(slf.guild == GIL_GIANT_RAT)
	{
		if(oth.guild < GIL_SEPERATOR_HUM)
		{
			return TRUE;
		};
		if(oth.guild > GIL_SEPERATOR_ORC)
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
		if(oth.guild == GIL_SCAVENGER)
		{
			return TRUE;
		};
		if(oth.guild == GIL_HARPY)
		{
			return TRUE;
		};
		if(oth.guild == GIL_WOLF)
		{
			return TRUE;
		};
		if(oth.guild == GIL_SUMMONED_WOLF)
		{
			return TRUE;
		};
		if(oth.guild == GIL_SHADOWBEAST)
		{
			return TRUE;
		};
		if(oth.guild == GIL_GOBBO)
		{
			return TRUE;
		};
		if(oth.guild == GIL_WARAN)
		{
			return TRUE;
		};
		if(oth.guild == GIL_LURKER)
		{
			return TRUE;
		};
		if(oth.guild == GIL_SNAPPER)
		{
			return TRUE;
		};
		if(oth.guild == GIL_MEATBUG)
		{
			return TRUE;
		};
		if(oth.guild == GIL_GIANT_BUG)
		{
			return TRUE;
		};
		if(oth.guild == GIL_BLOODFLY)
		{
			return TRUE;
		};
		if(oth.guild == GIL_MINECRAWLER)
		{
			return TRUE;
		};
	}
	else if(slf.guild == GIL_GIANT_BUG)
	{
		if(oth.guild == GIL_MEATBUG)
		{
			return TRUE;
		};
		if(oth.guild == GIL_BLOODFLY)
		{
			return TRUE;
		};
		if(oth.guild == GIL_MINECRAWLER)
		{
			return TRUE;
		};
	}
	else if(slf.guild == GIL_WARAN)
	{
		if(oth.guild == GIL_SCAVENGER)
		{
			return TRUE;
		};
		if(oth.guild == GIL_HARPY)
		{
			return TRUE;
		};
		if(oth.guild == GIL_GOBBO)
		{
			return TRUE;
		};
	}
	else if(slf.guild == GIL_WOLF)
	{
		if(slf.aivar[AIV_MM_REAL_ID] != ID_KEILER)
		{
			if(oth.guild < GIL_SEPERATOR_HUM)
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
		};
	}
	else if(slf.guild == GIL_MINECRAWLER)
	{
		if(oth.guild < GIL_SEPERATOR_HUM)
		{
			return TRUE;
		};
		if(oth.guild > GIL_SEPERATOR_ORC)
		{
			return TRUE;
		};
		if(oth.guild == GIL_MEATBUG)
		{
			return TRUE;
		};
		if(oth.guild == GIL_GIANT_BUG)
		{
			return TRUE;
		};
		if(oth.guild == GIL_BLOODFLY)
		{
			return TRUE;
		};
	}
	else if(slf.guild == GIL_LURKER)
	{
		if(oth.guild == GIL_GOBBO)
		{
			return TRUE;
		};
		if(oth.guild < GIL_SEPERATOR_HUM)
		{
			return TRUE;
		};
		if(oth.guild > GIL_SEPERATOR_ORC)
		{
			return TRUE;
		};
	}
	else if(slf.guild == GIL_SNAPPER)
	{
		if(oth.guild < GIL_SEPERATOR_HUM)
		{
			return TRUE;
		};
		if(oth.guild > GIL_SEPERATOR_ORC)
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
		if(oth.guild == GIL_SCAVENGER)
		{
			return TRUE;
		};
		if(oth.guild == GIL_HARPY)
		{
			return TRUE;
		};
		if(oth.guild == GIL_WOLF)
		{
			return TRUE;
		};
		if(oth.guild == GIL_SUMMONED_WOLF)
		{
			return TRUE;
		};
		if(oth.guild == GIL_SHADOWBEAST)
		{
			return TRUE;
		};
		if(oth.guild == GIL_GOBBO)
		{
			return TRUE;
		};
		if(oth.guild == GIL_WARAN)
		{
			return TRUE;
		};
		if(oth.guild == GIL_LURKER)
		{
			return TRUE;
		};
	}
	else if(slf.guild == GIL_SHADOWBEAST)
	{
		if(oth.guild < GIL_SEPERATOR_HUM)
		{
			return TRUE;
		};
		if(oth.guild > GIL_SEPERATOR_ORC)
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
		if(oth.guild == GIL_SCAVENGER)
		{
			return TRUE;
		};
		if(oth.guild == GIL_HARPY)
		{
			return TRUE;
		};
		if(oth.guild == GIL_WOLF)
		{
			return TRUE;
		};
		if(oth.guild == GIL_SUMMONED_WOLF)
		{
			return TRUE;
		};
		if(oth.guild == GIL_GOBBO)
		{
			return TRUE;
		};
		if(oth.guild == GIL_WARAN)
		{
			return TRUE;
		};
		if(oth.guild == GIL_LURKER)
		{
			return TRUE;
		};
		if(oth.guild == GIL_SNAPPER)
		{
			return TRUE;
		};
	};
	return FALSE;
};

