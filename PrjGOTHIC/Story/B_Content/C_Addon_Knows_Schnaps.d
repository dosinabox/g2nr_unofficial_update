
func int C_Addon_Knows_Schnaps()
{
	if(Knows_LousHammer == TRUE)
	{
		return TRUE;
	}
	else if(Knows_Schlafhammer == TRUE)
	{
		return TRUE;
	}
	else if(Knows_SchnellerHering == TRUE)
	{
		return TRUE;
	}
	/*else if(Knows_RuebenSchnaps == TRUE)
	{
		return TRUE;
	}
	else if(Knows_VinoSchnaps == TRUE)
	{
		return TRUE;
	}
	else if(Knows_PiratenSchnaps == TRUE)
	{
		return TRUE;
	}
	else if(Knows_Magierschnaps == TRUE)
	{
		return TRUE;
	}
	else if(Knows_Sumpfkrautschnaps == TRUE)
	{
		return TRUE;
	}*/
	else
	{
		return FALSE;
	};
};

