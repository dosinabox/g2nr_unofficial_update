
func int C_Addon_Knows_Schnaps()
{
	if((Knows_LousHammer == TRUE) || (Knows_RuebenSchnaps == TRUE) || (Knows_VinoSchnaps == TRUE) || (Knows_PiratenSchnaps == TRUE) || (Knows_Magierschnaps == TRUE) || (Knows_Sumpfkrautschnaps == TRUE))
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

