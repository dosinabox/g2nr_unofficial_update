
func void G_CanNotUse(var int bIsPlayer,var int nAttribute,var int nValue)
{
	var string strMessage;
	var string strAttributeMissing;
	var int nAttributeValue;
	var int nDifference;
	var string strDifference;
	if(!bIsPlayer)
	{
		return;
	};
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
		if(nValue == CONDITION_WEAPON_RAVEN)
		{
			B_BlitzInArsch();
			SC_FailedToEquipBeliarsWeapon = TRUE;
			Print(PRINT_ADDON_BELIARSCOURSE_MISSING);
			return;
		};
		if(nValue == CONDITION_ARMOR_DEMENTOR)
		{
			Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
			Snd_Play("MFX_FEAR_CAST");
			SC_IsObsessed = TRUE;
			PrintScreen(PRINT_SCIsObsessed,-1,-1,FONT_Screen,2);
			return;
		};
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
	strMessage = ConcatStrings(strAttributeMissing,strDifference);
	Print(strMessage);
};

