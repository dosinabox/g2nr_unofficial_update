
var int YPOS_LOGENTRY_NEXTLINE;

func void B_WriteToLog(var string topic,var string entry,var string title,var int queued)
{
	var string text;
	Log_AddEntry(topic,entry);
	if(NewLogDisabled == TRUE)
	{
		Snd_Play("LOGENTRY");
		PrintScreen(PRINT_NewLogEntry,-1,YPOS_LOGENTRY,FONT_ScreenSmall,2);
		return;
	};
	YPOS_LOGENTRY_NEXTLINE = YPOS_LOGENTRY_NEW + 2;
	text = ConcatStrings("'",topic);
	text = ConcatStrings(text,"'");
	if(queued == TRUE)
	{
		AI_Snd_Play(hero,"LOGENTRY");
		AI_PrintScreen(title,-1,YPOS_LOGENTRY_NEW,FONT_ScreenSmall,3);
		AI_PrintScreen(text,-1,YPOS_LOGENTRY_NEXTLINE,FONT_ScreenSmall,3);
	}
	else
	{
		Snd_Play("LOGENTRY");
		PrintScreen(title,-1,YPOS_LOGENTRY_NEW,FONT_ScreenSmall,3);
		PrintScreen(text,-1,YPOS_LOGENTRY_NEXTLINE,FONT_ScreenSmall,3);
	};
};

func void B_WriteToLog_Multiline(var string topic,var string entry,var int queued)
{
	var string text;
	Log_AddEntry(topic,entry);
	if(NewLogDisabled == FALSE)
	{
		YPOS_LOGENTRY_NEXTLINE += 2;
		text = ConcatStrings("'",topic);
		text = ConcatStrings(text,"'");
		if(queued == TRUE)
		{
			AI_PrintScreen(text,-1,YPOS_LOGENTRY_NEXTLINE,FONT_ScreenSmall,3);
		}
		else
		{
			PrintScreen(text,-1,YPOS_LOGENTRY_NEXTLINE,FONT_ScreenSmall,3);
		};
	};
};

func void B_LogEntry(var string topic,var string entry)
{
	B_WriteToLog(topic,entry,ConcatStrings(PRINT_NewLogEntry,":"),TRUE);
};

func void B_LogEntry_Instant(var string topic,var string entry)
{
	B_WriteToLog(topic,entry,ConcatStrings(PRINT_NewLogEntry,":"),FALSE);
};

func void B_LogEntries(var string topic,var string entry)
{
	B_WriteToLog(topic,entry,PRINT_NewLogEntries,TRUE);
};

func void B_LogEntries_Instant(var string topic,var string entry)
{
	B_WriteToLog(topic,entry,PRINT_NewLogEntries,FALSE);
};

func void B_LogNextEntry(var string topic,var string entry)
{
	B_WriteToLog_Multiline(topic,entry,TRUE);
};

func void B_LogNextEntry_Instant(var string topic,var string entry)
{
	B_WriteToLog_Multiline(topic,entry,FALSE);
};

