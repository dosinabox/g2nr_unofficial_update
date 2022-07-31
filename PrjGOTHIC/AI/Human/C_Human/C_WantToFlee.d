
func int C_WantToFlee(var C_Npc slf,var C_Npc oth)
{
	if(NpcWantToFlee == TRUE)
	{
		if(slf.guild < GIL_SEPERATOR_HUM)
		{
			if((slf.guild != GIL_DMT) && ((slf.npcType == NPCTYPE_AMBIENT) || (slf.npcType == NPCTYPE_OCAMBIENT) || (slf.npcType == NPCTYPE_OWAMBIENT) || (slf.npcType == NPCTYPE_BL_AMBIENT) || (slf.npcType == NPCTYPE_TAL_AMBIENT) || (slf.fight_tactic == FAI_HUMAN_COWARD)))
			{
				if((slf.fight_tactic == FAI_HUMAN_COWARD) && (slf.attribute[ATR_HITPOINTS] < (slf.attribute[ATR_HITPOINTS_MAX] / 2)))
				{
					return TRUE;	// ...убегает трус!
				};
				if((slf.fight_tactic == FAI_HUMAN_NORMAL) && (slf.attribute[ATR_HITPOINTS] < (slf.attribute[ATR_HITPOINTS_MAX] / 4)))
				{
					return TRUE;	// ...убегает обычный боец!
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
			if(slf.attribute[ATR_HITPOINTS] < (slf.attribute[ATR_HITPOINTS_MAX] / 2))
			{
				if((slf.fight_tactic == FAI_SCAVENGER) && (slf.aivar[AIV_MM_REAL_ID] != ID_ORCBITER))
				{
					return TRUE;	// ...убегает падальщик!
				};
				if(slf.fight_tactic == FAI_GIANT_RAT)
				{
					return TRUE;	// ...убегает крыса!
				};
				if(slf.fight_tactic == FAI_MOLERAT)
				{
					return TRUE;	// ...убегает крысокрот!
				};
			};
			if(slf.attribute[ATR_HITPOINTS] < slf.attribute[ATR_HITPOINTS_MAX])
			{
				if(slf.fight_tactic == FAI_MONSTER_COWARD)
				{
					return TRUE;	// ...убегает трусливый раненый зверь!
				};
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

