
func void B_CloseTopic(var string topic,var int MissionVar,var int CommonVar,var int EndChapter)
{
	if((MissionVar == LOG_Success) || (CommonVar == TRUE))
	{
		Log_SetTopicStatus(topic,LOG_Success);
	}
	else if(MissionVar == LOG_OBSOLETE)
	{
		Log_SetTopicStatus(topic,LOG_OBSOLETE);
	}
	else if(MissionVar == LOG_Failed)
	{
		Log_SetTopicStatus(topic,LOG_Failed);
	}
	else if((Kapitel >= EndChapter) && ((MissionVar == LOG_Running) || (CommonVar == FALSE)))
	{
		Log_SetTopicStatus(topic,LOG_OBSOLETE);
	};
};

