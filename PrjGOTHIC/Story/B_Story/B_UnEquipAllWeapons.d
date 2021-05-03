
func void B_UnEquipAllWeapons(var C_Npc slf,var int createCopy)
{
	var C_Item EquippedMeleeWeapon;
	var C_Item EquippedRangedWeapon;
	if(Npc_HasEquippedMeleeWeapon(slf))
	{
		EquippedMeleeWeapon = Npc_GetEquippedMeleeWeapon(slf);
		Npc_RemoveInvItems(slf,Hlp_GetInstanceID(EquippedMeleeWeapon),Npc_HasItems(slf,Hlp_GetInstanceID(EquippedMeleeWeapon)));
		if(createCopy == TRUE)
		{
			CreateInvItem(slf,Hlp_GetInstanceID(EquippedMeleeWeapon));
		};
	};
	if(Npc_HasEquippedRangedWeapon(slf))
	{
		EquippedRangedWeapon = Npc_GetEquippedRangedWeapon(slf);
		Npc_RemoveInvItems(slf,Hlp_GetInstanceID(EquippedRangedWeapon),Npc_HasItems(slf,Hlp_GetInstanceID(EquippedRangedWeapon)));
		if(createCopy == TRUE)
		{
			CreateInvItem(slf,Hlp_GetInstanceID(EquippedRangedWeapon));
		};
	};
};

