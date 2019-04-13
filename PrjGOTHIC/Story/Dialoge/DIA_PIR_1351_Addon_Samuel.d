
instance DIA_Addon_Samuel_EXIT(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 999;
	condition = DIA_Addon_Samuel_EXIT_Condition;
	information = DIA_Addon_Samuel_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Samuel_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Samuel_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Samuel_Hello(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 1;
	condition = DIA_Addon_Samuel_Hello_Condition;
	information = DIA_Addon_Samuel_Hello_Info;
	important = TRUE;
};


func int DIA_Addon_Samuel_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Samuel_Hello_Info()
{
	AI_Output(self,other,"DIA_Addon_Samuel_Hello_14_00");	//А, новичок!
	AI_Output(self,other,"DIA_Addon_Samuel_Hello_14_01");	//Итак, чего ты хочешь? Рому или чего-нибудь покрепче?
	Log_CreateTopic(Topic_Addon_PIR_Trader,LOG_NOTE);
	B_LogEntry(Topic_Addon_PIR_Trader,Log_Text_Addon_SamuelTrade);
};


instance DIA_Addon_Samuel_Francis(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 2;
	condition = DIA_Addon_Samuel_Francis_Condition;
	information = DIA_Addon_Samuel_Francis_Info;
	description = "Я хочу поговорить с тобой о Фрэнсисе.";
};


func int DIA_Addon_Samuel_Francis_Condition()
{
	if(Francis_ausgeschissen == FALSE)
	{
		if(Npc_KnowsInfo(other,DIA_Addon_Skip_GregsHut) || (Francis.aivar[AIV_TalkedToPlayer] == TRUE))
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Samuel_Francis_Info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Francis_15_00");	//Я хочу поговорить с тобой о Фрэнсисе.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_01");	//Не упоминай при мне эту жалкую пародию на капитана!
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_02");	//Он целыми днями сидит на своей жирной заднице с важным видом.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_03");	//Никто из нас не может понять, о чем, черт возьми, думал капитан, когда оставлял ЕГО за главного!
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_04");	//Что тебе нужно от этого идиота?
};


instance DIA_Addon_Samuel_Versteck(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 3;
	condition = DIA_Addon_Samuel_Versteck_Condition;
	information = DIA_Addon_Samuel_Versteck_Info;
	description = "Я должен попасть в хижину Грега.";
};


func int DIA_Addon_Samuel_Versteck_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Samuel_Francis) && (Francis_ausgeschissen == FALSE) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Samuel_Versteck_Info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Francis_15_02");	//Я должен попасть в хижину Грега.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_05");	//Неужели? А зачем, интересно?
	AI_Output(other,self,"DIA_Addon_Samuel_Francis_15_01");	//Мне нужны бандитские доспехи.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_06");	//(смеется) Фрэнсис ни за что не пустит тебя в хижину, чтобы ты мог покопаться в вещах Грега.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_07");	//Если только...
	AI_Output(other,self,"DIA_Addon_Samuel_Francis_15_03");	//Что?
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_08");	//...Если только у тебя не будет что-то, что действительно нужно Фрэнсису.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_09");	//Я знаю, что Фрэнсис что-то спрятал в заброшенной шахте в каньоне.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_10");	//Однажды мы вместе стояли в карауле, и он как всегда заснул. Я услышал, как он бормочет об этом во сне.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_11");	//Не знаю, что он там зарыл, но возможно, что это настолько для него важно, что за этот предмет он пропустит тебя в хижину...
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_12");	//(радостно) Когда капитан вернется и увидит, что что-то из его вещей пропало, он спустит с Фрэнсиса шкуру!
	B_LogEntry(TOPIC_Addon_BDTRuestung,"Самогонщик Сэмюэль упомянул тайник Фрэнсиса, который находится в одной из пещер каньона. Возможно, я найду там что-либо, что поможет мне попасть в хижину.");
};


var int Samuel_Knows_LousHammer;
var int Samuel_Knows_SchlafHammer;

instance DIA_Addon_Samuel_Recipe(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 4;
	condition = DIA_Addon_Samuel_Recipe_Condition;
	information = DIA_Addon_Samuel_Recipe_Info;
	permanent = TRUE;
	description = "У меня есть для тебя рецепт!";
};


func int DIA_Addon_Samuel_Recipe_Condition()
{
	if(((Samuel_Knows_LousHammer == FALSE) && (Npc_HasItems(other,ITWr_Addon_Lou_Rezept) > 0)) || ((Samuel_Knows_SchlafHammer == FALSE) && (Npc_HasItems(other,ITWr_Addon_Lou_Rezept2) > 0)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Samuel_Recipe_Info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Recipe_15_00");	//У меня есть для тебя рецепт!
	AI_Output(self,other,"DIA_Addon_Samuel_Recipe_14_01");	//Отлично, показывай. Что это за рецепт?
	Info_ClearChoices(DIA_Addon_Samuel_Recipe);
	if((Samuel_Knows_LousHammer == FALSE) && (Npc_HasItems(other,ITWr_Addon_Lou_Rezept) > 0))
	{
		Info_AddChoice(DIA_Addon_Samuel_Recipe,"Молот Лу",DIA_Addon_Samuel_Recipe_LousHammer);
	};
	if((Samuel_Knows_SchlafHammer == FALSE) && (Npc_HasItems(other,ITWr_Addon_Lou_Rezept2) > 0))
	{
		Info_AddChoice(DIA_Addon_Samuel_Recipe,"Двойной молот Лу",DIA_Addon_Samuel_Recipe_LousDoubleHammer);
	};
};

func void DIA_Addon_Samuel_Recipe_Back()
{
	Info_ClearChoices(DIA_Addon_Samuel_Recipe);
};

func void DIA_Addon_Samuel_Recipe_LousHammer()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Recipe_LousHammer_15_00");	//Это от Снафа.
	B_GiveInvItems(other,self,ITWr_Addon_Lou_Rezept,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Addon_Samuel_Recipe_LousHammer_14_04");	//Но это же ужасно! Я должен немедленно попробовать...
	B_GivePlayerXP(XP_Ambient);
	Samuel_Knows_LousHammer = TRUE;
};

func void DIA_Addon_Samuel_Recipe_LousDoubleHammer()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Recipe_LousDoubleHammer_15_00");	//Будь осторожен. Это опасная штука!
	B_GiveInvItems(other,self,ITWr_Addon_Lou_Rezept2,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Addon_Samuel_Recipe_LousDoubleHammer_14_04");	//Ты меня пугаешь. Но я все равно попробую.
	B_GivePlayerXP(XP_Ambient);
	Samuel_Knows_SchlafHammer = TRUE;
};


var int Samuel_Grog_Varianz;

instance DIA_Addon_Samuel_Grog(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 5;
	condition = DIA_Addon_Samuel_Grog_Condition;
	information = DIA_Addon_Samuel_Grog_Info;
	permanent = TRUE;
	description = "Я пришел за своей порцией грога! (10 золотых)";
};


func int DIA_Addon_Samuel_Grog_Condition()
{
	return TRUE;
};

func void DIA_Addon_Samuel_Grog_Info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Grog_15_00");	//Я пришел за своей порцией грога.
	if(B_GiveInvItems(other,self,ItMi_Gold,10))
	{
		if(Samuel_Grog_Varianz == 0)
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Grog_14_01");	//Да, без грога вы палец о палец ударить не можете. Вот, забирай.
			Samuel_Grog_Varianz = 1;
		}
		else if(Samuel_Grog_Varianz == 1)
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Grog_14_02");	//Надеюсь, пить его можно. У меня кончилась пресная вода. Но немного морской воды еще никому не повредило, верно?
			Samuel_Grog_Varianz = 2;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Grog_14_03");	//Ты можешь получить столько грога, сколько захочешь!
		};
		B_GiveInvItems(self,other,ItFo_Addon_Grog,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Samuel_Grog_14_04");	//Продаю я грог дешево, но не бесплатно! Раздобудь немного золота, приятель.
	};
};


var int Samuel_Rum_Varianz;

instance DIA_Addon_Samuel_Rum(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 6;
	condition = DIA_Addon_Samuel_Rum_Condition;
	information = DIA_Addon_Samuel_Rum_Info;
	permanent = TRUE;
	description = "Дай мне рома! (30 золотых)";
};


func int DIA_Addon_Samuel_Rum_Condition()
{
	return TRUE;
};

func void DIA_Addon_Samuel_Rum_Info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Rum_15_00");	//Дай мне рома!
	if(B_GiveInvItems(other,self,ItMi_Gold,30))
	{
		if(Samuel_Rum_Varianz == 0)
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Rum_14_01");	//А-а, ром для моряка - все равно что молоко матери! Вот, бери!
			Samuel_Rum_Varianz = 1;
		}
		else if(Samuel_Rum_Varianz == 1)
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Rum_14_02");	//У рома может быть небольшой привкус рыбы. У меня остались только бочки из-под селедки. Но ром остается ромом. Твое здоровье!
			Samuel_Rum_Varianz = 2;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Rum_14_03");	//Вот, бери.
		};
		B_GiveInvItems(self,other,ItFo_Addon_Rum,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Samuel_Rum_14_04");	//У тебя недостаточно золота, приятель! Как насчет грога?
	};
};


var int Samuel_Stronger_Varianz;
var int Samuel_DoppelHammer_Varianz;

instance DIA_Addon_Samuel_Stronger(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 7;
	condition = DIA_Addon_Samuel_Stronger_Condition;
	information = DIA_Addon_Samuel_Stronger_Info;
	permanent = TRUE;
	description = "Я хочу чего-нибудь покрепче!";
};


func int DIA_Addon_Samuel_Stronger_Condition()
{
	return TRUE;
};

func void DIA_Addon_Samuel_Stronger_Info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Stronger_15_00");	//Я хочу чего-нибудь покрепче!
	if(Samuel_Stronger_Varianz == 0)
	{
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_01");	//А, вижу родственную душу! Я и сам люблю экспериментировать.
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_02");	//Хорошая выпивка должна быть чистой, крепкой, а глотку продирать, как жидкий огонь.
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_03");	//Такое нечасто встречается. Но я слишком много болтаю, а ты хочешь выпить.
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_04");	//Вот. Мой собственный рецепт. Тебе понравится. Я называю этот напиток 'Быстрая селедка'.
		B_GiveInvItems(self,other,ItFo_Addon_SchnellerHering,1);
		B_UseItem(other,ItFo_Addon_SchnellerHering);
		AI_Output(other,self,"DIA_Addon_Samuel_Stronger_15_05");	//Впечатляет!
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_06");	//(смеется) Это точно!
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_07");	//А тебе не встречались рецепты напитков? Если встретятся, обязательно расскажи мне.
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_08");	//Хочешь еще?
		Samuel_Stronger_Varianz = 1;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_09");	//Что тебе приготовить.
	};
	Info_ClearChoices(DIA_Addon_Samuel_Stronger);
	Info_AddChoice(DIA_Addon_Samuel_Stronger,Dialog_Back,DIA_Addon_Samuel_Stronger_Back);
	if(Samuel_Knows_SchlafHammer == TRUE)
	{
		Info_AddChoice(DIA_Addon_Samuel_Stronger,"Двойной Молот Лу (60 золотых)",DIA_Addon_Samuel_Stronger_LousDoubleHammer);
	};
	if(Samuel_Knows_LousHammer == TRUE)
	{
		Info_AddChoice(DIA_Addon_Samuel_Stronger,"Молот Лу (30 золотых)",DIA_Addon_Samuel_Stronger_LousHammer);
	};
	Info_AddChoice(DIA_Addon_Samuel_Stronger,"Быстрая селедка (30 золотых)",DIA_Addon_Samuel_Stronger_SchnellerHering);
};

func void B_Addon_Samuel_NoGold()
{
	AI_Output(self,other,"DIA_Addon_Samuel_NoGold_14_00");	//Нет золота - нет выпивки!
};

func void DIA_Addon_Samuel_Stronger_Back()
{
	Info_ClearChoices(DIA_Addon_Samuel_Stronger);
};

func void DIA_Addon_Samuel_Stronger_SchnellerHering()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Stronger_SchnellerHering_15_00");	//Дай мне 'Быструю селедку'.
	if(B_GiveInvItems(other,self,ItMi_Gold,30))
	{
		AI_Output(self,other,"DIa_Addon_Samuel_Stronger_SchnellerHering_14_01");	//Злой напиток. Но эффективный!
		B_GiveInvItems(self,other,ItFo_Addon_SchnellerHering,1);
	}
	else
	{
		B_Addon_Samuel_NoGold();
	};
	Info_ClearChoices(DIA_Addon_Samuel_Stronger);
	Info_AddChoice(DIA_Addon_Samuel_Stronger,Dialog_Back,DIA_Addon_Samuel_Stronger_Back);
	if(Samuel_Knows_SchlafHammer == TRUE)
	{
		Info_AddChoice(DIA_Addon_Samuel_Stronger,"Двойной Молот Лу (60 золотых)",DIA_Addon_Samuel_Stronger_LousDoubleHammer);
	};
	if(Samuel_Knows_LousHammer == TRUE)
	{
		Info_AddChoice(DIA_Addon_Samuel_Stronger,"Молот Лу (30 золотых)",DIA_Addon_Samuel_Stronger_LousHammer);
	};
	Info_AddChoice(DIA_Addon_Samuel_Stronger,"Быстрая селедка (30 золотых)",DIA_Addon_Samuel_Stronger_SchnellerHering);
};

func void DIA_Addon_Samuel_Stronger_LousHammer()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Stronger_LousHammer_15_00");	//Я хочу 'Молоток Лу'!
	if(B_GiveInvItems(other,self,ItMi_Gold,30))
	{
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_LousHammer_14_01");	//Отличное пойло! Наслаждайся!
		B_GiveInvItems(self,other,ItFo_Addon_LousHammer,1);
	}
	else
	{
		B_Addon_Samuel_NoGold();
	};
	Info_ClearChoices(DIA_Addon_Samuel_Stronger);
	Info_AddChoice(DIA_Addon_Samuel_Stronger,Dialog_Back,DIA_Addon_Samuel_Stronger_Back);
	if(Samuel_Knows_SchlafHammer == TRUE)
	{
		Info_AddChoice(DIA_Addon_Samuel_Stronger,"Двойной Молот Лу (60 золотых)",DIA_Addon_Samuel_Stronger_LousDoubleHammer);
	};
	if(Samuel_Knows_LousHammer == TRUE)
	{
		Info_AddChoice(DIA_Addon_Samuel_Stronger,"Молот Лу (30 золотых)",DIA_Addon_Samuel_Stronger_LousHammer);
	};
	Info_AddChoice(DIA_Addon_Samuel_Stronger,"Быстрая селедка (30 золотых)",DIA_Addon_Samuel_Stronger_SchnellerHering);
};

func void DIA_Addon_Samuel_Stronger_LousDoubleHammer()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Stronger_LousDoubleHammer_15_00");	//(спокойно) Сделай мне двойной 'Молот'.
	if(B_GiveInvItems(other,self,ItMi_Gold,Value_SchlafHammer))
	{
		if(Samuel_DoppelHammer_Varianz == 0)
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Stronger_LousDoubleHammer_14_01");	//Не делай глупостей, сынок. Очень надеюсь, что ты берешь это не для себя.
		}
		else
		{
			AI_Output(self,other,"DIa_Addon_Samuel_Stronger_LousDoubleHammer_14_02");	//Да! Ничто так не укрепляет дух!
		};
		B_GiveInvItems(self,other,ItFo_Addon_SchlafHammer,1);
	}
	else
	{
		B_Addon_Samuel_NoGold();
	};
	Info_ClearChoices(DIA_Addon_Samuel_Stronger);
	Info_AddChoice(DIA_Addon_Samuel_Stronger,Dialog_Back,DIA_Addon_Samuel_Stronger_Back);
	if(Samuel_Knows_SchlafHammer == TRUE)
	{
		Info_AddChoice(DIA_Addon_Samuel_Stronger,"Двойной Молот Лу (60 золотых)",DIA_Addon_Samuel_Stronger_LousDoubleHammer);
	};
	if(Samuel_Knows_LousHammer == TRUE)
	{
		Info_AddChoice(DIA_Addon_Samuel_Stronger,"Молот Лу (30 золотых)",DIA_Addon_Samuel_Stronger_LousHammer);
	};
	Info_AddChoice(DIA_Addon_Samuel_Stronger,"Быстрая селедка (30 золотых)",DIA_Addon_Samuel_Stronger_SchnellerHering);
};


instance DIA_Addon_Samuel_Trade(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 8;
	condition = DIA_Addon_Samuel_Trade_Condition;
	information = DIA_Addon_Samuel_Trade_Info;
	permanent = TRUE;
	description = "Что у тебя еще есть?";
	trade = TRUE;
};


func int DIA_Addon_Samuel_Trade_Condition()
{
	return TRUE;
};

func void DIA_Addon_Samuel_Trade_Info()
{
	B_GiveTradeInv(self);
	Npc_RemoveInvItems(self,ItFo_Addon_Grog,Npc_HasItems(self,ItFo_Addon_Grog));
	CreateInvItems(self,ItFo_Addon_Grog,15);
	AI_Output(other,self,"DIA_Addon_Samuel_Trade_15_00");	//Что у тебя еще есть?
	AI_Output(self,other,"DIA_Addon_Samuel_Trade_14_01");	//Я могу продать тебе все, что нужно пирату для жизни.
};


instance DIA_Addon_Samuel_News(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 99;
	condition = DIA_Addon_Samuel_News_Condition;
	information = DIA_Addon_Samuel_News_Info;
	permanent = TRUE;
	description = "Что нового в лагере?";
};


func int DIA_Addon_Samuel_News_Condition()
{
	return TRUE;
};

func void DIA_Addon_Samuel_News_Info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_News_15_00");	//Что нового в лагере?
	if(Npc_IsDead(Francis) || (Francis_ausgeschissen == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Samuel_News_14_01");	//Фрэнсис получил по заслугам! Не могу даже описать, как это меня радует.
		AI_Output(self,other,"DIA_Addon_Samuel_News_14_02");	//А ты нормальный парень. Давай выпьем - я угощаю!
		if(GregIsBack == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Samuel_News_14_03");	//И Грег наконец-то вернулся. Он потерял корабль, но, по крайней мере, восстановил порядок в лагере.
		};
	}
	else
	{
		if(!Npc_IsDead(Morgan))
		{
			AI_Output(self,other,"DIA_Addon_Samuel_News_14_04");	//С тех пор как Грег уехал, ничего интересного не происходило. Морган и большинство парней целыми днями пьянствуют.
		};
		if(!Npc_IsDead(Henry))
		{
			AI_Output(self,other,"DIA_Addon_Samuel_News_14_05");	//Только Генри занимается делом. Он со своими людьми строит частокол.
		};
		AI_Output(self,other,"DIA_Addon_Samuel_News_14_06");	//Пора бы уже капитану вернуться и дать Фрэнсису хорошего пинка под зад!
	};
};

