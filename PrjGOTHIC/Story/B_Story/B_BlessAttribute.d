
func void B_BlessAttribute(var C_Npc oth,var int attrib,var int points)
{
	var string concatText;
	if(attrib == ATR_STRENGTH)
	{
		ATR_PermBonus[ATR_STRENGTH] += points;
		oth.attribute[ATR_STRENGTH] += points;
		concatText = ConcatStrings(PRINT_BlessSTR,IntToString(points));
		PrintScreen(concatText,-1,-1,FONT_Screen,3);
		Stats_Blessings_Str += points;
	}
	else if(attrib == ATR_DEXTERITY)
	{
		ATR_PermBonus[ATR_DEXTERITY] += points;
		oth.attribute[ATR_DEXTERITY] += points;
		if((oth.attribute[ATR_DEXTERITY] >= CONDITION_ACROBAT_DEXTERITY) && !Npc_GetTalentSkill(oth,NPC_TALENT_ACROBAT))
		{
			Npc_SetTalentSkill(oth,NPC_TALENT_ACROBAT,1);
			PrintScreen(PRINT_Addon_AcrobatBonus,-1,53,FONT_Screen,3);
		};
		concatText = ConcatStrings(PRINT_BlessDEX,IntToString(points));
		PrintScreen(concatText,-1,-1,FONT_Screen,3);
		Stats_Blessings_Dex += points;
	}
	else if(attrib == ATR_MANA_MAX)
	{
		ATR_PermBonus[ATR_MANA_MAX] += points;
		oth.attribute[ATR_MANA_MAX] += points;
		oth.attribute[ATR_MANA] = oth.attribute[ATR_MANA_MAX];
		concatText = ConcatStrings(PRINT_BlessMANA_MAX,IntToString(points));
		PrintScreen(concatText,-1,-1,FONT_Screen,3);
		Stats_Blessings_MaxMana += points;
	}
	else if(attrib == ATR_HITPOINTS_MAX)
	{
		ATR_PermBonus[ATR_HITPOINTS_MAX] += points;
		oth.attribute[ATR_HITPOINTS_MAX] += points;
		oth.attribute[ATR_HITPOINTS] = oth.attribute[ATR_HITPOINTS_MAX];
		concatText = ConcatStrings(PRINT_BlessHitpoints_MAX,IntToString(points));
		PrintScreen(concatText,-1,-1,FONT_Screen,3);
		Stats_Blessings_MaxHp += points;
	};
	Snd_Play("GOODIE");
};

