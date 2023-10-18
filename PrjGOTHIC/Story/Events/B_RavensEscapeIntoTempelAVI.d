
func void B_RavensEscapeIntoTempelAVI()
{
	if(RavenIsInTempel == FALSE)
	{
		PlayVideoEx("PORTAL_RAVEN.BIK",TRUE,FALSE);
		EnteredBanditsCamp = TRUE;
		Log_CreateTopic(TOPIC_Addon_RavenKDW,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_RavenKDW,LOG_Running);
		B_LogEntry(TOPIC_Addon_RavenKDW,"я вошел в покои ¬орона, но он скрылс€ от мен€ за большими вратами. я не могу последовать за ним. ћне кажетс€, что эти врата ведут в храм јданоса. я должен доложить об этом —атурасу.");
		RavenIsInTempel = TRUE;
	};
};

