
const int MAX_CHAPTER = 5;
const int MAX_MISSIONS = 5;
const int MAX_HITCHANCE = 5;

class C_Npc
{
	var int id;
	var string name[5];
	var string slot;
	var string effect;
	var int npcType;
	var int flags;
	var int attribute[ATR_INDEX_MAX];
	var int HitChance[MAX_HITCHANCE];
	var int protection[PROT_INDEX_MAX];
	var int damage[DAM_INDEX_MAX];
	var int damagetype;
	var int guild;
	var int level;
	var func mission[5];
	var int fight_tactic;
	var int weapon;
	var int voice;
	var int voicePitch;
	var int bodymass;
	var func daily_routine;
	var func start_aistate;
	var string spawnPoint;
	var int spawnDelay;
	var int senses;
	var int senses_range;
	var int aivar[100];
	var string wp;
	var int exp;
	var int exp_next;
	var int lp;
	var int bodyStateInterruptableOverride;
	var int noFocus;
};

class C_Mission
{
	var string name;
	var string description;
	var int duration;
	var int important;
	var func offerConditions;
	var func offer;
	var func successConditions;
	var func success;
	var func failureConditions;
	var func failure;
	var func obsoleteConditions;
	var func obsolete;
	var func running;
};

class C_Item
{
	var int id;
	var string name;
	var string nameID;
	var int hp;
	var int hp_max;
	var int mainflag;
	var int flags;
	var int weight;
	var int value;
	var int damagetype;
	var int damageTotal;
	var int damage[DAM_INDEX_MAX];
	var int wear;
	var int protection[PROT_INDEX_MAX];
	var int nutrition;
	var int cond_atr[3];
	var int cond_value[3];
	var int change_atr[3];
	var int change_value[3];
	var func magic;
	var func on_equip;
	var func on_unequip;
	var func on_state[4];
	var func owner;
	var int ownerGuild;
	var int disguiseGuild;
	var string visual;
	var string visual_change;
	var string effect;
	var int visual_skin;
	var string scemeName;
	var int material;
	var int munition;
	var int spell;
	var int range;
	var int mag_circle;
	var string description;
	var string text[6];
	var int count[6];
	var int inv_zbias;
	var int inv_rotx;
	var int inv_roty;
	var int inv_rotz;
	var int inv_animate;
};

class C_Focus
{
	var float npc_longrange;
	var float npc_range1;
	var float npc_range2;
	var float npc_azi;
	var float npc_elevdo;
	var float npc_elevup;
	var int npc_prio;
	var float item_range1;
	var float item_range2;
	var float item_azi;
	var float item_elevdo;
	var float item_elevup;
	var int item_prio;
	var float mob_range1;
	var float mob_range2;
	var float mob_azi;
	var float mob_elevdo;
	var float mob_elevup;
	var int mob_prio;
};

class C_Info
{
	var int npc;
	var int nr;
	var int important;
	var func condition;
	var func information;
	var string description;
	var int trade;
	var int permanent;
};

class C_ITEMREACT
{
	var int npc;
	var int trade_item;
	var int trade_amount;
	var int requested_cat;
	var int requested_item;
	var int requested_amount;
	var func reaction;
};

class C_Spell
{
	var float time_per_mana;
	var int damage_per_level;
	var int damagetype;
	var int spellType;
	var int canTurnDuringInvest;
	var int canChangeTargetDuringInvest;
	var int isMultiEffect;
	var int targetCollectAlgo;
	var int targetCollectType;
	var int targetCollectRange;
	var int targetCollectAzi;
	var int targetCollectElev;
};

instance self(C_Npc)
{
};

instance other(C_Npc)
{
};

instance victim(C_Npc)
{
};

instance item(C_Item)
{
};

instance hero(C_Npc)
{
};

