
var int PrayIdolDay;
var int PrayIdolDayOne;

var int Stats_Beliar_GoldTaken;
var int Stats_Beliar_HpGiven;
var int Stats_Beliar_ManaGiven;

const int BeliarsGoldMultiplier = 50;
const int BeliarsDispo = 10000;

func int C_PrayedIdolToday()
{
	if(Wld_GetDay() == 0)
	{
		if(PrayIdolDayOne == TRUE)
		{
			return TRUE;
		};
	}
	else if(PrayIdolDay == Wld_GetDay())
	{
		return TRUE;
	};
	return FALSE;
};

func void B_HitpointAngleich(var int BeliarsCost)
{
	var int CurrentHitpoints;
	Stats_Beliar_HpGiven += BeliarsCost;
	Npc_ChangeAttribute(hero,ATR_HITPOINTS_MAX,-BeliarsCost);
	ATR_PermBonus[ATR_HITPOINTS_MAX] -= BeliarsCost;
	CurrentHitpoints = hero.attribute[ATR_HITPOINTS] - BeliarsCost;
	if(CurrentHitpoints < 2)
	{
		CurrentHitpoints = 2;
	};
	hero.attribute[ATR_HITPOINTS] = CurrentHitpoints;
	PrintScreen(ConcatStrings(PRINT_Beliarshitpoints_MAX,IntToString(BeliarsCost)),-1,-1,FONT_Screen,4);
};

func void B_ManaAngleich(var int BeliarsCost)
{
	var int CurrentMana;
	Stats_Beliar_ManaGiven += BeliarsCost;
	B_UnEquipIllegalMagicItems(BeliarsCost);
	Npc_ChangeAttribute(hero,ATR_MANA_MAX,-BeliarsCost);
	ATR_PermBonus[ATR_MANA_MAX] -= BeliarsCost;
	CurrentMana = hero.attribute[ATR_MANA] - BeliarsCost;
	if(CurrentMana < 0)
	{
		CurrentMana = 0;
	};
	hero.attribute[ATR_MANA] = CurrentMana;
	PrintScreen(ConcatStrings(PRINT_Beliarsmana_MAX,IntToString(BeliarsCost)),-1,-1,FONT_Screen,4);
};

func void B_BlitzInArsch()
{
	var int BlitzInArsch_Hitpoints;
	var int CurrentHitpoints;
	var int Abzug;
	CurrentHitpoints = hero.attribute[ATR_HITPOINTS];
	BlitzInArsch_Hitpoints = (CurrentHitpoints * 4) / 5;
	if(BlitzInArsch_Hitpoints < 2)
	{
		BlitzInArsch_Hitpoints = 2;
	};
	Abzug = hero.attribute[ATR_HITPOINTS] - BlitzInArsch_Hitpoints;
	if(Abzug > 0)
	{
		Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
	};
	hero.attribute[ATR_HITPOINTS] = BlitzInArsch_Hitpoints;
};

func void B_GetBeliarsGold(var int Kohle)
{
	Stats_Beliar_GoldTaken += Kohle;
	if(Stats_Beliar_GoldTaken > BeliarsDispo)
	{
		Kohle = 100;
	};
	CreateInvItems(hero,ItMi_Gold,Kohle);
	AI_PrintScreen(ConcatStrings(IntToString(Kohle),PRINT_GoldTaken),-1,YPOS_GoldTaken,FONT_ScreenSmall,2);
	Snd_Play("CS_Prayer_FokusFinal");
};


func void B_PrayIdol(var int attribute,var int amount)
{
	var int gold;
	if(C_PrayedIdolToday() || (Stats_Beliar_GoldTaken >= BeliarsDispo))
	{
		B_BlitzInArsch();
	}
	else
	{
		if(attribute == ATR_HITPOINTS_MAX)
		{
			B_HitpointAngleich(amount);
			gold = amount * BeliarsGoldMultiplier;
		}
		else if(attribute == ATR_MANA_MAX)
		{
			B_ManaAngleich(amount);
			gold = amount * BeliarsGoldMultiplier * 10;
		};
		if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
		{
			B_GetBeliarsGold(gold / 2);
		}
		else
		{
			B_GetBeliarsGold(gold);
		};
	};
	PrayIdolDay = Wld_GetDay();
	if(PrayIdolDay == 0)
	{
		PrayIdolDayOne = TRUE;
	};
};

func void PrayIdol_S1()
{
	if(C_NpcIsHero(self))
	{
		Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_PRAYIDOL;
		AI_ProcessInfos(self);
	};
};


instance PC_PrayIdol_End(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_PrayIdol_End_Condition;
	information = PC_PrayIdol_End_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int PC_PrayIdol_End_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_PRAYIDOL)
	{
		return TRUE;
	};
};

func void PC_PrayIdol_End_Info()
{
	B_EndProductionDialog();
};


instance PC_PrayIdol_PrayIdol(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = PC_PrayIdol_PrayIdol_Condition;
	information = PC_PrayIdol_PrayIdol_Info;
	permanent = TRUE;
	description = NAME_ADDON_BETEN;
};


func int PC_PrayIdol_PrayIdol_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_PRAYIDOL)
	{
		return TRUE;
	};
};

func void PC_PrayIdol_PrayIdol_Info() //TODO при IgnoreBonuses == TRUE можно жертвовать бесконечно!
{
	Info_ClearChoices(PC_PrayIdol_PrayIdol);
	Info_AddChoice(PC_PrayIdol_PrayIdol,Dialog_Back,PC_PrayIdol_PrayIdol_Back);
	Info_AddChoice(PC_PrayIdol_PrayIdol,NAME_ADDON_PRAYIDOL_GIVENOTHING,PC_PrayIdol_PrayIdol_NoPay);
	if(Stats_Beliar_ManaGiven <= 10)
	{
		if(RealAttributeValue(ATR_MANA_MAX) > 10)
		{
			Info_AddChoice(PC_PrayIdol_PrayIdol,NAME_ADDON_PRAYIDOL_GIVEMANA,PC_PrayIdol_PrayIdol_ManaPay);
		};
	};
	if(Stats_Beliar_HpGiven <= 50)
	{
		if(RealAttributeValue(ATR_HITPOINTS_MAX) >= 40)
		{
			Info_AddChoice(PC_PrayIdol_PrayIdol,NAME_ADDON_PRAYIDOL_GIVEHITPOINT1,PC_PrayIdol_PrayIdol_SmallPay);
			Info_AddChoice(PC_PrayIdol_PrayIdol,NAME_ADDON_PRAYIDOL_GIVEHITPOINT2,PC_PrayIdol_PrayIdol_MediumPay);
			Info_AddChoice(PC_PrayIdol_PrayIdol,NAME_ADDON_PRAYIDOL_GIVEHITPOINT3,PC_PrayIdol_PrayIdol_BigPay);
		};
	};
};

func void PC_PrayIdol_PrayIdol_Back()
{
	Info_ClearChoices(PC_PrayIdol_PrayIdol);
};

func void PC_PrayIdol_PrayIdol_NoPay()
{
	B_BlitzInArsch();
	Info_ClearChoices(PC_PrayIdol_PrayIdol);
};

func void PC_PrayIdol_PrayIdol_SmallPay()
{
	B_PrayIdol(ATR_HITPOINTS_MAX,1);
	Info_ClearChoices(PC_PrayIdol_PrayIdol);
};

func void PC_PrayIdol_PrayIdol_MediumPay()
{
	B_PrayIdol(ATR_HITPOINTS_MAX,5);
	Info_ClearChoices(PC_PrayIdol_PrayIdol);
};

func void PC_PrayIdol_PrayIdol_BigPay()
{
	B_PrayIdol(ATR_HITPOINTS_MAX,10);
	Info_ClearChoices(PC_PrayIdol_PrayIdol);
};

func void PC_PrayIdol_PrayIdol_ManaPay()
{
	B_PrayIdol(ATR_MANA_MAX,1);
	Info_ClearChoices(PC_PrayIdol_PrayIdol);
};


instance PC_PrayShrine_UPGRATEBELIARSWEAPON(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = PC_PrayShrine_UPGRATEBELIARSWEAPON_Condition;
	information = PC_PrayShrine_UPGRATEBELIARSWEAPON_Info;
	permanent = TRUE;
	description = NAME_ADDON_UPGRATEBELIARSWEAPON;
};


func int PC_PrayShrine_UPGRATEBELIARSWEAPON_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PRAYIDOL) && C_ScCanUpgrateBeliarsWeapon())
	{
		if(C_ScHasMeleeBeliarsWeapon())
		{
			return TRUE;
		};
		if(C_SCHasBeliarsRune())
		{
			return TRUE;
		};
	};
};

func void PC_PrayShrine_UPGRATEBELIARSWEAPON_Info()
{
	B_ClearBeliarsItems();
	B_UpgrateBeliarsWeapon();
};

