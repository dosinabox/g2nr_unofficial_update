
var int SC_IsObsessed;
var int SC_ObsessionCounter;

func void B_ClearSCObsession(var C_Npc heiler)
{
	if(!Npc_IsPlayer(heiler))
	{
		AI_StopProcessInfos(heiler);
	};
	SC_IsObsessed = FALSE;
	SC_ObsessionCounter = 0;
	PrintScreen(PRINT_ClearSCObsession,-1,-1,FONT_Screen,3);
};

func void B_SCIsObsessed(var C_Npc dementor)
{
	if(!Npc_IsPlayer(dementor))
	{
		AI_StopProcessInfos(dementor);
	};
	if(!Npc_HasItems(hero,ItAm_Prot_BlackEye_Mis))
	{
		if(SC_ObsessionCounter >= 2)
		{
			SC_IsObsessed = TRUE;
			PrintScreen(PRINT_SCIsObsessed,-1,-1,FONT_Screen,2);
		};
		SC_ObsessionCounter += 1;
	};
};

