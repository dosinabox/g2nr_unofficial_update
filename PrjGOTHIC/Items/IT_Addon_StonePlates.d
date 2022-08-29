
const string StPl_MagicAuraText = "Эта каменная табличка излучает магическую ауру.";
const int STR_StPlLevel1 = 2;
const int STR_StPlLevel2 = 4;
const int STR_StPlLevel3 = 6;
const int DEX_StPlLevel1 = 2;
const int DEX_StPlLevel2 = 4;
const int DEX_StPlLevel3 = 6;
const int HPMax_StPlLevel1 = 5;
const int HPMax_StPlLevel2 = 10;
const int HPMax_StPlLevel3 = 15;
const int ManaMax_StPlLevel1 = 2;
const int ManaMax_StPlLevel2 = 4;
const int ManaMax_StPlLevel3 = 6;
const int OneH_StPlLevel1 = 2;
const int OneH_StPlLevel2 = 4;
const int OneH_StPlLevel3 = 6;
const int TwoH_StPlLevel1 = 2;
const int TwoH_StPlLevel2 = 4;
const int TwoH_StPlLevel3 = 6;
const int Bow_StPlLevel1 = 2;
const int Bow_StPlLevel2 = 4;
const int Bow_StPlLevel3 = 6;
const int CrsBow_StPlLevel1 = 2;
const int CrsBow_StPlLevel2 = 4;
const int CrsBow_StPlLevel3 = 6;
const int Value_StonePlateMagic = 100;
const int Value_StonePlateCommon = 5;

func void B_PrintPlayerMiddle(var C_Npc npc,var string text)
{
	if(Npc_IsPlayer(npc))
	{
		PrintScreen(text,-1,-1,FONT_Screen,2);
	};
};

func void B_RaiseAttributeByStonePlate(var int attribute,var int value)
{
	B_RaiseAttributeByPermBonus(self,attribute,value);
	Wld_PlayEffect("spellFX_LIGHTSTAR_ORANGE",self,self,0,0,0,FALSE);
	Snd_Play("SFX_HealObsession");
};

func void B_RaiseTalentByStonePlate(var C_Npc npc,var int talent,var int value)
{
	var string text;
	var int change;
	change = B_ChangeTalent(npc,talent,value,TS_PermBonus);
	if(change == 0)
	{
		B_PrintPlayerMiddle(npc,PRINT_NoLearnOverMAX);
		Mdl_ApplyOverlayMdsTimed(self,"HUMANS_STONEPLATE.MDS",500);
		B_Say(self,self,"$DONTKNOW");
		AI_Waitms(self,500);
		return;
	};
	if(talent == NPC_TALENT_1H)
	{
		text = PRINT_Learn1H;
	}
	else if(talent == NPC_TALENT_2H)
	{
		text = PRINT_Learn2H;
	}
	else if(talent == NPC_TALENT_BOW)
	{
		text = PRINT_LearnBow;
	}
	else if(talent == NPC_TALENT_CROSSBOW)
	{
		text = PRINT_LearnCrossbow;
	};
	text = ConcatStrings(text," + ");
	text = ConcatStrings(text,IntToString(change));
	B_PrintPlayerMiddle(npc,text);
	Wld_PlayEffect("spellFX_LIGHTSTAR_ORANGE",self,self,0,0,0,FALSE);
	Snd_Play("SFX_HealObsession");
};

func void B_CannotUse_Addon()
{
	var int rnd;
	rnd = Hlp_Random(100);
	if(rnd <= 20)
	{
		B_Say(self,self,"$COUGH");
	}
	else if(rnd >= 80)
	{
		B_Say(self,self,"$HUI");
	};
};

func int C_SCHasStPlSkill(var int level)
{
	if(level == LANGUAGE_1)
	{
		if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
		{
			return TRUE;
		};
	}
	else if(level == LANGUAGE_2)
	{
		if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE)
		{
			return TRUE;
		};
	}
	else if(level == LANGUAGE_3)
	{
		if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == TRUE)
		{
			return TRUE;
		};
	};
	return FALSE;
};

func void Use_StonePlate(var int level,var int attribute,var int talent,var int value)
{
	if(!C_SCHasStPlSkill(level))
	{
		Mdl_ApplyOverlayMdsTimed(self,"HUMANS_STONEPLATE.MDS",500);
		B_CannotUse_Addon();
		B_Say(self,self,"$CANTREADTHIS");
		AI_Waitms(self,500);
	}
	else
	{
		if(attribute > 0)
		{
			B_RaiseAttributeByStonePlate(attribute,value);
		}
		else if(talent > 0)
		{
			B_RaiseTalentByStonePlate(self,talent,value);
		};
	};
};


prototype Prototype_StonePlate(C_Item)
{
	name = "Каменная табличка";
//	mainflag = ITEM_KAT_DOCS;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = Value_StonePlateMagic;
	visual = "ItMi_StonePlate_PowerUp_01.3DS";
	material = MAT_STONE;
	scemeName = "MAPSEALED";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	text[2] = StPl_MagicAuraText;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItWr_StrStonePlate1_Addon(Prototype_StonePlate)
{
	description = "Каменная табличка силы I";
	on_state[0] = Use_StrStonePlate1;
	visual = "ItMi_StonePlate_PowerUp_01.3DS";
};


func void Use_StrStonePlate1()
{
	Use_StonePlate(LANGUAGE_1,ATR_STRENGTH,0,STR_StPlLevel1);
};


instance ItWr_StrStonePlate2_Addon(Prototype_StonePlate)
{
	description = "Каменная табличка силы II";
	on_state[0] = Use_StrStonePlate2;
	visual = "ItMi_StonePlate_PowerUp_01.3DS";
};


func void Use_StrStonePlate2()
{
	Use_StonePlate(LANGUAGE_2,ATR_STRENGTH,0,STR_StPlLevel2);
};


instance ItWr_StrStonePlate3_Addon(Prototype_StonePlate)
{
	description = "Каменная табличка силы III";
	on_state[0] = Use_StrStonePlate3;
	visual = "ItMi_StonePlate_PowerUp_01.3DS";
};


func void Use_StrStonePlate3()
{
	Use_StonePlate(LANGUAGE_3,ATR_STRENGTH,0,STR_StPlLevel3);
};


instance ItWr_DexStonePlate1_Addon(Prototype_StonePlate)
{
	description = "Каменная табличка ловкости I";
	on_state[0] = Use_DexStonePlate1;
	visual = "ItMi_StonePlate_PowerUp_02.3DS";
};


func void Use_DexStonePlate1()
{
	Use_StonePlate(LANGUAGE_1,ATR_DEXTERITY,0,DEX_StPlLevel1);
};


instance ItWr_DexStonePlate2_Addon(Prototype_StonePlate)
{
	description = "Каменная табличка ловкости II";
	on_state[0] = Use_DexStonePlate2;
	visual = "ItMi_StonePlate_PowerUp_02.3DS";
};


func void Use_DexStonePlate2()
{
	Use_StonePlate(LANGUAGE_2,ATR_DEXTERITY,0,DEX_StPlLevel2);
};


instance ItWr_DexStonePlate3_Addon(Prototype_StonePlate)
{
	description = "Каменная табличка ловкости III";
	on_state[0] = Use_DexStonePlate3;
	visual = "ItMi_StonePlate_PowerUp_02.3DS";
};


func void Use_DexStonePlate3()
{
	Use_StonePlate(LANGUAGE_3,ATR_DEXTERITY,0,DEX_StPlLevel3);
};


instance ItWr_HitPointStonePlate1_Addon(Prototype_StonePlate)
{
	description = "Каменная табличка жизненной силы I";
	on_state[0] = Use_HitPointStonePlate1;
	visual = "ItMi_StonePlate_PowerUp_06.3DS";
};


func void Use_HitPointStonePlate1()
{
	Use_StonePlate(LANGUAGE_1,ATR_HITPOINTS_MAX,0,HPMax_StPlLevel1);
};


instance ItWr_HitPointStonePlate2_Addon(Prototype_StonePlate)
{
	description = "Каменная табличка жизненной силы II";
	on_state[0] = Use_HitPointStonePlate2;
	visual = "ItMi_StonePlate_PowerUp_06.3DS";
};


func void Use_HitPointStonePlate2()
{
	Use_StonePlate(LANGUAGE_2,ATR_HITPOINTS_MAX,0,HPMax_StPlLevel2);
};


instance ItWr_HitPointStonePlate3_Addon(Prototype_StonePlate)
{
	description = "Каменная табличка жизненной силы III";
	on_state[0] = Use_HitPointStonePlate3;
	visual = "ItMi_StonePlate_PowerUp_06.3DS";
};


func void Use_HitPointStonePlate3()
{
	Use_StonePlate(LANGUAGE_3,ATR_HITPOINTS_MAX,0,HPMax_StPlLevel3);
};


instance ItWr_ManaStonePlate1_Addon(Prototype_StonePlate)
{
	description = "Каменная табличка магии I";
	on_state[0] = Use_ManaStonePlate1;
	visual = "ItMi_StonePlate_PowerUp_05.3DS";
};


func void Use_ManaStonePlate1()
{
	Use_StonePlate(LANGUAGE_1,ATR_MANA_MAX,0,ManaMax_StPlLevel1);
};


instance ItWr_ManaStonePlate2_Addon(Prototype_StonePlate)
{
	description = "Каменная табличка магии II";
	on_state[0] = Use_ManaStonePlate2;
	visual = "ItMi_StonePlate_PowerUp_05.3DS";
};


func void Use_ManaStonePlate2()
{
	Use_StonePlate(LANGUAGE_2,ATR_MANA_MAX,0,ManaMax_StPlLevel2);
};


instance ItWr_ManaStonePlate3_Addon(Prototype_StonePlate)
{
	description = "Каменная табличка магии III";
	on_state[0] = Use_ManaStonePlate3;
	visual = "ItMi_StonePlate_PowerUp_05.3DS";
};


func void Use_ManaStonePlate3()
{
	Use_StonePlate(LANGUAGE_3,ATR_MANA_MAX,0,ManaMax_StPlLevel3);
};


instance ItWr_OneHStonePlate1_Addon(Prototype_StonePlate)
{
	description = "Каменная табличка одноручного оружия I";
	on_state[0] = Use_OneHStonePlate1;
	visual = "ItMi_StonePlate_PowerUp_04.3DS";
};


func void Use_OneHStonePlate1()
{
	Use_StonePlate(LANGUAGE_1,0,NPC_TALENT_1H,OneH_StPlLevel1);
};


instance ItWr_OneHStonePlate2_Addon(Prototype_StonePlate)
{
	description = "Каменная табличка одноручного оружия II";
	on_state[0] = Use_OneHStonePlate2;
	visual = "ItMi_StonePlate_PowerUp_04.3DS";
};


func void Use_OneHStonePlate2()
{
	Use_StonePlate(LANGUAGE_2,0,NPC_TALENT_1H,OneH_StPlLevel2);
};


instance ItWr_OneHStonePlate3_Addon(Prototype_StonePlate)
{
	description = "Каменная табличка одноручного оружия III";
	on_state[0] = Use_OneHStonePlate3;
	visual = "ItMi_StonePlate_PowerUp_04.3DS";
};


func void Use_OneHStonePlate3()
{
	Use_StonePlate(LANGUAGE_3,0,NPC_TALENT_1H,OneH_StPlLevel3);
};


instance ItWr_TwoHStonePlate1_Addon(Prototype_StonePlate)
{
	description = "Каменная табличка двуручного оружия I";
	on_state[0] = Use_TwoHStonePlate1;
	visual = "ItMi_StonePlate_PowerUp_04.3DS";
};


func void Use_TwoHStonePlate1()
{
	Use_StonePlate(LANGUAGE_1,0,NPC_TALENT_2H,TwoH_StPlLevel1);
};


instance ItWr_TwoHStonePlate2_Addon(Prototype_StonePlate)
{
	description = "Каменная табличка двуручного оружия II";
	on_state[0] = Use_TwoHStonePlate2;
	visual = "ItMi_StonePlate_PowerUp_04.3DS";
};


func void Use_TwoHStonePlate2()
{
	Use_StonePlate(LANGUAGE_2,0,NPC_TALENT_2H,TwoH_StPlLevel2);
};


instance ItWr_TwoHStonePlate3_Addon(Prototype_StonePlate)
{
	description = "Каменная табличка двуручного оружия III";
	on_state[0] = Use_TwoHStonePlate3;
	visual = "ItMi_StonePlate_PowerUp_04.3DS";
};


func void Use_TwoHStonePlate3()
{
	Use_StonePlate(LANGUAGE_3,0,NPC_TALENT_2H,TwoH_StPlLevel3);
};


instance ItWr_BowStonePlate1_Addon(Prototype_StonePlate)
{
	description = "Каменная табличка стрельбы из лука I";
	on_state[0] = Use_BowStonePlate1;
	visual = "ItMi_StonePlate_PowerUp_03.3DS";
};


func void Use_BowStonePlate1()
{
	Use_StonePlate(LANGUAGE_1,0,NPC_TALENT_BOW,Bow_StPlLevel1);
};


instance ItWr_BowStonePlate2_Addon(Prototype_StonePlate)
{
	description = "Каменная табличка стрельбы из лука II";
	on_state[0] = Use_BowStonePlate2;
	visual = "ItMi_StonePlate_PowerUp_03.3DS";
};


func void Use_BowStonePlate2()
{
	Use_StonePlate(LANGUAGE_2,0,NPC_TALENT_BOW,Bow_StPlLevel2);
};


instance ItWr_BowStonePlate3_Addon(Prototype_StonePlate)
{
	description = "Каменная табличка стрельбы из лука III";
	on_state[0] = Use_BowStonePlate3;
	visual = "ItMi_StonePlate_PowerUp_03.3DS";
};


func void Use_BowStonePlate3()
{
	Use_StonePlate(LANGUAGE_3,0,NPC_TALENT_BOW,Bow_StPlLevel3);
};


instance ItWr_CrsBowStonePlate1_Addon(Prototype_StonePlate)
{
	description = "Каменная табличка стрельбы из арбалета I";
	on_state[0] = Use_CrsBowStonePlate1;
	visual = "ItMi_StonePlate_PowerUp_03.3DS";
};


func void Use_CrsBowStonePlate1()
{
	Use_StonePlate(LANGUAGE_1,0,NPC_TALENT_CROSSBOW,CrsBow_StPlLevel1);
};


instance ItWr_CrsBowStonePlate2_Addon(Prototype_StonePlate)
{
	description = "Каменная табличка стрельбы из арбалета II";
	on_state[0] = Use_CrsBowStonePlate2;
	visual = "ItMi_StonePlate_PowerUp_03.3DS";
};


func void Use_CrsBowStonePlate2()
{
	Use_StonePlate(LANGUAGE_2,0,NPC_TALENT_CROSSBOW,CrsBow_StPlLevel2);
};


instance ItWr_CrsBowStonePlate3_Addon(Prototype_StonePlate)
{
	description = "Каменная табличка стрельбы из арбалета III";
	on_state[0] = Use_CrsBowStonePlate3;
	visual = "ItMi_StonePlate_PowerUp_03.3DS";
};


func void Use_CrsBowStonePlate3()
{
	Use_StonePlate(LANGUAGE_3,0,NPC_TALENT_CROSSBOW,CrsBow_StPlLevel3);
};

func int C_ScHasColoredStonePlate()
{
	if(Npc_HasItems(hero,ItMi_Addon_Stone_01))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItMi_Addon_Stone_02))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItMi_Addon_Stone_03))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItMi_Addon_Stone_04))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItMi_Addon_Stone_05))
	{
		return TRUE;
	};
	return FALSE;
};

func int C_ScHasMagicStonePlate()
{
	if(Npc_HasItems(hero,ItWr_StrStonePlate1_Addon))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItWr_StrStonePlate2_Addon))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItWr_StrStonePlate3_Addon))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItWr_DexStonePlate1_Addon))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItWr_DexStonePlate2_Addon))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItWr_DexStonePlate3_Addon))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItWr_HitPointStonePlate1_Addon))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItWr_HitPointStonePlate2_Addon))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItWr_HitPointStonePlate3_Addon))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItWr_ManaStonePlate1_Addon))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItWr_ManaStonePlate2_Addon))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItWr_ManaStonePlate3_Addon))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItWr_OneHStonePlate1_Addon))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItWr_OneHStonePlate2_Addon))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItWr_OneHStonePlate3_Addon))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItWr_TwoHStonePlate1_Addon))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItWr_TwoHStonePlate2_Addon))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItWr_TwoHStonePlate3_Addon))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItWr_BowStonePlate1_Addon))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItWr_BowStonePlate2_Addon))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItWr_BowStonePlate3_Addon))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItWr_CrsBowStonePlate1_Addon))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItWr_CrsBowStonePlate2_Addon))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItWr_CrsBowStonePlate3_Addon))
	{
		return TRUE;
	};
	return FALSE;
};

