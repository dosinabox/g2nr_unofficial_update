
func void B_GiveAllClassicPotions(var C_Npc npc)
{
	CreateInvItems(npc,ItPo_Mana_01,10);
	CreateInvItems(npc,ItPo_Mana_02,10);
	CreateInvItems(npc,ItPo_Mana_03,10);
	CreateInvItems(npc,ItPo_Health_01,10);
	CreateInvItems(npc,ItPo_Health_02,10);
	CreateInvItems(npc,ItPo_Health_03,10);
	CreateInvItems(npc,ItPo_Perm_STR,10);
	CreateInvItems(npc,ItPo_Perm_DEX,10);
	CreateInvItems(npc,ItPo_Perm_Health,10);
	CreateInvItems(npc,ItPo_Perm_Mana,10);
	CreateInvItems(npc,ItPo_Perm_LittleMana,10);
	CreateInvItems(npc,ItPo_Speed,10);
	CreateInvItems(npc,ItPo_MegaDrink,10);
	CreateInvItems(npc,ItPo_HealHilda_MIS,10);
	CreateInvItems(npc,ItPo_HealRandolph_MIS,10);
	CreateInvItems(npc,ItPo_HealObsession_MIS,10);
	CreateInvItems(npc,ItPo_DragonEggDrinkNeoras_MIS,1);
	CreateInvItems(npc,ItPo_PotionOfDeath_01_MIS,1);
	CreateInvItems(npc,ItPo_PotionOfDeath_02_MIS,1);
};

func void B_GiveAllAddonPotions(var C_Npc npc)
{
	CreateInvItems(npc,ItPo_Addon_Geist_01,10);
	CreateInvItems(npc,ItPo_Addon_Geist_02,10);
	CreateInvItems(npc,ItPo_Health_Addon_04,10);
	CreateInvItems(npc,ItPo_Mana_Addon_04,10);
};

func void B_GiveAllPatchPotions(var C_Npc npc)
{
	CreateInvItems(npc,ItPo_Perm_MushroomMana,10);
	CreateInvItems(npc,ItPo_Perm_AppleSTR,10);
};

