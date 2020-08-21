
var int YPOS_LOGENTRY_NEXTLINE;

func void B_WriteToLog(var string topic,var string entry)
{
	var string text;
	Log_AddEntry(topic,entry);
	Snd_Play("LogEntry");
	if(NewLogEnabled == TRUE)
	{
		YPOS_LOGENTRY_NEXTLINE = YPOS_LOGENTRY_NEW + 2;
		text = ConcatStrings("'",topic);
		PrintScreen(ConcatStrings(text,"'"),-1,YPOS_LOGENTRY_NEXTLINE,FONT_ScreenSmall,3);
	}
	else
	{
		PrintScreen(PRINT_NewLogEntry,-1,YPOS_LOGENTRY,FONT_ScreenSmall,2);
	};
};

func void B_LogEntry(var string topic,var string entry)
{
	B_WriteToLog(topic,entry);
	if(NewLogEnabled == TRUE)
	{
		PrintScreen(ConcatStrings(PRINT_NewLogEntry,":"),-1,YPOS_LOGENTRY_NEW,FONT_ScreenSmall,3);
	};
};

func void B_LogEntries(var string topic,var string entry)
{
	B_WriteToLog(topic,entry);
	if(NewLogEnabled == TRUE)
	{
		PrintScreen(PRINT_NewLogEntries,-1,YPOS_LOGENTRY_NEW,FONT_ScreenSmall,3);
	};
};

func void B_LogNextEntry(var string topic,var string entry)
{
	var string text;
	Log_AddEntry(topic,entry);
	if(NewLogEnabled == TRUE)
	{
		YPOS_LOGENTRY_NEXTLINE += 2;
		text = ConcatStrings("'",topic);
		PrintScreen(ConcatStrings(text,"'"),-1,YPOS_LOGENTRY_NEXTLINE,FONT_ScreenSmall,3);
	};
};

