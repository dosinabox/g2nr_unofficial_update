
func string B_GetStoryPointName(var int storyPoint)
{
	var string text;
	if(storyPoint < SP_C2_P1)
	{
		text = ConcatStrings(KapWechsel_1,": ");
	}
	else if(storyPoint < SP_C3_P1)
	{
		text = ConcatStrings(KapWechsel_2,": ");
	}
	else if(storyPoint < SP_C4_P1)
	{
		text = ConcatStrings(KapWechsel_3,": ");
	}
	else if(storyPoint < SP_C5_P1)
	{
		text = ConcatStrings(KapWechsel_4,": ");
	}
	else if(storyPoint < SP_C6_P1)
	{
		text = ConcatStrings(KapWechsel_5,": ");
	}
	else
	{
		text = ConcatStrings(KapWechsel_6,": ");
	};
	if(storyPoint == SP_C1_P1)
	{
		text = ConcatStrings(text,KapAnfang);
	};
	if(storyPoint == SP_C1_P2)
	{
		text = ConcatStrings(text,"получен доступ в верхний квартал");
	};
	if(storyPoint == SP_C1_P3)
	{
		text = ConcatStrings(text,"получен доступ в ратушу");
	};
	if(storyPoint == SP_C2_P1)
	{
		text = ConcatStrings(text,KapAnfang);
	};
	if(storyPoint == SP_C2_P2)
	{
		text = ConcatStrings(text,"получено письмо Гаронда");
	};
	if(storyPoint == SP_C3_P1)
	{
		text = ConcatStrings(text,KapAnfang);
	};
	if(storyPoint == SP_C3_P2)
	{
		text = ConcatStrings(text,"освобожден Беннет");
	};
	if(storyPoint == SP_C3_P3)
	{
		text = ConcatStrings(text,"восстановлен Глаз Инноса");
	};
	if(storyPoint == SP_C4_P1)
	{
		text = ConcatStrings(text,KapAnfang);
	};
	if(storyPoint == SP_C4_P2)
	{
		text = ConcatStrings(text,"убиты все драконы");
	};
	if(storyPoint == SP_C5_P1)
	{
		text = ConcatStrings(text,KapAnfang);
	};
	if(storyPoint == SP_C5_P2)
	{
		text = ConcatStrings(text,"найдена морская карта");
	};
	if(storyPoint == SP_C5_P3)
	{
		text = ConcatStrings(text,"готов к отплытию");
	};
	if(storyPoint == SP_C6_P1)
	{
		text = ConcatStrings(text,KapAnfang);
	};
	if(storyPoint == SP_C6_P2)
	{
		text = ConcatStrings(text,"убит Феодарон");
	};
	if(storyPoint == SP_C6_P3)
	{
		text = ConcatStrings(text,"убит дракон-нежить");
	};
	return text;
};

