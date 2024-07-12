
func string B_BuildLearnString(var string text,var int kosten)
{
	var string concatText;
	concatText = ConcatStrings(text," (");
	concatText = ConcatStrings(concatText,IntToString(kosten));
	if(kosten >= 5)
	{
		concatText = ConcatStrings(concatText,PRINT_LP);
	}
	else if(kosten > 1)
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
		concatText = ConcatStrings(concatText,IntToString(kosten * PremiumTeachersPrice));
		concatText = ConcatStrings(concatText,PRINT_Gold);
	};
	concatText = ConcatStrings(concatText,")");
	return concatText;
};

