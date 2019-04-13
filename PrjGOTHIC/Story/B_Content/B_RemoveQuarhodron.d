
var int B_RemoveQuarhodron_OneTime;
var int B_RemoveRhademes_OneTime;

func void B_RemoveGhost()
{
	if(Ghost_SCKnowsHow2GetInAdanosTempel == TRUE)
	{
		if((SC_SummonedAncientGhost == TRUE) && (B_RemoveQuarhodron_OneTime == FALSE))
		{
			AI_Teleport(NONE_ADDON_111_Quarhodron,"TOT");
			B_RemoveNpc(NONE_ADDON_111_Quarhodron);
			Snd_Play("MFX_GhostVoice");
			Snd_Play("MFX_Firestorm_Cast");
			B_RemoveQuarhodron_OneTime = TRUE;
			GhostAttackWarn = 0;
		};
	};
	if(ADW_ADANOSTEMPEL_STONEGRD_TRIGG_FUNC_01_OneTime == TRUE)
	{
		if((SC_TookRhademesTrap == TRUE) && (B_RemoveRhademes_OneTime == FALSE))
		{
			AI_Teleport(NONE_ADDON_112_Rhademes,"TOT");
			B_RemoveNpc(NONE_ADDON_112_Rhademes);
			if(SC_TalkedToRhademAfter == TRUE)
			{
				Snd_Play("MFX_GhostVoice");
				Snd_Play("MFX_Firestorm_Cast");
			};
			B_RemoveRhademes_OneTime = TRUE;
			GhostAttackWarn = 0;
		};
	};
};

