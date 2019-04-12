
func void B_ENTER_ADDONWORLD_Kapitel_1()
{
	if(RavenIsDead == TRUE)
	{
		B_RemoveNpc(KDW_14030_Addon_Myxir_ADW);
	};
	if((Sklaven_weg == TRUE) && (RemoveSklaven == FALSE))
	{
		B_RemoveNpc(STRF_1118_Addon_Patrick);
		B_RemoveNpc(STRF_1119_Addon_Monty);
		B_RemoveNpc(STRF_1120_Addon_Tonak);
		B_RemoveNpc(STRF_1121_Addon_Telbor);
		B_RemoveNpc(STRF_1122_Addon_Pardos);
		RemoveSklaven = TRUE;
	};
};


var int EnterADW_Kapitel2;

func void B_ENTER_ADDONWORLD_Kapitel_2()
{
	if(EnterADW_Kapitel2 == FALSE)
	{
		EnterADW_Kapitel2 = TRUE;
	};
};


var int EnterADW_Kapitel3;

func void B_ENTER_ADDONWORLD_Kapitel_3()
{
	if(EnterADW_Kapitel3 == FALSE)
	{
		EnterADW_Kapitel3 = TRUE;
	};
};


var int EnterADW_Kapitel4;

func void B_ENTER_ADDONWORLD_Kapitel_4()
{
	if(EnterADW_Kapitel4 == FALSE)
	{
		Wld_InsertNpc(Giant_DesertRat,"ADW_CANYON_TELEPORT_PATH_03");
		Wld_InsertNpc(Giant_DesertRat,"ADW_CANYON_TELEPORT_PATH_03");
		Wld_InsertNpc(Giant_DesertRat,"ADW_CANYON_TELEPORT_PATH_04");
		Wld_InsertNpc(DragonSnapper,"ADW_CANYON_PATH_TO_LIBRARY_36");
		Wld_InsertNpc(DragonSnapper,"ADW_CANYON_PATH_TO_LIBRARY_36");
		Wld_InsertNpc(DragonSnapper,"ADW_CANYON_PATH_TO_BANDITS_31");
		Wld_InsertNpc(DragonSnapper,"ADW_CANYON_PATH_TO_MINE2_04");
		Wld_InsertNpc(DragonSnapper,"ADW_CANYON_PATH_TO_MINE2_04");
		Wld_InsertNpc(Troll,"ADW_CANYON_ORCS_02");
		Wld_InsertNpc(Troll,"ADW_CANYON_PATH_TO_MINE2_09");
		Wld_InsertNpc(DragonSnapper,"ADW_CANYON_PATH_TO_MINE2_06");
		Wld_InsertNpc(MinecrawlerWarrior,"ADW_CANYON_PATH_TO_BANDITS_26");
		Wld_InsertNpc(MinecrawlerWarrior,"ADW_CANYON_PATH_TO_BANDITS_24");
		Wld_InsertNpc(MinecrawlerWarrior,"ADW_CANYON_PATH_TO_BANDITS_66");
		Wld_InsertNpc(SkeletonMage,"ADW_CANYON_LIBRARY_STONIE_01");
		Wld_InsertNpc(Skeleton,"ADW_CANYON_LIBRARY_STONIE_02");
		Wld_InsertNpc(Skeleton,"ADW_CANYON_LIBRARY_STONIE_03");
		Wld_InsertNpc(Skeleton,"ADW_CANYON_LIBRARY_STONIE_04");
		Wld_InsertNpc(Skeleton,"ADW_CANYON_LIBRARY_STONIE_05");
		Wld_InsertNpc(FireWaran,"ADW_ENTRANCE_2_VALLEY_05");
		Wld_InsertNpc(Waran,"ADW_ENTRANCE_2_VALLEY_11");
		Wld_InsertNpc(DragonSnapper,"ADW_ENTRANCE_PATH2BANDITS_10");
		Wld_InsertNpc(DragonSnapper,"ADW_ENTRANCE_BEHINDAKROPOLIS_04");
		Wld_InsertNpc(DragonSnapper,"ADW_ENTRANCE_BEHINDAKROPOLIS_04");
		Wld_InsertNpc(Swamprat,"ADW_ENTRANCE_PATH2BANDITS_03");
		Wld_InsertNpc(SkeletonMage,"ADW_PORTALTEMPEL_08B");
		Wld_InsertNpc(Skeleton,"ADW_PORTALTEMPEL_08A");
		Wld_InsertNpc(DragonSnapper,"ADW_ENTRANCE_2_PIRATECAMP_22");
		Wld_InsertNpc(Swampshark,"ADW_SWAMP_SHARKSTREET_02");
		Wld_InsertNpc(Swampshark,"ADW_SWAMP_SHARKSTREET_07");
		Wld_InsertNpc(Swampshark,"ADW_SWAMP_SHARKSTREET_09");
		Wld_InsertNpc(Swampshark,"ADW_SWAMP_SHARKSTREET_10");
		Wld_InsertNpc(SwampGolem,"ADW_SWAMP_LITTLE_SEA_01");
		Wld_InsertNpc(Bloodfly,"ADW_SWAMP_LITTLE_SEA_01");
		Wld_InsertNpc(SwampGolem,"ADW_SWAMP_LITTLE_SEA_02");
		Wld_InsertNpc(Bloodfly,"ADW_SWAMP_LITTLE_SEA_02");
		Wld_InsertNpc(SwampGolem,"ADW_SWAMP_LITTLE_SEA_03");
		Wld_InsertNpc(Bloodfly,"ADW_SWAMP_LITTLE_SEA_03");
		Wld_InsertNpc(MayaZombie01,"ADW_PFUETZE_01");
		Wld_InsertNpc(MayaZombie02,"ADW_PFUETZE_02");
		Wld_InsertNpc(MayaZombie03,"ADW_PFUETZE_03");
		Wld_InsertNpc(MayaZombie04,"ADW_PFUETZE_04");
		Wld_InsertNpc(MayaZombie04,"ADW_BANDIT_VP1_07_D");
		Wld_InsertNpc(MayaZombie01,"ADW_BANDIT_VP1_07_E");
		Wld_InsertNpc(MayaZombie02,"ADW_BANDIT_VP1_07_F");
		Wld_InsertNpc(MayaZombie03,"ADW_SWAMP_LITTLE_SEA_03_B");
		Wld_InsertNpc(MayaZombie04,"ADW_SWAMP_09_C");
		Wld_InsertNpc(SwampGolem,"ADW_SWAMP_10");
		Wld_InsertNpc(SwampGolem,"ADW_SWAMP_13");
		Wld_InsertNpc(SwampGolem,"ADW_SWAMP_14");
		Wld_InsertNpc(Swampshark,"ADW_SWAMP_HOHLWEG_03");
		Wld_InsertNpc(Swampshark,"ADW_SWAMP_HOHLWEG_04");
		Wld_InsertNpc(Skeleton,"ADW_SENAT_SIDE_01");
		Wld_InsertNpc(Skeleton,"ADW_SENAT_SIDE_02");
		Wld_InsertNpc(MayaZombie04,"ADW_SENAT_SIDE_03");
		Wld_InsertNpc(Skeleton,"ADW_SENAT_GUARDIAN_01");
		Wld_InsertNpc(MayaZombie01,"ADW_SENAT_GUARDIAN_02");
		Wld_InsertNpc(SwampDrone,"ADW_SWAMP_HILLS_DOWN_03");
		Wld_InsertNpc(SwampDrone,"ADW_SWAMP_15");
		Wld_InsertNpc(Swamprat,"ADW_HOHLWEG_CENTER");
		Wld_InsertNpc(SwampGolem,"FP_ROAM_BF_NEST_26");
		Wld_InsertNpc(Swamprat,"ADW_BANDITSCAMP_RAKEPLACE_03");
		Wld_InsertNpc(SwampDrone,"ADW_CANYON_PATH_TO_BANDITS_02");
		Wld_InsertNpc(SwampDrone,"ADW_PFUETZE_02");
		Wld_InsertNpc(SwampDrone,"ADW_SWAMP_LOCH_05");
		Wld_InsertNpc(SwampDrone,"ADW_SWAMP_LOCH_06");
		Wld_InsertNpc(Demon,"ADW_PIRATECAMP_LONEBEACH_CAVE_03");
		Wld_InsertNpc(FireWaran,"ADW_PIRATECAMP_LONEBEACH_05");
		Wld_InsertNpc(Lurker,"ADW_PIRATECAMP_WATERHOLE_04");
		Wld_InsertNpc(Gobbo_Warrior_Visir,"ADW_VALLEY_BIGCAVE_06");
		Wld_InsertNpc(Gobbo_Warrior,"ADW_VALLEY_BIGCAVE_06");
		Wld_InsertNpc(DragonSnapper,"ADW_VALLEY_BIGCAVE_15");
		Wld_InsertNpc(DragonSnapper,"ADW_VALLEY_PATH_110");
		Wld_InsertNpc(DragonSnapper,"ADW_VALLEY_PATH_110");
		Wld_InsertNpc(Warg,"ADW_ENTRANCE_2_PIRATECAMP_13");
		Wld_InsertNpc(Warg,"ADW_ENTRANCE_2_PIRATECAMP_13");
		Wld_InsertNpc(Gobbo_Warrior_Visir,"ADW_ENTRANCE_2_PIRATECAMP_13");
		Wld_InsertNpc(Gobbo_Warrior,"ADW_ENTRANCE_2_PIRATECAMP_13");
		Wld_InsertNpc(Gobbo_Warrior_Visir,"ADW_ENTRANCE_2_PIRATECAMP_13");
		Wld_InsertNpc(Gobbo_Warrior,"ADW_ENTRANCE_2_PIRATECAMP_13");
		Wld_InsertNpc(Gobbo_Warrior_Visir,"ADW_ENTRANCE_2_VALLEY_10");
		Wld_InsertNpc(Gobbo_Warrior,"ADW_ENTRANCE_2_VALLEY_10");
		Wld_InsertNpc(Gobbo_Warrior,"ADW_ENTRANCE_2_VALLEY_10");
		Wld_InsertNpc(Gobbo_Warrior,"ADW_ENTRANCE_2_VALLEY_10");
		Wld_InsertNpc(Gobbo_Warrior,"ADW_ENTRANCE_2_VALLEY_02A");
		Wld_InsertNpc(Gobbo_Warrior,"ADW_ENTRANCE_2_VALLEY_02A");
		Wld_InsertNpc(DragonSnapper,"ADW_VALLEY_PATH_020");
		Wld_InsertNpc(DragonSnapper,"ADW_VALLEY_BIGCAVE_01");
		Wld_InsertNpc(DragonSnapper,"ADW_VALLEY_PATH_048_A");
		Wld_InsertNpc(DragonSnapper,"ADW_VALLEY_PATH_047_D");
		Wld_InsertNpc(DragonSnapper,"ADW_VALLEY_PATH_047_D");
		Wld_InsertNpc(Scavenger_Demon,"ADW_VALLEY_PATH_047_G");
		Wld_InsertNpc(Scavenger_Demon,"ADW_VALLEY_PATH_047_G");
		Wld_InsertNpc(Scavenger_Demon,"ADW_VALLEY_PATH_038_E");
		Wld_InsertNpc(Scavenger_Demon,"ADW_VALLEY_PATH_038_E");
		Wld_InsertNpc(Scavenger_Demon,"ADW_VALLEY_PATH_038_J");
		Wld_InsertNpc(SkeletonMage,"ADW_VALLEY_PATH_131");
		Wld_InsertNpc(SkeletonMage,"ADW_VALLEY_PATH_132_A");
		Wld_InsertNpc(Skeleton,"ADW_VALLEY_PATH_132_A");
		Wld_InsertNpc(Skeleton,"ADW_VALLEY_PATH_134");
		Wld_InsertNpc(Skeleton,"ADW_VALLEY_PATH_134");
		Wld_InsertNpc(Skeleton,"ADW_VALLEY_PATH_135");
		Wld_InsertNpc(Shadowbeast_Addon_Fire,"ADW_VALLEY_PATH_072");
		Wld_InsertNpc(Skeleton,"ADW_VALLEY_PATH_072");
		Wld_InsertNpc(Skeleton,"ADW_VALLEY_PATH_073");
		Wld_InsertNpc(Shadowbeast_Addon_Fire,"ADW_VALLEY_PATH_072");
		Wld_InsertNpc(Skeleton,"ADW_VALLEY_PATH_073");
		Wld_InsertNpc(Skeleton,"ADW_VALLEY_PATH_073");
		Wld_InsertNpc(DragonSnapper,"ADW_CANYON_PATH_TO_MINE1_05");
		Wld_InsertNpc(DragonSnapper,"ADW_CANYON_PATH_TO_MINE1_05");
		Wld_InsertNpc(DragonSnapper,"ADW_CANYON_MINE1_01");
		Wld_InsertNpc(DragonSnapper,"ADW_CANYON_MINE1_01");
		Wld_InsertNpc(DragonSnapper,"ADW_CANYON_MINE1_01");
		Wld_InsertNpc(DragonSnapper,"ADW_CANYON_PATH_TO_LIBRARY_31A");
		Wld_InsertNpc(DragonSnapper,"ADW_CANYON_PATH_TO_LIBRARY_31A");
		Wld_InsertNpc(FireWaran,"ADW_CANYON_PATH_TO_BANDITS_55");
		Wld_InsertNpc(FireWaran,"ADW_CANYON_PATH_TO_BANDITS_55");
		Wld_InsertNpc(OrcBiter,"ADW_CANYON_PATH_TO_BANDITS_52");
		Wld_InsertNpc(OrcBiter,"ADW_CANYON_PATH_TO_BANDITS_52");
		Wld_InsertNpc(Troll,"ADW_CANYON_PATH_TO_LIBRARY_17");
		Wld_InsertNpc(Troll,"ADW_CANYON_PATH_TO_LIBRARY_16A");
		Wld_InsertNpc(OrcBiter,"ADW_CANYON_ORCS_09");
		Wld_InsertNpc(OrcBiter,"ADW_CANYON_ORCS_09");
		Wld_InsertNpc(FireWaran,"ADW_CANYON_PATH_TO_LIBRARY_07A");
		Wld_InsertNpc(FireWaran,"ADW_CANYON_PATH_TO_LIBRARY_07A");
		Wld_InsertNpc(Blattcrawler,"ADW_CANYON_TELEPORT_PATH_09");
		Wld_InsertNpc(Blattcrawler,"ADW_CANYON_TELEPORT_PATH_09");
		Wld_InsertNpc(Blattcrawler,"ADW_CANYON_TELEPORT_PATH_09");
		Wld_InsertNpc(DragonSnapper,"ADW_ENTRANCE_PATH2BANDITS_05P");
		Wld_InsertNpc(DragonSnapper,"ADW_ENTRANCE_PATH2BANDITS_05P");
		Wld_InsertNpc(SwampGolem,"ADW_ENTRANCE_PATH2BANDITS_05");
		Wld_InsertNpc(Troll,"ADW_CANYON_PATH_TO_BANDITS_20");
		Wld_InsertNpc(MinecrawlerWarrior,"ADW_CANYON_PATH_TO_BANDITS_21");
		Wld_InsertNpc(MinecrawlerWarrior,"ADW_CANYON_PATH_TO_BANDITS_17");
		Wld_InsertNpc(MinecrawlerWarrior,"ADW_CANYON_PATH_TO_BANDITS_14");
		Wld_InsertNpc(MinecrawlerWarrior,"ADW_CANYON_PATH_TO_BANDITS_62");
		Wld_InsertNpc(MinecrawlerWarrior,"ADW_CANYON_PATH_TO_BANDITS_19");
		EnterADW_Kapitel4 = TRUE;
	};
};


var int EnterADW_Kapitel5;

func void B_ENTER_ADDONWORLD_Kapitel_5()
{
	if(EnterADW_Kapitel5 == FALSE)
	{
		EnterADW_Kapitel5 = TRUE;
	};
};


var int EnterADW_Kapitel6;

func void B_ENTER_ADDONWORLD_Kapitel_6()
{
	if(EnterADW_Kapitel6 == FALSE)
	{
		EnterADW_Kapitel6 = TRUE;
	};
};

func void b_enter_addonworld()
{
	B_InitNpcGlobals();
	if(Kapitel >= 1)
	{
		B_ENTER_ADDONWORLD_Kapitel_1();
	};
	if(Kapitel >= 2)
	{
		B_ENTER_ADDONWORLD_Kapitel_2();
	};
	if(Kapitel >= 3)
	{
		B_ENTER_ADDONWORLD_Kapitel_3();
	};
	if(Kapitel >= 4)
	{
		B_ENTER_ADDONWORLD_Kapitel_4();
	};
	if(Kapitel >= 5)
	{
		B_ENTER_ADDONWORLD_Kapitel_5();
	};
	if(Kapitel >= 6)
	{
		B_ENTER_ADDONWORLD_Kapitel_6();
	};
	CurrentLevel = ADDONWORLD_ZEN;
	B_InitNpcGlobals();
};

