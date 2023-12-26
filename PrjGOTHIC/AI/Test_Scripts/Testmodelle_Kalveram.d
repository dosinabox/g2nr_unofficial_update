
instance Itemhoshi(Npc_Default)
{
	name[0] = "Мистер Вещь Хоша";
	guild = GIL_MIL;
	id = 1500;
	voice = 3;
	flags = NPC_FLAG_IMMORTAL;
	npcType = NPCTYPE_MAIN;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_STRONG;
	B_GiveAllClassicWeapons(self);
	B_GiveAllAddonWeapons(self);
	B_GiveAllPatchWeapons(self);
	B_GiveAllClassicArmor(self);
	B_GiveAllAddonArmor(self);
	B_GiveAllPatchArmor(self);
	B_GiveAllClassicRunes(self);
	B_GiveAllAddonRunes(self);
	B_GiveAllPatchRunes(self);
	B_GiveAllClassicScrolls(self);
	B_GiveAllAddonScrolls(self);
	B_GiveAllPatchScrolls(self);
	B_GiveAllClassicKeys(self);
	B_GiveAllAddonKeys(self);
	B_GiveAllPatchKeys(self);
	B_GiveAllClassicTrophies(self);
	B_GiveAllAddonTrophies(self);
	B_GiveAllPatchTrophies(self);
	B_GiveAllClassicFood(self);
	B_GiveAllAddonFood(self);
	B_GiveAllPatchFood(self);
	B_GiveAllClassicDocuments(self);
	B_GiveAllAddonDocuments(self);
	B_GiveAllPatchDocuments(self);
	B_GiveAllClassicPotions(self);
	B_GiveAllAddonPotions(self);
	B_GiveAllPatchPotions(self);
	CreateInvItems(self,ItSe_ErzFisch,1);
	CreateInvItems(self,ItSe_GoldFisch,1);
	CreateInvItems(self,ItSe_RingFisch,1);
	CreateInvItems(self,ItSe_LockpickFisch,1);
	CreateInvItems(self,ItSe_GoldPocket25,1);
	CreateInvItems(self,ItSe_GoldPocket50,1);
	CreateInvItems(self,ItSe_GoldPocket100,1);
	CreateInvItems(self,ItSe_HannasBeutel,1);
	CreateInvItems(self,ItPl_SwampHerb,10);
	CreateInvItems(self,ItPl_Mana_Herb_01,10);
	CreateInvItems(self,ItPl_Mana_Herb_02,10);
	CreateInvItems(self,ItPl_Mana_Herb_03,10);
	CreateInvItems(self,ItPl_Health_Herb_01,10);
	CreateInvItems(self,ItPl_Health_Herb_02,10);
	CreateInvItems(self,ItPl_Health_Herb_03,10);
	CreateInvItems(self,ItPl_Dex_Herb_01,10);
	CreateInvItems(self,ItPl_Strength_Herb_01,10);
	CreateInvItems(self,ItPl_Speed_Herb_01,10);
	CreateInvItems(self,ItPl_Mushroom_01,10);
	CreateInvItems(self,ItPl_Mushroom_02,10);
	CreateInvItems(self,ItPl_Forestberry,10);
	CreateInvItems(self,ItPl_Blueplant,10);
	CreateInvItems(self,ItPl_Planeberry,10);
	CreateInvItems(self,ItPl_Temp_Herb,10);
	CreateInvItems(self,ItPl_Perm_Herb,10);
	CreateInvItems(self,ItPl_Weed,10);
	CreateInvItems(self,ItPl_Beet,10);
	CreateInvItems(self,ItKe_Lockpick,10);
	CreateInvItems(self,ItLsTorch,50);
	CreateInvItems(self,ItLsTorchburned,50);
	CreateInvItems(self,ItLsTorchFirespit,10);
	CreateInvItems(self,ItMi_Pan,1);
	CreateInvItems(self,ItMi_PanFull,1);
	CreateInvItems(self,ItMi_Saw,1);
	CreateInvItems(self,ItMi_Pliers,1);
	CreateInvItems(self,ItMi_Brush,1);
	CreateInvItems(self,ItMi_Flask,10);
	CreateInvItems(self,ItMi_Stomper,1);
	CreateInvItems(self,ItMi_Broom,1);
	CreateInvItems(self,ItMi_Rake,1);
	CreateInvItems(self,ItMi_Hammer,1);
	CreateInvItems(self,ItMi_Scoop,1);
	CreateInvItems(self,ItMi_Nugget,1);
	CreateInvItems(self,ItMi_Joint,10);
	CreateInvItems(self,ItMi_Lute,1);
	CreateInvItems(self,ItMi_Gold,1000);
	CreateInvItems(self,ItMi_OldCoin,1);
	CreateInvItems(self,ItMiSwordraw,1);
	CreateInvItems(self,ItMiSwordrawhot,1);
	CreateInvItems(self,ItMiSwordbladehot,1);
	CreateInvItems(self,ItMiSwordblade,1);
	CreateInvItems(self,ItMi_RuneBlank,10);
	CreateInvItems(self,ItMi_Sulfur,10);
	CreateInvItems(self,ItMi_Quartz,10);
	CreateInvItems(self,ItMi_Pitch,10);
	CreateInvItems(self,ItMi_Rockcrystal,10);
	CreateInvItems(self,ItMi_Aquamarine,10);
	CreateInvItems(self,ItMi_HolyWater,10);
	CreateInvItems(self,ItMi_Coal,10);
	CreateInvItems(self,ItMi_DarkPearl,10);
	CreateInvItems(self,ItMi_GoldCandleHolder,1);
	CreateInvItems(self,ItMi_GoldNecklace,1);
	CreateInvItems(self,ItMi_GoldCup,1);
	CreateInvItems(self,ItMi_GoldChalice,1);
	CreateInvItems(self,ItMi_GoldChest,1);
	CreateInvItems(self,ItMi_GoldRing,1);
	CreateInvItems(self,ItMi_GoldPlate,1);
	CreateInvItems(self,ItMi_SilverChalice,1);
	CreateInvItems(self,ItMi_GregsSilverPlate,1);
	CreateInvItems(self,ItMi_JeweleryChest,1);
	CreateInvItems(self,ItMi_InnosStatue,1);
	CreateInvItems(self,ItMi_SilverRing,1);
	CreateInvItems(self,ItMi_SilverChalice,1);
	CreateInvItems(self,ItMi_SilverCup,1);
	CreateInvItems(self,ItMi_SilverPlate,1);
	CreateInvItems(self,ItMi_SilverNecklace,1);
	CreateInvItems(self,ItMi_SilverCandleHolder,1);
	CreateInvItems(self,ItMi_Sextant,1);
//	CreateInvItems(self,ItMi_Packet,1);
	CreateInvItems(self,ItMi_Pocket,1);
	CreateInvItems(self,ItMi_BloodCup_MIS,1);
	CreateInvItems(self,ItMi_ApfelTabak,1);
	CreateInvItems(self,ItMi_PilzTabak,1);
	CreateInvItems(self,ItMi_DoppelTabak,1);
	CreateInvItems(self,ItMi_Honigtabak,1);
	CreateInvItems(self,ItMi_SumpfTabak,1);
	CreateInvItems(self,ItMi_GoldNugget_Addon,10);
	CreateInvItems(self,ItMi_Addon_WhitePearl,10);
	CreateInvItems(self,ItMi_Addon_Joint_01,10);
	CreateInvItems(self,ItMi_BaltramPaket,1);
	CreateInvItems(self,ItMi_Packet_Baltram4Skip_Addon,1);
	CreateInvItems(self,ItMi_BromorsGeld_Addon,10);
	CreateInvItems(self,ItSe_ADDON_CavalornsBeutel,10);
	CreateInvItems(self,ItMi_Skull,1);
	CreateInvItems(self,ItMi_Addon_Shell_01,10);
	CreateInvItems(self,ItMi_Addon_Shell_02,10);
	CreateInvItems(self,ItMi_Grog_Crate,5);
	CreateInvItems(self,ItMi_ArrowPack,10);
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
	CreateInvItem(self,ItAm_Addon_Franco);
	CreateInvItem(self,ItAm_Addon_Greg);
	CreateInvItem(self,ItAm_Addon_Health);
	CreateInvItem(self,ItAm_Addon_MANA);
	CreateInvItem(self,ItAm_Addon_STR);
	CreateInvItem(self,ItAm_Hp_Regen);
	CreateInvItem(self,ItAm_Mana_Regen);
	CreateInvItem(self,ItAm_Fall);
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
	CreateInvItem(self,ItRi_Prot_Mage_03);
	CreateInvItem(self,ItRi_Prot_Point_01);
	CreateInvItem(self,ItRi_Prot_Point_02);
	CreateInvItem(self,ItRi_Prot_Total_01);
	CreateInvItem(self,ItRi_Prot_Total_02);
	CreateInvItem(self,ItRi_Prot_Total_03);
	CreateInvItem(self,ItRi_Addon_Health_01);
	CreateInvItem(self,ItRi_Addon_Health_02);
	CreateInvItem(self,ItRi_Addon_MANA_01);
	CreateInvItem(self,ItRi_Addon_MANA_02);
	CreateInvItem(self,ItRi_Addon_STR_01);
	CreateInvItem(self,ItRi_Addon_STR_02);
	CreateInvItems(self,ItMw_2h_Rod,1);
	CreateInvItems(self,ItMi_CoragonsSilber,1);
	CreateInvItems(self,ItMi_TheklasPaket,1);
	CreateInvItems(self,ItMi_MariasGoldPlate,1);
	CreateInvItems(self,ItRi_Prot_Edge_01_Valentino,1);
	CreateInvItems(self,ItMi_HerbPaket,1);
	CreateInvItems(self,ItFo_HalvorFish_MIS,1);
	CreateInvItems(self,ItMw_AlriksSword_Mis,1);
	CreateInvItems(self,Holy_Hammer_MIS,1);
	CreateInvItems(self,ItRw_Bow_L_03_MIS,1);
	CreateInvItems(self,ItRi_Prot_Point_01_MIS,1);
	CreateInvItems(self,ItMi_EddasStatue,1);
	CreateInvItems(self,ItPl_Sagitta_Herb_MIS,1);
	CreateInvItems(self,ItRw_DragomirsArmbrust_MIS,1);
	CreateInvItems(self,ItMi_StoneOfKnowlegde_MIS,1);
	CreateInvItems(self,ItMi_GornsTreasure_MIS,1);
	CreateInvItems(self,ItAt_ClawLeader,1);
	CreateInvItems(self,ItSe_Olav,1);
//	CreateInvItems(self,ItMi_GoldPlate_MIS,1);
	CreateInvItems(self,ItRi_HP_01_Tengron,1);
	CreateInvItems(self,ItMi_InnosEye_MIS,1);
	CreateInvItems(self,ItMi_InnosEye_Discharged_Mis,1);
	CreateInvItems(self,ItMi_InnosEye_Broken_Mis,1);
	CreateInvItems(self,ItMw_MalethsGehstock_MIS,1);
	CreateInvItems(self,ItMi_MalethsBanditGold,1);
	CreateInvItems(self,ItMi_Moleratlubric_MIS,1);
	CreateInvItems(self,ItSe_Golemchest_Mis,1);
	CreateInvItems(self,ItSe_DiegosTreasure_Mis,1);
	CreateInvItems(self,ItMi_UltharsHolyWater_Mis,1);
	CreateInvItems(self,ItAm_Prot_BlackEye_Mis,1);
	CreateInvItems(self,ItMi_KarrasBlessedStone_Mis,1);
	CreateInvItems(self,ItAm_Mana_Angar_MIS,1);
	CreateInvItems(self,ItMw_1H_FerrosSword_MIS,1);
	CreateInvItems(self,ItMi_KerolothsGeldbeutel_MIS,1);
	CreateInvItems(self,ItMi_KerolothsGeldbeutelLeer_MIS,1);
	CreateInvItems(self,ItRw_SengrathsArmbrust_MIS,1);
	CreateInvItems(self,ItAt_TalbinsLurkerSkin,1);
	CreateInvItems(self,ItAt_DragonEgg_MIS,1);
	CreateInvItems(self,ItRi_OrcEliteRing,1);
	CreateInvItems(self,ItAm_AmulettOfDeath_MIS,1);
	CreateInvItems(self,ItSe_XardasNotfallBeutel_MIS,1);
	CreateInvItems(self,ItMi_PowerEye,1);
	CreateInvItems(self,ItMi_Ornament_Addon,1);
	CreateInvItems(self,ItMi_Ornament_Addon_Vatras,1);
	CreateInvItems(self,ItRi_Ranger_Lares_Addon,1);
	CreateInvItems(self,ItRi_Ranger_Addon,1);
	CreateInvItems(self,ItRi_Ranger_Lance_Addon,1);
	CreateInvItems(self,ItMi_PortalRing_Addon,1);
	CreateInvItems(self,ItMi_LostInnosStatue_Daron,1);
	CreateInvItems(self,ItMi_AmbossEffekt_Addon,1);
	CreateInvItems(self,ItMi_OrnamentEffekt_FARM_Addon,1);
	CreateInvItems(self,ItMi_OrnamentEffekt_FOREST_Addon,1);
	CreateInvItems(self,ItMi_OrnamentEffekt_BIGFARM_Addon,1);
	CreateInvItems(self,ItMi_Rake,1);
	CreateInvItems(self,ItRi_Addon_BanditTrader,1);
	CreateInvItems(self,ItAm_Addon_WispDetector,1);
	CreateInvItems(self,ItRi_Addon_MorgansRing_Mission,1);
	CreateInvItems(self,ItMi_Focus,1);
	CreateInvItems(self,ItMi_Addon_Steel_Paket,1);
	CreateInvItems(self,ItMi_Addon_Fisk_Paket,1);
	CreateInvItems(self,ItMi_Zeitspalt_Addon,1);
	CreateInvItems(self,ItMi_Addon_Stone_01,1);
	CreateInvItems(self,ItMi_Addon_Stone_05,1);
	CreateInvItems(self,ItMi_Addon_Stone_03,1);
	CreateInvItems(self,ItMi_Addon_Stone_04,1);
	CreateInvItems(self,ItMi_Addon_Stone_02,1);
	CreateInvItems(self,ItMi_Addon_Kompass_MIS,1);
	CreateInvItems(self,ItSe_Addon_FrancisChest,1);
	CreateInvItems(self,ItMi_TempelTorKey,1);
	CreateInvItems(self,ItMi_Addon_Bloodwyn_Kopf,1);
	CreateInvItems(self,ItMi_Addon_GregsTreasureBottle_MIS,1);
	CreateInvItems(self,ItMi_ErolsKelch,1);
	CreateInvItems(self,ItMi_IECello,1);
	CreateInvItems(self,ItMi_IECelloBow,1);
	CreateInvItems(self,ItMi_IEDrum,1);
	CreateInvItems(self,ItMi_IEDrumScheit,1);
	CreateInvItems(self,ItMi_IEDrumStick,1);
	CreateInvItems(self,ItMi_IEDudelBlau,1);
	CreateInvItems(self,ItMi_IEDudelGelb,1);
	CreateInvItems(self,ItMi_IEHarfe,1);
	CreateInvItems(self,ItMi_IELaute,1);
	CreateInvItems(self,ItMi_AlarmHorn,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_OldBald_Jeremiah,BodyTex_N,NO_ARMOR);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
};

/*instance Hoshi_Testmodell(Npc_Default)
{
	name[0] = "Хоша";
	guild = GIL_MIL;
	id = 20000;
	voice = 6;
	flags = 0;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Mil_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Normal05,BodyTex_N,ITAR_PAL_M);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_20000;
};


func void Rtn_Start_20000()
{
	TA_Guard_Passage(8,0,23,0,"NW_CITY_GUARDOFFICE_GUARD_01");
	TA_Guard_Passage(23,0,8,0,"NW_CITY_GUARDOFFICE_GUARD_01");
};


instance TA_Testmodell(Npc_Default)
{
	name[0] = "TA_Testmodell";
	guild = GIL_SLD;
	id = 1500;
	voice = 3;
	flags = NPC_FLAG_IMMORTAL;
	npcType = NPCTYPE_MAIN;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_OldBald_Jeremiah,BodyTex_N,NO_ARMOR);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
	daily_routine = Rtn_Start_1500;
};


func void Rtn_Start_1500()
{
	TA_Cook_Cauldron(0,0,0,15,"WP_COOK_CAULDRON");
	TA_Pee(0,15,0,30,"WP_WASH");
	TA_Cook_Pan(0,30,0,45,"WP_COOK_PAN");
	TA_Pick_FP(0,45,1,0,"WP_PICK");
	TA_Pick_Ore(1,0,1,15,"WP_PICK_ORE");
	TA_Practice_Magic(1,15,1,30,"WP_STAND");
	TA_Potion_Alchemy(1,30,1,45,"WP_POTION_ALCHEMY");
	TA_Pray_Innos_FP(1,45,2,0,"WP_PRAY");
	TA_Pray_Innos(2,0,2,15,"WP_PRAY_INNOS_STATUE");
	TA_Practice_Sword(2,15,2,30,"WP_MOBSIS_ALLE");
	TA_Play_Lute(2,30,2,45,"WP_STAND");
	TA_Read_Bookstand(2,45,3,0,"WP_READ_BOOKSTAND");
	TA_Repair_Hut(3,0,3,15,"WP_REPAIR_HUT");
	TA_Roast_Scavenger(3,15,3,30,"WP_ROAST_SCAVENGER");
	TA_Sit_Campfire(3,30,3,45,"WP_STAND");
	TA_Sit_Bench(3,45,4,0,"WP_SIT_BENCH");
	TA_Smoke_Joint(4,0,4,15,"WP_STAND");
	TA_Sit_Chair(4,15,4,30,"WP_SIT_CHAIR");
	TA_Sit_Throne(4,30,4,45,"WP_SIT_THRONE");
	TA_Smalltalk(4,45,5,0,"WP_SMALLTALK");
	TA_Smith_Fire(5,0,5,15,"WP_SMITH_FIRE");
	TA_Smith_Anvil(5,15,5,30,"WP_SMITH_ANVIL");
	TA_Smith_Cool(5,30,5,45,"WP_SMITH_COOL");
	TA_Smith_Sharp(5,45,6,0,"WP_SMITH_SHARP");
	TA_Sleep(6,0,6,15,"WP_SLEEP");
	TA_Stand_ArmsCrossed(6,15,6,30,"WP_STAND");
	TA_Smoke_Waterpipe(6,30,6,45,"WP_SMOKE_WATERPIPE");
	TA_Stand_Guarding(6,45,7,0,"WP_STAND");
	TA_Stand_Eating(7,0,7,15,"WP_STAND");
	TA_Spit_Fire(7,15,7,30,"WP_STAND");
	TA_Stand_Drinking(7,30,7,45,"WP_STAND");
	TA_Stand_Sweeping(7,45,8,0,"WP_STAND");
	TA_Rake_FP(8,0,8,15,"WP_PICK");
	TA_Cook_Stove(8,15,8,30,"WP_COOK_STOVE");
	TA_Saw(8,30,8,45,"WP_SAW");
	TA_Pray_Innos(8,45,9,0,"WP_PRAY_INNOS_STATUE");
	TA_Pray_Innos_FP(9,0,9,15,"WP_PRAY");
	TA_Wash_FP(9,15,9,30,"WP_WASH");
	TA_Stomp_Herb(9,30,9,45,"WP_STOMP_HERB");
	TA_Pick_FP(9,45,10,15,"WP_PICK");
	TA_Pick_FP(10,15,24,0,"WP_PRAY");
};

func void Rtn_Guide_1500()
{
	TA_Guide_Player(6,0,18,0,"WP_GUIDE_PLAYER");
	TA_Guide_Player(18,0,6,0,"WP_GUIDE_PLAYER");
};

func void Rtn_Follow_1500()
{
	TA_Follow_Player(6,0,18,0,"WP_FOLLOW_PLAYER");
	TA_Follow_Player(18,0,6,0,"WP_FOLLOW_PLAYER");
};


instance DIA_TA_Testmodell_EXIT(C_Info)
{
	npc = TA_Testmodell;
	nr = 999;
	condition = DIA_TA_Testmodell_EXIT_Condition;
	information = DIA_TA_Testmodell_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_TA_Testmodell_EXIT_Condition()
{
	return TRUE;
};

func void DIA_TA_Testmodell_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_TA_Testmodell_GuideStart(C_Info)
{
	npc = TA_Testmodell;
	nr = 997;
	condition = DIA_TA_Testmodell_GuideStart_Condition;
	information = DIA_TA_Testmodell_GuideStart_Info;
	permanent = TRUE;
	description = "Покажи мне Guide_Player!";
};


func int DIA_TA_Testmodell_GuideStart_Condition()
{
	var C_Npc Testmodell;
	Testmodell = Hlp_GetNpc(TA_Testmodell);
	if(!Npc_IsInRoutine(self,ZS_Guide_Player))
	{
		return TRUE;
	};
};

func void DIA_TA_Testmodell_GuideStart_Info()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Guide");
};


instance Info_TA_Testmodell_GuideEnd(C_Info)
{
	npc = TA_Testmodell;
	nr = 998;
	condition = DIA_TA_Testmodell_GuideEnd_Condition;
	information = DIA_TA_Testmodell_GuideEnd_Info;
	permanent = TRUE;
	description = "Закончить Guide_Player!";
};


func int DIA_TA_Testmodell_GuideEnd_Condition()
{
	var C_Npc Testmodell;
	Testmodell = Hlp_GetNpc(TA_Testmodell);
	if(Npc_IsInRoutine(self,ZS_Guide_Player))
	{
		return TRUE;
	};
};

func void DIA_TA_Testmodell_GuideEnd_Info()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance Info_TA_Testmodell_FollowStart(C_Info)
{
	npc = TA_Testmodell;
	nr = 995;
	condition = DIA_TA_Testmodell_FollowStart_Condition;
	information = DIA_TA_Testmodell_FollowStart_Info;
	permanent = TRUE;
	description = "Иди за мной!";
};


func int DIA_TA_Testmodell_FollowStart_Condition()
{
	var C_Npc Testmodell;
	Testmodell = Hlp_GetNpc(TA_Testmodell);
	if(!Npc_IsInRoutine(self,ZS_Follow_Player))
	{
		return TRUE;
	};
};

func void DIA_TA_Testmodell_FollowStart_Info()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FOLLOW");
};


instance Info_TA_Testmodell_FollowEnd(C_Info)
{
	npc = TA_Testmodell;
	nr = 998;
	condition = DIA_TA_Testmodell_FollowEnd_Condition;
	information = DIA_TA_Testmodell_FollowEnd_Info;
	permanent = TRUE;
	description = "Хватит ходить за мной!";
};


func int DIA_TA_Testmodell_FollowEnd_Condition()
{
	var C_Npc Testmodell;
	Testmodell = Hlp_GetNpc(TA_Testmodell);
	if(Npc_IsInRoutine(self,ZS_Follow_Player))
	{
		return TRUE;
	};
};

func void DIA_TA_Testmodell_FollowEnd_Info()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance TA_Smalltalkpartner(Npc_Default)
{
	name[0] = "Партнер для короткого разговора";
	guild = GIL_NONE;
	id = 1501;
	voice = 1;
	flags = NPC_FLAG_IMMORTAL;
	npcType = NPCTYPE_MAIN;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_OldBald_Jeremiah,BodyTex_N,NO_ARMOR);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
	daily_routine = Rtn_Start_1501;
};


func void Rtn_Start_1501()
{
	TA_Smalltalk(11,0,23,0,"WP_SMALLTALK");
	TA_Smalltalk(23,0,11,0,"WP_SMALLTALK");
};

func void Startup_TA_Testlevel()
{
	B_InitMonsterAttitudes();
	B_InitNpcGlobals();
	Wld_InsertNpc(PIR_1350_Addon_Francis,"WP_SMITH_SHARP");
	Wld_InsertNpc(PIR_1351_Addon_Samuel,"WP_COOK_STOVE");
	Wld_InsertNpc(PIR_1352_Addon_AlligatorJack,"WP_SAW");
	Wld_InsertNpc(PIR_1353_Addon_Morgan,"WP_SMITH_FIRE");
	Wld_InsertNpc(PIR_1354_Addon_Henry,"WP_POTION_ALCHEMY");
	Wld_InsertNpc(PIR_1355_Addon_Skip,"WP_COOK_PAN");
	Wld_InsertNpc(PIR_1356_Addon_Bill,"WP_ROAST_SCAVENGER");
	Wld_InsertNpc(Pal_Zombie01,"WP_GUIDE_PLAYER");
};

func void init_sub_ta_testlevel()
{
};

func void INIT_TA_Testlevel()
{
	B_InitMonsterAttitudes();
	B_InitNpcGlobals();
	init_sub_ta_testlevel();
};

instance Armor(C_Item)
{
	name = NAME_Bag;
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItMi_Bag.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = UseArmor;
	description = name;
	text[0] = "Мешок наполнен доспехами!";
};


func void UseArmor()
{
	Snd_Play("Geldbeutel");
	Print("Найдено много разных доспехов!");
	B_GiveAllClassicArmor(self);
	B_GiveAllAddonArmor(self);
	B_GiveAllPatchArmor(self);
};

instance Runenbrief(C_Item)
{
	name = "Новые руны";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItRu_TeleportOWDemonTower.3DS";
	material = MAT_STONE;
	on_state[0] = UseHosh1;
	scemeName = "MAP";
	description = name;
	text[0] = "Все руны аддона!";
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void UseHosh1()
{
	B_GiveAllAddonRunes(self);
	B_GiveAllAddonScrolls(self);
};


instance EnterBanditCamp(C_Item)
{
	name = "Пришли в бандитский лагерь";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItRu_TeleportOWDemonTower.3DS";
	material = MAT_STONE;
	on_state[0] = UseHosh2;
	scemeName = "MAP";
	description = name;
	text[0] = "Задать Player_HasTalkedToBanditCamp!";
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void UseHosh2()
{
	Player_HasTalkedToBanditCamp = TRUE;
};


instance PH(C_Item)
{
	name = "Дай мне магию";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItRu_TeleportOWDemonTower.3DS";
	material = MAT_STONE;
	on_state[0] = UsePatrickHelper;
	scemeName = "MAP";
	description = name;
	text[0] = "Небольшой тест магии!";
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void UsePatrickHelper()
{
	self.attribute[ATR_MANA_MAX] = 400;
	self.attribute[ATR_MANA] = 400;
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	Npc_SetTalentSkill(self,NPC_TALENT_RUNES,1);
	PLAYER_TALENT_RUNES[SPL_Light] = TRUE;
	PLAYER_TALENT_RUNES[SPL_Firebolt] = TRUE;
	PLAYER_TALENT_RUNES[SPL_Icebolt] = TRUE;
	PLAYER_TALENT_RUNES[SPL_LightHeal] = TRUE;
	PLAYER_TALENT_RUNES[SPL_SummonGoblinSkeleton] = TRUE;
	PLAYER_TALENT_RUNES[SPL_InstantFireball] = TRUE;
	PLAYER_TALENT_RUNES[SPL_Zap] = TRUE;
	PLAYER_TALENT_RUNES[SPL_SummonWolf] = TRUE;
	PLAYER_TALENT_RUNES[SPL_WindFist] = TRUE;
	PLAYER_TALENT_RUNES[SPL_Sleep] = TRUE;
	PLAYER_TALENT_RUNES[SPL_MediumHeal] = TRUE;
	PLAYER_TALENT_RUNES[SPL_LightningFlash] = TRUE;
	PLAYER_TALENT_RUNES[SPL_ChargeFireball] = TRUE;
	PLAYER_TALENT_RUNES[SPL_SummonSkeleton] = TRUE;
	PLAYER_TALENT_RUNES[SPL_Fear] = TRUE;
	PLAYER_TALENT_RUNES[SPL_IceCube] = TRUE;
	PLAYER_TALENT_RUNES[SPL_ChargeZap] = TRUE;
	PLAYER_TALENT_RUNES[SPL_SummonGolem] = TRUE;
	PLAYER_TALENT_RUNES[SPL_DestroyUndead] = TRUE;
	PLAYER_TALENT_RUNES[SPL_Pyrokinesis] = TRUE;
	PLAYER_TALENT_RUNES[SPL_Firestorm] = TRUE;
	PLAYER_TALENT_RUNES[SPL_IceWave] = TRUE;
	PLAYER_TALENT_RUNES[SPL_SummonDemon] = TRUE;
	PLAYER_TALENT_RUNES[SPL_FullHeal] = TRUE;
	PLAYER_TALENT_RUNES[SPL_Firerain] = TRUE;
	PLAYER_TALENT_RUNES[SPL_BreathOfDeath] = TRUE;
	PLAYER_TALENT_RUNES[SPL_MassDeath] = TRUE;
	PLAYER_TALENT_RUNES[SPL_ArmyOfDarkness] = TRUE;
	PLAYER_TALENT_RUNES[SPL_Shrink] = TRUE;
	PLAYER_TALENT_RUNES[SPL_Whirlwind] = TRUE;
	PLAYER_TALENT_RUNES[SPL_Geyser] = TRUE;
	PLAYER_TALENT_RUNES[SPL_GreenTentacle] = TRUE;
	PLAYER_TALENT_RUNES[SPL_Swarm] = TRUE;
	PLAYER_TALENT_RUNES[SPL_WaterFist] = TRUE;
	B_GiveAllAddonRunes(self);
};


instance Hosh4(C_Item)
{
	name = "Грег вернулся";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItRu_TeleportOWDemonTower.3DS";
	material = MAT_STONE;
	scemeName = "MAP";
	description = name;
	text[0] = "Вернуть Грега в лагерь пиратов.";
	on_state[0] = UseHoshiTagebuch;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void UseHoshiTagebuch()
{
	GregIsBack_S1();
};

var int TimeDemoStarted;

instance TimeDemo(C_Item)
{
	name = "Руна TimeDemo";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItRu_TeleportOWDemonTower.3DS";
	material = MAT_STONE;
	scemeName = "MAP";
	description = name;
	text[0] = "Запустить камеру TimeDemo.";
	on_state[0] = UseTimeDemo;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void UseTimeDemo()
{
	if(TimeDemoStarted == FALSE)
	{
		Wld_SendTrigger("TIMEDEMO");
		TimeDemoStarted = TRUE;
	}
	else
	{
		Wld_SendUntrigger("TIMEDEMO");
		TimeDemoStarted = FALSE;
	};
};*/

instance AttBook(C_Item) //TODO перенести в StatsBook
{
	name = "Книга атрибутов";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_GregsLogbuch_MIS.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
	on_state[0] = UseAttributesBook;
};


func void UseAttributesBook()
{
	if(C_NpcIsHero(self))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_SetFont(nDocID,0,FONT_Book);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,ConcatStrings("Сила: ",IntToString(hero.attribute[ATR_STRENGTH])));
		Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(ATR_Training[ATR_STRENGTH])," - учителя"));
		Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(ATR_PermBonus[ATR_STRENGTH])," - постоянные бонусы"));
		Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(ATR_TempBonus[ATR_STRENGTH])," - временные бонусы"));
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,ConcatStrings("Ловкость: ",IntToString(hero.attribute[ATR_DEXTERITY])));
		Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(ATR_Training[ATR_DEXTERITY])," - учителя"));
		Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(ATR_PermBonus[ATR_DEXTERITY])," - постоянные бонусы"));
		Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(ATR_TempBonus[ATR_DEXTERITY])," - временные бонусы"));
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,ConcatStrings("Макс. мана: ",IntToString(hero.attribute[ATR_MANA_MAX])));
		Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(ATR_Training[ATR_MANA_MAX])," - учителя"));
		Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(ATR_PermBonus[ATR_MANA_MAX])," - постоянные бонусы"));
		Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(ATR_TempBonus[ATR_MANA_MAX])," - временные бонусы"));
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,ConcatStrings("Макс. здоровье: ",IntToString(hero.attribute[ATR_HITPOINTS_MAX])));
		Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(ATR_Training[ATR_HITPOINTS_MAX])," - учителя"));
		Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(ATR_PermBonus[ATR_HITPOINTS_MAX])," - постоянные бонусы"));
		Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(ATR_TempBonus[ATR_HITPOINTS_MAX])," - временные бонусы"));
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_SetFont(nDocID,1,FONT_Book);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,ConcatStrings("Одноручное оружие: ",IntToString(hero.HitChance[NPC_TALENT_1H])));
		Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(TAL_Training[NPC_TALENT_1H])," - учителя"));
		Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(TAL_PermBonus[NPC_TALENT_1H])," - постоянные бонусы"));
		Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(TAL_TempBonus[NPC_TALENT_1H])," - временные бонусы"));
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,ConcatStrings("Двуручное оружие: ",IntToString(hero.HitChance[NPC_TALENT_2H])));
		Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(TAL_Training[NPC_TALENT_2H])," - учителя"));
		Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(TAL_PermBonus[NPC_TALENT_2H])," - постоянные бонусы"));
		Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(TAL_TempBonus[NPC_TALENT_2H])," - временные бонусы"));
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,ConcatStrings("Луки: ",IntToString(hero.HitChance[NPC_TALENT_BOW])));
		Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(TAL_Training[NPC_TALENT_BOW])," - учителя"));
		Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(TAL_PermBonus[NPC_TALENT_BOW])," - постоянные бонусы"));
		Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(TAL_TempBonus[NPC_TALENT_BOW])," - временные бонусы"));
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,ConcatStrings("Арбалеты: ",IntToString(hero.HitChance[NPC_TALENT_CROSSBOW])));
		Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(TAL_Training[NPC_TALENT_CROSSBOW])," - учителя"));
		Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(TAL_PermBonus[NPC_TALENT_CROSSBOW])," - постоянные бонусы"));
		Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(TAL_TempBonus[NPC_TALENT_CROSSBOW])," - временные бонусы"));
		Doc_Show(nDocID);
	};
};

instance PickPocketSyncer(C_Item)
{
	name = "Руна обновления";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItRu_TeleportOWDemonTower.3DS";
	material = MAT_STONE;
	scemeName = "MAP";
	description = name;
	text[0] = "Обновить предметы для кражи.";
	on_state[0] = UsePickPocketSyncer;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void UsePickPocketSyncer()
{
	B_SyncItemsToSteal();
	PrintScreen("Предметы для кражи обновлены",-1,55,FONT_Screen,4);
};

instance MobsiBrief(C_Item)
{
	name = "Руна MobsiBrief";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItRu_TeleportOWDemonTower.3DS";
	material = MAT_STONE;
	scemeName = "MAP";
	description = name;
	text[0] = "Исправить блокировку состояния.";
	on_state[0] = UseMobsiBrief;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void UseMobsiBrief()
{
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PrintScreen("PLAYER_MOBSI_PRODUCTION = MOBSI_NONE",-1,50,FONT_Screen,4);
	PrintScreen("self.aivar[AIV_INVINCIBLE] = FALSE",-1,55,FONT_Screen,4);
};

instance Gold(C_Item)
{
	name = NAME_Bag;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItMi_Bag.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = UseGold;
	description = name;
	text[0] = "Целый мешок золота!";
};


func void UseGold()
{
	B_PlayerFindItem(ItMi_Gold,1000);
	PrintScreen("Наказание за читерство",-1,50,FONT_Screen,2);
	B_GivePlayerXP(XP_EXPLOITBONUS);
};

