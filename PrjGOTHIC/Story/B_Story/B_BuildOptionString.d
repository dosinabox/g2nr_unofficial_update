
func string B_BuildOptionString(var string option,var int variable,var int condition)
{
	if(variable == condition)
	{
		return ConcatStrings(option,PRINT_Selected);
	};
	return option;
};

