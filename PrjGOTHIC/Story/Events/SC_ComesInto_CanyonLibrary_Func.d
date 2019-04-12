
var int SC_COMESINTO_CANYONLIBRARY_FUNC_OneTime;

func void sc_comesinto_canyonlibrary_func()
{
	if(SC_COMESINTO_CANYONLIBRARY_FUNC_OneTime == FALSE)
	{
		if(Npc_IsDead(Shadowbeast_Addon_Fire_CanyonLib) == FALSE)
		{
			AI_Standup(Shadowbeast_Addon_Fire_CanyonLib);
			Shadowbeast_Addon_Fire_CanyonLib.aivar[AIV_EnemyOverride] = FALSE;
			Snd_Play("THRILLJINGLE_03");
			Snd_Play("GOL_Ambient_A2");
		};
		SC_COMESINTO_CANYONLIBRARY_FUNC_OneTime = TRUE;
	};
};

