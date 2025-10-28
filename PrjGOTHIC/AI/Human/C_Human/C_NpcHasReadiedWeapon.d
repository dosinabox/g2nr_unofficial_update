
func int C_NpcHasReadiedWeapon(var C_Npc npc,var int itemInstance)
{
	var C_Item readiedWeapon;
	if(Npc_HasReadiedWeapon(npc))
	{
		readiedWeapon = Npc_GetReadiedWeapon(npc);
		if(Hlp_IsItem(readiedWeapon,itemInstance))
		{
			return TRUE;
		};
	};
	return FALSE;
};

