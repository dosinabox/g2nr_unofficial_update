
const string FONT_Screen = "FONT_OLD_20_WHITE.TGA";
const string FONT_ScreenSmall = "FONT_OLD_10_WHITE.TGA";
const string FONT_Book = "FONT_10_BOOK.TGA";
const string FONT_BookHeadline = "FONT_20_BOOK.TGA";

const int SPL_Cost_Scroll = 5;
const int ATR_HITPOINTS = 0;
const int ATR_HITPOINTS_MAX = 1;
const int ATR_MANA = 2;
const int ATR_MANA_MAX = 3;
const int ATR_STRENGTH = 4;
const int ATR_DEXTERITY = 5;
const int ATR_REGENERATEHP = 6;
const int ATR_REGENERATEMANA = 7;
const int ATR_INDEX_MAX = 8;
const int NPC_FLAG_FRIEND = 1;
const int NPC_FLAG_IMMORTAL = 2;
const int NPC_FLAG_GHOST = 4;
const int FMODE_NONE = 0;
const int FMODE_FIST = 1;
const int FMODE_MELEE = 2;
const int FMODE_FAR = 5;
const int FMODE_MAGIC = 7;
const int NPC_RUN = 0;
const int NPC_WALK = 1;
const int NPC_SNEAK = 2;
const int NPC_RUN_WEAPON = 128;
const int NPC_WALK_WEAPON = 129;
const int NPC_SNEAK_WEAPON = 130;
const int WEAR_TORSO = 1;
const int WEAR_HEAD = 2;
const int WEAR_EFFECT = 16;
const int INV_WEAPON = 1;
const int INV_ARMOR = 2;
const int INV_RUNE = 3;
const int INV_MAGIC = 4;
const int INV_FOOD = 5;
const int INV_POTION = 6;
const int INV_DOC = 7;
const int INV_MISC = 8;
const int INV_CAT_MAX = 9;
const int INV_MAX_WEAPONS = 6;
const int INV_MAX_ARMORS = 2;
const int INV_MAX_RUNES = 1000;
const int INV_MAX_FOOD = 15;
const int INV_MAX_DOCS = 1000;
const int INV_MAX_POTIONS = 1000;
const int INV_MAX_MAGIC = 1000;
const int INV_MAX_MISC = 1000;
const int ITM_TEXT_MAX = 6;
const int ITEM_KAT_NONE = 1;
const int ITEM_KAT_NF = 2;
const int ITEM_KAT_FF = 4;
const int ITEM_KAT_MUN = 8;
const int ITEM_KAT_ARMOR = 16;
const int ITEM_KAT_FOOD = 32;
const int ITEM_KAT_DOCS = 64;
const int ITEM_KAT_POTIONS = 128;
const int ITEM_KAT_LIGHT = 256;
const int ITEM_KAT_RUNE = 512;
const int ITEM_KAT_MAGIC = 1 << 31;
const int ITEM_KAT_KEYS = 1;
const int ITEM_DAG = 1 << 13;
const int ITEM_SWD = 1 << 14;
const int ITEM_AXE = 1 << 15;
const int ITEM_2HD_SWD = 1 << 16;
const int ITEM_2HD_AXE = 1 << 17;
const int ITEM_SHIELD = 1 << 18;
const int ITEM_BOW = 1 << 19;
const int ITEM_CROSSBOW = 1 << 20;
const int ITEM_RING = 1 << 11;
const int ITEM_AMULET = 1 << 22;
const int ITEM_BELT = 1 << 24;
const int ITEM_DROPPED = 1 << 10;
const int ITEM_MISSION = 1 << 12;
const int ITEM_MULTI = 1 << 21;
const int ITEM_NFOCUS = 1 << 23;
const int ITEM_CREATEAMMO = 1 << 25;
const int ITEM_NSPLIT = 1 << 26;
const int ITEM_DRINK = 1 << 27;
const int ITEM_TORCH = 1 << 28;
const int ITEM_THROW = 1 << 29;
const int ITEM_ACTIVE = 1 << 30;
const int DAM_INVALID = 0;
const int DAM_BARRIER = 1;
const int DAM_BLUNT = 2;
const int DAM_EDGE = 4;
const int DAM_FIRE = 8;
const int DAM_FLY = 16;
const int DAM_MAGIC = 32;
const int DAM_POINT = 64;
const int DAM_FALL = 128;
const int DAM_INDEX_BARRIER = 0;
const int DAM_INDEX_BLUNT = 1;
const int DAM_INDEX_EDGE = 2;
const int DAM_INDEX_FIRE = 3;
const int DAM_INDEX_FLY = 4;
const int DAM_INDEX_MAGIC = 5;
const int DAM_INDEX_POINT = 6;
const int DAM_INDEX_FALL = 7;
const int DAM_INDEX_MAX = 8;
const int NPC_ATTACK_FINISH_DISTANCE = 180;
const int NPC_BURN_TICKS_PER_DAMAGE_POINT = 1000;
const int NPC_BURN_DAMAGE_POINTS_PER_INTERVALL = 50;
const int DAM_CRITICAL_MULTIPLIER = 2;
const int BLOOD_SIZE_DIVISOR = 1000;
const int BLOOD_DAMAGE_MAX = 200;
const int DAMAGE_FLY_CM_MAX = 2000;
const int DAMAGE_FLY_CM_MIN = 300;
const int DAMAGE_FLY_CM_PER_POINT = 5;
const int NPC_DAM_DIVE_TIME = 100;
const int IMMUNE = -1;

const float NPC_COLLISION_CORRECTION_SCALER = 0.75;

const int PROT_BARRIER = 0;
const int PROT_BLUNT = 1;
const int PROT_EDGE = 2;
const int PROT_FIRE = 3;
const int PROT_FLY = 4;
const int PROT_MAGIC = 5;
const int PROT_POINT = 6;
const int PROT_FALL = 7;
const int PROT_INDEX_MAX = 8;
const int PERC_ASSESSPLAYER = 1;
const int PERC_ASSESSENEMY = 2;
const int PERC_ASSESSFIGHTER = 3;
const int PERC_ASSESSBODY = 4;
const int PERC_ASSESSITEM = 5;
const int SENSE_SEE = 1;
const int SENSE_HEAR = 2;
const int SENSE_SMELL = 4;
const int PERC_ASSESSMURDER = 6;
const int PERC_ASSESSDEFEAT = 7;
const int PERC_ASSESSDAMAGE = 8;
const int PERC_ASSESSOTHERSDAMAGE = 9;
const int PERC_ASSESSTHREAT = 10;
const int PERC_ASSESSREMOVEWEAPON = 11;
const int PERC_OBSERVEINTRUDER = 12;
const int PERC_ASSESSFIGHTSOUND = 13;
const int PERC_ASSESSQUIETSOUND = 14;
const int PERC_ASSESSWARN = 15;
const int PERC_CATCHTHIEF = 16;
const int PERC_ASSESSTHEFT = 17;
const int PERC_ASSESSCALL = 18;
const int PERC_ASSESSTALK = 19;
const int PERC_ASSESSGIVENITEM = 20;
const int PERC_ASSESSFAKEGUILD = 21;
const int PERC_MOVEMOB = 22;
const int PERC_MOVENPC = 23;
const int PERC_DRAWWEAPON = 24;
const int PERC_OBSERVESUSPECT = 25;
const int PERC_NPCCOMMAND = 26;
const int PERC_ASSESSMAGIC = 27;
const int PERC_ASSESSSTOPMAGIC = 28;
const int PERC_ASSESSCASTER = 29;
const int PERC_ASSESSSURPRISE = 30;
const int PERC_ASSESSENTERROOM = 31;
const int PERC_ASSESSUSEMOB = 32;
const int NEWS_DONT_SPREAD = 0;
const int NEWS_SPREAD_NPC_FRIENDLY_TOWARDS_VICTIM = 1;
const int NEWS_SPREAD_NPC_FRIENDLY_TOWARDS_WITNESS = 2;
const int NEWS_SPREAD_NPC_FRIENDLY_TOWARDS_OFFENDER = 3;
const int NEWS_SPREAD_NPC_SAME_GUILD_VICTIM = 4;
const int important = 1;
const int INF_TELL = 0;
const int INF_UNKNOWN = 2;
const int LOG_Running = 1;
const int LOG_SUCCESS = 2;
const int LOG_FAILED = 3;
const int LOG_OBSOLETE = 4;
const int ATT_FRIENDLY = 3;
const int ATT_NEUTRAL = 2;
const int ATT_ANGRY = 1;
const int ATT_HOSTILE = 0;
const int GIL_NONE = 0;
const int GIL_HUMAN = 1;
const int GIL_PAL = 1;
const int GIL_MIL = 2;
const int GIL_VLK = 3;
const int GIL_KDF = 4;
const int GIL_NOV = 5;
const int GIL_DJG = 6;
const int GIL_SLD = 7;
const int GIL_BAU = 8;
const int GIL_BDT = 9;
const int GIL_STRF = 10;
const int GIL_DMT = 11;
const int GIL_OUT = 12;
const int GIL_PIR = 13;
const int GIL_KDW = 14;
const int GIL_EMPTY_D = 15;
const int GIL_PUBLIC = 15;
const int GIL_SEPERATOR_HUM = 16;
const int GIL_MEATBUG = 17;
const int GIL_SHEEP = 18;
const int GIL_GOBBO = 19;
const int GIL_GOBBO_SKELETON = 20;
const int GIL_SUMMONED_GOBBO_SKELETON = 21;
const int GIL_SCAVENGER = 22;
const int GIL_Giant_Rat = 23;
const int GIL_GIANT_BUG = 24;
const int GIL_BLOODFLY = 25;
const int GIL_WARAN = 26;
const int GIL_WOLF = 27;
const int GIL_SUMMONED_WOLF = 28;
const int GIL_MINECRAWLER = 29;
const int GIL_LURKER = 30;
const int GIL_SKELETON = 31;
const int GIL_SUMMONED_SKELETON = 32;
const int GIL_SKELETON_MAGE = 33;
const int GIL_ZOMBIE = 34;
const int GIL_SNAPPER = 35;
const int GIL_SHADOWBEAST = 36;
const int GIL_SHADOWBEAST_SKELETON = 37;
const int GIL_HARPY = 38;
const int GIL_STONEGOLEM = 39;
const int GIL_FIREGOLEM = 40;
const int GIL_ICEGOLEM = 41;
const int GIL_SUMMONED_GOLEM = 42;
const int GIL_DEMON = 43;
const int GIL_SUMMONED_DEMON = 44;
const int GIL_TROLL = 45;
const int GIL_SWAMPSHARK = 46;
const int GIL_DRAGON = 47;
const int GIL_MOLERAT = 48;
const int GIL_Alligator = 49;
const int GIL_SWAMPGOLEM = 50;
const int GIL_Stoneguardian = 51;
const int GIL_Gargoyle = 52;
const int GIL_Empty_A = 53;
const int GIL_SummonedGuardian = 54;
const int GIL_SummonedZombie = 55;
const int GIL_EMPTY_B = 56;
const int GIL_EMPTY_C = 57;
const int GIL_SEPERATOR_ORC = 58;
const int GIL_ORC = 59;
const int GIL_FRIENDLY_ORC = 60;
const int GIL_UNDEADORC = 61;
const int GIL_DRACONIAN = 62;
const int GIL_EMPTY_X = 63;
const int GIL_EMPTY_Y = 64;
const int GIL_EMPTY_Z = 65;
const int GIL_MAX = 66;

class C_GILVALUES
{
	var int water_depth_knee[GIL_MAX];
	var int water_depth_chest[GIL_MAX];
	var int jumpup_height[GIL_MAX];
	var int swim_time[GIL_MAX];
	var int dive_time[GIL_MAX];
	var int step_height[GIL_MAX];
	var int jumplow_height[GIL_MAX];
	var int jumpmid_height[GIL_MAX];
	var int slide_angle[GIL_MAX];
	var int slide_angle2[GIL_MAX];
	var int disable_autoroll[GIL_MAX];
	var int surface_align[GIL_MAX];
	var int climb_heading_angle[GIL_MAX];
	var int climb_horiz_angle[GIL_MAX];
	var int climb_ground_angle[GIL_MAX];
	var int fight_range_base[GIL_MAX];
	var int fight_range_fist[GIL_MAX];
	var int fight_range_g[GIL_MAX];
	var int fight_range_1hs[GIL_MAX];
	var int fight_range_1ha[GIL_MAX];
	var int fight_range_2hs[GIL_MAX];
	var int fight_range_2ha[GIL_MAX];
	var int falldown_height[GIL_MAX];
	var int falldown_damage[GIL_MAX];
	var int blood_disabled[GIL_MAX];
	var int blood_max_distance[GIL_MAX];
	var int blood_amount[GIL_MAX];
	var int blood_flow[GIL_MAX];
	var string blood_emitter[GIL_MAX];
	var string blood_texture[GIL_MAX];
	var int turn_speed[GIL_MAX];
};

const int NPC_SOUND_DROPTAKE = 1;
const int NPC_SOUND_SPEAK = 3;
const int NPC_SOUND_STEPS = 4;
const int NPC_SOUND_THROWCOLL = 5;
const int NPC_SOUND_DRAWWEAPON = 6;
const int NPC_SOUND_SCREAM = 7;
const int NPC_SOUND_FIGHT = 8;
const int MAT_WOOD = 0;
const int MAT_STONE = 1;
const int MAT_METAL = 2;
const int MAT_LEATHER = 3;
const int MAT_CLAY = 4;
const int MAT_GLAS = 5;
const int LOG_MISSION = 0;
const int LOG_NOTE = 1;
const int TIME_INFINITE = -1000;
const int NPC_VOICE_VARIATION_MAX = 10;

const float TRADE_VALUE_MULTIPLIER = 0.15;

const string TRADE_CURRENCY_INSTANCE = "ITMI_GOLD";

const int SPELL_GOOD = 0;
const int SPELL_NEUTRAL = 1;
const int SPELL_BAD = 2;
const int SPL_DONTINVEST = 0;
const int SPL_RECEIVEINVEST = 1;
const int SPL_SENDCAST = 2;
const int SPL_SENDSTOP = 3;
const int SPL_NEXTLEVEL = 4;
const int SPL_STATUS_CANINVEST_NO_MANADEC = 8;
const int SPL_FORCEINVEST = 1 << 16;
const int TARGET_COLLECT_NONE = 0;
const int TARGET_COLLECT_CASTER = 1;
const int TARGET_COLLECT_FOCUS = 2;
const int TARGET_COLLECT_ALL = 3;
const int TARGET_COLLECT_FOCUS_FALLBACK_NONE = 4;
const int TARGET_COLLECT_FOCUS_FALLBACK_CASTER = 5;
const int TARGET_COLLECT_ALL_FALLBACK_NONE = 6;
const int TARGET_COLLECT_ALL_FALLBACK_CASTER = 7;
const int TARGET_TYPE_ALL = 1;
const int TARGET_TYPE_ITEMS = 2;
const int TARGET_TYPE_NPCS = 4;
const int TARGET_TYPE_ORCS = 8;
const int TARGET_TYPE_HUMANS = 16;
const int TARGET_TYPE_UNDEAD = 32;
const int SPL_PalLight = 0;
const int SPL_PalLightHeal = 1;
const int SPL_PalHolyBolt = 2;
const int SPL_PalMediumHeal = 3;
const int SPL_PalRepelEvil = 4;
const int SPL_PalFullHeal = 5;
const int SPL_PalDestroyEvil = 6;
const int SPL_PalTeleportSecret = 7;
const int SPL_TeleportSeaport = 8;
const int SPL_TeleportMonastery = 9;
const int SPL_TeleportFarm = 10;
const int SPL_TeleportXardas = 11;
const int SPL_TeleportPassNW = 12;
const int SPL_TeleportPassOW = 13;
const int SPL_TeleportOC = 14;
const int SPL_TeleportOWDemonTower = 15;
const int SPL_TeleportTaverne = 16;
const int SPL_Teleport_3 = 17;
const int SPL_Light = 18;
const int SPL_Firebolt = 19;
const int SPL_Icebolt = 20;
const int SPL_LightHeal = 21;
const int SPL_SummonGoblinSkeleton = 22;
const int SPL_InstantFireball = 23;
const int SPL_Zap = 24;
const int SPL_SummonWolf = 25;
const int SPL_WindFist = 26;
const int SPL_Sleep = 27;
const int SPL_MediumHeal = 28;
const int SPL_LightningFlash = 29;
const int SPL_ChargeFireball = 30;
const int SPL_SummonSkeleton = 31;
const int SPL_Fear = 32;
const int SPL_IceCube = 33;
const int SPL_ChargeZap = 34;
const int SPL_SummonGolem = 35;
const int SPL_DestroyUndead = 36;
const int SPL_Pyrokinesis = 37;
const int SPL_Firestorm = 38;
const int SPL_IceWave = 39;
const int SPL_SummonDemon = 40;
const int SPL_FullHeal = 41;
const int SPL_Firerain = 42;
const int SPL_BreathOfDeath = 43;
const int SPL_MassDeath = 44;
const int SPL_ArmyOfDarkness = 45;
const int SPL_Shrink = 46;
const int SPL_TrfSheep = 47;
const int SPL_TrfScavenger = 48;
const int SPL_TrfGiantRat = 49;
const int SPL_TrfGiantBug = 50;
const int SPL_TrfWolf = 51;
const int SPL_TrfWaran = 52;
const int SPL_TrfSnapper = 53;
const int SPL_TrfWarg = 54;
const int SPL_TrfFireWaran = 55;
const int SPL_TrfLurker = 56;
const int SPL_TrfShadowbeast = 57;
const int SPL_TrfDragonSnapper = 58;
const int SPL_Charm = 59;
const int SPL_MasterOfDisaster = 60;
const int SPL_Deathbolt = 61;
const int SPL_Deathball = 62;
const int SPL_ConcussionBolt = 63;
const int SPL_Reserved_64 = 64;
const int SPL_Reserved_65 = 65;
const int SPL_Reserved_66 = 66;
const int SPL_Reserved_67 = 67;
const int SPL_Reserved_68 = 68;
const int SPL_Reserved_69 = 69;
const int SPL_Thunderstorm = 70;
const int SPL_Whirlwind = 71;
const int SPL_WaterFist = 72;
const int SPL_IceLance = 73;
const int SPL_Inflate = 74;
const int SPL_Geyser = 75;
const int SPL_Waterwall = 76;
const int SPL_Reserved_77 = 77;
const int SPL_Reserved_78 = 78;
const int SPL_Reserved_79 = 79;
const int SPL_Plague = 80;
const int SPL_Swarm = 81;
const int SPL_GreenTentacle = 82;
const int SPL_Earthquake = 83;
const int SPL_SummonGuardian = 84;
const int SPL_Energyball = 85;
const int SPL_SuckEnergy = 86;
const int SPL_Skull = 87;
const int SPL_SummonZombie = 88;
const int SPL_SummonMud = 89;
const int SPL_Reserved_90 = 90;
const int SPL_Reserved_91 = 91;
const int SPL_Reserved_92 = 92;
const int SPL_Reserved_93 = 93;
const int SPL_Reserved_94 = 94;
const int SPL_Reserved_95 = 95;
const int SPL_Reserved_96 = 96;
const int SPL_Reserved_97 = 97;
const int SPL_Reserved_98 = 98;
const int SPL_Reserved_99 = 99;
const int MAX_SPELL = 100;


const string spellFxInstanceNames[100] =
{
	"PalLight",
	"PalHeal",
	"PalHolyBolt",
	"PalHeal",
	"PalRepelEvil",
	"PalHeal",
	"PalDestroyEvil",
	"Teleport",
	"Teleport",
	"Teleport",
	"Teleport",
	"Teleport",
	"Teleport",
	"Teleport",
	"Teleport",
	"Teleport",
	"Teleport",
	"Teleport",
	"Light",
	"Firebolt",
	"Icebolt",
	"Heal",
	"SummonGoblinSkeleton",
	"InstantFireball",
	"Zap",
	"SummonWolf",
	"WindFist",
	"Sleep",
	"Heal",
	"LightningFlash",
	"ChargeFireball",
	"SummonSkeleton",
	"Fear",
	"Icecube",
	"ChargeZap",
	"SummonGolem",
	"DestroyUndead",
	"Pyrokinesis",
	"Firestorm",
	"Icewave",
	"SummonDemon",
	"Heal",
	"Firerain",
	"BreathOfDeath",
	"MassDeath",
	"ArmyOfDarkness",
	"Shrink",
	"Transform",
	"Transform",
	"Transform",
	"Transform",
	"Transform",
	"Transform",
	"Transform",
	"Transform",
	"Transform",
	"Transform",
	"Transform",
	"Transform",
	"Charm",
	"MasterOfDisaster",
	"Deathbolt",
	"Deathball",
	"Concussionbolt",
	"Light",
	"Light",
	"Light",
	"Light",
	"Light",
	"Light",
	"Thunderstorm",
	"Whirlwind",
	"Waterfist",
	"IceLance",
	"Sleep",
	"Geyser",
	"Firerain",
	"Light",
	"Light",
	"Light",
	"Fear",
	"Swarm",
	"Greententacle",
	"Firerain",
	"SummonGuardian",
	"Energyball",
	"SuckEnergy",
	"Skull",
	"SummonZombie",
	"SummonMud",
	"Light",
	"Light",
	"Light",
	"Light",
	"Light",
	"Light",
	"Light",
	"Light",
	"Light",
	"Light"
};

const string spellFxAniLetters[100] =
{
	"SLE",
	"HEA",
	"FBT",
	"HEA",
	"FBT",
	"HEA",
	"FIB",
	"HEA",
	"HEA",
	"HEA",
	"HEA",
	"HEA",
	"HEA",
	"HEA",
	"HEA",
	"HEA",
	"HEA",
	"HEA",
	"SLE",
	"FBT",
	"FBT",
	"HEA",
	"SUM",
	"FBT",
	"FBT",
	"SUM",
	"WND",
	"SLE",
	"HEA",
	"WND",
	"FIB",
	"SUM",
	"FEA",
	"FRZ",
	"FIB",
	"SUM",
	"FIB",
	"FIB",
	"FIB",
	"FEA",
	"SUM",
	"HEA",
	"FEA",
	"FIB",
	"MSD",
	"SUM",
	"SLE",
	"TRF",
	"TRF",
	"TRF",
	"TRF",
	"TRF",
	"TRF",
	"TRF",
	"TRF",
	"TRF",
	"TRF",
	"TRF",
	"TRF",
	"FIB",
	"FIB",
	"FBT",
	"FBT",
	"FBT",
	"XXX",
	"XXX",
	"XXX",
	"XXX",
	"XXX",
	"XXX",
	"STM",
	"WHI",
	"WND",
	"FBT",
	"SLE",
	"WND",
	"FEA",
	"XXX",
	"XXX",
	"XXX",
	"FBT",
	"FBT",
	"FRZ",
	"FEA",
	"SUM",
	"WND",
	"WND",
	"WND",
	"SUM",
	"SUM",
	"XXX",
	"XXX",
	"XXX",
	"XXX",
	"XXX",
	"XXX",
	"XXX",
	"XXX",
	"XXX",
	"XXX"
};

const int NPC_TALENT_UNKNOWN = 0;
const int NPC_TALENT_1H = 1;
const int NPC_TALENT_2H = 2;
const int NPC_TALENT_BOW = 3;
const int NPC_TALENT_CROSSBOW = 4;
const int NPC_TALENT_PICKLOCK = 5;
const int NPC_TALENT_MAGE = 7;
const int NPC_TALENT_SNEAK = 8;
const int NPC_TALENT_REGENERATE = 9;
const int NPC_TALENT_FIREMASTER = 10;
const int NPC_TALENT_ACROBAT = 11;
const int NPC_TALENT_PICKPOCKET = 12;
const int NPC_TALENT_SMITH = 13;
const int NPC_TALENT_RUNES = 14;
const int NPC_TALENT_ALCHEMY = 15;
const int NPC_TALENT_TAKEANIMALTROPHY = 16;
const int NPC_TALENT_FOREIGNLANGUAGE = 17;
const int NPC_TALENT_WISPDETECTOR = 18;
const int NPC_TALENT_C = 19;
const int NPC_TALENT_D = 20;
const int NPC_TALENT_E = 21;
const int NPC_TALENT_MAX = 22;

var int player_talent_runes[MAX_SPELL];
const int LANGUAGE_1 = 0;
const int LANGUAGE_2 = 1;
const int LANGUAGE_3 = 2;
const int MAX_LANGUAGE = 3;

var int player_talent_foreignlanguage[MAX_LANGUAGE];
const int WISPSKILL_NF = 0;
const int WISPSKILL_FF = 1;
const int WISPSKILL_NONE = 2;
const int WISPSKILL_RUNE = 3;
const int WISPSKILL_MAGIC = 4;
const int WISPSKILL_FOOD = 5;
const int WISPSKILL_POTIONS = 6;
const int MAX_WISPSKILL = 7;

var int player_talent_wispdetector[MAX_WISPSKILL];
var int WispSearching;
const int WispSearch_Follow = 1;
const int WispSearch_ALL = 2;
const int WispSearch_POTIONS = 3;
const int WispSearch_MAGIC = 4;
const int WispSearch_FOOD = 5;
const int WispSearch_NF = 6;
const int WispSearch_FF = 7;
const int WispSearch_NONE = 8;
const int WispSearch_RUNE = 9;
const int POTION_Health_01 = 0;
const int POTION_Health_02 = 1;
const int POTION_Health_03 = 2;
const int POTION_Mana_01 = 3;
const int POTION_Mana_02 = 4;
const int POTION_Mana_03 = 5;
const int POTION_Speed = 6;
const int POTION_Perm_STR = 7;
const int POTION_Perm_DEX = 8;
const int POTION_Perm_Mana = 9;
const int POTION_Perm_Health = 10;
const int POTION_MegaDrink = 11;
const int CHARGE_Innoseye = 12;
const int POTION_Mana_04 = 13;
const int POTION_Health_04 = 14;
const int MAX_POTION = 15;

var int player_talent_alchemy[MAX_POTION];
const int WEAPON_Common = 0;
const int WEAPON_1H_Special_01 = 1;
const int WEAPON_2H_Special_01 = 2;
const int WEAPON_1H_Special_02 = 3;
const int WEAPON_2H_Special_02 = 4;
const int WEAPON_1H_Special_03 = 5;
const int WEAPON_2H_Special_03 = 6;
const int WEAPON_1H_Special_04 = 7;
const int WEAPON_2H_Special_04 = 8;
const int WEAPON_1H_Harad_01 = 9;
const int WEAPON_1H_Harad_02 = 10;
const int WEAPON_1H_Harad_03 = 11;
const int WEAPON_1H_Harad_04 = 12;
const int MAX_WEAPONS = 13;

var int player_talent_smith[MAX_WEAPONS];
const int TROPHY_Teeth = 0;
const int TROPHY_Claws = 1;
const int TROPHY_Fur = 2;
const int TROPHY_Heart = 3;
const int TROPHY_ShadowHorn = 4;
const int TROPHY_FireTongue = 5;
const int TROPHY_BFWing = 6;
const int TROPHY_BFSting = 7;
const int TROPHY_Mandibles = 8;
const int TROPHY_CrawlerPlate = 9;
const int TROPHY_DrgSnapperHorn = 10;
const int TROPHY_DragonScale = 11;
const int TROPHY_DragonBlood = 12;
const int TROPHY_ReptileSkin = 13;
const int MAX_TROPHIES = 14;

var int player_talent_takeanimaltrophy[MAX_TROPHIES];

const string TEXT_FONT_20 = "Font_old_20_white.tga";
const string TEXT_FONT_10 = "Font_old_10_white.tga";
const string TEXT_FONT_DEFAULT = "Font_old_10_white.tga";
const string TEXT_FONT_Inventory = "Font_old_10_white.tga";

const float VIEW_TIME_PER_CHAR = 550;

const int NEWWORLD_ZEN = 1;
const int OldWorld_Zen = 2;
const int DRAGONISLAND_ZEN = 3;
const int ADDONWORLD_ZEN = 4;
const int INVCAM_ENTF_RING_STANDARD = 400;
const int INVCAM_ENTF_AMULETTE_STANDARD = 150;
const int INVCAM_ENTF_MISC_STANDARD = 200;
const int INVCAM_ENTF_MISC2_STANDARD = 250;
const int INVCAM_ENTF_MISC3_STANDARD = 500;
const int INVCAM_ENTF_MISC4_STANDARD = 650;
const int INVCAM_ENTF_MISC5_STANDARD = 850;
const int INVCAM_X_RING_STANDARD = 25;
const int INVCAM_Z_RING_STANDARD = 45;
