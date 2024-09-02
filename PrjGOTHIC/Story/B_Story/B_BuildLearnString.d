
func string B_BuildLearnString(var string text,var int cost)
{
	var string concatText;
	concatText = ConcatStrings(text," (");
	concatText = ConcatStrings(concatText,IntToString(cost));
	if(cost >= 5)
	{
		concatText = ConcatStrings(concatText,PRINT_LP);
	}
	else if(cost > 1)
	{
		concatText = ConcatStrings(concatText,PRINT_2LP);
	}
	else
	{
		concatText = ConcatStrings(concatText,PRINT_1LP);
	};
	if(C_PremiumTeachersEnabled())
	{
		concatText = ConcatStrings(concatText,", ");
		concatText = ConcatStrings(concatText,IntToString(cost * PremiumTeachersPrice));
		concatText = ConcatStrings(concatText,PRINT_Gold);
	};
	concatText = ConcatStrings(concatText,")");
	return concatText;
};

func string B_BuildLearnAttributeString(var int attribute,var int value)
{
	var string attributeName;
	if(attribute == ATR_STRENGTH)
	{
		attributeName = PRINT_LearnSTR;
	}
	else if(attribute == ATR_DEXTERITY)
	{
		attributeName = PRINT_LearnDEX;
	}
	else if(attribute == ATR_MANA_MAX)
	{
		attributeName = PRINT_LearnMANA_MAX;
	}
	else if(attribute == ATR_HITPOINTS_MAX)
	{
		attributeName = PRINT_LearnHP_MAX;
	};
	attributeName = ConcatStrings(attributeName,IntToString(value));
	return B_BuildLearnString(attributeName,B_GetLearnCostAttribute(attribute,value));
};

func string B_BuildLearnTalentString(var C_Npc oth,var int talent,var int value)
{
	var string talentName;
	if(talent == NPC_TALENT_1H)
	{
		talentName = NAME_OneHanded;
	}
	else if(talent == NPC_TALENT_2H)
	{
		talentName = NAME_TwoHanded;
	}
	else if(talent == NPC_TALENT_BOW)
	{
		talentName = NAME_Bow;
	}
	else if(talent == NPC_TALENT_CROSSBOW)
	{
		talentName = NAME_CrossBow;
	};
	talentName = ConcatStrings(talentName," + ");
	talentName = ConcatStrings(talentName,IntToString(value));
	return B_BuildLearnString(talentName,B_GetLearnCostTalent(oth,talent,value));
};

