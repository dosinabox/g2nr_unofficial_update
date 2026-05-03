
func string B_GetStoryPointName(var int mainStoryPoint)
{
	var string text;
	if(mainStoryPoint < SP_C2_P1)
	{
		text = ConcatStrings(KapWechsel_1,": ");
	}
	else if(mainStoryPoint < SP_C3_P1)
	{
		text = ConcatStrings(KapWechsel_2,": ");
	}
	else if(mainStoryPoint < SP_C4_P1)
	{
		text = ConcatStrings(KapWechsel_3,": ");
	}
	else if(mainStoryPoint < SP_C5_P1)
	{
		text = ConcatStrings(KapWechsel_4,": ");
	}
	else if(mainStoryPoint < SP_C6_P1)
	{
		text = ConcatStrings(KapWechsel_5,": ");
	}
	else
	{
		text = ConcatStrings(KapWechsel_6,": ");
	};
	if(mainStoryPoint == SP_C1_P1)
	{
		text = ConcatStrings(text,KapAnfang);
	}
	else if(mainStoryPoint == SP_C1_P2)
	{
		text = ConcatStrings(text,"верхний квартал");
	}
	else if(mainStoryPoint == SP_C1_P3)
	{
		text = ConcatStrings(text,"ратуша");
	}
	else if(mainStoryPoint == SP_C2_P1)
	{
		text = ConcatStrings(text,KapAnfang);
	}
	else if(mainStoryPoint == SP_C2_P2)
	{
		text = ConcatStrings(text,"письмо Гаронда");
	}
	else if(mainStoryPoint == SP_C3_P1)
	{
		text = ConcatStrings(text,KapAnfang);
	}
	else if(mainStoryPoint == SP_C3_P2)
	{
		text = ConcatStrings(text,"Беннет на свободе");
	}
	else if(mainStoryPoint == SP_C3_P3)
	{
		text = ConcatStrings(text,"восстановлен Глаз");
	}
	else if(mainStoryPoint == SP_C4_P1)
	{
		text = ConcatStrings(text,KapAnfang);
	}
	else if(mainStoryPoint == SP_C4_P2)
	{
		text = ConcatStrings(text,"убиты все драконы");
	}
	else if(mainStoryPoint == SP_C5_P1)
	{
		text = ConcatStrings(text,KapAnfang);
	}
	else if(mainStoryPoint == SP_C5_P2)
	{
		text = ConcatStrings(text,"найдена карта");
	}
	else if(mainStoryPoint == SP_C5_P3)
	{
		text = ConcatStrings(text,"готов к отплытию");
	}
	else if(mainStoryPoint == SP_C6_P1)
	{
		text = ConcatStrings(text,KapAnfang);
	}
	else if(mainStoryPoint == SP_C6_P2)
	{
		text = ConcatStrings(text,"убит Феодарон");
	}
	else if(mainStoryPoint == SP_C6_P3)
	{
		text = ConcatStrings(text,"убит дракон-нежить");
	};
	return text;
};

func string B_GetAddonStoryPointName(var int addonStoryPoint)
{
	var string text;
	if(addonStoryPoint == SP_A1)
	{
		text = "1: приказы Ворона";
	}
	else if(addonStoryPoint == SP_A2)
	{
		text = "2: вступление в Кольцо";
	}
	else if(addonStoryPoint == SP_A3)
	{
		text = "3: получен орнамент";
	}
	else if(addonStoryPoint == SP_A4)
	{
		text = "4: доступ в храм";
	}
	else if(addonStoryPoint == SP_A5)
	{
		text = "5: убит Ворон";
	};
	return text;
};

