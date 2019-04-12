
func int B_TeachAttributePoints(var C_Npc slf,var C_Npc oth,var int attrib,var int points,var int teacherMAX)
{
	var string concatText;
	var int kosten;
	var int realAttribute;
	kosten = B_GetLearnCostAttribute(oth,attrib) * points;
	if((attrib != ATR_STRENGTH) && (attrib != ATR_DEXTERITY) && (attrib != ATR_MANA_MAX))
	{
		Print("*** ERROR: Wrong Parameter ***");
		return FALSE;
	};
	if(attrib == ATR_STRENGTH)
	{
		realAttribute = oth.attribute[ATR_STRENGTH];
	}
	else if(attrib == ATR_DEXTERITY)
	{
		realAttribute = oth.attribute[ATR_DEXTERITY];
	}
	else if(attrib == ATR_MANA_MAX)
	{
		realAttribute = oth.attribute[ATR_MANA_MAX];
	};
	if(realAttribute >= teacherMAX)
	{
		concatText = ConcatStrings(PRINT_NoLearnOverPersonalMAX,IntToString(teacherMAX));
		PrintScreen(concatText,-1,-1,FONT_Screen,2);
		B_Say(slf,oth,"$NOLEARNYOUREBETTER");
		return FALSE;
	};
	if((realAttribute + points) > teacherMAX)
	{
		concatText = ConcatStrings(PRINT_NoLearnOverPersonalMAX,IntToString(teacherMAX));
		PrintScreen(concatText,-1,-1,FONT_Screen,2);
		B_Say(slf,oth,"$NOLEARNOVERPERSONALMAX");
		return FALSE;
	};
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NotEnoughLP,-1,-1,FONT_Screen,2);
		B_Say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	B_RaiseAttribute(oth,attrib,points);
	return TRUE;
};

