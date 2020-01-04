
func void B_KillThievesGuild()
{
	if((Andre_FoundThieves_KilledByMilitia == FALSE) && (Andre_FoundThieves_Reported == TRUE) && (Andre_FoundThieves_Reported_Day <= (Wld_GetDay() - 2)))
	{
		if(!Npc_IsDead(Cassia) || !Npc_IsDead(Jesper) || !Npc_IsDead(Ramirez))
		{
			B_KillNpc(VLK_447_Cassia);
			B_KillNpc(VLK_446_Jesper);
			B_KillNpc(VLK_445_Ramirez);
			Andre_FoundThieves_KilledByMilitia = TRUE;
		};
	};
};

