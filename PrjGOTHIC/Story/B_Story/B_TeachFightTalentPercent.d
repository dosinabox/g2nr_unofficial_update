
func int B_TeachFightTalentPercent(var C_Npc slf,var C_Npc oth,var int talent,var int percent,var int teacherMAX)
{
	var string concatText;
	var int cost;
	var int limitReason;
	limitReason = B_GetTeachLimitReason(oth,talent,percent,teacherMax);
	if(limitReason == TLR_AlreadyMax)
	{
		B_PrintPlayerMiddle(oth,PRINT_NoLearnOverMAX);
		B_Say(slf,oth,"$NOLEARNYOUREBETTER");
		return FALSE;
	};
	if(limitReason == TLR_WillBeOverMax)
	{
		B_PrintPlayerMiddle(oth,PRINT_NoLearnOverMAX);
		B_Say(slf,oth,"$NOLEARNYOUREBETTER");
		return FALSE;
	};
	if(limitReason == TLR_AlreadySame)
	{
		concatText = ConcatStrings(PRINT_NoLearnOverPersonalMAX,IntToString(teacherMAX));
		B_PrintPlayerMiddle(oth,concatText);
		B_Say(slf,oth,"$NOLEARNYOUREBETTER");
		return FALSE;
	};
	if(limitReason == TLR_AlreadyBetter)
	{
		concatText = ConcatStrings(PRINT_NoLearnOverPersonalMAX,IntToString(teacherMAX));
		B_PrintPlayerMiddle(oth,concatText);
		B_Say(slf,oth,"$YOULEARNEDSOMETHING");
		return FALSE;
	};
	if(limitReason == TLR_WillBeBetter)
	{
		concatText = ConcatStrings(PRINT_NoLearnOverPersonalMAX,IntToString(teacherMAX));
		B_PrintPlayerMiddle(oth,concatText);
		B_Say(slf,oth,"$NOLEARNOVERPERSONALMAX");
		return FALSE;
	};
	cost = B_GetTalentTrainCost(oth,talent,percent);
	if(oth.lp < cost)
	{
		B_PrintPlayerMiddle(oth,PRINT_NotEnoughLP);
		B_Say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	if(C_PremiumTeachersEnabled())
	{
		if(!B_GiveInvItems(oth,slf,ItMi_Gold,cost * PremiumTeachersPrice))
		{
			B_PrintPlayerMiddle(oth,Print_NotEnoughGold);
			DIA_Common_WeWillGetToThatLater();
			return FALSE;
		};
	};
	oth.lp -= cost;
	B_ChangeTalent(oth,talent,percent,TS_Training);
	if(SecondaryChange > 0)
	{
		if(talent == NPC_TALENT_1H)
		{
			concatText = PRINT_Learn1H_and_2H;
		}
		else if(talent == NPC_TALENT_2H)
		{
			concatText = PRINT_Learn2H_and_1H;
		}
		else if(talent == NPC_TALENT_BOW)
		{
			concatText = PRINT_LearnBow_and_Crossbow;
		}
		else if(talent == NPC_TALENT_CROSSBOW)
		{
			concatText = PRINT_LearnCrossbow_and_Bow;
		};
	}
	else
	{
		if(talent == NPC_TALENT_1H)
		{
			concatText = PRINT_Learn1H;
		}
		else if(talent == NPC_TALENT_2H)
		{
			concatText = PRINT_Learn2H;
		}
		else if(talent == NPC_TALENT_BOW)
		{
			concatText = PRINT_LearnBow;
		}
		else if(talent == NPC_TALENT_CROSSBOW)
		{
			concatText = PRINT_LearnCrossbow;
		};
	};
	B_PrintPlayerMiddle(oth,concatText);
	return TRUE;
};

