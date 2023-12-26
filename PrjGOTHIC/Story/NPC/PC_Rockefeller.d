
instance PC_Rockefeller(Npc_Default)
{
	name[0] = "���������";
	npcType = NPCTYPE_MAIN;
	guild = GIL_NONE;
	level = 100;
	voice = 15;
	id = 0;
	attribute[ATR_STRENGTH] = 1000;
	attribute[ATR_DEXTERITY] = 1000;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	exp = B_GetCurrentLevelExp(self);
	exp_next = B_GetNextLevelExp(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_N_Player,BodyTex_Player_G1,ITAR_PAL_H);
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	Npc_SetTalentSkill(self,NPC_TALENT_PICKLOCK,1);
	Npc_SetTalentSkill(self,NPC_TALENT_SNEAK,1);
	Npc_SetTalentSkill(self,NPC_TALENT_ACROBAT,0);
	Npc_SetTalentSkill(self,NPC_TALENT_PICKPOCKET,1);
	Npc_SetTalentSkill(self,NPC_TALENT_SMITH,1);
	Npc_SetTalentSkill(self,NPC_TALENT_RUNES,1);
	Npc_SetTalentSkill(self,NPC_TALENT_ALCHEMY,1);
	Npc_SetTalentSkill(self,NPC_TALENT_TAKEANIMALFUR,1);
	B_SetFightSkills(self,100);
	B_GiveAllClassicWeapons(self);
	B_GiveAllClassicArmor(self);
	B_GiveAllClassicRunes(self);
	B_GiveAllClassicScrolls(self);
	B_GiveAllClassicTrophies(self);
	B_GiveAllClassicFood(self);
	B_GiveAllClassicPotions(self);
	CreateInvItem(self,ItPl_SwampHerb);
	CreateInvItem(self,ItPl_Mana_Herb_01);
	CreateInvItem(self,ItPl_Mana_Herb_02);
	CreateInvItem(self,ItPl_Mana_Herb_03);
	CreateInvItem(self,ItPl_Health_Herb_01);
	CreateInvItem(self,ItPl_Health_Herb_02);
	CreateInvItem(self,ItPl_Health_Herb_03);
	CreateInvItem(self,ItPl_Dex_Herb_01);
	CreateInvItem(self,ItPl_Strength_Herb_01);
	CreateInvItem(self,ItPl_Speed_Herb_01);
	CreateInvItem(self,ItPl_Mushroom_01);
	CreateInvItem(self,ItPl_Mushroom_02);
	CreateInvItem(self,ItPl_Forestberry);
	CreateInvItem(self,ItPl_Blueplant);
	CreateInvItem(self,ItPl_Planeberry);
	CreateInvItem(self,ItPl_Temp_Herb);
	CreateInvItem(self,ItPl_Perm_Herb);
	CreateInvItem(self,ItKe_Lockpick);
	CreateInvItems(self,ItLsTorch,50);
	CreateInvItem(self,ItMi_Pan);
	CreateInvItem(self,ItMi_Saw);
	CreateInvItem(self,ItMi_Brush);
	CreateInvItem(self,ItMi_Flask);
	CreateInvItem(self,ItMi_Stomper);
	CreateInvItem(self,ItMi_Broom);
	CreateInvItem(self,ItMi_Rake);
	CreateInvItem(self,ItMi_Hammer);
	CreateInvItem(self,ItMi_Scoop);
	CreateInvItem(self,ItMi_Nugget);
	CreateInvItem(self,ItMi_Joint);
	CreateInvItem(self,ItMi_Lute);
	CreateInvItems(self,ItMi_Gold,1000);
	CreateInvItem(self,ItMiSwordraw);
	CreateInvItem(self,ItMiSwordrawhot);
	CreateInvItem(self,ItMiSwordbladehot);
	CreateInvItem(self,ItMiSwordblade);
	CreateInvItem(self,ItMi_RuneBlank);
	CreateInvItem(self,ItMi_Sulfur);
	CreateInvItem(self,ItMi_Quartz);
	CreateInvItem(self,ItMi_Pitch);
	CreateInvItem(self,ItMi_Rockcrystal);
	CreateInvItem(self,ItMi_Aquamarine);
	CreateInvItem(self,ItMi_HolyWater);
	CreateInvItem(self,ItMi_Coal);
	CreateInvItem(self,ItMi_DarkPearl);
	CreateInvItem(self,ItMi_GoldCandleHolder);
	CreateInvItem(self,ItMi_GoldNecklace);
	CreateInvItem(self,ItMi_GoldCup);
	CreateInvItem(self,ItMi_GoldChalice);
	CreateInvItem(self,ItMi_GoldChest);
	CreateInvItem(self,ItMi_GoldRing);
	CreateInvItem(self,ItMi_SilverChalice);
	CreateInvItem(self,ItMi_JeweleryChest);
	CreateInvItem(self,ItMi_InnosStatue);
	CreateInvItem(self,ItMi_SilverRing);
	CreateInvItem(self,ItMi_SilverCup);
	CreateInvItem(self,ItMi_SilverPlate);
	CreateInvItem(self,ItMi_SilverNecklace);
	CreateInvItem(self,ItMi_SilverCandleHolder);
	CreateInvItem(self,ItMi_Sextant);
	CreateInvItems(self,ItBE_Addon_Leather_01,1);
	CreateInvItems(self,ItBE_Addon_SLD_01,1);
	CreateInvItems(self,ItBE_Addon_NOV_01,1);
	CreateInvItems(self,ItBE_Addon_MIL_01,1);
	CreateInvItems(self,ItBE_Addon_KDF_01,1);
	CreateInvItems(self,ItBE_Addon_MC,1);
	CreateInvItems(self,ItBe_Addon_STR_5,1);
	CreateInvItems(self,ItBe_Addon_STR_10,1);
	CreateInvItems(self,ItBe_Addon_DEX_5,1);
	CreateInvItems(self,ItBe_Addon_DEX_10,1);
	CreateInvItems(self,ItBe_Addon_Prot_EDGE,1);
	CreateInvItems(self,ItBe_Addon_Prot_Point,1);
	CreateInvItems(self,ItBe_Addon_Prot_MAGIC,1);
	CreateInvItems(self,ItBe_Addon_Prot_FIRE,1);
	CreateInvItems(self,ItBe_Addon_Prot_EdgPoi,1);
	CreateInvItems(self,ItBe_Addon_Prot_TOTAL,1);
	CreateInvItem(self,ItAm_Dex_01);
	CreateInvItem(self,ItAm_Strg_01);
	CreateInvItem(self,ItAm_Hp_01);
	CreateInvItem(self,ItAm_Mana_01);
	CreateInvItem(self,ItAm_Dex_Strg_01);
	CreateInvItem(self,ItAm_Hp_Mana_01);
	CreateInvItem(self,ItAm_Prot_Fire_01);
	CreateInvItem(self,ItAm_Prot_Mage_01);
	CreateInvItem(self,ItAm_Prot_Edge_01);
	CreateInvItem(self,ItAm_Prot_Point_01);
	CreateInvItem(self,ItAm_Prot_Total_01);
	CreateInvItem(self,ItRi_Dex_01);
	CreateInvItem(self,ItRi_Dex_02);
	CreateInvItem(self,ItRi_HP_01);
	CreateInvItem(self,ItRi_HP_02);
	CreateInvItem(self,ItRi_Str_01);
	CreateInvItem(self,ItRi_Str_02);
	CreateInvItem(self,ItRi_Mana_01);
	CreateInvItem(self,ItRi_Mana_02);
	CreateInvItem(self,ItRi_Dex_Strg_01);
	CreateInvItem(self,ItRi_Hp_Mana_01);
	CreateInvItem(self,ItRi_Prot_Fire_01);
	CreateInvItem(self,ItRi_Prot_Fire_02);
	CreateInvItem(self,ItRi_Prot_Edge_01);
	CreateInvItem(self,ItRi_Prot_Edge_02);
	CreateInvItem(self,ItRi_Prot_Mage_01);
	CreateInvItem(self,ItRi_Prot_Mage_02);
	CreateInvItem(self,ItRi_Prot_Point_01);
	CreateInvItem(self,ItRi_Prot_Point_02);
	CreateInvItem(self,ItRi_Prot_Total_01);
	CreateInvItem(self,ItRi_Prot_Total_02);
};

