
var int EnterOW_Kapitel1;

func void B_ENTER_OLDWORLD_Kapitel_1()
{
	if(EnterOW_Kapitel1 == FALSE)
	{
		EnterOW_Kapitel1 = TRUE;
	};
};


var int EnterOW_Kapitel2;

func void B_ENTER_OLDWORLD_Kapitel_2()
{
	if(EnterOW_Kapitel2 == FALSE)
	{
		EnterOW_Kapitel2 = TRUE;
	};
};


var int EnterOW_Kapitel3;

func void B_ENTER_OLDWORLD_Kapitel_3()
{
	if(EnterOW_Kapitel3 == FALSE)
	{
		B_RemoveNpc(PC_Mage_OW);
		B_RemoveNpc(PC_Fighter_OW);
		B_RemoveNpc(PC_ThiefOW);
		Wld_InsertNpc(Snapper,"SPAWN_OW_MOLERATS_WOOD_OM");
		Wld_InsertNpc(Snapper,"SPAWN_OW_MOLERATS_WOOD_OM");
		Wld_InsertNpc(Snapper,"SPAWN_OW_MOLERATS_WOOD_OM");
		Wld_InsertNpc(Draconian,"SPAWN_OW_MOLERAT_A_6_NC4");
		Wld_InsertNpc(Draconian,"SPAWN_OW_MOLERAT_A_6_NC4");
		Wld_InsertNpc(Draconian,"SPAWN_OW_MOLERAT_A_6_NC4");
		Wld_InsertNpc(Draconian,"SPAWN_OW_MOLERAT_A_6_NC4");
		Wld_InsertNpc(Draconian,"MOVEMENT_OW_BLOODFLYS_152");
		Wld_InsertNpc(Draconian,"MOVEMENT_OW_BLOODFLYS_152");
		Wld_InsertNpc(Draconian,"MOVEMENT_OW_BLOODFLYS_152");
		Wld_InsertNpc(Draconian,"MOVEMENT_OW_BLOODFLYS_152");
		Wld_InsertNpc(Draconian,"FP_ROAM_OW_BLOODFLY_A_1");
		Wld_InsertNpc(Snapper,"OW_PATH_SCAVENGER13_SPAWN01");
		Wld_InsertNpc(Snapper,"OW_PATH_SCAVENGER13_SPAWN01");
		Wld_InsertNpc(Snapper,"OW_PATH_SCAVENGER13_SPAWN01");
		Wld_InsertNpc(Snapper,"OW_PATH_SCAVENGER13_SPAWN01");
		Wld_InsertNpc(Snapper,"OW_GOBBO_PLACE_SPAWN");
		Wld_InsertNpc(Snapper,"OW_GOBBO_PLACE_SPAWN");
		Wld_InsertNpc(Snapper,"OW_GOBBO_PLACE_SPAWN");
		Wld_InsertNpc(BDT_1006_Bandit_H,"OW_WOODRUIN_WOLF_SPAWN");
		Wld_InsertNpc(BDT_1007_Bandit_H,"OW_WOODRUIN_WOLF_SPAWN");
		Wld_InsertNpc(BDT_1008_Bandit_H,"OW_PATH_02_SPAWN_HOGEWOLF");
		Wld_InsertNpc(BDT_1003_Bandit_M,"OW_PATH_02_SPAWN_HOGEWOLF");
		Wld_InsertNpc(BDT_1008_Bandit_H,"OW_PATH_02_SPAWN_HOGEWOLF");
		Wld_InsertNpc(BDT_1006_Bandit_H,"PATH_OC_NC_14");
		Wld_InsertNpc(BDT_1001_Bandit_L,"PATH_OC_NC_22");
		Wld_InsertNpc(BDT_1002_Bandit_L,"PATH_OC_NC_21");
		Wld_InsertNpc(BDT_1003_Bandit_M,"PATH_OC_NC_15");
		Wld_InsertNpc(BDT_1004_Bandit_M,"OW_WARAN_G_SPAWN");
		Wld_InsertNpc(BDT_1005_Bandit_M,"OW_WARAN_G_SPAWN");
		Wld_InsertNpc(BDT_1006_Bandit_H,"OW_WOODRUIN_FOR_WOLF_SPAWN");
		Wld_InsertNpc(BDT_1005_Bandit_M,"OW_WOODRUIN_FOR_WOLF_SPAWN");
		Wld_InsertNpc(BDT_1000_Bandit_L,"OW_WOODRUIN_FOR_WOLF_SPAWN");
		Wld_InsertNpc(BDT_1003_Bandit_M,"PATH_OC_NC_12");
		Wld_InsertNpc(Snapper,"SPAWN_OW_SCAVENGER_01_DEMONT5");
		Wld_InsertNpc(Snapper,"SPAWN_OW_SCAVENGER_01_DEMONT5");
		Wld_InsertNpc(DMT_DementorAmbient,"DT_E3_06");
		Wld_InsertNpc(DMT_DementorAmbient,"DT_E3_05");
		Wld_InsertNpc(DMT_DementorAmbient,"DT_E3_07");
		Wld_InsertNpc(DMT_DementorAmbient,"DT_E1_05");
		Wld_InsertNpc(DMT_DementorAmbient,"DT");
		Wld_InsertNpc(DMT_DementorAmbient,"OW_PATH_133");
		Wld_InsertNpc(DMT_DementorAmbient,"OW_PATH_128");
		Wld_InsertItem(ItRu_Fear,"FP_ITEM_XARDASALTERTURM_01");
		if(hero.guild == GIL_KDF)
		{
			Wld_InsertItem(ItMi_RuneBlank,"FP_ITEM_XARDASALTERTURM_02");
		}
		else
		{
			Wld_InsertItem(ItMi_Nugget,"FP_ITEM_XARDASALTERTURM_02");
		};
		EnterOW_Kapitel3 = TRUE;
	};
};


var int EnterOW_Kapitel4;

func void B_ENTER_OLDWORLD_Kapitel_4()
{
	if(EnterOW_Kapitel4 == FALSE)
	{
		if(Npc_IsDead(Engrom) == FALSE)
		{
			B_StartOtherRoutine(Engrom,"Obsessed");
			CreateInvItems(Engrom,ItAt_TalbinsLurkerSkin,1);
			if(hero.guild == GIL_KDF)
			{
				CreateInvItems(Engrom,ITWR_DementorObsessionBook_MIS,1);
			}
			else
			{
				B_KillNpc(Engrom);
			};
			EngromIsGone = TRUE;
		};
		B_RemoveNpc(STRF_1115_Geppert);
		B_RemoveNpc(STRF_1116_Kervo);
		B_RemoveNpc(VLK_4106_Dobar);
		B_RemoveNpc(VLK_4107_Parlaf);
		if(Npc_IsDead(Sengrath) == FALSE)
		{
			B_StartOtherRoutine(Sengrath,"ORCBARRIER");
			if(Npc_HasItems(Sengrath,ItRw_Mil_Crossbow))
			{
				Npc_RemoveInvItem(Sengrath,ItRw_Mil_Crossbow);
			};
			CreateInvItems(Sengrath,ItRw_SengrathsArmbrust_MIS,1);
			Sengrath_Missing = TRUE;
			B_KillNpc(Sengrath);
		};
		Wld_InsertNpc(DJG_730_ToterDrachenjaeger,"OC1");
		B_KillNpc(DJG_730_ToterDrachenjaeger);
		Wld_InsertNpc(DJG_731_ToterDrachenjaeger,"OC1");
		B_KillNpc(DJG_731_ToterDrachenjaeger);
		Wld_InsertNpc(DJG_732_ToterDrachenjaeger,"OC1");
		B_KillNpc(DJG_732_ToterDrachenjaeger);
		Wld_InsertNpc(DJG_733_ToterDrachenjaeger,"OC1");
		B_KillNpc(DJG_733_ToterDrachenjaeger);
		Wld_InsertNpc(DJG_734_ToterDrachenjaeger,"OC1");
		B_KillNpc(DJG_734_ToterDrachenjaeger);
		Wld_InsertNpc(DJG_735_ToterDrachenjaeger,"OC1");
		B_KillNpc(DJG_735_ToterDrachenjaeger);
		Wld_InsertNpc(DJG_736_ToterDrachenjaeger,"OC1");
		B_KillNpc(DJG_736_ToterDrachenjaeger);
		Wld_InsertNpc(DJG_737_ToterDrachenjaeger,"OC1");
		B_KillNpc(DJG_737_ToterDrachenjaeger);
		Wld_InsertNpc(DJG_738_ToterDrachenjaeger,"OC1");
		B_KillNpc(DJG_738_ToterDrachenjaeger);
		Wld_InsertNpc(DJG_739_ToterDrachenjaeger,"OC1");
		B_KillNpc(DJG_739_ToterDrachenjaeger);
		Wld_InsertNpc(DJG_740_ToterDrachenjaeger,"OC1");
		B_KillNpc(DJG_740_ToterDrachenjaeger);
		Npc_ExchangeRoutine(Brutus,"Meatbugs");
		Wld_InsertNpc(Meatbug_Brutus1,"OC_FOLTER_SHARP");
		Wld_InsertNpc(Meatbug_Brutus2,"OC_FOLTER_SHARP");
		Wld_InsertNpc(Meatbug_Brutus3,"OC_FOLTER_SHARP");
		Wld_InsertNpc(Meatbug_Brutus4,"OC_FOLTER_SHARP");
		Wld_InsertNpc(DJG_700_Sylvio,"OC1");
		if(SLD_Bullco_is_alive == TRUE)
		{
			Wld_InsertNpc(DJG_701_Bullco,"OC1");
		};
		if(SLD_Rod_is_alive == TRUE)
		{
			Wld_InsertNpc(DJG_702_Rod,"OC1");
		};
		if(SLD_Cipher_is_alive == TRUE)
		{
			Wld_InsertNpc(DJG_703_Cipher,"OC1");
		};
		if(SLD_Gorn_is_alive == TRUE)
		{
			Wld_InsertNpc(PC_Fighter_DJG,"OC1");
		};
		Wld_InsertNpc(DJG_705_Angar,"OC1");
		Wld_InsertNpc(DJG_708_Kurgan,"OC1");
		Wld_InsertNpc(DJG_709_Rethon,"OC1");
		Wld_InsertNpc(DJG_710_Kjorn,"OC1");
		Wld_InsertNpc(DJG_711_Godar,"OC1");
		Wld_InsertNpc(DJG_712_Hokurn,"OC1");
		Wld_InsertNpc(DJG_713_Biff,"OC1");
		Wld_InsertNpc(DJG_714_Jan,"OC1");
		Wld_InsertNpc(DJG_715_Ferros,"OC1");
		Wld_InsertNpc(NONE_110_Urshak,"WP_INTRO_FALL");
		Wld_InsertNpc(Warg,"OC3");
		Wld_InsertNpc(OrcWarrior_Roam,"OW_SCAVENGER_SPAWN_TREE");
		Wld_InsertNpc(OrcElite_Roam,"OW_SCAVENGER_SPAWN_TREE");
		Wld_InsertNpc(OrcWarrior_Roam,"OC4");
		Wld_InsertNpc(OrcWarrior_Roam,"SPAWN_OW_SCAVENGER_AL_ORC");
		Wld_InsertNpc(OrcWarrior_Roam,"OC5");
		Wld_InsertNpc(OrcWarrior_Roam,"OC6");
		Wld_InsertNpc(OrcWarrior_Roam,"SPAWN_PATH_GUARD1");
		Wld_InsertNpc(OrcWarrior_Roam,"SPAWN_OW_BLACKWOLF_02_01");
		Wld_InsertNpc(Warg,"SPAWN_OW_BLACKWOLF_02_01");
		Wld_InsertNpc(Warg,"SPAWN_OW_BLACKWOLF_02_01");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORC_09");
		Wld_InsertNpc(OrcShaman_Sit,"FP_ROAM_ORC_08");
		Wld_InsertNpc(OrcWarrior_Roam,"OW_PATH_103");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_WARAN_ORC_01");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_WARAN_ORC_04");
		Wld_InsertNpc(OrcElite_Roam,"OW_NEWMINE_02");
		Wld_InsertNpc(OrcShaman_Sit,"OW_NEWMINE_10");
		Wld_InsertNpc(OrcElite_Roam,"OW_NEWMINE_11");
		Wld_InsertNpc(OrcShaman_Sit,"OW_NEWMINE_11");
		Wld_InsertNpc(OrcWarrior_Roam,"OW_NEWMINE_06");
		Wld_InsertNpc(OrcWarrior_Roam,"OW_NEWMINE_03");
		Wld_InsertNpc(DragonSnapper,"SPAWN_OW_SCAVENGER_ORC_03");
		Wld_InsertNpc(DragonSnapper,"SPAWN_OW_SCAVENGER_ORC_03");
		Wld_InsertNpc(DragonSnapper,"SPAWN_OW_BLOCKGOBBO_CAVE_DM6");
		Wld_InsertNpc(DragonSnapper,"SPAWN_OW_BLOCKGOBBO_CAVE_DM6");
		Wld_InsertNpc(DragonSnapper,"OW_PATH_333");
		Wld_InsertNpc(Warg,"OW_PATH_099");
		Wld_InsertNpc(Warg,"SPAWN_OW_WARAN_ORC_01");
		Wld_InsertNpc(OrcWarrior_Roam,"OC11");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORK_OC_27");
		Wld_InsertNpc(OrcElite_Roam,"FP_ROAM_ORK_OC_11");
		Wld_InsertNpc(Warg,"FP_ROAM_ORK_OC_12");
		Wld_InsertNpc(OrcElite_Roam,"FP_ROAM_ORK_OC_07");
		Wld_InsertNpc(OrcWarrior_Roam,"OC9");
		Wld_InsertNpc(Warg,"FP_ROAM_ORK_OC_28");
		Wld_InsertNpc(OrcElite_Roam,"FP_ROAM_ORK_OC_16");
		Wld_InsertNpc(OrcElite_Roam,"FP_ROAM_ORK_OC_13");
		Wld_InsertNpc(OrcElite_Roam,"FP_ROAM_ORK_OC_10");
		Wld_InsertNpc(OrcElite_Roam,"FP_ROAM_ORK_OC_09");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_CAMPFIRE_ORK_OC_17");
		Wld_InsertNpc(OrcElite_Roam,"FP_ROAM_OW_SCAVENGER_06_03");
		Wld_InsertNpc(OrcShaman_Sit,"FP_ROAM_OW_SCAVENGER_06_05");
		Wld_InsertNpc(Warg,"FP_ROAM_OW_SCAVENGER_06_06");
		Wld_InsertNpc(OrcElite_Roam,"FP_ROAM_OW_SCAVENGER_06_04");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_SCAVENGER_06_07");
		Wld_InsertNpc(OrcElite_Roam,"FP_ROAM_ORK_OC_21");
		Wld_InsertNpc(Warg,"FP_ROAM_ORK_OC_22");
		Wld_InsertNpc(Warg,"FP_ROAM_ORK_OC_11");
		Wld_InsertNpc(OrcElite_Roam,"FP_ROAM_ORK_OC_15");
		Wld_InsertNpc(Warg,"FP_ROAM_ORK_OC_14");
		Wld_InsertNpc(OrcElite_Roam,"FP_ROAM_WARG_OC_02");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_WARG_OC_02");
		Wld_InsertNpc(OrcElite_Roam,"OC_PATH_04");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_WARG_OC_04");
		Wld_InsertNpc(OrcElite_Roam,"FP_ROAM_ORK_OC_04");
		Wld_InsertNpc(Warg,"FP_ROAM_ORK_OC_03");
		Wld_InsertNpc(OrcShaman_Sit,"FP_ROAM_ORK_OC_03");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORK_OC_30");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORK_OC_31");
		Wld_InsertNpc(OrcElite_Roam,"FP_ROAM_WARG_OC_09");
		Wld_InsertNpc(Warg,"FP_ROAM_WARG_OC_05");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_WARG_OC_07");
		Wld_InsertNpc(Warg,"FP_ROAM_WARG_OC_06");
		Wld_InsertNpc(OrcElite_Roam,"FP_ROAM_WARG_OC_08");
		Wld_InsertNpc(Warg,"OC_PATH_02");
		Wld_InsertNpc(OrcElite_Roam,"OC_PATH_02");
		Wld_InsertNpc(Warg,"FP_ROAM_ORK_OC_02");
		Wld_InsertNpc(Warg,"FP_ROAM_ORK_OC_16");
		Wld_InsertNpc(Warg,"FP_ROAM_ORK_OC_01");
		Wld_InsertNpc(OrcElite_Roam,"FP_ROAM_ORK_OC_23");
		Wld_InsertNpc(Warg,"FP_ROAM_ORK_OC_24");
		Wld_InsertNpc(OrcElite_Roam,"FP_ROAM_WARG_OC_11");
		Wld_InsertNpc(Warg,"FP_ROAM_ORK_OC_12");
		Wld_InsertNpc(OrcElite_Roam,"FP_ROAM_ORK_OC_06");
		Wld_InsertNpc(Warg,"FP_ROAM_ORK_OC_05");
		Wld_InsertNpc(OrcElite_Roam,"FP_ROAM_ORK_OC_07");
		Wld_InsertNpc(OrcShaman_Sit,"FP_ROAM_ORK_OC_08");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORK_OC_05");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORK_OC_25");
		Wld_InsertNpc(Warg,"FP_ROAM_ORK_OC_06");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORK_OC_05");
		Wld_InsertNpc(Warg,"FP_CAMPFIRE_ORK_OC_09");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORK_OC_26");
		Wld_InsertNpc(OrcElite_Roam,"FP_ROAM_ORK_OC_10");
		Wld_InsertNpc(Warg,"FP_ROAM_WARG_OC_14");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_WARG_OC_15");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_WARG_OC_11");
		Wld_InsertNpc(Warg,"FP_ROAM_WARG_OC_12");
		Wld_InsertNpc(OrcWarrior_Roam,"OC_ROUND_28");
		Wld_InsertNpc(Warg,"FP_ROAM_ORK_OC_13");
		Wld_InsertNpc(Warg,"FP_ROAM_ORK_OC_14");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORK_OC_12");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_HOSHPAK_02");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_HOSHPAK_04");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_HOSHPAK_05");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_HOSHPAK_06");
		Wld_InsertNpc(Warg,"SPAWN_O_SCAVENGER_OCWOODL2");
		Wld_InsertNpc(OrcWarrior_Roam,"SPAWN_O_SCAVENGER_OCWOODL2");
		Wld_InsertNpc(OrcWarrior_Roam,"SPAWN_O_SCAVENGER_OCWOODL2");
		Wld_InsertNpc(Lurker,"OW_PATH_OW_PATH_WARAN05_SPAWN01");
		Wld_InsertNpc(Lurker,"OW_PATH_OW_PATH_WARAN05_SPAWN01");
		Wld_InsertNpc(Lurker,"OW_PATH_OW_PATH_WARAN05_SPAWN01");
		Wld_InsertNpc(Shadowbeast,"FP_ROAM_OW_SCAVENGER_LONE_WALD_OC3");
		Wld_InsertNpc(Warg,"SPAWN_OW_WOLF2_WALD_OC3");
		Wld_InsertNpc(Warg,"SPAWN_OW_WOLF2_WALD_OC3");
		Wld_InsertNpc(OrcWarrior_Roam,"SPAWN_WALD_OC_BLOODFLY01");
		Wld_InsertNpc(OrcWarrior_Roam,"SPAWN_WALD_OC_BLOODFLY01");
		Wld_InsertNpc(OrcWarrior_Roam,"SPAWN_WALD_OC_BLOODFLY01");
		Wld_InsertNpc(Shadowbeast,"SPAWN_OW_MOLERAT2_WALD_OC1");
		Wld_InsertNpc(OrcWarrior_Roam,"PATH_WALD_OC_WOLFSPAWN2");
		Wld_InsertNpc(OrcWarrior_Roam,"PATH_WALD_OC_WOLFSPAWN2");
		Wld_InsertNpc(Warg,"PATH_WALD_OC_WOLFSPAWN2");
		Wld_InsertNpc(Shadowbeast,"PATH_WALD_OC_MOLERATSPAWN");
		Wld_InsertNpc(Warg,"SPAWN_OW_WOLF2_WALD_OC2");
		Wld_InsertNpc(Warg,"SPAWN_OW_WOLF2_WALD_OC2");
		Wld_InsertNpc(Warg,"SPAWN_OW_SCAVENGER_INWALD_OC2");
		Wld_InsertNpc(Warg,"SPAWN_OW_SCAVENGER_INWALD_OC2");
		Wld_InsertNpc(Snapper,"SPAWN_OW_SCAVENGER_OC_PSI_RUIN1");
		Wld_InsertNpc(Snapper,"SPAWN_OW_SCAVENGER_OC_PSI_RUIN1");
		Wld_InsertNpc(Snapper,"SPAWN_OW_SCAVENGER_OC_PSI_RUIN1");
		Wld_InsertNpc(Snapper,"SPAWN_OW_WARAN_OC_PSI3");
		Wld_InsertNpc(Snapper,"SPAWN_OW_WARAN_OC_PSI3");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_SNAPPER_OW_ORC5");
		Wld_InsertNpc(OrcShaman_Sit,"FP_ROAM_OW_SNAPPER_OW_ORC_MOVE");
		Wld_InsertNpc(OrcShaman_Sit,"LOCATION_16_IN");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_SNAPPER_OW_ORC3");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_SNAPPER_OW_ORC3");
		Wld_InsertNpc(Warg,"FP_ROAM_OW_SNAPPER_OW_ORC");
		Wld_InsertNpc(Warg,"FP_ROAM_OW_SNAPPER_OW_ORC");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_SNAPPER_OW_ORC");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_SNAPPER_OW_ORC");
		Wld_InsertNpc(Warg,"FP_ROAM_OW_SNAPPER_OW_ORC");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORC_01");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORC_02");
		Wld_InsertNpc(OrcShaman_Sit,"FP_ROAM_ORC_02");
		Wld_InsertNpc(Warg,"CASTLE_2");
		Wld_InsertNpc(FireWaran,"OW_PATH_104");
		Wld_InsertNpc(FireWaran,"OW_PATH_104");
		Wld_InsertNpc(FireWaran,"OW_PATH_104");
		Wld_InsertNpc(Warg,"OW_PATH_BLACKWOLF07_SPAWN01");
		Wld_InsertNpc(Warg,"OW_PATH_BLACKWOLF07_SPAWN01");
		Wld_InsertNpc(OrcWarrior_Roam,"CASTLE_3");
		Wld_InsertNpc(Warg,"CASTLE_3");
		Wld_InsertNpc(Warg,"CASTLE_4");
		Wld_InsertNpc(Warg,"CASTLE_4");
		Wld_InsertNpc(OrcWarrior_Roam,"OW_PATH_109");
		Wld_InsertNpc(DragonSnapper,"FP_ROAM_OW_SNAPPER_02_06");
		Wld_InsertNpc(DragonSnapper,"FP_ROAM_OW_SNAPPER_02_11");
		Wld_InsertNpc(DragonSnapper,"FP_ROAM_OW_SNAPPER_02_05");
		Wld_InsertNpc(DragonSnapper,"FP_ROAM_OW_SNAPPER_02_08");
		Wld_InsertNpc(DragonSnapper,"OW_PATH_303");
		Wld_InsertNpc(DragonSnapper,"OW_PATH_303");
		Wld_InsertNpc(DragonSnapper,"SPAWN_OW_SCAVENGER_01_DEMONT5");
		Wld_InsertNpc(DragonSnapper,"SPAWN_OW_SCAVENGER_01_DEMONT5");
		Wld_InsertNpc(MinecrawlerWarrior,"OW_MINE3_LEFT_05");
		Wld_InsertNpc(DragonSnapper,"OW_MINE3_LEFT_07");
		Wld_InsertItem(ItMi_GoldChalice,"FP_ROAM_MC_04");
		Wld_InsertNpc(DragonSnapper,"OW_PATH_117");
		Wld_InsertNpc(Harpie,"DT_E1_07");
		Wld_InsertNpc(Harpie,"DT_E1_08");
		Wld_InsertNpc(Harpie,"DT_E1_09");
		Wld_InsertNpc(DMT_DementorAmbient,"OW_PATH_093");
		Wld_InsertNpc(Warg,"OW_PATH_195");
		Wld_InsertNpc(Warg,"OW_PATH_195");
		Wld_InsertNpc(DragonSnapper,"OW_PATH_210");
		Wld_InsertNpc(DragonSnapper,"OW_PATH_210");
		Wld_InsertNpc(Waran,"MT15");
		Wld_InsertNpc(DragonSnapper,"OW_ORC_LOOKOUT_2_02");
		Wld_InsertNpc(DragonSnapper,"OW_ORC_LOOKOUT_2_02");
		Wld_InsertNpc(DragonSnapper,"OW_ORC_LOOKOUT_2_02");
		Wld_InsertNpc(DragonSnapper,"SPAWN_OW_SHADOWBEAST_10_03");
		Wld_InsertNpc(DragonSnapper,"SPAWN_OW_SHADOWBEAST_10_03");
		Wld_InsertNpc(DragonSnapper,"SPAWN_OW_SHADOWBEAST_10_03");
		Wld_InsertNpc(DragonSnapper,"OW_PATH_SCAVENGER13_SPAWN01");
		Wld_InsertNpc(DragonSnapper,"OW_PATH_SCAVENGER13_SPAWN01");
		Wld_InsertNpc(DragonSnapper,"OW_PATH_SCAVENGER13_SPAWN01");
		Wld_InsertItem(ItRw_Bow_H_02,"FP_ROAM_ITEM_SPECIAL_01");
		Wld_InsertNpc(DragonSnapper,"OW_PATH_07_19");
		Wld_InsertNpc(DragonSnapper,"OW_PATH_146");
		Wld_InsertNpc(FireWaran,"OW_PATH_182");
		Wld_InsertNpc(FireWaran,"FP_ROAM_OW_SCAVENGER_01_07");
		Wld_InsertNpc(FireWaran,"FP_ROAM_OW_SCAVENGER_01_06");
		Wld_InsertNpc(FireWaran,"OW_PATH_182");
		Wld_InsertNpc(Waran,"FP_ROAM_OW_GOBBO_07_06");
		Wld_InsertNpc(Waran,"FP_ROAM_OW_GOBBO_07_03");
		Wld_InsertNpc(DragonSnapper,"FP_ROAM_OW_SNAPPER_WOOD05_02");
		Wld_InsertNpc(DragonSnapper,"FP_ROAM_OW_SNAPPER_WOOD05_02");
		Wld_InsertNpc(DragonSnapper,"SPAWN_OW_SCA_05_01");
		Wld_InsertNpc(DragonSnapper,"SPAWN_OW_SCA_05_01");
		Wld_InsertNpc(Warg,"SPAWN_OW_BLOODFLY_06_01");
		Wld_InsertNpc(Warg,"SPAWN_OW_BLOODFLY_06_01");
		Wld_InsertNpc(Lurker,"SPAWN_OW_BLOODFLY_12");
		Wld_InsertNpc(Lurker,"SPAWN_OW_BLOODFLY_12");
		Wld_InsertNpc(Lurker,"FP_ROAM_OW_LURKER_NC_LAKE_02");
		Wld_InsertNpc(Lurker,"FP_ROAM_OW_LURKER_NC_LAKE_01");
		Wld_InsertNpc(Lurker,"OW_LAKE_NC_BLOODFLY_SPAWN01");
		Wld_InsertNpc(Lurker,"OW_LAKE_NC_BLOODFLY_SPAWN01");
		Wld_InsertNpc(Troll,"OW_PATH_SCAVENGER12_SPAWN01");
		Wld_InsertNpc(Troll,"SPAWN_OW_WARAN_NC_03");
		Wld_InsertNpc(Troll,"OW_PATH_038");
		Wld_InsertNpc(FireWaran,"PLATEAU_ROUND02_CAVE");
		Wld_InsertNpc(Draconian,"PLATEAU_ROUND02_CAVE_MOVE");
		Wld_InsertNpc(Draconian,"PLATEAU_ROUND02_CAVE_MOVE");
		Wld_InsertItem(ItMi_GoldChest,"FP_ROAM_ITEM_SPECIAL_03");
		Wld_InsertNpc(Draconian,"LOCATION_18_OUT");
		Wld_InsertNpc(Draconian,"LOCATION_18_OUT");
		Wld_InsertNpc(Draconian,"FP_ROAM_OW_ROCK_DRACONIAN_07");
		Wld_InsertItem(ItSc_Firestorm,"FP_ROAM_OW_ROCK_DRACONIAN_07_2");
		Wld_InsertNpc(DragonSnapper,"FP_ROAM_OW_SCAVENGER_03_04");
		Wld_InsertNpc(DragonSnapper,"FP_ROAM_OW_SCAVENGER_03_02");
		Wld_InsertNpc(DragonSnapper,"FP_ROAM_OW_SCAVENGER_03_03");
		Wld_InsertNpc(DragonSnapper,"FP_ROAM_OW_SCAVENGER_03_01");
		Wld_InsertNpc(DragonSnapper,"SPAWN_OW_SNAPPER_OCWOOD1_05_02");
		Wld_InsertNpc(DragonSnapper,"SPAWN_OW_SNAPPER_OCWOOD1_05_02");
		Wld_InsertNpc(OrcElite_Roam,"OW_ORCBARRIER_19");
		Wld_InsertNpc(OrcElite_Roam,"OW_ORCBARRIER_12");
		Wld_InsertNpc(OrcElite_Roam,"LOCATION_29_04");
		Wld_InsertNpc(OrcElite_Roam,"OW_PATH_166");
		Wld_InsertNpc(OrcWarrior_Roam,"PATH_TO_PLATEAU07");
		Wld_InsertNpc(OrcWarrior_Roam,"PATH_TO_PLATEAU07");
		Wld_InsertNpc(Warg,"SPAWN_OW_SHADOWBEAST_NEAR_SHADOW4");
		Wld_InsertNpc(Warg,"SPAWN_OW_SHADOWBEAST_NEAR_SHADOW4");
		Wld_InsertNpc(Warg,"SPAWN_OW_SHADOWBEAST_NEAR_SHADOW4");
		Wld_InsertItem(ItMi_KerolothsGeldbeutel_MIS,"FP_OC_KEROLOTHS_GELDBEUTEL");
		Log_CreateTopic(TOPIC_Dragonhunter,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Dragonhunter,LOG_Running);
		B_LogEntry(TOPIC_Dragonhunter,"Началась масштабная охота на драконов. Она привлекла многих искателей приключений в Долину рудников. Мне остается только надеяться, что они не будут мешаться у меня под ногами.");
		IntroduceChapter(KapWechsel_4,KapWechsel_4_Text,"chapter4.tga","chapter_01.wav",6000);
		EnterOW_Kapitel4 = TRUE;
	};
	if(Talbin_FollowsThroughPass == LOG_OBSOLETE)
	{
		B_KillNpc(VLK_4130_Talbin);
		Wld_InsertNpc(DragonSnapper,"START");
		Talbin_FollowsThroughPass = LOG_FAILED;
	}
	else if(Talbin_FollowsThroughPass == LOG_SUCCESS)
	{
		B_RemoveNpc(VLK_4130_Talbin);
		Talbin_FollowsThroughPass = LOG_FAILED;
	};
};


var int EnterOW_Kapitel5;

func void B_ENTER_OLDWORLD_Kapitel_5()
{
	if(EnterOW_Kapitel5 == FALSE)
	{
		VLK_4143_HaupttorWache.flags = 0;
		CreateInvItems(VLK_4143_HaupttorWache,itke_oc_maingate_mis,1);
		if(Npc_IsDead(Brutus) == FALSE)
		{
			CreateInvItems(VLK_4100_Brutus,ITWR_DementorObsessionBook_MIS,1);
		};
		if(TschuessBilgot == TRUE)
		{
			B_RemoveNpc(VLK_4120_Bilgot);
		};
		EnterOW_Kapitel5 = TRUE;
	};
	if(Biff_FollowsThroughPass == LOG_SUCCESS)
	{
		B_RemoveNpc(DJG_713_Biff);
	};
};


var int EnterOW_Kapitel6;

func void B_ENTER_OLDWORLD_Kapitel_6()
{
	if(EnterOW_Kapitel6 == FALSE)
	{
		EnterOW_Kapitel6 = TRUE;
	};
};

func void b_enter_oldworld()
{
	B_InitNpcGlobals();
	if(Kapitel >= 1)
	{
		B_ENTER_OLDWORLD_Kapitel_1();
	};
	if(Kapitel >= 2)
	{
		B_ENTER_OLDWORLD_Kapitel_2();
	};
	if(Kapitel >= 3)
	{
		B_ENTER_OLDWORLD_Kapitel_3();
	};
	if(Kapitel >= 4)
	{
		B_ENTER_OLDWORLD_Kapitel_4();
	};
	if(Kapitel >= 5)
	{
		B_ENTER_OLDWORLD_Kapitel_5();
	};
	if(Kapitel >= 6)
	{
		B_ENTER_OLDWORLD_Kapitel_6();
	};
	CurrentLevel = OldWorld_Zen;
	B_InitNpcGlobals();
	if((DJG_BiffParty == TRUE) && (Npc_IsDead(Biff) == FALSE))
	{
		if(DJG_Biff_HalbeHalbe == TRUE)
		{
			Npc_SetRefuseTalk(Biff,500);
		}
		else
		{
			Npc_SetRefuseTalk(Biff,300);
		};
	};
	if((Npc_IsDead(Bilgot) == TRUE) && (MIS_RescueBilgot == LOG_Running))
	{
		MIS_RescueBilgot = LOG_FAILED;
	};
};

