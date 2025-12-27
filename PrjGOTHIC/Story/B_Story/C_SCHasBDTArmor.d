
func int C_SCHasBDTArmor()
{
	if(Npc_HasItems(hero,ITAR_BDT_M))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ITAR_BDT_H))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ITAR_Thorus_Addon))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ITAR_OreBaron_Addon))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ITAR_Bloodwyn_Addon))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ITAR_Diego))
	{
		return TRUE;
	};
	return FALSE;
};

