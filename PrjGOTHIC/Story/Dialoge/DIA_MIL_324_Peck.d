
func int C_PeckIsInBarracks()
{
	if(Npc_GetDistToWP(self,"NW_CITY_ARMORY_PECK") <= 1000)
	{
		return TRUE;
	};
	if(Npc_GetDistToWP(self,"NW_CITY_BARRACK02_BED_PECK") <= 2000)
	{
		return TRUE;
	};
	return FALSE;
};

instance DIA_Peck_EXIT(C_Info)
{
	npc = MIL_324_Peck;
	nr = 999;
	condition = DIA_Peck_EXIT_Condition;
	information = DIA_Peck_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Peck_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Peck_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Peck_HEY(C_Info)
{
	npc = MIL_324_Peck;
	nr = 2;
	condition = DIA_Peck_HEY_Condition;
	information = DIA_Peck_HEY_Info;
	permanent = TRUE;
	description = "Эй, ты что делаешь тут?";
};


func int DIA_Peck_HEY_Condition()
{
	if(MIS_Andre_Peck != LOG_Running)
	{
		if(!C_PeckIsInBarracks())
		{
			return TRUE;
		};
	};
};

func void DIA_Peck_HEY_Info()
{
	AI_Output(other,self,"DIA_Peck_HEY_15_00");	//Эй, ты что делаешь тут?
	AI_Output(self,other,"DIA_Peck_HEY_12_01");	//Послушай, я занят. Оставь меня в покое.
	AI_StopProcessInfos(self);
};


instance DIA_Peck_FOUND_PECK(C_Info)
{
	npc = MIL_324_Peck;
	nr = 2;
	condition = DIA_Peck_FOUND_PECK_Condition;
	information = DIA_Peck_FOUND_PECK_Info;
	permanent = FALSE;
	description = "Эй, тебе пора возвращаться назад.";
};


func int DIA_Peck_FOUND_PECK_Condition()
{
	if(MIS_Andre_Peck == LOG_Running)
	{
		if(!C_PeckIsInBarracks())
		{
			return TRUE;
		};
	};
};

func void DIA_Peck_FOUND_PECK_Info()
{
	AI_Output(other,self,"DIA_Peck_FOUND_PECK_15_00");	//Эй, тебе пора возвращаться назад.
	AI_Output(self,other,"DIA_Peck_FOUND_PECK_12_01");	//Что тебе нужно? Ты разве не видишь, я занят?
	AI_Output(other,self,"DIA_Peck_FOUND_PECK_15_02");	//Мне нужно оружие, так что возвращайся в казармы.
	AI_Output(self,other,"DIA_Peck_FOUND_PECK_12_03");	//Черт, твое оружие может подождать.
	AI_Output(other,self,"DIA_Peck_FOUND_PECK_15_04");	//Пошли, Андрэ уже тоже ищет тебя.
	AI_Output(self,other,"DIA_Peck_FOUND_PECK_12_05");	//Хм-м-м... черт. Ладно, я уже иду - но когда будешь докладывать Андрэ, не говори ему, что я был здесь.
	self.aivar[AIV_IgnoresFakeGuild] = FALSE;
	self.aivar[AIV_ToughGuy] = FALSE;
	self.aivar[AIV_ToughGuyNewsOverride] = FALSE;
	self.aivar[AIV_IGNORE_Murder] = FALSE;
	self.aivar[AIV_IGNORE_Theft] = FALSE;
	self.aivar[AIV_IGNORE_Sheepkiller] = FALSE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"STORAGE");
	B_StartOtherRoutine(Vanja,"ALONE");
};


var int DIA_Peck_WEAPON_perm;
var int DIA_Peck_WEAPON2_perm;

func void B_GetWeaponFromPeckCh3()
{
	AI_Output(self,other,"DIA_Peck_Add_12_03");	//Хорошо, что ты спросил. Нам досталось несколько очень хороших клинков от наемников Онара.
	AI_Output(self,other,"DIA_Peck_Add_12_04");	//Они им больше не понадобятся. (грязный смех)
	AI_Output(self,other,"DIA_Peck_Add_12_05");	//Вот, возьми.
	if(MIS_Andre_Peck == LOG_FAILED)
	{
		B_GiveInvItems(self,other,ItMw_Schwert2,1);
	}
	else
	{
		B_GiveInvItems(self,other,ItMw_Rubinklinge,1);
	};
	DIA_Peck_WEAPON_perm = TRUE;
	DIA_Peck_WEAPON2_perm = TRUE;
};

instance DIA_Peck_WEAPON(C_Info)
{
	npc = MIL_324_Peck;
	nr = 2;
	condition = DIA_Peck_WEAPON_Condition;
	information = DIA_Peck_WEAPON_Info;
	permanent = TRUE;
	description = "Я пришел за оружием.";
};


func int DIA_Peck_WEAPON_Condition()
{
	if((other.guild == GIL_MIL) && (DIA_Peck_WEAPON_perm == FALSE))
	{
		if(C_PeckIsInBarracks())
		{
			return TRUE;
		};
	};
};

func void DIA_Peck_WEAPON_Info()
{
	AI_Output(other,self,"DIA_Peck_WEAPON_15_00");	//Я пришел за оружием.
	if(MIS_Andre_Peck == LOG_Running)
	{
		AI_Output(self,other,"DIA_Peck_WEAPON_12_01");	//Сходи сначала к Андрэ и доложи ему.
	}
	else if(MIS_Andre_Peck == LOG_OBSOLETE)
	{
		AI_Output(self,other,"DIA_Peck_WEAPON_12_02");	//Посмотрите, кто пришел. Наш новый друг. И ему нужен меч.
		AI_Output(self,other,"DIA_Peck_WEAPON_12_03");	//Ты не сказал Андрэ, что я был в Красном Фонаре. Похоже, ты нормальный парень. Вот, держи твой меч.
		AI_Output(self,other,"DIA_Peck_Add_12_00");	//Это лучшее, что у меня есть.
		B_GiveInvItems(self,other,ItMw_Schwert1,1);
		DIA_Peck_WEAPON_perm = TRUE;
	}
	else if(MIS_Andre_Peck == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Peck_WEAPON_12_04");	//Я не забуду тебе этого. Кто сказал Андрэ, что я был в Красном Фонаре, а?
		AI_Output(self,other,"DIA_Peck_WEAPON_12_05");	//И теперь ты хочешь получить от меня меч... хорошо, ты получишь меч. Вот. А теперь пошел к черту!
		B_GiveInvItems(self,other,ItMw_1h_MISC_Sword,1);
		DIA_Peck_WEAPON_perm = TRUE;
	}
	else if(Kapitel >= 3)
	{
		B_GetWeaponFromPeckCh3();
	};
	AI_StopProcessInfos(self);
};

func void B_Peck_LeckMich()
{
	AI_Output(self,other,"DIA_Peck_Add_12_07");	//Поцелуй мою задницу!
};

instance DIA_Peck_WEAPON2(C_Info)
{
	npc = MIL_324_Peck;
	nr = 2;
	condition = DIA_Peck_WEAPON2_Condition;
	information = DIA_Peck_WEAPON2_Info;
	permanent = TRUE;
	description = "У тебя нет оружия получше для меня?";
};


func int DIA_Peck_WEAPON2_Condition()
{
	if((other.guild == GIL_MIL) && (DIA_Peck_WEAPON_perm == TRUE) && (DIA_Peck_WEAPON2_perm == FALSE))
	{
		if(C_PeckIsInBarracks())
		{
			return TRUE;
		};
	};
};

func void DIA_Peck_WEAPON2_Info()
{
	AI_Output(other,self,"DIA_Peck_Add_15_01");	//У тебя нет оружия получше для меня?
	if(MIS_Andre_Peck == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Peck_Add_12_06");	//Я не забыл, что ты донес на меня лорду Андрэ.
		B_Peck_LeckMich();
	}
	else if(Kapitel < 3)
	{
		AI_Output(self,other,"DIA_Peck_Add_12_02");	//Пока нет...
		AI_Output(self,other,"DIA_Peck_WEAPON_12_06");	//Если тебе нужно оружие получше, иди к торговцам на рынке.
	}
	else
	{
		B_GetWeaponFromPeckCh3();
	};
};


func int C_PeckCanSellArmor()
{
	if(MIS_Addon_Andre_MissingPeople == LOG_SUCCESS)
	{
		return TRUE;
	};
	if(MIS_OLDWORLD == LOG_SUCCESS)
	{
		return TRUE;
	};
	return FALSE;
};

func int B_GetPeckArmorPrice()
{
	var int value;
	value = 4500;
	if(MIS_Andre_Peck == LOG_SUCCESS)
	{
		value += 500;
	};
	if((MIS_Andre_WAREHOUSE == LOG_SUCCESS) && (MIS_Andre_REDLIGHT == LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_Andre_LOBART_SUCCESS))
	{
		value -= 500;
	};
	if(Rengaru_Ausgeliefert == TRUE)
	{
		value -= 100;
	};
	if(Halvor_Ausgeliefert == TRUE)
	{
		value -= 100;
	};
	if(Nagur_Ausgeliefert == TRUE)
	{
		value -= 100;
	};
	if(Sarah_Ausgeliefert == TRUE)
	{
		value -= 100;
	};
	if(Canthar_Ausgeliefert == TRUE)
	{
		value -= 100;
	};
	if(Fernando_ImKnast == TRUE)
	{
		value -= 100;
	};
	if(Andre_Knows_MartinEmpfehlung == TRUE)
	{
		value -= 100;
	};
	if(MIS_Andre_GuildOfThieves == LOG_SUCCESS)
	{
		value -= 1000;
	}
	else if(Andre_FoundThieves_Reported == TRUE)
	{
		value -= 500;
	};
	return value;
};

instance DIA_Peck_ARMOR(C_Info)
{
	npc = MIL_324_Peck;
	nr = 3;
	condition = DIA_Peck_ARMOR_Condition;
	information = DIA_Peck_ARMOR_Info;
	permanent = TRUE;
	description = "А как насчет доспехов получше?";
};


func int DIA_Peck_ARMOR_Condition()
{
	if((other.guild == GIL_MIL) && (DIA_MIL_ARMOR_M_perm == FALSE))
	{
		if(C_PeckIsInBarracks())
		{
			return TRUE;
		};
	};
};

func void DIA_Peck_ARMOR_Info()
{
	DIA_Common_WhatAboutBetterArmor();
	if(MIS_Andre_Peck == LOG_Running)
	{
		AI_Output(self,other,"DIA_Peck_WEAPON_12_01");	//Сходи сначала к Андрэ и доложи ему.
	}
	else if(B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		B_Say(self,other,"$CITY_CRIME");
	}
	else
	{
		if(C_PeckCanSellArmor())
		{
			if(MIS_Andre_Peck == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Rein_12_01");	//Хорошо.
			}
			else
			{
				AI_Output(self,other,"DIA_Peck_Add_12_00");	//Это лучшее, что у меня есть.
			};
			Info_ClearChoices(DIA_Peck_ARMOR);
			Info_AddChoice(DIA_Peck_ARMOR,Dialog_Back,DIA_Peck_ARMOR_Back);
			Info_AddChoice(DIA_Peck_ARMOR,B_BuildPriceString("Купить тяжелые доспехи ополчения. Защита: 70/70/10/10.",B_GetPeckArmorPrice()),DIA_Peck_ARMOR_BUY);
		}
		else
		{
			if(MIS_Andre_Peck == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Addon_Thorus_Add_12_05");	//(твердо) Нет!
				AI_StopProcessInfos(self);
			}
			else
			{
				AI_Output(self,other,"DIA_Peck_Add_12_02");	//Пока нет...
			};
		};
	};
};

func void DIA_Peck_ARMOR_Back()
{
	Info_ClearChoices(DIA_Peck_ARMOR);
};

func void DIA_Peck_ARMOR_BUY()
{
	DIA_Common_GiveMeThatArmor();
	if(B_GiveInvItems(other,self,ItMi_Gold,B_GetPeckArmorPrice()))
	{
		AI_Output(self,other,"DIA_Peck_Add_12_05");	//Вот, возьми.
		B_GiveArmor(ITAR_MIL_M);
		DIA_MIL_ARMOR_M_perm = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Mika_UEBERLEGT_12_02");	//(сердито) Возвращайся, когда у тебя будут деньги.
	};
	Info_ClearChoices(DIA_Peck_ARMOR);
};

instance DIA_Peck_PERM(C_Info)
{
	npc = MIL_324_Peck;
	nr = 800;
	condition = DIA_Peck_PERM_Condition;
	information = DIA_Peck_PERM_Info;
	permanent = TRUE;
	description = "С тобой все в порядке?";
};


func int DIA_Peck_PERM_Condition()
{
	if(C_PeckIsInBarracks())
	{
		return TRUE;
	};
};

func void DIA_Peck_PERM_Info()
{
	AI_Output(other,self,"DIA_Peck_PERM_15_00");	//С тобой все в порядке?
	if(MIS_Andre_Peck == LOG_SUCCESS)
	{
		B_Peck_LeckMich();
	}
	else if(Kapitel != 3)
	{
		AI_Output(self,other,"DIA_Peck_PERM_12_01");	//Да, а с тобой?
	}
	else
	{
		if(MIS_RescueBennet != LOG_SUCCESS)
		{
			if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
			{
				AI_Output(self,other,"DIA_Peck_PERM_12_02");	//Не совсем. Меня волнуют эти наемники. Я хочу сказать, они могут попытаться освободить своего дружка из тюрьмы силой.
				AI_Output(self,other,"DIA_Peck_PERM_12_03");	//Мне что-то не очень хочется выступать против банды опытных бойцов.
			}
			else if(hero.guild == GIL_KDF)
			{
				AI_Output(self,other,"DIA_Peck_PERM_12_04");	//Конечно! Мы готовы ко всему. Маги могут быть уверены, что этому заключенному не удастся сбежать.
			}
			else
			{
				AI_Output(self,other,"DIA_Peck_PERM_12_05");	//Я знаю, что ты задумал, но у тебя не получится уйти вместе с этим заключенным.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Peck_PERM_12_06");	//Я очень рад, что это дело об убийстве теперь закрыто.
			AI_Output(other,self,"DIA_Peck_PERM_15_07");	//Почему?
			AI_Output(self,other,"DIA_Peck_PERM_12_08");	//Наемники просто так не отступили бы. Они бы не стали сидеть сложа руки и спокойно наблюдать за тем, как мы повесим одного из них.
			AI_Output(self,other,"DIA_Peck_PERM_12_09");	//Они даже могли напасть на город. Я даже думать не хочу о том, к чему это могло привести.
		};
	};
};

