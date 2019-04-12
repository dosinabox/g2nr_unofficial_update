
var int VALLEY_SHOWCASE_TRIGGERSCRIPT_FUNC_OneTime;

func void valley_showcase_triggerscript_func()
{
	if(VALLEY_SHOWCASE_TRIGGERSCRIPT_FUNC_OneTime == FALSE)
	{
		B_GivePlayerXP(XP_Addon_WackelBaum);
		VALLEY_SHOWCASE_TRIGGERSCRIPT_FUNC_OneTime = TRUE;
	};
};

