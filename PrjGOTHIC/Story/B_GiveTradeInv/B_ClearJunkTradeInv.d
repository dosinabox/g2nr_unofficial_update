
func void B_ClearJunkTradeInv(var C_Npc slf)
{
	var C_Item EquipWeap;
	if(Hlp_IsValidNpc(slf))
	{
		if(Npc_HasEquippedMeleeWeapon(slf))
		{
			EquipWeap = Npc_GetEquippedMeleeWeapon(slf);
			if(!Hlp_IsItem(EquipWeap,ItMw_1h_Bau_Mace))
			{
				B_RemoveEveryInvItem(slf,ItMw_1h_Bau_Mace);
			};
		}
		else
		{
			B_RemoveEveryInvItem(slf,ItMw_1h_Bau_Mace);
		};
		if(Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Cipher))
		{
			B_RemoveEveryInvItem(slf,ItMi_Joint);
			B_RemoveEveryInvItem(slf,ItMw_2H_OrcAxe_01);
		};
		B_RemoveEveryInvItem(slf,ItMw_2H_OrcAxe_02);
		B_RemoveEveryInvItem(slf,ItMw_2H_OrcAxe_03);
		B_RemoveEveryInvItem(slf,ItMw_2H_OrcAxe_04);
		B_RemoveEveryInvItem(slf,ItMw_2H_OrcMace_01);
		B_RemoveEveryInvItem(slf,ItMw_2H_OrcSword_01);
		B_RemoveEveryInvItem(slf,ItMw_2H_OrcSword_02);
		B_RemoveEveryInvItem(slf,ItMw_TrainSword);
		if(Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Lutero))
		{
			B_RemoveEveryInvItem(slf,ItAt_CrawlerMandibles);
		};
		if((Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Lutero)) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Fisk)))
		{
			B_RemoveEveryInvItem(slf,ItAt_Sting);
		};
		if((Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Gorax)) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Cronos_ADW)))
		{
			B_RemoveEveryInvItem(slf,ItAt_WaranFiretongue);
		};
		B_RemoveEveryInvItem(slf,ItAt_Meatbugflesh);
		B_RemoveEveryInvItem(slf,ItAt_SheepFur);
		B_RemoveEveryInvItem(slf,ItAt_WolfFur);
		B_RemoveEveryInvItem(slf,ItAt_BugMandibles);
		B_RemoveEveryInvItem(slf,ItAt_Claw);
		B_RemoveEveryInvItem(slf,ItAt_LurkerClaw);
		B_RemoveEveryInvItem(slf,ItAt_Teeth);
		B_RemoveEveryInvItem(slf,ItAt_LurkerSkin);
		B_RemoveEveryInvItem(slf,ItAt_WargFur);
		B_RemoveEveryInvItem(slf,ItAt_DrgSnapperHorn);
		B_RemoveEveryInvItem(slf,ItAt_CrawlerPlate);
		B_RemoveEveryInvItem(slf,ItAt_ShadowFur);
		B_RemoveEveryInvItem(slf,ItAt_SharkSkin);
		B_RemoveEveryInvItem(slf,ItAt_TrollFur);
		B_RemoveEveryInvItem(slf,ItAt_Addon_KeilerFur);
		B_RemoveEveryInvItem(slf,ItAt_IceWolfFur);
		B_RemoveEveryInvItem(slf,ItAt_Addon_BCKopf);
		B_RemoveEveryInvItem(slf,ItAt_SnapperSkin);
		B_RemoveEveryInvItem(slf,ItAt_RazorSkin);
		B_RemoveEveryInvItem(slf,ItAt_DragonSnapperSkin);
		B_RemoveEveryInvItem(slf,ItAt_WaranSkin);
		B_RemoveEveryInvItem(slf,ItAt_FireWaranSkin);
		B_RemoveEveryInvItem(slf,ItAt_AlligatorSkin);
		if(Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Constantino))
		{
			B_RemoveEveryInvItem(slf,ItAt_GoblinBone);
			B_RemoveEveryInvItem(slf,ItAt_SkeletonBone);
			B_RemoveEveryInvItem(slf,ItAt_Wing);
		};
		if(Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Sagitta))
		{
			B_RemoveEveryInvItem(slf,ItAt_KeilerHorn);
		};
//		B_RemoveEveryInvItem(slf,ItFo_Apple);
		B_RemoveEveryInvItem(slf,ItFo_Cheese);
		B_RemoveEveryInvItem(slf,ItFo_Bacon);
		B_RemoveEveryInvItem(slf,ItFo_Bread);
		B_RemoveEveryInvItem(slf,ItFo_Fish);
		B_RemoveEveryInvItem(slf,ItFo_SmellyFish);
		B_RemoveEveryInvItem(slf,ItFoMuttonRaw);
		B_RemoveEveryInvItem(slf,ItFoMutton);
		B_RemoveEveryInvItem(slf,ItFo_Stew);
		B_RemoveEveryInvItem(slf,ItFo_FishSoup);
		B_RemoveEveryInvItem(slf,ItFo_EddasFishSoup);
		B_RemoveEveryInvItem(slf,ItFo_Sausage);
		B_RemoveEveryInvItem(slf,ItFo_Schafswurst);
		B_RemoveEveryInvItem(slf,ItFo_Honey);
		B_RemoveEveryInvItem(slf,ItFo_Water);
		B_RemoveEveryInvItem(slf,ItFo_Beer);
		B_RemoveEveryInvItem(slf,ItFo_Booze);
		if((Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Lutero)) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Sagitta)))
		{
			B_RemoveEveryInvItem(slf,ItMi_Skull);
		};
		if(Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Gorax))
		{
			B_RemoveEveryInvItem(slf,ItFo_Wine);
		};
		if(Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Lucia))
		{
			B_RemoveEveryInvItem(slf,ItFo_Addon_Liquor);
		};
		if((Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Canthar)) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Matteo)))
		{
			B_RemoveEveryInvItem(slf,ItMi_Pan);
		};
		B_RemoveEveryInvItem(slf,ItFo_DarkWine);
		B_RemoveEveryInvItem(slf,ItFo_Milk);
		B_RemoveEveryInvItem(slf,ItFo_Addon_Shellflesh);
		B_RemoveEveryInvItem(slf,ItMi_OldCoin);
		B_RemoveEveryInvItem(slf,ItMi_GoldCandleHolder);
		B_RemoveEveryInvItem(slf,ItMi_GoldNecklace);
		B_RemoveEveryInvItem(slf,ItMi_SilverRing);
		B_RemoveEveryInvItem(slf,ItMi_SilverNecklace);
		B_RemoveEveryInvItem(slf,ItMi_SilverCandleHolder);
		B_RemoveEveryInvItem(slf,ItMi_SilverPlate);
		B_RemoveEveryInvItem(slf,ItMi_SilverCup);
		B_RemoveEveryInvItem(slf,ItMi_SilverChalice);
		B_RemoveEveryInvItem(slf,ItMi_ErolsKelch);
		B_RemoveEveryInvItem(slf,ItMi_GoldRing);
		B_RemoveEveryInvItem(slf,ItMi_GoldCandleHolder);
		B_RemoveEveryInvItem(slf,ItMi_GoldCup);
		B_RemoveEveryInvItem(slf,ItMi_GoldChest);
		B_RemoveEveryInvItem(slf,ItMi_JeweleryChest);
		B_RemoveEveryInvItem(slf,ItMi_InnosStatue);
		B_RemoveEveryInvItem(slf,ItPl_Beet);
		B_RemoveEveryInvItem(slf,ItPl_SwampHerb);
//		B_RemoveEveryInvItem(slf,ItPl_Mushroom_01);
		B_RemoveEveryInvItem(slf,ItPl_Mushroom_02);
		B_RemoveEveryInvItem(slf,ItPl_Blueplant);
		B_RemoveEveryInvItem(slf,ItPl_Forestberry);
		B_RemoveEveryInvItem(slf,ItPl_Planeberry);
		B_RemoveEveryInvItem(slf,ItLsTorchburned);
		B_RemoveEveryInvItem(slf,ItWr_Poster_MIS);
		Npc_RemoveInvItem(slf,ItSe_Addon_EmptyFrancisChest);
		Npc_RemoveInvItem(slf,ItMi_Addon_Bloodwyn_Kopf);
		Npc_RemoveInvItem(slf,ItWr_Addon_Hinweis_01);
		Npc_RemoveInvItem(slf,ItWr_Addon_Hinweis_02);
		Npc_RemoveInvItem(slf,ItWr_Addon_William_01);
		Npc_RemoveInvItem(slf,ItWr_Addon_Pirates_01);
		Npc_RemoveInvItem(slf,ItWr_Kraeuterliste);
		Npc_RemoveInvItem(slf,ItWr_BanditLetter_MIS);
		Npc_RemoveInvItem(slf,ItWr_KDWLetter);
		Npc_RemoveInvItem(slf,ItWr_GilbertLetter);
		Npc_RemoveInvItem(slf,ItWr_Manowar);
		Npc_RemoveInvItem(slf,ItWr_Pfandbrief_MIS);
		Npc_RemoveInvItem(slf,ItWr_Silvestro_MIS);
		Npc_RemoveInvItem(slf,ItWr_UseLampIdiot_MIS);
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
		if(MIS_RamirezSextant == LOG_SUCCESS)
		{
			B_RemoveEveryInvItem(slf,ItMi_Sextant);
		};
		if((MIS_CassiaKelche == LOG_SUCCESS) || (MIS_CassiaKelche == LOG_FAILED))
		{
			B_RemoveEveryInvItem(slf,ItMi_BloodCup_MIS);
		};
		if(Fortuno_Geheilt_01 == TRUE)
		{
			B_RemoveEveryInvItem(slf,ItMi_Addon_Joint_01);
		};
		if(MIS_Bromor_LuciaStoleGold == LOG_SUCCESS)
		{
			Npc_RemoveInvItem(slf,ItMi_BromorsGeld_Addon);
		};
		if(MIS_Maria_BringPlate == LOG_SUCCESS)
		{
			Npc_RemoveInvItem(slf,ItMi_MariasGoldPlate);
		};
		if(MIS_Addon_Greg_RakeCave == LOG_SUCCESS)
		{
			Npc_RemoveInvItem(slf,ItMi_GregsSilverPlate);
			Npc_RemoveInvItem(slf,ItAm_Addon_Greg);
		};
	};
};

func void B_ClearTools(var C_Npc slf)
{
	if(Hlp_IsValidNpc(slf))
	{
		if(!C_NpcIsHero(slf))
		{
			B_RemoveEveryInvItem(slf,ItMi_Stomper);
			B_RemoveEveryInvItem(slf,ItMi_Hammer);
			B_RemoveEveryInvItem(slf,ItMi_Scoop);
			B_RemoveEveryInvItem(slf,ItMi_Brush);
			B_RemoveEveryInvItem(slf,ItMi_Rake);
			if(Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Canthar))
			{
				B_RemoveEveryInvItem(slf,ItMi_Saw);
			};
			if(Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Matteo))
			{
				B_RemoveEveryInvItem(slf,ItMi_Broom);
				B_RemoveEveryInvItem(slf,ItMi_Lute);
			};
		};
	};
};

func void B_ClearSpecialAmmo(var C_Npc slf)
{
	if(Hlp_IsValidNpc(slf))
	{
		if(!C_NpcIsHero(slf))
		{
			if(Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Bennet_DI))
			{
				B_RemoveEveryInvItem(slf,ItRw_Addon_MagicBolt);
				B_RemoveEveryInvItem(slf,ItRw_Addon_MagicArrow);
				B_RemoveEveryInvItem(slf,ItRw_Addon_FireArrow);
			};
		};
	};
};

