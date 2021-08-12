
/*
На будущее: https://worldofplayers.ru/threads/36817/post-997859

var int VALLEY_SHOWCASE_TRIGGERSCRIPT_FUNC_OneTime;
var int CutDownTreeAttempts;

func void valley_showcase_triggerscript_func_s1()
{
	if((VALLEY_SHOWCASE_TRIGGERSCRIPT_FUNC_OneTime == FALSE) && (CutDownTreeAttempts >= 2))
	{
		Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
		Wld_SendTrigger("VALLEY_SHOWCASE_MOVER_01");
		B_GivePlayerXP(XP_Addon_WackelBaum);
		VALLEY_SHOWCASE_TRIGGERSCRIPT_FUNC_OneTime = TRUE;
	};
};

func int C_CanCutDownTree()
{
	if(VALLEY_SHOWCASE_TRIGGERSCRIPT_FUNC_OneTime == FALSE)
	{
		CutDownTreeAttempts += 1;
		if(CutDownTreeAttempts == 1)
		{
			Snd_Play("OW_SHIPWREKORBRIDGE_A1");
		}
		else if(CutDownTreeAttempts == 2)
		{
			Snd_Play("OW_SHIPWREKORBRIDGE_A2");
		}
		else
		{
			Snd_Play("OW_SHIPWREKORBRIDGE_A3");
		};
		return TRUE;
	};
	return FALSE;
};*/

