
var int B_RemoveQuarhodron_OneTime;
var int B_RemoveRhademes_OneTime;

func void B_RemoveGhost()
{
	if(Ghost_SCKnowsHow2GetInAdanosTempel == TRUE)
	{
		if((SC_SummonedAncientGhost == TRUE) && (B_RemoveQuarhodron_OneTime == FALSE))
		{
			AI_Teleport(Quarhodron,"TOT");
			B_MoveNpcToMorgue(NONE_ADDON_111_Quarhodron);
			Snd_Play("MFX_GhostVoice");
			Snd_Play("MFX_Firestorm_Cast");
			B_RemoveQuarhodron_OneTime = TRUE;
			GhostAttackWarn = 0;
		};
	};
	if(SC_TalkedToRhademAfter == TRUE)
	{
		if(B_RemoveRhademes_OneTime == FALSE)
		{
			AI_Teleport(Rhademes,"TOT");
			B_MoveNpcToMorgue(NONE_ADDON_112_Rhademes);
			Snd_Play("MFX_GhostVoice");
			Snd_Play("MFX_Firestorm_Cast");
			B_RemoveRhademes_OneTime = TRUE;
			GhostAttackWarn = 0;
		};
	};
};

