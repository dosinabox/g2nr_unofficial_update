
func void B_ClearJunkTradeInv(var C_Npc slf)
{
	var C_Item EquipWeap;
	EquipWeap = Npc_GetEquippedMeleeWeapon(slf);
	if(Hlp_IsValidNpc(slf))
	{
		if(Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Cipher))
		{
			Npc_RemoveInvItems(slf,ItMi_Joint,Npc_HasItems(slf,ItMi_Joint));
			Npc_RemoveInvItems(slf,ItMw_2H_OrcAxe_01,Npc_HasItems(slf,ItMw_2H_OrcAxe_01));
		};
		Npc_RemoveInvItems(slf,ItMw_2H_OrcAxe_02,Npc_HasItems(slf,ItMw_2H_OrcAxe_02));
		Npc_RemoveInvItems(slf,ItMw_2H_OrcAxe_03,Npc_HasItems(slf,ItMw_2H_OrcAxe_03));
		Npc_RemoveInvItems(slf,ItMw_2H_OrcAxe_04,Npc_HasItems(slf,ItMw_2H_OrcAxe_04));
		Npc_RemoveInvItems(slf,ItMw_2H_OrcMace_01,Npc_HasItems(slf,ItMw_2H_OrcMace_01));
		Npc_RemoveInvItems(slf,ItMw_2H_OrcSword_01,Npc_HasItems(slf,ItMw_2H_OrcSword_01));
		Npc_RemoveInvItems(slf,ItMw_2H_OrcSword_02,Npc_HasItems(slf,ItMw_2H_OrcSword_02));
		Npc_RemoveInvItems(slf,ItMw_TrainSword,Npc_HasItems(slf,ItMw_TrainSword));
		if(!Hlp_IsItem(EquipWeap,ItMw_1h_Bau_Mace))
		{
			Npc_RemoveInvItems(slf,ItMw_1h_Bau_Mace,Npc_HasItems(slf,ItMw_1h_Bau_Mace));
		};
		if(Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(VLK_404_Lutero))
		{
			Npc_RemoveInvItems(slf,ItAt_CrawlerMandibles,Npc_HasItems(slf,ItAt_CrawlerMandibles));
			Npc_RemoveInvItems(slf,ItAt_Sting,Npc_HasItems(slf,ItAt_Sting));
		};
		if((Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Gorax)) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Cronos_ADW)))
		{
			Npc_RemoveInvItems(slf,ItAt_WaranFiretongue,Npc_HasItems(slf,ItAt_WaranFiretongue));
		};
		Npc_RemoveInvItems(slf,ItAt_Meatbugflesh,Npc_HasItems(slf,ItAt_Meatbugflesh));
		Npc_RemoveInvItems(slf,ItAt_SheepFur,Npc_HasItems(slf,ItAt_SheepFur));
		Npc_RemoveInvItems(slf,ItAt_WolfFur,Npc_HasItems(slf,ItAt_WolfFur));
		Npc_RemoveInvItems(slf,ItAt_BugMandibles,Npc_HasItems(slf,ItAt_BugMandibles));
		Npc_RemoveInvItems(slf,ItAt_Claw,Npc_HasItems(slf,ItAt_Claw));
		Npc_RemoveInvItems(slf,ItAt_LurkerClaw,Npc_HasItems(slf,ItAt_LurkerClaw));
		Npc_RemoveInvItems(slf,ItAt_Teeth,Npc_HasItems(slf,ItAt_Teeth));
		Npc_RemoveInvItems(slf,ItAt_Wing,Npc_HasItems(slf,ItAt_Wing));
		Npc_RemoveInvItems(slf,ItAt_LurkerSkin,Npc_HasItems(slf,ItAt_LurkerSkin));
		Npc_RemoveInvItems(slf,ItAt_WargFur,Npc_HasItems(slf,ItAt_WargFur));
		Npc_RemoveInvItems(slf,ItAt_DrgSnapperHorn,Npc_HasItems(slf,ItAt_DrgSnapperHorn));
		Npc_RemoveInvItems(slf,ItAt_CrawlerPlate,Npc_HasItems(slf,ItAt_CrawlerPlate));
		Npc_RemoveInvItems(slf,ItAt_ShadowFur,Npc_HasItems(slf,ItAt_ShadowFur));
		Npc_RemoveInvItems(slf,ItAt_SharkSkin,Npc_HasItems(slf,ItAt_SharkSkin));
		Npc_RemoveInvItems(slf,ItAt_TrollFur,Npc_HasItems(slf,ItAt_TrollFur));
		Npc_RemoveInvItems(slf,ItAt_Addon_KeilerFur,Npc_HasItems(slf,ItAt_Addon_KeilerFur));
		Npc_RemoveInvItems(slf,ItAt_IceWolfFur,Npc_HasItems(slf,ItAt_IceWolfFur));
		Npc_RemoveInvItems(slf,ItAt_Addon_BCKopf,Npc_HasItems(slf,ItAt_Addon_BCKopf));
//		Npc_RemoveInvItems(slf,ItFo_Apple,Npc_HasItems(slf,ItFo_Apple));
		Npc_RemoveInvItems(slf,ItFo_Cheese,Npc_HasItems(slf,ItFo_Cheese));
		Npc_RemoveInvItems(slf,ItFo_Bacon,Npc_HasItems(slf,ItFo_Bacon));
		Npc_RemoveInvItems(slf,ItFo_Bread,Npc_HasItems(slf,ItFo_Bread));
		Npc_RemoveInvItems(slf,ItFo_Fish,Npc_HasItems(slf,ItFo_Fish));
		Npc_RemoveInvItems(slf,ItFo_SmellyFish,Npc_HasItems(slf,ItFo_SmellyFish));
		Npc_RemoveInvItems(slf,ItFoMuttonRaw,Npc_HasItems(slf,ItFoMuttonRaw));
		Npc_RemoveInvItems(slf,ItFoMutton,Npc_HasItems(slf,ItFoMutton));
		Npc_RemoveInvItems(slf,ItFo_Stew,Npc_HasItems(slf,ItFo_Stew));
		Npc_RemoveInvItems(slf,ItFo_FishSoup,Npc_HasItems(slf,ItFo_FishSoup));
		Npc_RemoveInvItems(slf,ItFo_EddasFishSoup,Npc_HasItems(slf,ItFo_EddasFishSoup));
		Npc_RemoveInvItems(slf,ItFo_Sausage,Npc_HasItems(slf,ItFo_Sausage));
		Npc_RemoveInvItems(slf,ItFo_Schafswurst,Npc_HasItems(slf,ItFo_Schafswurst));
		Npc_RemoveInvItems(slf,ItFo_Honey,Npc_HasItems(slf,ItFo_Honey));
		Npc_RemoveInvItems(slf,ItFo_Water,Npc_HasItems(slf,ItFo_Water));
		Npc_RemoveInvItems(slf,ItFo_Beer,Npc_HasItems(slf,ItFo_Beer));
		Npc_RemoveInvItems(slf,ItFo_Booze,Npc_HasItems(slf,ItFo_Booze));
		if(Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Gorax))
		{
			Npc_RemoveInvItems(slf,ItFo_Wine,Npc_HasItems(slf,ItFo_Wine));
		};
		if((Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Canthar)) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Matteo)))
		{
			Npc_RemoveInvItems(slf,ItMi_Pan,Npc_HasItems(slf,ItMi_Pan));
		};
		Npc_RemoveInvItems(slf,ItFo_DarkWine,Npc_HasItems(slf,ItFo_DarkWine));
		Npc_RemoveInvItems(slf,ItFo_Milk,Npc_HasItems(slf,ItFo_Milk));
		Npc_RemoveInvItems(slf,ItFo_Addon_Shellflesh,Npc_HasItems(slf,ItFo_Addon_Shellflesh));
		Npc_RemoveInvItems(slf,ItMi_OldCoin,Npc_HasItems(slf,ItMi_OldCoin));
		Npc_RemoveInvItems(slf,ItMi_GoldCandleHolder,Npc_HasItems(slf,ItMi_GoldCandleHolder));
		Npc_RemoveInvItems(slf,ItMi_GoldNecklace,Npc_HasItems(slf,ItMi_GoldNecklace));
		Npc_RemoveInvItems(slf,ItMi_SilverRing,Npc_HasItems(slf,ItMi_SilverRing));
		Npc_RemoveInvItems(slf,ItMi_SilverNecklace,Npc_HasItems(slf,ItMi_SilverNecklace));
		Npc_RemoveInvItems(slf,ItMi_SilverCandleHolder,Npc_HasItems(slf,ItMi_SilverCandleHolder));
		Npc_RemoveInvItems(slf,ItMi_SilverPlate,Npc_HasItems(slf,ItMi_SilverPlate));
		Npc_RemoveInvItems(slf,ItMi_SilverCup,Npc_HasItems(slf,ItMi_SilverCup));
		Npc_RemoveInvItems(slf,ItMi_SilverChalice,Npc_HasItems(slf,ItMi_SilverChalice));
		Npc_RemoveInvItems(slf,ItMi_ErolsKelch,Npc_HasItems(slf,ItMi_ErolsKelch));
		Npc_RemoveInvItems(slf,ItMi_GoldRing,Npc_HasItems(slf,ItMi_GoldRing));
		Npc_RemoveInvItems(slf,ItMi_GoldCandleHolder,Npc_HasItems(slf,ItMi_GoldCandleHolder));
		Npc_RemoveInvItems(slf,ItMi_GoldCup,Npc_HasItems(slf,ItMi_GoldCup));
		Npc_RemoveInvItems(slf,ItMi_GoldChest,Npc_HasItems(slf,ItMi_GoldChest));
		Npc_RemoveInvItems(slf,ItMi_JeweleryChest,Npc_HasItems(slf,ItMi_JeweleryChest));
		Npc_RemoveInvItems(slf,ItMi_InnosStatue,Npc_HasItems(slf,ItMi_InnosStatue));
		Npc_RemoveInvItems(slf,ItMi_Sextant,Npc_HasItems(slf,ItMi_Sextant));
		Npc_RemoveInvItems(slf,ItPl_Beet,Npc_HasItems(slf,ItPl_Beet));
		Npc_RemoveInvItems(slf,ItPl_SwampHerb,Npc_HasItems(slf,ItPl_SwampHerb));
//		Npc_RemoveInvItems(slf,ItPl_Mushroom_01,Npc_HasItems(slf,ItPl_Mushroom_01));
		Npc_RemoveInvItems(slf,ItPl_Mushroom_02,Npc_HasItems(slf,ItPl_Mushroom_02));
		Npc_RemoveInvItems(slf,ItPl_Blueplant,Npc_HasItems(slf,ItPl_Blueplant));
		Npc_RemoveInvItems(slf,ItPl_Forestberry,Npc_HasItems(slf,ItPl_Forestberry));
		Npc_RemoveInvItems(slf,ItPl_Planeberry,Npc_HasItems(slf,ItPl_Planeberry));
		Npc_RemoveInvItems(slf,ItLsTorchburned,Npc_HasItems(slf,ItLsTorchburned));
		Npc_RemoveInvItems(slf,ItWr_Poster_MIS,Npc_HasItems(slf,ItWr_Poster_MIS));
		Npc_RemoveInvItem(slf,ITWr_Addon_Hinweis_01);
		Npc_RemoveInvItem(slf,ITWr_Addon_Hinweis_02);
		Npc_RemoveInvItem(slf,ITWr_Addon_William_01);
		Npc_RemoveInvItem(slf,ITWr_Addon_Pirates_01);
		Npc_RemoveInvItem(slf,ItWr_Kraeuterliste);
		Npc_RemoveInvItem(slf,ItWr_BanditLetter_MIS);
		Npc_RemoveInvItem(slf,ItWr_KDWLetter);
		Npc_RemoveInvItem(slf,ItWr_GilbertLetter);
		Npc_RemoveInvItem(slf,ItWr_Manowar);
		Npc_RemoveInvItem(slf,ItWr_Pfandbrief_MIS);
		Npc_RemoveInvItem(slf,ItWr_Silvestro_MIS);
		Npc_RemoveInvItem(slf,ItWr_UseLampIdiot_Mis);
		Npc_RemoveInvItem(slf,ItWr_Krypta_Garon);
		if(SC_SummonedAncientGhost == TRUE)
		{
			Npc_RemoveInvItem(slf,ItWr_Addon_SUMMONANCIENTGHOST);
		};
		if(Kapitel > 1)
		{
			Npc_RemoveInvItem(slf,ItWr_Martin_MilizEmpfehlung_Addon);
		};
		if(MIS_LuciasLetter == LOG_SUCCESS)
		{
			Npc_RemoveInvItem(slf,ItWr_LuciasLoveLetter_Addon);
		};
		if((MIS_Vatras_FindTheBanditTrader == LOG_SUCCESS) || (MIS_Vatras_FindTheBanditTrader == LOG_FAILED) || (MIS_Martin_FindTheBanditTrader == LOG_SUCCESS) || (MIS_Martin_FindTheBanditTrader == LOG_FAILED))
		{
			Npc_RemoveInvItem(slf,ItWr_Addon_BanditTrader);
		};
	};
};

func void B_ClearTools(var C_Npc slf)
{
	if(Hlp_IsValidNpc(slf))
	{
		Npc_RemoveInvItems(slf,ItMi_Stomper,Npc_HasItems(slf,ItMi_Stomper));
		Npc_RemoveInvItems(slf,ItMi_Hammer,Npc_HasItems(slf,ItMi_Hammer));
		Npc_RemoveInvItems(slf,ItMi_Scoop,Npc_HasItems(slf,ItMi_Scoop));
		Npc_RemoveInvItems(slf,ItMi_Brush,Npc_HasItems(slf,ItMi_Brush));
		Npc_RemoveInvItems(slf,ItMi_Rake,Npc_HasItems(slf,ItMi_Rake));
		if(Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Canthar))
		{
			Npc_RemoveInvItems(slf,ItMi_Saw,Npc_HasItems(slf,ItMi_Saw));
		};
		if(Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Matteo))
		{
			Npc_RemoveInvItems(slf,ItMi_Broom,Npc_HasItems(slf,ItMi_Broom));
			Npc_RemoveInvItems(slf,ItMi_Lute,Npc_HasItems(slf,ItMi_Lute));
		};
	};
};

