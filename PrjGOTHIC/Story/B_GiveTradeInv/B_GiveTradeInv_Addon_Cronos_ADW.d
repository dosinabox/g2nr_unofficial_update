
var int Cronos_ADW_ItemsGiven_Chapter_1;
var int Cronos_ADW_ItemsGiven_Chapter_2;
var int Cronos_ADW_ItemsGiven_Chapter_3;
var int Cronos_ADW_ItemsGiven_Chapter_4;
var int Cronos_ADW_ItemsGiven_Chapter_5;

func void B_GiveTradeInv_Addon_Cronos_ADW(var C_Npc slf)
{
	if((Kapitel >= 2) && (Cronos_ADW_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems(slf,ItMW_Addon_Stab03,1);
		CreateInvItems(slf,ItMW_Addon_Stab05,1);
		CreateInvItems(slf,ItMi_Sulfur,2);
		CreateInvItems(slf,ItMi_Quartz,2);
		CreateInvItems(slf,ItMi_Pitch,1);
		CreateInvItems(slf,ItPo_Health_01,7);
		CreateInvItems(slf,ItPo_Health_02,2);
		CreateInvItems(slf,ItPo_Mana_01,14);
		CreateInvItems(slf,ItPo_Health_Addon_04,2);
		CreateInvItems(slf,ItPo_Mana_Addon_04,5);
		CreateInvItems(slf,ItMi_Flask,15);
		CreateInvItems(slf,ItWr_Map_AddonWorld,1);
		CreateInvItems(slf,ITWR_Addon_Runemaking_KDF_CIRC1,1);
		CreateInvItems(slf,ITWR_Addon_Runemaking_KDF_CIRC2,1);
		CreateInvItems(slf,ITWR_Addon_Runemaking_KDF_CIRC3,1);
		CreateInvItems(slf,ITWR_Addon_Runemaking_KDF_CIRC4,1);
		CreateInvItems(slf,ITWR_Addon_Runemaking_KDF_CIRC5,1);
		CreateInvItems(slf,ITWR_Addon_Runemaking_KDF_CIRC6,1);
		CreateInvItems(slf,ITWR_Addon_Runemaking_KDW_CIRC1,1);
		CreateInvItems(slf,ItMi_RuneBlank,2);
		CreateInvItems(slf,ItSc_Light,5);
		CreateInvItems(slf,ItSc_Firebolt,5);
		CreateInvItems(slf,ItSc_Zap,5);
		CreateInvItems(slf,ItSc_LightHeal,5);
		CreateInvItems(slf,ItSc_SumGobSkel,2);
		CreateInvItems(slf,ItSc_Icelance,5);
		CreateInvItems(slf,ItSc_Whirlwind,1);
		CreateInvItems(slf,ItSc_Icebolt,3);
		CreateInvItems(slf,ItSc_InstantFireball,3);
		CreateInvItems(slf,ItSc_Whirlwind,2);
		CreateInvItems(slf,ItSc_Geyser,2);
		CreateInvItems(slf,ItSc_Thunderstorm,2);
		CreateInvItems(slf,ItSc_Waterfist,1);
		CreateInvItems(slf,ItSc_SumWolf,2);
		Cronos_ADW_ItemsGiven_Chapter_2 = TRUE;
	};
	if((Kapitel >= 3) && (Cronos_ADW_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItMi_Sulfur,2);
		CreateInvItems(slf,ItMi_Quartz,2);
		CreateInvItems(slf,ItMi_Rockcrystal,2);
		CreateInvItems(slf,ItMi_Coal,2);
		CreateInvItems(slf,ItAt_WaranFiretongue,1);
		CreateInvItems(slf,ItMi_Pitch,1);
		CreateInvItems(slf,ItPo_Health_02,9);
		CreateInvItems(slf,ItPo_Health_03,6);
		CreateInvItems(slf,ItPo_Mana_01,30);
		CreateInvItems(slf,ItPo_Health_Addon_04,2);
		CreateInvItems(slf,ItPo_Mana_Addon_04,5);
		CreateInvItems(slf,ItSc_MediumHeal,5);
		CreateInvItems(slf,ItSc_Firestorm,4);
		CreateInvItems(slf,ItSc_ThunderBall,2);
		CreateInvItems(slf,ItSc_SumSkel,3);
		CreateInvItems(slf,ItSc_Fear,2);
		CreateInvItems(slf,ItSc_IceCube,3);
		CreateInvItems(slf,ItMi_Flask,10);
		CreateInvItems(slf,ItSc_Icelance,2);
		CreateInvItems(slf,ItSc_Whirlwind,2);
		CreateInvItems(slf,ItSc_Geyser,2);
		CreateInvItems(slf,ItSc_Thunderstorm,2);
		CreateInvItems(slf,ItSc_Waterfist,1);
		CreateInvItems(slf,ItMi_RuneBlank,2);
		CreateInvItems(slf,ItSc_TrfGiantBug,1);
		CreateInvItems(slf,ItSc_TrfWolf,1);
		CreateInvItems(slf,ItSc_TrfSheep,1);
		CreateInvItems(slf,ItSc_TrfScavenger,1);
		Cronos_ADW_ItemsGiven_Chapter_3 = TRUE;
	};
	if((Kapitel >= 4) && (Cronos_ADW_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems(slf,ItMi_Sulfur,5);
		CreateInvItems(slf,ItMi_Quartz,6);
		CreateInvItems(slf,ItMi_Rockcrystal,3);
		CreateInvItems(slf,ItMi_Coal,4);
		CreateInvItems(slf,ItMi_Aquamarine,2);
		CreateInvItems(slf,ItMi_Pitch,1);
		CreateInvItems(slf,ItMi_Flask,10);
		CreateInvItems(slf,ItPo_Health_Addon_04,5);
		CreateInvItems(slf,ItPo_Mana_Addon_04,10);
		CreateInvItems(slf,ItPo_Health_02,15);
		CreateInvItems(slf,ItPo_Health_03,10);
		CreateInvItems(slf,ItPo_Mana_01,30);
		CreateInvItems(slf,ItPo_Mana_02,30);
		CreateInvItems(slf,ItSc_LightningFlash,3);
		CreateInvItems(slf,ItSc_SumGol,3);
		CreateInvItems(slf,ItSc_HarmUndead,2);
		CreateInvItems(slf,ItSc_ChargeFireBall,3);
		CreateInvItems(slf,ItSc_TrfSnapper,1);
		CreateInvItems(slf,ItSc_TrfWarg,1);
		CreateInvItems(slf,ItSc_Icelance,3);
		CreateInvItems(slf,ItSc_Whirlwind,3);
		CreateInvItems(slf,ItSc_Geyser,3);
		CreateInvItems(slf,ItSc_Thunderstorm,3);
		CreateInvItems(slf,ItSc_Waterfist,2);
		Cronos_ADW_ItemsGiven_Chapter_4 = TRUE;
	};
	if((Kapitel >= 5) && (Cronos_ADW_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems(slf,ItMi_Sulfur,6);
		CreateInvItems(slf,ItMi_Quartz,4);
		CreateInvItems(slf,ItMi_Rockcrystal,6);
		CreateInvItems(slf,ItMi_Coal,3);
		CreateInvItems(slf,ItMi_Aquamarine,3);
		CreateInvItems(slf,ItMi_DarkPearl,1);
		CreateInvItems(slf,ItMi_HolyWater,3);
		CreateInvItems(slf,ItMi_Flask,10);
		CreateInvItems(slf,ItPo_Health_02,20);
		CreateInvItems(slf,ItPo_Health_03,15);
		CreateInvItems(slf,ItPo_Mana_01,50);
		CreateInvItems(slf,ItPo_Mana_02,40);
		CreateInvItems(slf,ItSc_Pyrokinesis,5);
		CreateInvItems(slf,ItSc_IceWave,4);
		CreateInvItems(slf,ItSc_SumDemon,2);
		CreateInvItems(slf,ItSc_FullHeal,3);
		CreateInvItems(slf,ItSc_Icelance,3);
		CreateInvItems(slf,ItSc_Whirlwind,3);
		CreateInvItems(slf,ItSc_Geyser,3);
		CreateInvItems(slf,ItSc_Thunderstorm,3);
		CreateInvItems(slf,ItSc_Waterfist,3);
		CreateInvItems(slf,ItMi_RuneBlank,1);
		CreateInvItems(slf,ItSc_TrfLurker,1);
		CreateInvItems(slf,ItSc_TrfDragonSnapper,1);
		Cronos_ADW_ItemsGiven_Chapter_5 = TRUE;
	};
};

