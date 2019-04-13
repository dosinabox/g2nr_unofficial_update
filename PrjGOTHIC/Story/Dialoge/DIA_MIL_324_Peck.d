
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


instance DIA_Peck_PICKPOCKET(C_Info)
{
	npc = MIL_324_Peck;
	nr = 900;
	condition = DIA_Peck_PICKPOCKET_Condition;
	information = DIA_Peck_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(Воровать этот ключ рискованно)";
};


func int DIA_Peck_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_HasItems(self,ItKe_City_Tower_05) >= 1) && (other.attribute[ATR_DEXTERITY] >= (60 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Peck_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Peck_PICKPOCKET);
	Info_AddChoice(DIA_Peck_PICKPOCKET,Dialog_Back,DIA_Peck_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Peck_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Peck_PICKPOCKET_DoIt);
};

func void DIA_Peck_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 60)
	{
		B_GiveInvItems(self,other,ItKe_City_Tower_05,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Peck_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void DIA_Peck_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Peck_PICKPOCKET);
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
	if((MIS_Andre_Peck != LOG_Running) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_PUFF_PECK") <= 500))
	{
		return TRUE;
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
	if((MIS_Andre_Peck == LOG_Running) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_PUFF_PECK") <= 500))
	{
		return TRUE;
	};
};

func void DIA_Peck_FOUND_PECK_Info()
{
	AI_Output(other,self,"DIA_Peck_FOUND_PECK_15_00");	//Эй, тебе пора возвращаться назад.
	AI_Output(self,other,"DIA_Peck_FOUND_PECK_12_01");	//Что тебе нужно? Ты разве не видишь, я занят?
	AI_Output(other,self,"DIA_Peck_FOUND_PECK_15_02");	//Мне нужно оружие, так что возвращайся в казармы.
	AI_Output(self,other,"DIA_Peck_FOUND_PECK_12_03");	//Черт, твое оружие может подождать.
	AI_Output(other,self,"DIA_Peck_FOUND_PECK_15_04");	//Пошли, Андрэ уже тоже ищет тебя.
	AI_Output(self,other,"DIA_Peck_FOUND_PECK_12_05");	//Хммм ... черт. Ладно, я уже иду - но когда будешь докладывать Андрэ, не говори ему, что я был здесь.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"STORAGE");
	Npc_ExchangeRoutine(Vanja,"ALONE");
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


var int DIA_Peck_WEAPON_perm;

func int DIA_Peck_WEAPON_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Andre_FOUND_PECK) && (Npc_GetDistToWP(self,"NW_CITY_ARMORY_PECK") <= 1000) && (Kapitel < 3) && (DIA_Peck_WEAPON_perm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Peck_WEAPON_Info()
{
	AI_Output(other,self,"DIA_Peck_WEAPON_15_00");	//Я пришел за оружием.
	if(MIS_Andre_Peck == LOG_Running)
	{
		AI_Output(self,other,"DIA_Peck_WEAPON_12_01");	//Сначала сходи к Андрэ и доложи ему.
	}
	else
	{
		if(MIS_Andre_Peck == LOG_OBSOLETE)
		{
			AI_Output(self,other,"DIA_Peck_WEAPON_12_02");	//Посмотрите, кто пришел. Наш новый друг. И ему нужен меч.
			AI_Output(self,other,"DIA_Peck_WEAPON_12_03");	//Ты не сказал Андрэ, что я был в Красном Фонаре. Похоже, ты нормальный парень. Вот, держи твой меч.
			AI_Output(self,other,"DIA_Peck_Add_12_00");	//Это лучшее, что у меня есть.
			B_GiveInvItems(self,hero,ItMw_Schwert1,1);
		}
		else if(MIS_Andre_Peck == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Peck_WEAPON_12_04");	//Я не забуду тебе этого. Кто сказал Андрэ, что я был в Красном Фонаре, а?
			AI_Output(self,other,"DIA_Peck_WEAPON_12_05");	//И теперь ты хочешь получить от меня меч ... хорошо, ты получишь меч. Вот. А теперь пошел к черту!
			B_GiveInvItems(self,hero,ItMw_1h_MISC_Sword,1);
		};
		DIA_Peck_WEAPON_perm = TRUE;
		AI_Output(self,other,"DIA_Peck_WEAPON_12_06");	//Если тебе нужно оружие получше, иди к торговцам на рынке.
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


var int DIA_Peck_WEAPON2_perm;

func int DIA_Peck_WEAPON2_Condition()
{
	if((other.guild == GIL_MIL) && (Npc_GetDistToWP(self,"NW_CITY_ARMORY_PECK") <= 1000) && (EnterOW_Kapitel2 == TRUE) && (DIA_Peck_WEAPON_perm == TRUE) && (DIA_Peck_WEAPON2_perm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Peck_WEAPON2_Info()
{
	AI_Output(self,other,"DIA_Peck_Add_15_01");	//У тебя нет оружия получше для меня?
	if(MIS_Andre_Peck == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Peck_Add_12_06");	//Я не забыл, что ты донес на меня лорду Андрэ.
		B_Peck_LeckMich();
	}
	else if(Kapitel < 3)
	{
		AI_Output(self,other,"DIA_Peck_Add_12_02");	//Пока нет ...
	}
	else
	{
		AI_Output(self,other,"DIA_Peck_Add_12_03");	//Хорошо, что ты спросил. Нам досталось несколько очень хороших клинков от наемников Онара.
		AI_Output(self,other,"DIA_Peck_Add_12_04");	//Они им больше не понадобятся. (грязный смех)
		AI_Output(self,other,"DIA_Peck_Add_12_05");	//Вот, возьми.
		B_GiveInvItems(self,other,ItMw_Rubinklinge,1);
		DIA_Peck_WEAPON2_perm = TRUE;
	};
};


instance DIA_Peck_PERM(C_Info)
{
	npc = MIL_324_Peck;
	nr = 998;
	condition = DIA_Peck_PERM_Condition;
	information = DIA_Peck_PERM_Info;
	permanent = TRUE;
	description = "С тобой все в порядке?";
};


func int DIA_Peck_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Peck_WEAPON) || ((other.guild != GIL_MIL) && (Npc_GetDistToWP(self,"NW_CITY_ARMORY_PECK") <= 1000)))
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
	else if(Kapitel == 3)
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
			AI_Output(self,other,"DIA_Peck_PERM_12_09");	//Они даже могли напасть на город. Я даже думать не хочу от том, к чему это могло привести.
		};
	};
};

