
func void G_CanNotUse(var int bIsPlayer,var int nAttribute,var int nValue)
{
	var string strMessage;
	var string strAttributeMissing;
	var int nAttributeValue;
	var int nDifference;
	var string strDifference;
	if((nAttribute == ATR_MANA_MAX) && (nValue == 666666))
	{
		strMessage = PRINT_ADDON_BELIARSCOURSE_MISSING;
		B_BlitzInArsch();
		SC_FailedToEquipBeliarsWeapon = TRUE;
	}
	else
	{
		if(nAttribute == ATR_HITPOINTS)
		{
			strAttributeMissing = PRINT_HITPOINTS_MISSING;
			nAttributeValue = self.attribute[ATR_HITPOINTS];
		}
		else if(nAttribute == ATR_HITPOINTS_MAX)
		{
			strAttributeMissing = PRINT_HITPOINTS_MAX_MISSING;
			nAttributeValue = self.attribute[ATR_HITPOINTS_MAX];
		}
		else if(nAttribute == ATR_MANA)
		{
			strAttributeMissing = PRINT_MANA_MISSING;
			nAttributeValue = self.attribute[ATR_MANA];
		}
		else if(nAttribute == ATR_MANA_MAX)
		{
			strAttributeMissing = PRINT_MANA_MAX_MISSING;
			nAttributeValue = self.attribute[ATR_MANA_MAX];
		}
		else if(nAttribute == ATR_STRENGTH)
		{
			strAttributeMissing = PRINT_STRENGTH_MISSING;
			nAttributeValue = self.attribute[ATR_STRENGTH];
		}
		else if(nAttribute == ATR_DEXTERITY)
		{
			strAttributeMissing = PRINT_DEXTERITY_MISSING;
			nAttributeValue = self.attribute[ATR_DEXTERITY];
		}
		else
		{
			strAttributeMissing = "";
			nAttributeValue = 0;
		};
		nDifference = nValue - nAttributeValue;
		strDifference = IntToString(nDifference);
		strMessage = strDifference;
		strMessage = ConcatStrings(strMessage," ");
		strMessage = ConcatStrings(strMessage,strAttributeMissing);
	};
	if(bIsPlayer)
	{
		Print(strMessage);
	};
};

