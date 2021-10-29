
func string B_BuildPriceString(var string text,var int price)
{
	var string concatText;
	concatText = ConcatStrings(text," (");
	concatText = ConcatStrings(concatText,IntToString(price));
	concatText = ConcatStrings(concatText,PRINT_Gold);
	concatText = ConcatStrings(concatText,")");
	return concatText;
};

