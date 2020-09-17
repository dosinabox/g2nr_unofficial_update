
func void B_CheckRedLightUndercover()
{
	if((Undercover_Failed_Nadja == TRUE) && (Undercover_Failed_Borka == TRUE) && ((Undercover_Failed_Kardif == TRUE) || (Undercover_Failed_Meldor == TRUE)))
	{
		Undercover_Failed = TRUE;
	};
};

