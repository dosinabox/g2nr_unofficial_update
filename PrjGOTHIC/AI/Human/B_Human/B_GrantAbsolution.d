
func void B_GrantAbsolution(var int location)
{
	if((location == LOC_OLDCAMP) || (location == LOC_ALL))
	{
		ABSOLUTIONLEVEL_OldCamp += 1;
		PETZCOUNTER_OldCamp_Murder = 0;
		PETZCOUNTER_OldCamp_Theft = 0;
		PETZCOUNTER_OldCamp_Attack = 0;
		PETZCOUNTER_OldCamp_Sheepkiller = 0;
	};
	if((location == LOC_CITY) || (location == LOC_ALL))
	{
		ABSOLUTIONLEVEL_City += 1;
		PETZCOUNTER_City_Murder = 0;
		PETZCOUNTER_City_Theft = 0;
		PETZCOUNTER_City_Attack = 0;
		PETZCOUNTER_City_Sheepkiller = 0;
	};
	if((location == LOC_MONASTERY) || (location == LOC_ALL))
	{
		ABSOLUTIONLEVEL_Monastery += 1;
		PETZCOUNTER_Monastery_Murder = 0;
		PETZCOUNTER_Monastery_Theft = 0;
		PETZCOUNTER_Monastery_Attack = 0;
		PETZCOUNTER_Monastery_Sheepkiller = 0;
	};
	if((location == LOC_FARM) || (location == LOC_ALL))
	{
		ABSOLUTIONLEVEL_Farm += 1;
		PETZCOUNTER_Farm_Murder = 0;
		PETZCOUNTER_Farm_Theft = 0;
		PETZCOUNTER_Farm_Attack = 0;
		PETZCOUNTER_Farm_Sheepkiller = 0;
	};
};

func void B_GrantPersonalAbsolution(var C_Npc slf)
{
	if(C_IsNpc(slf,PAL_250_Garond))
	{
		B_GrantAbsolution(LOC_OLDCAMP);
		Garond_Schulden = 0;
		Garond_LastPetzCounter = 0;
		Garond_LastPetzCrime = 0;
	}
	else if(C_IsNpc(slf,PAL_200_Hagen) || C_IsNpc(slf,MIL_311_Andre))
	{
		B_GrantAbsolution(LOC_CITY);
		Hagen_Schulden = 0;
		Hagen_LastPetzCounter = 0;
		Hagen_LastPetzCrime = 0;
		Andre_Schulden = 0;
		Andre_LastPetzCounter = 0;
		Andre_LastPetzCrime = 0;
	}
	else if(C_IsNpc(slf,KDF_504_Parlan))
	{
		B_GrantAbsolution(LOC_MONASTERY);
		Parlan_Schulden = 0;
		Parlan_LastPetzCounter = 0;
		Parlan_LastPetzCrime = 0;
	}
	else if(C_IsNpc(slf,SLD_800_Lee))
	{
		B_GrantAbsolution(LOC_FARM);
		Lee_Schulden = 0;
		Lee_LastPetzCounter = 0;
		Lee_LastPetzCrime = 0;
	};
};

