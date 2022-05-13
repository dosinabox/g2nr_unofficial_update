
/*func void B_Check_Talents()
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
};*/

func void B_UnEquipAllTempBonusItems() //TODO перенести в CharacterHelper.d
{
	B_UnEquipHeroItem(ItBe_Addon_STR_5);
	B_UnEquipHeroItem(ItBe_Addon_STR_10);
	B_UnEquipHeroItem(ItBe_Addon_DEX_5);
	B_UnEquipHeroItem(ItBe_Addon_DEX_10);
	B_UnEquipHeroItem(ItAm_Dex_01);
	B_UnEquipHeroItem(ItAm_Strg_01);
	B_UnEquipHeroItem(ItAm_Hp_01);
	B_UnEquipHeroItem(ItAm_Mana_01);
	B_UnEquipHeroItem(ItAm_Dex_Strg_01);
	B_UnEquipHeroItem(ItAm_Hp_Mana_01);
	B_UnEquipHeroItem(ItAm_Addon_Franco);
	B_UnEquipHeroItem(ItAm_Addon_Health);
	B_UnEquipHeroItem(ItAm_Addon_MANA);
	B_UnEquipHeroItem(ItAm_Addon_STR);
	B_UnEquipHeroItem(ItRi_Dex_01);
	B_UnEquipHeroItem(ItRi_Dex_02);
	B_UnEquipHeroItem(ItRi_HP_01);
	B_UnEquipHeroItem(ItRi_HP_02);
	B_UnEquipHeroItem(ItRi_Str_01);
	B_UnEquipHeroItem(ItRi_Str_02);
	B_UnEquipHeroItem(ItRi_Mana_01);
	B_UnEquipHeroItem(ItRi_Mana_02);
	B_UnEquipHeroItem(ItRi_Dex_Strg_01);
	B_UnEquipHeroItem(ItRi_Hp_Mana_01);
	B_UnEquipHeroItem(ItRi_Addon_Health_01);
	B_UnEquipHeroItem(ItRi_Addon_Health_02);
	B_UnEquipHeroItem(ItRi_Addon_MANA_01);
	B_UnEquipHeroItem(ItRi_Addon_MANA_02);
	B_UnEquipHeroItem(ItRi_Addon_STR_01);
	B_UnEquipHeroItem(ItRi_Addon_STR_02);
	B_UnEquipHeroItem(ItRi_HP_01_Tengron);
	B_UnEquipHeroItem(ItRi_OrcEliteRing);
	B_UnEquipHeroItem(ItRi_Addon_MorgansRing_Mission);
	B_UnEquipHeroItem(ItAm_Mana_Angar_MIS);
	B_UnEquipHeroItem(ItAm_Hp_Regen);
	B_UnEquipHeroItem(ItAm_Mana_Regen);
};

func void B_Check_Attributes() //TODO удалить к релизу 29 версии
{
	if(NewAttributeSystemSynced == TRUE)
	{
		return;
	};
	if(!Npc_KnowsInfo(hero,DIA_Xardas_FirstEXIT))
	{
		return;
	};
	B_UnEquipAllTempBonusItems();
	B_InitAttributeSystem();
};

