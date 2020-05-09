
func void B_Check_Talents()
{
	if(TalentSystemSynced == FALSE)
	{
		if(FIX_VERSION_SAVE < 25)
		{
			AI_UnequipWeapons(hero);
			B_UnEquipHeroItem(ItRi_Addon_MorgansRing_Mission);
			B_InitTalentSystem();
		};
	};
};

