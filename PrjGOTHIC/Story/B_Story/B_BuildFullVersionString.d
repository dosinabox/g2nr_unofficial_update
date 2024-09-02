
func string B_BuildFullVersionString(var int version,var int day,var int month,var int year)
{
	var string concatText;
	concatText = ConcatStrings("v",IntToString(version));
	concatText = ConcatStrings(concatText," (");
	concatText = ConcatStrings(concatText,B_BuildDateString(day,month,year));
	concatText = ConcatStrings(concatText,")");
	return concatText;
};

