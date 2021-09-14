
func void B_DaronSegen()
{
	var string concatText;
	var int Bonus_1;
	var int Bonus_2;
	var int Bonus_3;
	if(Daron_Spende < 100)
	{
		if(other.attribute[ATR_HITPOINTS] < other.attribute[ATR_HITPOINTS_MAX])
		{
			other.attribute[ATR_HITPOINTS] = other.attribute[ATR_HITPOINTS_MAX];
			PrintScreen(PRINT_FullyHealed,-1,-1,FONT_Screen,2);
		};
	}
	else if((Daron_Spende < 250) && (Bonus_1 == FALSE))
	{
		B_RaiseAttribute(other,ATR_MANA_MAX,2);
		other.attribute[ATR_MANA] = other.attribute[ATR_MANA_MAX];
		Bonus_1 = TRUE;
	}
	else if((Daron_Spende < 500) && (Bonus_2 == FALSE))
	{
		B_GivePlayerXP(XP_Ambient);
		Bonus_2 = TRUE;
	}
	else if((Daron_Spende >= 750) && (Daron_Spende < 1000) && (Bonus_3 == FALSE))
	{
		other.lp += 1;
		concatText = ConcatStrings(PRINT_LearnLP,IntToString(1));
		PrintScreen(concatText,-1,-1,FONT_Screen,2);
		Bonus_3 = TRUE;
	}
	else
	{
		other.attribute[ATR_HITPOINTS_MAX] += 5;
		other.attribute[ATR_HITPOINTS] = other.attribute[ATR_HITPOINTS_MAX];
		other.attribute[ATR_MANA] = other.attribute[ATR_MANA_MAX];
		concatText = ConcatStrings(PRINT_LearnHP_MAX,IntToString(5));
		PrintScreen(concatText,-1,-1,FONT_Screen,2);
	};
	if((MIS_Thorben_GetBlessings == LOG_Running) && (GotInnosBlessingForThorben == FALSE))
	{
		B_LogEntry(TOPIC_Thorben,"Маг Огня Дарон благословил меня.");
	};
	GotInnosBlessingForThorben = TRUE;
	Daron_Segen = TRUE;
};


instance DIA_Daron_EXIT(C_Info)
{
	npc = KDF_511_Daron;
	nr = 999;
	condition = DIA_Daron_EXIT_Condition;
	information = DIA_Daron_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Daron_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Daron_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Daron_Hallo(C_Info)
{
	npc = KDF_511_Daron;
	nr = 2;
	condition = DIA_Daron_Hallo_Condition;
	information = DIA_Daron_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Daron_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Daron_Hallo_Info()
{
	AI_Output(self,other,"DIA_Daron_Hallo_10_00");	//Что я могу сделать для тебя? Ты ищешь душевного комфорта?
	if(hero.guild != GIL_KDF)
	{
		AI_Output(self,other,"DIA_Daron_Hallo_10_01");	//Ты хочешь помолиться нашему владыке Инносу, или, может, хочешь пожертвовать золото его церкви?
	};
};


instance DIA_Daron_Paladine(C_Info)
{
	npc = KDF_511_Daron;
	nr = 2;
	condition = DIA_Daron_Paladine_Condition;
	information = DIA_Daron_Paladine_Info;
	permanent = FALSE;
	description = "Мне нужно поговорить с паладинами. Ты можешь помочь мне в этом?";
};


func int DIA_Daron_Paladine_Condition()
{
	if((other.guild == GIL_NONE) || (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Daron_Paladine_Info()
{
	AI_Output(other,self,"DIA_Daron_Paladine_15_00");	//Мне нужно поговорить с паладинами. Ты можешь помочь мне в этом?
	AI_Output(self,other,"DIA_Daron_Paladine_10_01");	//Ну, для этого ты должен иметь доступ в верхний квартал города. Однако входить туда позволено только гражданам и городской страже.
	AI_Output(self,other,"DIA_Daron_Paladine_10_02");	//Ну и, конечно же, нам, магам Огня.
	AI_Output(other,self,"DIA_Daron_Paladine_15_03");	//Как я могу стать магом Огня?
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Daron_Paladine_10_04");	//Ты должен вступить в наш орден в качестве послушника. А по прошествии некоторого времени, возможно, ты будешь принят в ряды магов.
		AI_Output(self,other,"DIA_Daron_Paladine_10_05");	//Однако, этот путь долог, полон тяжелой работы и утомительного обучения.
	}
	else
	{
		AI_Output(self,other,"DIA_Daron_Paladine_10_05_add");	//Путь долог, полон тяжелой работы и утомительного обучения.
	};
};


instance DIA_Daron_AboutSegen(C_Info)
{
	npc = KDF_511_Daron;
	nr = 2;
	condition = DIA_Daron_AboutSegen_Condition;
	information = DIA_Daron_AboutSegen_Info;
	permanent = FALSE;
	description = "Я пришел, чтобы получить твое благословение!";
};


func int DIA_Daron_AboutSegen_Condition()
{
	if((MIS_Thorben_GetBlessings == LOG_Running) && (Player_IsApprentice == APP_NONE) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Daron_AboutSegen_Info()
{
	AI_Output(other,self,"DIA_Daron_AboutSegen_15_00");	//Я пришел, чтобы получить твое благословение!
	AI_Output(self,other,"DIA_Daron_AboutSegen_10_01");	//Это хорошо - тогда ты, вероятно, захочешь пожертвовать золото святой церкви Инноса, правда?
	AI_Output(other,self,"DIA_Daron_AboutSegen_15_02");	//Вообще-то я хотел получить твое благословение, чтобы поступить в ученики к одному из мастеров в нижней части города...
	if(Daron_Segen == TRUE)
	{
		AI_Output(self,other,"DIA_Daron_AboutSegen_10_03");	//Но я уже дал тебе мое благословение, сын мой.
		AI_Output(self,other,"DIA_Daron_AboutSegen_10_04");	//Ступай с Инносом, сын мой!
	}
	else
	{
		AI_Output(self,other,"DIA_Daron_AboutSegen_10_05");	//Но, сын мой! Без скромного пожертвования церкви я не считаю для себя возможным благословить тебя.
		AI_Output(self,other,"DIA_Daron_AboutSegen_10_06");	//Как еще могу я увериться в твоих добрых намерениях по отношению к святой церкви Инноса?
	};
};


instance DIA_Daron_Spenden(C_Info)
{
	npc = KDF_511_Daron;
	nr = 3;
	condition = DIA_Daron_Spenden_Condition;
	information = DIA_Daron_Spenden_Info;
	permanent = FALSE;
	description = "И какое пожертвование обычно считается достаточным?";
};


func int DIA_Daron_Spenden_Condition()
{
	if(hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_Daron_Spenden_Info()
{
	AI_Output(other,self,"DIA_Daron_Spenden_15_00");	//И какое пожертвование обычно считается достаточным?
	AI_Output(self,other,"DIA_Daron_Spenden_10_01");	//Ну, это зависит от того, чем ты располагаешь. Давай посмотрим, что у тебя есть.
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"DIA_Daron_Spenden_10_02");	//(смотрит в кошелек с деньгами) М-м-м хмм...
	if(Npc_HasItems(other,ItMi_Gold) < 10)
	{
		AI_Output(self,other,"DIA_Daron_Spenden_10_03");	//Хм, ты ведь бедняк, да? Оставь себе то немногое, что у тебя есть.
		if((MIS_Thorben_GetBlessings == LOG_Running) && (GotInnosBlessingForThorben == FALSE))
		{
			B_LogEntry(TOPIC_Thorben,"Маг Огня Дарон не благословил меня. Мне кажется, это означает, что я должен пожертвовать ему немного золота. Без этого он не благословит меня.");
		};
	}
	else
	{
		if(Npc_HasItems(other,ItMi_Gold) < 50)
		{
			AI_Output(self,other,"DIA_Daron_Spenden_10_04");	//Ну, ты не богат, но и не беден. 10 золотых для Инноса - мы живем скромной жизнью.
			B_GiveInvItems(other,self,ItMi_Gold,10);
		}
		else if(Npc_HasItems(other,ItMi_Gold) < 100)
		{
			AI_Output(self,other,"DIA_Daron_Spenden_10_05");	//У тебя больше 50 золотых монет. Пожертвуй 25 монет Инносу и получи мое благословение.
			B_GiveInvItems(other,self,ItMi_Gold,25);
		}
		else
		{
			AI_Output(self,other,"DIA_Daron_Spenden_10_06");	//У тебя больше ста золотых монет - Владыка говорит: 'Делись, если можешь'.
			AI_Output(self,other,"DIA_Daron_Spenden_10_07");	//Церковь примет твое щедрое подношение.
			B_GiveInvItems(other,self,ItMi_Gold,50);
		};
		AI_Output(self,other,"DIA_Daron_Spenden_10_08");	//Благословляю тебя от имени Инноса. Он несет в этот мир свет и справедливость.
		if((MIS_Thorben_GetBlessings == LOG_Running) && (GotInnosBlessingForThorben == FALSE))
		{
			B_LogEntry(TOPIC_Thorben,"Маг Огня Дарон благословил меня.");
		};
		GotInnosBlessingForThorben = TRUE;
		Daron_Segen = TRUE;
		B_GivePlayerXP(XP_InnosSegen);
	};
};


instance DIA_Daron_Woher(C_Info)
{
	npc = KDF_511_Daron;
	nr = 9;
	condition = DIA_Daron_Woher_Condition;
	information = DIA_Daron_Woher_Info;
	permanent = FALSE;
	description = "Откуда ты пришел?";
};


func int DIA_Daron_Woher_Condition()
{
	if((other.guild != GIL_KDF) && (other.guild != GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Daron_Woher_Info()
{
	AI_Output(other,self,"DIA_Daron_Woher_15_00");	//Откуда ты пришел?
	AI_Output(self,other,"DIA_Daron_Woher_10_01");	//Я пришел из монастыря магов, находящегося в горах.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Daron_Woher_10_02");	//Мы принимаем к себе всех, кто чист сердцем и ощущает желание служить нашему всемогущему владыке Инносу.
	};
};


instance DIA_Daron_Innos(C_Info)
{
	npc = KDF_511_Daron;
	nr = 9;
	condition = DIA_Daron_Innos_Condition;
	information = DIA_Daron_Innos_Info;
	permanent = FALSE;
	description = "Расскажи мне об Инносе.";
};


func int DIA_Daron_Innos_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Daron_Woher) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Daron_Innos_Info()
{
	AI_Output(other,self,"DIA_Daron_Innos_15_00");	//Расскажи мне об Инносе.
	AI_Output(self,other,"DIA_Daron_Innos_10_01");	//Иннос, наш всемогущий владыка - наш свет и огонь.
	AI_Output(self,other,"DIA_Daron_Innos_10_02");	//Он выбирал людей в качестве проводников своей воли на земле. Он дает им магию и законы.
	AI_Output(self,other,"DIA_Daron_Innos_10_03");	//Мы говорим и действуем от его имени. Мы осуществляем правосудие согласно его воле и проповедуем его слово.
};


instance DIA_Daron_Kloster(C_Info)
{
	npc = KDF_511_Daron;
	nr = 10;
	condition = DIA_Daron_Kloster_Condition;
	information = DIA_Daron_Kloster_Info;
	permanent = FALSE;
	description = "Расскажи мне подробнее о монастыре.";
};


func int DIA_Daron_Kloster_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Daron_Woher) || (Npc_KnowsInfo(other,DIA_Daron_Paladine) && (other.guild != GIL_NOV) && (other.guild != GIL_KDF)))
	{
		return TRUE;
	};
};

func void DIA_Daron_Kloster_Info()
{
	AI_Output(other,self,"DIA_Daron_Kloster_15_00");	//Расскажи мне подробнее о монастыре.
	AI_Output(self,other,"DIA_Daron_Kloster_10_01");	//Мы обучаем наших студентов всем формам магии. Но сила магов Огня не ограничивается только магией.
	AI_Output(self,other,"DIA_Daron_Kloster_10_02");	//Мы также хорошо разбираемся в искусстве алхимии и создании рун.
	AI_Output(self,other,"DIA_Daron_Kloster_10_03");	//Еще мы делаем превосходное вино.
};


instance DIA_Daron_Stadt(C_Info)
{
	npc = KDF_511_Daron;
	nr = 99;
	condition = DIA_Daron_Stadt_Condition;
	information = DIA_Daron_Stadt_Info;
	permanent = FALSE;
	description = "А что ты делаешь в городе?";
};


func int DIA_Daron_Stadt_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Daron_Woher) || (other.guild == GIL_KDF) || (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Daron_Stadt_Info()
{
	AI_Output(other,self,"DIA_Daron_Stadt_15_00");	//А что ты делаешь в городе?
	AI_Output(self,other,"DIA_Daron_Stadt_10_01");	//Я просвещаю паладинов и поддерживаю горожан своими советами и ободряющими словами.
	AI_Output(self,other,"DIA_Daron_Stadt_10_02");	//В эти тяжелые времена наш долг быть среди народа и помогать бедным.
};


instance DIA_Addon_Daron_GuildHelp(C_Info)
{
	npc = KDF_511_Daron;
	nr = 5;
	condition = DIA_Addon_Daron_GuildHelp_Condition;
	information = DIA_Addon_Daron_GuildHelp_Info;
	description = "Я слышал, у вас пропала ценная статуэтка.";
};


func int DIA_Addon_Daron_GuildHelp_Condition()
{
	if(MIS_Addon_Vatras_Go2Daron == FALSE)
	{
		if(other.guild == GIL_NOV)
		{
			DIA_Addon_Daron_GuildHelp.description = "У тебя есть какое-нибудь задание для меня?";
			return TRUE;
		}
		else if(other.guild != GIL_NONE)
		{
			DIA_Addon_Daron_GuildHelp.description = "У тебя такой расстроенный вид...";
			return TRUE;
		};
	}
	else if(MIS_Addon_Vatras_Go2Daron == LOG_Running)
	{
		DIA_Addon_Daron_GuildHelp.description = "Я слышал, у вас пропала ценная статуэтка.";
		return TRUE;
	};
};

func void DIA_Addon_Daron_GuildHelp_Info()
{
	if(MIS_Addon_Vatras_Go2Daron == FALSE)
	{
		if(other.guild == GIL_NOV)
		{
			DIA_Common_AnyMissionForMe();
		}
		else if(other.guild != GIL_NONE)
		{
			DIA_Common_YouLookSoSad();
		};
	}
	else if(MIS_Addon_Vatras_Go2Daron == LOG_Running)
	{
		AI_Output(other,self,"DIA_Addon_Daron_GuildHelp_15_00");	//Я слышал, у вас пропала ценная статуэтка.
		AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_10_01");	//Неужели? Об этом знал только маг Воды Ватрас.
		AI_Output(other,self,"DIA_Addon_Daron_GuildHelp_15_02");	//В чем проблема?
	};
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_10_03");	//С континента в монастырь была отправлена драгоценная статуэтка. Но до нас она так и не дошла.
	AI_Output(other,self,"DIA_Addon_Daron_GuildHelp_15_04");	//Корабль был ограблен?
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_10_05");	//Нет. Он в целости и сохранности прибыл в Хоринис. Я встретил его и забрал статуэтку.
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_10_06");	//Но когда я возвращался в монастырь, на меня напали гоблины и отобрали ее у меня.
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_10_07");	//(сердито) И не надо на меня так смотреть. Маги, к твоему сведению, тоже люди.
	MIS_Addon_Vatras_Go2Daron = LOG_SUCCESS;
	Info_ClearChoices(DIA_Addon_Daron_GuildHelp);
	if(Hlp_IsValidNpc(Gobbo_DaronsStatuenKlauer) && Npc_HasItems(Gobbo_DaronsStatuenKlauer,ItMi_LostInnosStatue_Daron))
	{
		Info_AddChoice(DIA_Addon_Daron_GuildHelp,"Значит, сейчас она у гоблинов?",DIA_Addon_Daron_GuildHelp_gobbos);
	};
	Info_AddChoice(DIA_Addon_Daron_GuildHelp,"Где именно ты потерял статуэтку?",DIA_Addon_Daron_GuildHelp_wo);
	Info_AddChoice(DIA_Addon_Daron_GuildHelp,"Ты не пытался вернуть статуэтку?",DIA_Addon_Daron_GuildHelp_wiederholen);
};

func void DIA_Addon_Daron_GuildHelp_wiederholen()
{
	AI_Output(other,self,"DIA_Addon_Daron_GuildHelp_wiederholen_15_00");	//Ты не пытался вернуть статуэтку?
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_wiederholen_10_01");	//Конечно, пытался! Я везде ее искал. Но увы, безрезультатно.
};

func void DIA_Addon_Daron_GuildHelp_gobbos()
{
	AI_Output(other,self,"DIA_Addon_Daron_GuildHelp_gobbos_15_00");	//Значит, сейчас она у гоблинов?
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_gobbos_10_01");	//Когда она оказалась у них в руках, они скрылись в кустарнике.
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_gobbos_10_02");	//Больше я их не видел. Наверное, они живут в какой-нибудь пещере.
};

func void DIA_Addon_Daron_GuildHelp_wo()
{
	AI_Output(other,self,"DIA_Addon_Daron_GuildHelp_wo_15_00");	//Где именно ты потерял статуэтку?
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_wo_10_01");	//На пути в монастырь, неподалеку от таверны Орлана.
	Info_AddChoice(DIA_Addon_Daron_GuildHelp,"Я услышал достаточно. Я найду статуэтку.",DIA_Addon_Daron_GuildHelp_auftrag);
	Info_AddChoice(DIA_Addon_Daron_GuildHelp,"Таверна Орлана? Где она находится?",DIA_Addon_Daron_GuildHelp_woTaverne);
};

func void DIA_Addon_Daron_GuildHelp_woTaverne()
{
	AI_Output(other,self,"DIA_Addon_Daron_GuildHelp_woTaverne_15_00");	//Таверна Орлана? Где она находится?
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_woTaverne_10_01");	//Если ты выйдешь из города через эти ворота и пойдешь прямо по дороге, ты дойдешь до отдельно стоящего дома.
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_woTaverne_10_02");	//Это и есть таверна Орлана, 'Мертвая гарпия'.
};

func void DIA_Addon_Daron_GuildHelp_auftrag()
{
	AI_Output(other,self,"DIA_Addon_Daron_GuildHelp_auftrag_15_00");	//Я услышал достаточно. Я найду статуэтку.
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_auftrag_10_01");	//Да направит тебя Иннос, и да защитит он тебя от опасностей, подстерегающих тебя за воротами города.
	Info_ClearChoices(DIA_Addon_Daron_GuildHelp);
	MIS_Addon_Daron_GetStatue = LOG_Running;
	if(other.guild == GIL_NONE)
	{
		B_LogEntry(TOPIC_Addon_RangerHelpKDF,TOPIC_Addon_DaronGobbos);
	}
	else
	{
		Log_CreateTopic(TOPIC_Addon_HelpDaron,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_HelpDaron,LOG_Running);
		B_LogEntry(TOPIC_Addon_HelpDaron,TOPIC_Addon_DaronGobbos);
	};
};


func void B_DaronGivesReward()
{
	AI_Output(self,other,"DIA_Addon_Daron_ReturnedStatue_10_01");	//Это прекрасная новость! Да хранит тебя Иннос.
	AI_Output(self,other,"DIA_Addon_Daron_ReturnedStatue_10_02");	//Прими вот это в знак моей благодарности.
	CreateInvItems(self,ItMi_Gold,150);
	B_GiveInvItems(self,other,ItMi_Gold,150);
	MIS_Addon_Daron_GetStatue = LOG_SUCCESS;
	TOPIC_End_RangerHelpKDF = TRUE;
};

instance DIA_Addon_Daron_FoundStatue(C_Info)
{
	npc = KDF_511_Daron;
	nr = 5;
	condition = DIA_Addon_Daron_FoundStatue_Condition;
	information = DIA_Addon_Daron_FoundStatue_Info;
	description = "Я нашел статуэтку.";
};


func int DIA_Addon_Daron_FoundStatue_Condition()
{
	if(Npc_HasItems(other,ItMi_LostInnosStatue_Daron) && (MIS_Addon_Daron_GetStatue == LOG_Running) && (LostInnosStatueInMonastery == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Daron_FoundStatue_Info()
{
	AI_Output(other,self,"DIA_Addon_Daron_FoundStatue_15_00");	//Я нашел статуэтку.
	if(other.guild == GIL_KDF)
	{
		B_GiveInvItems(other,self,ItMi_LostInnosStatue_Daron,1);
		Npc_RemoveInvItem(self,ItMi_LostInnosStatue_Daron);
		B_DaronGivesReward();
		B_GivePlayerXP(XP_Addon_ReturnedLostInnosStatue_Daron + XP_Addon_ReportLostInnosStatue2Daron);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Daron_FoundStatue_10_01");	//Хвала Инносу!
		AI_Output(other,self,"DIA_Addon_Daron_FoundStatue_15_02");	//Что ты будешь с ней делать?
		AI_Output(self,other,"DIA_Addon_Daron_FoundStatue_10_03");	//Я? Ничего. До сих пор она приносила мне лишь несчастья.
		AI_Output(self,other,"DIA_Addon_Daron_FoundStatue_10_04");	//ТЫ отнесешь ее в монастырь, сынок.
		if(other.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Addon_Daron_FoundStatue_10_05");	//Конечно, тебя не пропустят внутрь, если ты не согласишься посвятить оставшуюся жизнь служению монастырю.
			AI_Output(self,other,"DIA_Addon_Daron_FoundStatue_10_06");	//Но я уверен, что ты не откажешься. Ведь ты можешь оказать услугу МНЕ, верно?
		};
		AI_Output(self,other,"DIA_Addon_Daron_FoundStatue_10_07");	//Ступай, сынок! Да пребудет с тобой Иннос.
	};
};


instance DIA_Addon_Daron_ReturnedStatue(C_Info)
{
	npc = KDF_511_Daron;
	nr = 5;
	condition = DIA_Addon_Daron_ReturnedStatue_Condition;
	information = DIA_Addon_Daron_ReturnedStatue_Info;
	description = "Я отнес твою статуэтку в монастырь. Можешь быть спокоен.";
};


func int DIA_Addon_Daron_ReturnedStatue_Condition()
{
	if(LostInnosStatueInMonastery == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Daron_ReturnedStatue_Info()
{
	AI_Output(other,self,"DIA_Addon_Daron_ReturnedStatue_15_00");	//Я отнес твою статуэтку в монастырь. Можешь быть спокоен.
	B_DaronGivesReward();
	B_GivePlayerXP(XP_Addon_ReportLostInnosStatue2Daron);
};


var int Daron_Spende;

instance DIA_Daron_arm(C_Info)
{
	npc = KDF_511_Daron;
	nr = 10;
	condition = DIA_Daron_arm_Condition;
	information = DIA_Daron_arm_Info;
	permanent = FALSE;
	description = "Я как раз бедный!";
};


func int DIA_Daron_arm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Daron_Stadt) && (Npc_HasItems(other,ItMi_Gold) < 10) && (other.guild == GIL_NONE) && (Daron_Spende == 0))
	{
		return TRUE;
	};
};

func void DIA_Daron_arm_Info()
{
	AI_Output(other,self,"DIA_Daron_arm_15_00");	//Я как раз бедный!
	AI_Output(self,other,"DIA_Daron_arm_10_01");	//Да, ты доведен до нищеты. Это неудивительно в эти тяжелые времена. Возьми это золото, надеюсь, оно поможет тебе.
	AI_Output(self,other,"DIA_Daron_arm_10_02");	//Но ты должен найти себе работу, и тогда у тебя не будет недостатка в золоте. И ты сможешь пожертвовать это золото церкви Инноса, помня о том, как она помогала тебе.
	B_GiveInvItems(self,other,ItMi_Gold,20);
};


var int DIA_Daron_Spende_permanent;

instance DIA_Daron_Spende(C_Info)
{
	npc = KDF_511_Daron;
	nr = 800;
	condition = DIA_Daron_Spende_Condition;
	information = DIA_Daron_Spende_Info;
	permanent = TRUE;
	description = "Я хочу сделать пожертвование...";
};

func int DIA_Daron_Spende_Condition()
{
	if((DIA_Daron_Spende_permanent == FALSE) && Npc_KnowsInfo(other,DIA_Daron_Spenden) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Daron_Spende_Info()
{
	AI_Output(other,self,"DIA_Daron_Spende_15_00");	//Я хочу сделать пожертвование...
	Info_ClearChoices(DIA_Daron_Spende);
	if(Daron_Spende < 1000)
	{
		Info_AddChoice(DIA_Daron_Spende,"Я должен еще подумать.",DIA_Daron_Spende_BACK);
		Info_AddChoice(DIA_Daron_Spende,"Но у меня недостаточно золота...",DIA_Daron_Spende_NoGold);
		Info_AddChoice(DIA_Daron_Spende,"(50 золотых)",DIA_Daron_Spende_50);
		Info_AddChoice(DIA_Daron_Spende,"(100 золотых)",DIA_Daron_Spende_100);
		Info_AddChoice(DIA_Daron_Spende,"(200 золотых)",DIA_Daron_Spende_200);
	}
	else
	{
		AI_Output(self,other,"DIA_Daron_Spende_10_01");	//Ты уже пожертвовал мне более 1000 золотых монет.
		AI_Output(self,other,"DIA_Daron_Spende_10_02");	//Благословение Инноса всегда пребудет с тобой.
		DIA_Daron_Spende_permanent = TRUE;
		B_DaronSegen();
	};
};

func void DIA_Daron_Spende_NoGold()
{
	AI_Output(other,self,"DIA_Daron_Spende_BACK_15_00");	//Но у меня недостаточно золота...
	AI_Output(self,other,"DIA_Daron_Spende_BACK_10_01");	//Это не имеет значения, сын мой. Ты можешь принести пожертвование позже.
};

func void DIA_Daron_Spende_BACK()
{
	DIA_Common_INeedToThinkAboutIt();
	Info_ClearChoices(DIA_Daron_Spende);
};


func void DIA_Daron_Spende_50()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		AI_Output(self,other,"DIA_Daron_Spende_50_10_00");	//Благословляю тебя от имени Инноса. Он несет в этот мир свет и справедливость.
		Daron_Spende += 50;
		B_DaronSegen();
	}
	else
	{
		AI_Output(self,other,"DIA_Daron_Spende_50_10_01");	//Ты можешь жертвовать несколько раз понемногу, если у тебя сейчас недостаточно золота.
	};
	Info_ClearChoices(DIA_Daron_Spende);
};

func void DIA_Daron_Spende_100()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		AI_Output(self,other,"DIA_Daron_Spende_100_10_00");	//Иннос, ты свет, озаряющий путь праведников.
		AI_Output(self,other,"DIA_Daron_Spende_100_10_01");	//Я благословляю этого человека от твоего имени. Да будет твой свет сиять над ним вечно.
		Daron_Spende += 100;
		B_DaronSegen();
	}
	else
	{
		AI_Output(self,other,"DIA_Daron_Spende_100_10_02");	//Иннос говорит - если хочешь молиться, открой свою душу. А если ты хочешь пожертвовать, принеси свой дар.
	};
	Info_ClearChoices(DIA_Daron_Spende);
};

func void DIA_Daron_Spende_200()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,200))
	{
		AI_Output(self,other,"DIA_Daron_Spende_200_10_00");	//Иннос, благослови этого человека. Да будет твой свет сиять над ним вечно.
		AI_Output(self,other,"DIA_Daron_Spende_200_10_01");	//Придай ему силы жить праведной жизнью.
		Daron_Spende += 200;
		B_DaronSegen();
	}
	else
	{
		AI_Output(self,other,"DIA_Daron_Spende_200_10_02");	//Если ты хочешь пожертвовать столько золота, оно у тебя должно хотя бы быть.
	};
	Info_ClearChoices(DIA_Daron_Spende);
};


instance DIA_Daron_PICKPOCKET(C_Info)
{
	npc = KDF_511_Daron;
	nr = 900;
	condition = DIA_Daron_PICKPOCKET_Condition;
	information = DIA_Daron_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Daron_PICKPOCKET_Condition()
{
	return C_Beklauen(47,80);
};

func void DIA_Daron_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Daron_PICKPOCKET);
	Info_AddChoice(DIA_Daron_PICKPOCKET,Dialog_Back,DIA_Daron_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Daron_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Daron_PICKPOCKET_DoIt);
};

func void DIA_Daron_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Daron_PICKPOCKET);
};

func void DIA_Daron_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Daron_PICKPOCKET);
};

