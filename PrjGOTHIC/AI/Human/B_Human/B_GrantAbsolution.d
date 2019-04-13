
func void B_GrantAbsolution(var int location)
{
	if((location == LOC_OLDCAMP) || (location == LOC_ALL))
	{
		ABSOLUTIONLEVEL_OldCamp = ABSOLUTIONLEVEL_OldCamp + 1;
		PETZCOUNTER_OldCamp_Murder = 0;
		PETZCOUNTER_OldCamp_Theft = 0;
		PETZCOUNTER_OldCamp_Attack = 0;
		PETZCOUNTER_OldCamp_Sheepkiller = 0;
	};
	if((location == LOC_CITY) || (location == LOC_ALL))
	{
		ABSOLUTIONLEVEL_City = ABSOLUTIONLEVEL_City + 1;
		PETZCOUNTER_City_Murder = 0;
		PETZCOUNTER_City_Theft = 0;
		PETZCOUNTER_City_Attack = 0;
		PETZCOUNTER_City_Sheepkiller = 0;
	};
	if((location == LOC_MONASTERY) || (location == LOC_ALL))
	{
		ABSOLUTIONLEVEL_Monastery = ABSOLUTIONLEVEL_Monastery + 1;
		PETZCOUNTER_Monastery_Murder = 0;
		PETZCOUNTER_Monastery_Theft = 0;
		PETZCOUNTER_Monastery_Attack = 0;
		PETZCOUNTER_Monastery_Sheepkiller = 0;
	};
	if((location == LOC_FARM) || (location == LOC_ALL))
	{
		ABSOLUTIONLEVEL_Farm = ABSOLUTIONLEVEL_Farm + 1;
		PETZCOUNTER_Farm_Murder = 0;
		PETZCOUNTER_Farm_Theft = 0;
		PETZCOUNTER_Farm_Attack = 0;
		PETZCOUNTER_Farm_Sheepkiller = 0;
	};
	if(location == LOC_BL)
	{
		ABSOLUTIONLEVEL_BL = ABSOLUTIONLEVEL_BL + 1;
		PETZCOUNTER_BL_Murder = 0;
		PETZCOUNTER_BL_Theft = 0;
		PETZCOUNTER_BL_Attack = 0;
	};
};

