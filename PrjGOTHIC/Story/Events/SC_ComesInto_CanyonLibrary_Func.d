
var int SC_ComesInto_CanyonLibrary_Func_OneTime;

func void SC_ComesInto_CanyonLibrary_Func()
{
	if(SC_ComesInto_CanyonLibrary_Func_OneTime == FALSE)
	{
		if(!Npc_IsDead(Shadowbeast_Addon_Fire_CanyonLib))
		{
			AI_Standup(Shadowbeast_Addon_Fire_CanyonLib);
			Shadowbeast_Addon_Fire_CanyonLib.aivar[AIV_EnemyOverride] = FALSE;
			Snd_Play("THRILLJINGLE_03");
			Snd_Play("GOL_AMBIENT_A2");
		};
		SC_ComesInto_CanyonLibrary_Func_OneTime = TRUE;
	};
};

