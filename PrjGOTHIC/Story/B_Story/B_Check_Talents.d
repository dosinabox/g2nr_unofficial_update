
func void B_Check_Talents()
{
	//начиная с 27 версии не вызывается в INIT_Global при каждой загрузке
	var C_Item weapon;
	B_InitTalentSystem();
	if(Npc_HasEquippedMeleeWeapon(hero))
	{
		weapon = Npc_GetEquippedMeleeWeapon(hero);
		if(Hlp_IsValidItem(weapon))
		{
			B_UnEquipHeroItem(Hlp_GetInstanceID(weapon));
		};
	};
	B_UnEquipHeroItem(ItRi_Addon_MorgansRing_Mission);
	B_InitTalentSystem();
};

