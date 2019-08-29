
func int C_WantToFlee(var C_Npc slf,var C_Npc oth)
{
	if(NpcWantToFlee == TRUE)
	{
		if(slf.guild < GIL_SEPERATOR_HUM)
		{
			if((slf.guild != GIL_DMT) && ((slf.npcType == NPCTYPE_AMBIENT) || (slf.npcType == NPCTYPE_OCAMBIENT) || (slf.npcType == NPCTYPE_BL_AMBIENT) || (slf.npcType == NPCTYPE_TAL_AMBIENT) || (slf.fight_tactic == FAI_HUMAN_COWARD)))
			{
				if((slf.fight_tactic == FAI_HUMAN_COWARD) && (slf.attribute[ATR_HITPOINTS] < (slf.attribute[ATR_HITPOINTS_MAX] / 2)))
				{
					return TRUE;	// ...убегает трус!
				};
				if((slf.fight_tactic == FAI_HUMAN_STRONG) && (slf.attribute[ATR_HITPOINTS] < (slf.attribute[ATR_HITPOINTS_MAX] / 4)))
				{
					return TRUE;	// ...убегает сильный боец!
				};
				if((slf.aivar[AIV_MagicUser] == MAGIC_ALWAYS) && (slf.attribute[ATR_MANA] < (slf.attribute[ATR_MANA_MAX] / 5)))
				{
					return TRUE;	// ...убегает маг!
				};
				if(Npc_IsInFightMode(slf,FMODE_FAR) && (slf.attribute[ATR_HITPOINTS] < (slf.attribute[ATR_HITPOINTS_MAX] / 3)))
				{
					return TRUE;	// ...убегает стрелок!
				};
			};
		}
		else
		{
			if(slf.guild == GIL_SHEEP)
			{
				return TRUE;	// ...убегает овца!
			};
			if((((slf.fight_tactic == FAI_SCAVENGER) && (slf.aivar[AIV_MM_REAL_ID] != ID_OrcBiter)) || (slf.fight_tactic == FAI_GIANT_RAT) || (slf.fight_tactic == FAI_MOLERAT)) && (slf.attribute[ATR_HITPOINTS] < (slf.attribute[ATR_HITPOINTS_MAX] / 2)))
			{
				return TRUE;	// ...убегает падальщик, крыса или крысокрот!
			};
			if((slf.fight_tactic == FAI_MONSTER_COWARD) && ((slf.attribute[ATR_HITPOINTS] < (slf.attribute[ATR_HITPOINTS_MAX] / 2)) || C_AmIWeaker(slf,oth)))
			{
				return TRUE;	// ...убегает трусливый зверь!
			};
		};
	}
	else
	{
		if(slf.guild == GIL_SHEEP)
		{
			return TRUE;	// ...убегает только овца!
		};
	};
	return FALSE;
};


func int C_IsBestFriend(var C_Npc slf)
{
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DiegoOW))
	{
		return TRUE;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DiegoNW))
	{
		return TRUE;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Diego_DI))
	{
		return TRUE;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Lester))
	{
		return TRUE;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Lester_DI))
	{
		return TRUE;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(MiltenOW))
	{
		return TRUE;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(MiltenNW))
	{
		return TRUE;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Milten_DI))
	{
		return TRUE;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(GornOW))
	{
		return TRUE;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(GornNW_vor_DJG))
	{
		return TRUE;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(GornDJG))
	{
		return TRUE;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(GornNW_nach_DJG))
	{
		return TRUE;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Gorn_DI))
	{
		return TRUE;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DJG_Angar))
	{
		return TRUE;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Angar_NW))
	{
		return TRUE;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Angar_DI))
	{
		return TRUE;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Xardas))
	{
		return TRUE;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Greg_NW))
	{
		return TRUE;
	};
	return FALSE;
};
