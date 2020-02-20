
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
	};
	return FALSE;
};

