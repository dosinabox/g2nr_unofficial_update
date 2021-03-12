
var int B_RAVENSESCAPEINTOTEMPELAVI_OneTime;

func void b_ravensescapeintotempelavi()
{
	if(B_RAVENSESCAPEINTOTEMPELAVI_OneTime == FALSE)
	{
		PlayVideoEx("PORTAL_RAVEN.BIK",TRUE,FALSE);
		EnteredBanditsCamp = TRUE;
		RavenIsInTempel = TRUE;
		Log_CreateTopic(TOPIC_Addon_RavenKDW,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_RavenKDW,LOG_Running);
		B_LogEntry(TOPIC_Addon_RavenKDW,"я вошел в покои ¬орона, но он скрылс€ от мен€ за большими вратами. я не могу последовать за ним. ћне кажетс€, что эти врата ведут в храм јданоса. я должен доложить об этом —атурасу.");
		B_RAVENSESCAPEINTOTEMPELAVI_OneTime = TRUE;
	};
};

