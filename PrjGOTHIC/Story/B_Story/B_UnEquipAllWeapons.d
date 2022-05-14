
func void B_UnEquipAllWeapons(var C_Npc slf,var int createCopy)
{
	var C_Item EquippedMeleeWeapon;
	var C_Item EquippedRangedWeapon;
	if(Npc_HasEquippedMeleeWeapon(slf))
	{
		EquippedMeleeWeapon = Npc_GetEquippedMeleeWeapon(slf);
		B_RemoveEveryInvItem(slf,Hlp_GetInstanceID(EquippedMeleeWeapon));
		if(createCopy == TRUE)
		{
			CreateInvItem(slf,Hlp_GetInstanceID(EquippedMeleeWeapon));
		};
	};
	if(Npc_HasEquippedRangedWeapon(slf))
	{
		EquippedRangedWeapon = Npc_GetEquippedRangedWeapon(slf);
		B_RemoveEveryInvItem(slf,Hlp_GetInstanceID(EquippedRangedWeapon));
		if(createCopy == TRUE)
		{
			CreateInvItem(slf,Hlp_GetInstanceID(EquippedRangedWeapon));
		};
	};
};

