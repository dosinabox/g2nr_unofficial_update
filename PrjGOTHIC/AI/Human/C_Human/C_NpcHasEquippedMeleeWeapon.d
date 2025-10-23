
func int C_NpcHasEquippedMeleeWeapon(var C_Npc npc,var int itemInstance)
{
	var C_Item equippedWeapon;
	if(Npc_HasEquippedMeleeWeapon(npc))
	{
		equippedWeapon = Npc_GetEquippedMeleeWeapon(npc);
		if(Hlp_IsItem(equippedWeapon,itemInstance))
		{
			return TRUE;
		};
	};
	return FALSE;
};

