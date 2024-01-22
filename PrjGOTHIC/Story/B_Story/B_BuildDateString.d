
func string B_BuildDateString(var int day,var int month,var int year)
{
	var string concatText;
	concatText = ConcatStrings(IntToString(day),"/");
	concatText = ConcatStrings(concatText,IntToString(month));
	concatText = ConcatStrings(concatText,"/");
	concatText = ConcatStrings(concatText,IntToString(year));
	return concatText;
};

