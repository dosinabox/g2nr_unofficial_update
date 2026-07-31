
func int C_FireContestRuneFound()
{
	if(C_WorldIsFixed())
	{
		if(!Mob_HasItems("MAGICCHEST",ItMi_RuneBlank))
		{
			return TRUE;
		};
	}
	else if(Npc_HasItems(hero,ItMi_RuneBlank) || Npc_HasItems(hero,ItRu_FireBolt))
	{
		return TRUE;
	};
	return FALSE;
};

