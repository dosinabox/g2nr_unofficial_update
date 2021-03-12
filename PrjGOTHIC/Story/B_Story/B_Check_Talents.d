
func void B_Check_Talents()
{
	//удалить, когда сохранения версии 25 перестанут поддерживаться
	if(TalentSystemSynced == FALSE)
	{
		if(FIX_VERSION_SAVE < 25)
		{
			var C_Item weapon;
			B_InitTalentSystem();
			weapon = Npc_GetEquippedMeleeWeapon(hero);
			if(Hlp_IsValidItem(weapon))
			{
				B_UnEquipHeroItem(Hlp_GetInstanceID(weapon));
			};
			B_UnEquipHeroItem(ItRi_Addon_MorgansRing_Mission);
			B_InitTalentSystem();
		};
	};
};

