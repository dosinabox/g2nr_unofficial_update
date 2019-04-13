
func void B_CloseTopic(var string topic,var int MissionVar,var int CommonVar,var int EndChapter)
{
	if((MissionVar == LOG_SUCCESS) || (CommonVar == TRUE))
	{
		Log_SetTopicStatus(topic,LOG_SUCCESS);
	}
	else if(MissionVar == LOG_OBSOLETE)
	{
		Log_SetTopicStatus(topic,LOG_OBSOLETE);
	}
	else if(MissionVar == LOG_FAILED)
	{
		Log_SetTopicStatus(topic,LOG_FAILED);
	}
	else if((Kapitel >= EndChapter) && ((MissionVar == LOG_Running) || (CommonVar == FALSE)))
	{
		Log_SetTopicStatus(topic,LOG_OBSOLETE);
	};
};

