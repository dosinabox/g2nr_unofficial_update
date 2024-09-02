
instance DIA_Hyglas_Kap1_EXIT(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 999;
	condition = DIA_Hyglas_Kap1_EXIT_Condition;
	information = DIA_Hyglas_Kap1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hyglas_Kap1_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Hyglas_Kap1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hyglas_Feuer(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 2;
	condition = DIA_Hyglas_Feuer_Condition;
	information = DIA_Hyglas_Feuer_Info;
	permanent = FALSE;
	description = "Мне необходимо пройти Испытание Огнем.";
};


func int DIA_Hyglas_Feuer_Condition()
{
	if((other.guild == GIL_NOV) && (Knows_Fire_Contest == TRUE) && !Npc_KnowsInfo(other,DIA_Pyrokar_FIRE) && Npc_KnowsInfo(other,DIA_Hyglas_JOB))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_Feuer_Info()
{
	AI_Output(other,self,"DIA_Hyglas_Feuer_15_00");	//Мне необходимо пройти Испытание Огнем.
	AI_Output(self,other,"DIA_Hyglas_Feuer_14_01");	//Испытание Огнем - это обряд из древних времен, он давно не проводился.
	AI_Output(self,other,"DIA_Hyglas_Feuer_14_02");	//То, чего ты требуешь, очень опасно. Даже и не думай об этом.
};


instance DIA_Hyglas_Hallo(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 2;
	condition = DIA_Hyglas_Hallo_Condition;
	information = DIA_Hyglas_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Hyglas_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_Hallo_Info()
{
	AI_Output(self,other,"DIA_Hyglas_Hallo_14_00");	//Я мастер Хиглас, Страж Огня и Хранитель Знаний.
	if(other.guild == GIL_NOV)
	{
		AI_Output(self,other,"DIA_Hyglas_Hallo_14_01");	//Итак, мастер Парлан дал тебе разрешение изучать священные книги.
		AI_Output(self,other,"DIA_Hyglas_Hallo_14_02");	//Тогда бери их и изучай. Может быть, ты найдешь просвещение в этих писаниях.
	};
};


instance DIA_Hyglas_JOB(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 2;
	condition = DIA_Hyglas_JOB_Condition;
	information = DIA_Hyglas_JOB_Info;
	permanent = FALSE;
	description = "Что ты изучаешь, Мастер?";
};


func int DIA_Hyglas_JOB_Condition()
{
	return TRUE;
};

func void DIA_Hyglas_JOB_Info()
{
	AI_Output(other,self,"DIA_Hyglas_JOB_15_00");	//Что ты изучаешь, Мастер?
	AI_Output(self,other,"DIA_Hyglas_JOB_14_01");	//Я посвятил себя изучению огня - силы Инноса.
	AI_Output(self,other,"DIA_Hyglas_JOB_14_02");	//Это его дар, и в то же время, могучее оружие - я создаю руны, содержащие частицу его силы.
	if(other.guild == GIL_NOV)
	{
		AI_Output(other,self,"DIA_Hyglas_JOB_15_03");	//Как это интересно! А не мог бы ты научить и меня этому?
		AI_Output(self,other,"DIA_Hyglas_JOB_14_04");	//Магию дарует Иннос. И только его слугам, магам Огня, дано познать, как пользоваться этой силой.
		Log_CreateTopic(Topic_KlosterTeacher,LOG_NOTE);
		B_LogEntry(Topic_KlosterTeacher,"Мастер Хиглас может посвятить меня в тайны огня. Но для этого я должен быть магом Огня.");
	};
	if((other.guild == GIL_KDF) && !Npc_KnowsInfo(other,DIA_Pyrokar_Lernen))
	{
		Log_CreateTopic(Topic_KlosterTeacher,LOG_NOTE);
		B_LogEntry(Topic_KlosterTeacher,"Брат Хиглас может посвятить меня в тайны огня.");
	};
};


instance DIA_Hyglas_CONTEST(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 9;
	condition = DIA_Hyglas_CONTEST_Condition;
	information = DIA_Hyglas_CONTEST_Info;
	permanent = FALSE;
	description = "Я должен пройти Испытание Огнем.";
};


func int DIA_Hyglas_CONTEST_Condition()
{
	if((MIS_Rune == LOG_Running) && Npc_KnowsInfo(other,DIA_Hyglas_JOB))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_CONTEST_Info()
{
	AI_Output(other,self,"DIA_Hyglas_CONTEST_15_00");	//Я должен пройти Испытание Огнем. Ультар дал мне задание создать руну огненной стрелы.
	AI_Output(self,other,"DIA_Hyglas_CONTEST_14_01");	//И ты хочешь, чтобы я обучил тебя этому?
	AI_Output(other,self,"DIA_Hyglas_CONTEST_15_02");	//Я не знаю другого способа выполнить это задание.
	AI_Output(self,other,"DIA_Hyglas_CONTEST_14_03");	//Хмм...
	AI_Output(self,other,"DIA_Hyglas_CONTEST_14_04");	//Хорошо, я научу тебя. Но сначала ты должен найти все необходимые ингредиенты.
	B_LogEntry(TOPIC_Rune,"Хиглас готов обучить меня создавать руну огненной стрелы, если я принесу ему все необходимые ингредиенты.");
};


instance DIA_Hyglas_TALENT_FIREBOLT(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 800;
	condition = DIA_Hyglas_TALENT_FIREBOLT_Condition;
	information = DIA_Hyglas_TALENT_FIREBOLT_Info;
	permanent = TRUE;
	description = B_BuildLearnString("Руна огненной стрелы",B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Firebolt));
};


func int DIA_Hyglas_TALENT_FIREBOLT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Hyglas_CONTEST) && (PLAYER_TALENT_RUNES[SPL_Firebolt] == FALSE))
	{
		return TRUE;
	};
};

var int Firebolt_Scroll_Once;

func void DIA_Hyglas_TALENT_FIREBOLT_Info()
{
	AI_Output(other,self,"DIA_Hyglas_TALENT_FIREBOLT_15_00");	//Научи меня создавать руну огненной стрелы.
	if(Npc_HasItems(other,ItSc_Firebolt) && Npc_HasItems(other,ItMi_RuneBlank) && Npc_HasItems(other,ItMi_Sulfur))
	{
		if(B_TeachPlayerTalentRunes(self,other,SPL_Firebolt))
		{
			AI_Output(self,other,"DIA_Hyglas_TALENT_FIREBOLT_14_01");	//Чтобы создать руну огненной стрелы, ты должен объединить на рунном столе серу с рунным камнем.
			AI_Output(self,other,"DIA_Hyglas_TALENT_FIREBOLT_14_02");	//Сила свитка огненной стрелы перетечет в эту руну, и ты станешь обладателем оружия Инноса.
			AI_Output(self,other,"DIA_Hyglas_TALENT_FIREBOLT_14_03");	//Когда у тебя будет все необходимое, подойди к рунному столу и создай свою руну.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Hyglas_CONTEST_14_04");	//Хорошо, я научу тебя. Но сначала ты должен найти все необходимые ингредиенты.
		if(Firebolt_Scroll_Once == FALSE)
		{
			if(!Npc_HasItems(other,ItSc_Firebolt))
			{
				B_LogEntry(TOPIC_Rune,"Пока у меня нет свитка огненной стрелы, Хиглас не сможет обучить меня созданию руны.");
				if(!Npc_IsDead(Gorax))
				{
					CreateInvItem(Gorax,ItSc_Firebolt);
					B_LogEntry(TOPIC_Rune,"Возможно, я смогу купить такой свиток у Горакса.");
				}
				else
				{
					Wld_InsertItem(ItSc_Firebolt,"FP_ITEM_KLOSTER_01");
					B_LogEntry(TOPIC_Rune,"Похоже, что мне придется искать этот свиток по всему монастырю.");
				};
				Firebolt_Scroll_Once = TRUE;
			};
		};
		AI_StopProcessInfos(self);
	};
};


instance DIA_Hyglas_FIREBOLT(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 9;
	condition = DIA_Hyglas_FIREBOLT_Condition;
	information = DIA_Hyglas_FIREBOLT_Info;
	permanent = TRUE;
	description = "Какие ингредиенты нужны для создания руны огненной стрелы?";
};


func int DIA_Hyglas_FIREBOLT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Hyglas_CONTEST) && (PLAYER_TALENT_RUNES[SPL_Firebolt] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_FIREBOLT_Info()
{
	AI_Output(other,self,"DIA_Hyglas_FIREBOLT_15_00");	//Какие ингредиенты нужны для создания руны огненной стрелы?
	DIA_Common_14_GoReadAboutIt();
};


instance DIA_Hyglas_BLANK_RUNE(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 9;
	condition = DIA_Hyglas_BLANK_RUNE_Condition;
	information = DIA_Hyglas_BLANK_RUNE_Info;
	permanent = FALSE;
	description = "Где я могу найти рунный камень?";
};


func int DIA_Hyglas_BLANK_RUNE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Hyglas_CONTEST) && (MIS_Rune == LOG_Running) && !Npc_HasItems(other,ItMi_RuneBlank) && (PLAYER_TALENT_RUNES[SPL_Firebolt] == FALSE))
	{
		if(SC_KnowsBlankRuneForFirebolt == TRUE)
		{
			return TRUE;
		};
	};
};

func void DIA_Hyglas_BLANK_RUNE_Info()
{
	AI_Output(other,self,"DIA_Hyglas_BLANK_RUNE_15_00");	//Где я могу найти рунный камень?
	AI_Output(self,other,"DIA_Hyglas_BLANK_RUNE_14_01");	//Послушай, ведь тебе необходимо пройти Испытание Огнем - не мне. Поиски входят в это испытание.
};


instance DIA_Hyglas_GOTRUNE(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 2;
	condition = DIA_Hyglas_GOTRUNE_Condition;
	information = DIA_Hyglas_GOTRUNE_Info;
	permanent = FALSE;
	description = "Я создал руну.";
};


func int DIA_Hyglas_GOTRUNE_Condition()
{
	if((MIS_Rune == LOG_Running) && Npc_HasItems(other,ItRu_FireBolt) && !Npc_KnowsInfo(other,DIA_Ulthar_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_GOTRUNE_Info()
{
	AI_Output(other,self,"DIA_Hyglas_GOTRUNE_15_00");	//Я создал руну.
	AI_Output(self,other,"DIA_Hyglas_GOTRUNE_14_01");	//Хорошо, хорошо. Я думаю, ты прошел этот тест. Впрочем, это было не так уж и сложно.
	AI_Output(self,other,"DIA_Hyglas_GOTRUNE_14_02");	//Теперь иди к Ультару и покажи ему плоды своего труда.
	B_LogEntry(TOPIC_Rune,"Я создал руну 'Огненная стрела'.");
};


instance DIA_Hyglas_TEACH(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 15;
	condition = DIA_Hyglas_TEACH_Condition;
	information = DIA_Hyglas_TEACH_Info;
	permanent = TRUE;
	description = "Я хочу изучить новые заклинания.";
};


func int DIA_Hyglas_TEACH_Condition()
{
	if((other.guild == GIL_KDF) && Npc_KnowsInfo(other,DIA_Hyglas_JOB))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_TEACH_Info()
{
	var int abletolearn;
	abletolearn = 0;
	DIA_Common_WantToLearnNewRunes();
	Info_ClearChoices(DIA_Hyglas_TEACH);
	Info_AddChoice(DIA_Hyglas_TEACH,Dialog_Back,DIA_Hyglas_TEACH_BACK);
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2) && (PLAYER_TALENT_RUNES[SPL_InstantFireball] == FALSE))
	{
		Info_AddChoice(DIA_Hyglas_TEACH,B_BuildLearnString(NAME_SPL_InstantFireball,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_InstantFireball)),DIA_Hyglas_TEACH_InstantFireball);
		abletolearn += 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[SPL_Firestorm] == FALSE))
	{
		Info_AddChoice(DIA_Hyglas_TEACH,B_BuildLearnString(NAME_SPL_Firestorm,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Firestorm)),DIA_Hyglas_TEACH_Firestorm);
		abletolearn += 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4) && (PLAYER_TALENT_RUNES[SPL_ChargeFireball] == FALSE))
	{
		Info_AddChoice(DIA_Hyglas_TEACH,B_BuildLearnString(NAME_SPL_ChargeFireball,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_ChargeFireball)),DIA_Hyglas_TEACH_ChargeFireball);
		abletolearn += 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5) && (PLAYER_TALENT_RUNES[SPL_Pyrokinesis] == FALSE))
	{
		Info_AddChoice(DIA_Hyglas_TEACH,B_BuildLearnString(NAME_SPL_Pyrokinesis,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Pyrokinesis)),DIA_Hyglas_TEACH_Pyrokinesis);
		abletolearn += 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 6) && (PLAYER_TALENT_RUNES[SPL_Firerain] == FALSE))
	{
		Info_AddChoice(DIA_Hyglas_TEACH,B_BuildLearnString(NAME_SPL_Firerain,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Firerain)),DIA_Hyglas_TEACH_Firerain);
		abletolearn += 1;
	};
	if(abletolearn < 1)
	{
		if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 0)
		{
			B_Say(self,other,"$NOLEARNNOPOINTS");
			PrintScreen(PRINT_MAGCIRCLES_NEEDFIRST,-1,-1,FONT_ScreenSmall,2);
		}
		else
		{
			B_Say(self,other,"$NOLEARNOVERPERSONALMAX");
		};
		Info_ClearChoices(DIA_Hyglas_TEACH);
	};
};

func void DIA_Hyglas_TEACH_BACK()
{
	Info_ClearChoices(DIA_Hyglas_TEACH);
};

func void DIA_Hyglas_TEACH_InstantFireball()
{
	B_TeachPlayerTalentRunes(self,other,SPL_InstantFireball);
};

func void DIA_Hyglas_TEACH_ChargeFireball()
{
	B_TeachPlayerTalentRunes(self,other,SPL_ChargeFireball);
};

func void DIA_Hyglas_TEACH_Pyrokinesis()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Pyrokinesis);
};

func void DIA_Hyglas_TEACH_Firestorm()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Firestorm);
};

func void DIA_Hyglas_TEACH_Firerain()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Firerain);
};

instance DIA_Hyglas_BringBook(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 38;
	condition = DIA_Hyglas_BringBook_Condition;
	information = DIA_Hyglas_BringBook_Info;
	permanent = FALSE;
	description = "Есть какие-нибудь новости?";
};


func int DIA_Hyglas_BringBook_Condition()
{
	if((Kapitel >= 3) && (hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_BringBook_Info()
{
	AI_Output(other,self,"DIA_Hyglas_BringBook_15_00");	//Есть какие-нибудь новости?
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_01");	//Хмм, да. Ну, ты, вероятно, заметил эти фигуры в черных робах.
	AI_Output(other,self,"DIA_Hyglas_BringBook_15_02");	//Я встречал их.
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_03");	//Вот! А теперь перейдем к сути дела. В настоящий момент, мы наблюдаем очень редкое созвездие.
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_04");	//Если быть более точным, созвездие Быка сейчас находится в прямой взаимосвязи с созвездием Воина. Я полагаю, ты знаешь, что это означает.
	AI_Output(other,self,"DIA_Hyglas_BringBook_15_05");	//Хмм. Ну, если быть честным...
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_06");	//Да, хорошо, я понимаю. Ну, я не могу объяснить тебе сейчас все детали, но это, определенно, предвещает великие перемены. А я не люблю перемены.
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_07");	//Поэтому я хочу, чтобы ты принес мне из города книгу. Она называется 'Божественная сила звезд'. Тебе, возможно, придется поискать ее, но я уверен, что ты справишься с этим.
	Info_ClearChoices(DIA_Hyglas_BringBook);
	Info_AddChoice(DIA_Hyglas_BringBook,"Достань эту книгу сам.",DIA_Hyglas_BringBook_GetItYourself);
	Info_AddChoice(DIA_Hyglas_BringBook,"И что я за это получу?",DIA_Hyglas_BringBook_GetForIt);
	Info_AddChoice(DIA_Hyglas_BringBook,"Я попробую найти ее.",DIA_Hyglas_BringBook_Yes);
};

func void DIA_Hyglas_BringBook_GetItYourself()
{
	AI_Output(other,self,"DIA_Hyglas_BringBook_GetItYourself_15_00");	//Достань эту книгу сам.
	AI_Output(self,other,"DIA_Hyglas_BringBook_GetItYourself_14_01");	//Как ты смеешь говорить со мной в таком тоне?! Твое поведение недопустимо, ты обязан проявлять уважение ко мне!
	AI_Output(self,other,"DIA_Hyglas_BringBook_GetItYourself_14_02");	//Убирайся с глаз моих и подумай о своем поведении.
	MIS_HyglasBringBook = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Hyglas_BringBook);
};

func void DIA_Hyglas_BringBook_GetForIt()
{
	AI_Output(other,self,"DIA_Hyglas_BringBook_GetForIt_15_00");	//И что я за это получу?
	AI_Output(self,other,"DIA_Hyglas_BringBook_GetForIt_14_01");	//Что ты имеешь в виду?
	AI_Output(other,self,"DIA_Hyglas_BringBook_GetForIt_15_02");	//Ну, я бы хотел знать, что ты дашь мне, если я принесу эту книгу.
	AI_Output(self,other,"DIA_Hyglas_BringBook_GetForIt_14_03");	//Ничего. А что ты ожидал получить? Если у тебя есть время, чтобы выполнить для меня задание в городе, это твоя обязанность помочь мне.
};

func void DIA_Hyglas_BringBook_Yes()
{
	AI_Output(other,self,"DIA_Hyglas_BringBook_Yes_15_00");	//Я попробую найти ее.
	AI_Output(self,other,"DIA_Hyglas_BringBook_Yes_14_01");	//Хорошо - это сэкономит мое время, и я смогу заняться другими делами.
	AI_Output(self,other,"DIA_Hyglas_BringBook_Yes_14_02");	//Но не трать на это слишком много времени. Как раз времени-то, боюсь, у нас очень мало.
	MIS_HyglasBringBook = LOG_Running;
	Info_ClearChoices(DIA_Hyglas_BringBook);
	Log_CreateTopic(TOPIC_HyglasBringBook,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HyglasBringBook,LOG_Running);
	B_LogEntry(TOPIC_HyglasBringBook,"Хиглас хочет, чтобы я принес ему книгу 'Божественная сила звезд'. Она может быть у одного из торговцев в городе.");
};


instance DIA_Hyglas_HaveBook(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 38;
	condition = DIA_Hyglas_HaveBook_Condition;
	information = DIA_Hyglas_HaveBook_Info;
	permanent = FALSE;
	description = "Я принес тебе книгу.";
};


func int DIA_Hyglas_HaveBook_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Hyglas_BringBook) && Npc_HasItems(other,ItWr_Astronomy_MIS))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_HaveBook_Info()
{
	AI_Output(other,self,"DIA_Hyglas_HaveBook_15_00");	//Я принес тебе книгу.
	if(MIS_HyglasBringBook == LOG_Running)
	{
		AI_Output(self,other,"DIA_Hyglas_HaveBook_14_01");	//Очень хорошо, давай ее сюда.
	}
	else
	{
		AI_Output(self,other,"DIA_Hyglas_HaveBook_14_02");	//Ты все же передумал. Очень хорошо. Так где же эта книга?
	};
	B_GiveInvItems(other,self,ItWr_Astronomy_MIS,1);
	AI_Output(self,other,"DIA_Hyglas_HaveBook_14_03");	//Теперь ты можешь удалиться. А я должен уединиться и заняться ее изучением.
	MIS_HyglasBringBook = LOG_SUCCESS;
	B_GivePlayerXP(XP_HyglasBringBook);
};


instance DIA_Hyglas_Kap4_PERM(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 49;
	condition = DIA_Hyglas_Kap4_PERM_Condition;
	information = DIA_Hyglas_Kap4_PERM_Info;
	permanent = TRUE;
	description = "Ничего пока не нашел?";
};


func int DIA_Hyglas_Kap4_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Hyglas_BringBook))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_Kap4_PERM_Info()
{
	AI_Output(other,self,"DIA_Hyglas_Kap4_PERM_15_00");	//Ничего пока не нашел?
	if(MIS_HyglasBringBook == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_01");	//Ну, я не совсем уверен, но текущее расположение звезд, похоже, сулит многие опасности.
		AI_Output(other,self,"DIA_Hyglas_Kap4_PERM_15_02");	//Какого рода опасности?
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_03");	//Ну, материя между мирами, похоже, очень слаба. Нужна только небольшая часть силы, которая потребовалась бы в обычное время, чтобы прорвать брешь в этой материи.
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_04");	//Демоны могут использовать эти порталы, чтобы войти в наш мир, не встретив сопротивления.
//		Hyglas_SendsToKarras = TRUE;
	}
	else if(MIS_HyglasBringBook == LOG_Running)
	{
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_05");	//Нет, я все еще жду эту книгу.
	}
	else
	{
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_06");	//Я говорил тебе, что все равно продолжаю свои исследования, но на них, конечно же, потребуется больше времени, если у меня не будет необходимых материалов.
	};
};

