
instance DIA_Addon_Snaf_EXIT(C_Info)
{
	npc = BDT_1098_Addon_Snaf;
	nr = 999;
	condition = DIA_Addon_Snaf_EXIT_Condition;
	information = DIA_Addon_Snaf_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Snaf_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Snaf_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Snaf_PICKPOCKET(C_Info)
{
	npc = BDT_1098_Addon_Snaf;
	nr = 900;
	condition = DIA_Addon_Snaf_PICKPOCKET_Condition;
	information = DIA_Addon_Snaf_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Addon_Snaf_PICKPOCKET_Condition()
{
	return C_Beklauen(49,56);
};

func void DIA_Addon_Snaf_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Snaf_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Snaf_PICKPOCKET,Dialog_Back,DIA_Addon_Snaf_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Snaf_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Snaf_PICKPOCKET_DoIt);
};

func void DIA_Addon_Snaf_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Snaf_PICKPOCKET);
};

func void DIA_Addon_Snaf_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Snaf_PICKPOCKET);
};


instance DIA_Addon_Snaf_Hi(C_Info)
{
	npc = BDT_1098_Addon_Snaf;
	nr = 1;
	condition = DIA_Addon_Snaf_Hi_Condition;
	information = DIA_Addon_Snaf_Hi_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Snaf_Hi_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Snaf_Hi_Info()
{
	AI_Output(self,other,"DIA_Addon_Snaf_Hi_01_00");	//Хочешь жрать или болтать?
	EnteredBanditsCamp = TRUE;
};


instance DIA_Addon_Snaf_Cook(C_Info)
{
	npc = BDT_1098_Addon_Snaf;
	nr = 2;
	condition = DIA_Addon_Snaf_Cook_Condition;
	information = DIA_Addon_Snaf_Cook_Info;
	permanent = FALSE;
	description = "А что у вас в меню, сэр?";
};


func int DIA_Addon_Snaf_Cook_Condition()
{
	return TRUE;
};

func void DIA_Addon_Snaf_Cook_Info()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Cook_15_00");	//А что у вас в меню, сэр?
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_01_01");	//Советовал бы попробовать наше новое блюдо, умник. Оно называется 'Пламенная нарезка' в соусе 'Плавленые зубы'.
	Info_ClearChoices(DIA_Addon_Snaf_Cook);
	Info_AddChoice(DIA_Addon_Snaf_Cook,"Пламенная нарезка?",DIA_Addon_Snaf_Cook_FEUER);
	Info_AddChoice(DIA_Addon_Snaf_Cook,"А что за соус такой - 'Плавленые зубы'?",DIA_Addon_Snaf_Cook_HAMMER);
};

func void DIA_Addon_Snaf_Cook_FEUER()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Cook_FEUER_15_00");	//Пламенная нарезка?
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_FEUER_01_01");	//Это хрустящее, слегка поджаренное мясо с маринованными корешками огненной травы.
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_FEUER_01_02");	//Но ты не волнуйся. Все ингредиенты уже в наличии.
};

func void DIA_Addon_Snaf_Cook_HAMMER()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Cook_HAMMER_15_00");	//А что за соус такой - 'Плавленые зубы'?
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_HAMMER_01_01");	//Соус, приготовленный из такого крепкого пойла, что зубы плавятся. Достал рецепт у парнишки по имени Лу.
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_HAMMER_01_02");	//Ты достаешь нужные ингредиенты, гонишь горилку на алхимических инструментах, и я тебе делаю соус. Ну как?
	Info_AddChoice(DIA_Addon_Snaf_Cook,"Все, конечно, хорошо, но мне не до этого.",DIA_Addon_Snaf_Cook_NO);
	Info_AddChoice(DIA_Addon_Snaf_Cook,"Собственно, почему бы и нет?",DIA_Addon_Snaf_Cook_YES);
};

func void DIA_Addon_Snaf_Cook_NO()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Cook_HAMMER_NO_15_00");	//Все, конечно, хорошо, но мне не до этого.
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_HAMMER_NO_01_01");	//Ну, дело твое.
	MIS_SnafHammer = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Addon_Snaf_Cook);
};

func void DIA_Addon_Snaf_Cook_YES()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Cook_HAMMER_YES_15_00");	//Собственно, почему бы и нет?
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_HAMMER_YES_01_01");	//Отлично. Вот рецепт.
	B_GiveInvItems(self,other,ITWr_Addon_Lou_Rezept,1);
	MIS_SnafHammer = LOG_Running;
	Info_ClearChoices(DIA_Addon_Snaf_Cook);
	Log_CreateTopic(Topic_Addon_Hammer,LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Hammer,LOG_Running);
	B_LogEntry(Topic_Addon_Hammer,"Снафу нужен ингредиент для соуса. Он дал мне рецепт напитка 'Молот', который я могу приготовить на алхимическом столе.");
};


var int Snaf_Tip_Kosten;

instance DIA_Addon_Snaf_Booze(C_Info)
{
	npc = BDT_1098_Addon_Snaf;
	nr = 3;
	condition = DIA_Addon_Snaf_Booze_Condition;
	information = DIA_Addon_Snaf_Booze_Info;
	permanent = FALSE;
	description = "Вот твой самогон, приятель.";
};


func int DIA_Addon_Snaf_Booze_Condition()
{
	if(Npc_HasItems(other,ItFo_Addon_LousHammer) && (MIS_SnafHammer == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Snaf_Booze_Info()
{
	B_GiveInvItems(other,self,ItFo_Addon_LousHammer,1);
	AI_Output(other,self,"DIA_Addon_Snaf_Booze_15_00");	//Вот твой самогон, приятель.
	AI_Output(self,other,"DIA_Addon_Snaf_Booze_01_01");	//Прекрасно. Позволь мне приготовить соус.
	AI_GotoWP(self,"BL_INN_BAR_03");
	AI_UseMob(self,"CAULDRON",1);
	AI_Wait(self,2);
	AI_UseMob(self,"CAULDRON",-1);
	AI_Wait(self,1);
//	AI_GotoNpc(self,other);
	AI_GotoWP(self,"BL_INN_BAR_05");
	AI_TurnToNPC(self,other);
	AI_Output(self,other,"DIA_Addon_Snaf_Booze_01_02");	//Вот, готово. Можешь попробовать прямо сейчас. Силушки-то в ручонках прибавится, спору нет.
	AI_Output(self,other,"DIA_Addon_Snaf_Booze_01_03");	//А еще, если тебе понадобится моя помощь... Теперь вся информация для тебя - бесплатно.
	Snaf_Tip_Kosten = 0;
	B_GiveInvItems(self,other,ItFo_Addon_FireStew,1);
	MIS_SnafHammer = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Loushammer);
};


instance DIA_Addon_Snaf_Attentat(C_Info)
{
	npc = BDT_1098_Addon_Snaf;
	nr = 4;
	condition = DIA_Addon_Snaf_Attentat_Condition;
	information = DIA_Addon_Snaf_Attentat_Info;
	permanent = FALSE;
	description = "Что ты знаешь о нападении?";
};


func int DIA_Addon_Snaf_Attentat_Condition()
{
	if(MIS_Judas == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Snaf_Attentat_Info()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Attentat_15_00");	//Что ты знаешь о нападении?
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_01_01");	//Ты говоришь про нападение на Эстебана?
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_01_02");	//Ну, ты меня понимаешь, хозяин таверны слышит все, но не утверждает, что все, что он слышал - правда.
	Info_ClearChoices(DIA_Addon_Snaf_Attentat);
	Info_AddChoice(DIA_Addon_Snaf_Attentat,"Скажи хоть, к кому я могу с этим обратиться.",DIA_Addon_Snaf_Attentat_GoWhere);
	Info_AddChoice(DIA_Addon_Snaf_Attentat,"А что ты бы сделал, будь ты на моем месте?",DIA_Addon_Snaf_Attentat_YouBeingMe);
	Info_AddChoice(DIA_Addon_Snaf_Attentat,"Значит, все же тебе что-то известно?",DIA_Addon_Snaf_Attentat_Something);
};

func void DIA_Addon_Snaf_Attentat_Something()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Attentat_Something_15_00");	//Значит, все же тебе что-то известно?
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_Something_01_01");	//Ну, я этого не говорил.
};

func void DIA_Addon_Snaf_Attentat_GoWhere()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Attentat_GoWhere_15_00");	//Скажи хоть, к кому я могу с этим обратиться.
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_GoWhere_01_01");	//Какое тебе до этого дело, друг? Брось ты все это.
};

func void DIA_Addon_Snaf_Attentat_YouBeingMe()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Attentat_YouBeingMe_15_00");	//А что ты бы сделал, будь ты на моем месте?
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_YouBeingMe_01_01");	//Я бы задумался над тем, что я знаю о человеке, который стоял за нападением.
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_YouBeingMe_01_02");	//Во-первых, вероятнее всего это разбойник, и это означает, что он здесь, в лагере.
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_YouBeingMe_01_03");	//Во-вторых, он наверняка за тобой наблюдает.
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_YouBeingMe_01_04");	//И в-третьих, пока он считает, что ты на стороне Эстебана, он ни за что не раскроет себя тебе.
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_YouBeingMe_01_05");	//Самое время задать вопрос: каковы твои шансы найти этого человека?
	Info_ClearChoices(DIA_Addon_Snaf_Attentat);
};


instance DIA_Addon_Snaf_Abrechnung(C_Info)
{
	npc = BDT_1098_Addon_Snaf;
	nr = 5;
	condition = DIA_Addon_Snaf_Abrechnung_Condition;
	information = DIA_Addon_Snaf_Abrechnung_Info;
	permanent = TRUE;
	description = "Ну и каковы же?";
};


func int DIA_Addon_Snaf_Abrechnung_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Snaf_Attentat) && (MIS_Judas == LOG_Running) && (Huno_zuSnaf == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Snaf_Abrechnung_Info()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Abrechnung_15_00");	//Ну и каковы же?
	AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_01");	//Хм...
	if((Senyan_Erpressung == LOG_Running) && !Npc_IsDead(Senyan))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_02");	//Невысоки, я бы сказал. Некоторые уже заметили, что у тебя общие дела с Сеньяном.
		AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_03");	//Тебе нужно срочно исправить это и порвать с ним, иначе не видать тебе человека, что стоял за нападением.
		if(Snaf_Tip_Senyan == FALSE)
		{
			B_LogEntry(Topic_Addon_Senyan,"Я должен порвать отношения с Сеньяном. Но нападать на него напрямую было бы глупо, поэтому я должен сначала с ним поговорить.");
			Snaf_Tip_Senyan = TRUE;
		};
	}
	else if(Npc_IsDead(Senyan))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_04");	//Ты прибил одного из парней Эстебана. Я полагаю, тот, кого ты ищешь, будет больше тебе доверять, когда ты его встретишь.
		AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_05");	//Но он вряд ли так просто раскроется. Тебе нужно узнать больше.
	}
	else
	{
		if(Finn_Petzt == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_06");	//Финн заметно взволнован с тех пор, как ты с ним поговорил.
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_07");	//И все здесь знают, что он хорошо ладит с Эстебаном.
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_08");	//Это значит, что ты сказал ему что-то, чего он явно не хотел слышать.
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_09");	//Это наверняка понравится тому, кого ты ищешь.
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_10");	//Хотя вполне возможно, что он бросится к Эстебану с этой информацией. (ухмыляется) Ну, хотя ты сам все прекрасно понимаешь.
		};
		if(Finn_TellAll == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_11");	//Говорят, ты сболтнул Финну, что работаешь на Эстебана.
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_12");	//Не знаю, чего ты там задумал, но теперь человек, которого ты ищешь, наверняка станет осторожней.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_13");	//Ну, хотя вряд ли можно говорить об этом с уверенностью.
		};
	};
	if(Snaf_Rechnung == FALSE)
	{
		if(Snaf_Einmal == FALSE)
		{
			AI_Output(other,self,"DIA_Addon_Snaf_Abschied_15_14");	//Спасибо тебе.
			AI_Output(self,other,"DIA_Addon_Snaf_Abschied_01_15");	//(резко) Эй! Ты от меня ничего не слышал, ясно?!
			Snaf_Einmal = TRUE;
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Snaf_Abschied_15_16");	//Само собой.
			AI_Output(self,other,"DIA_Addon_Snaf_Abschied_01_17");	//Вот именно.
		};
	};
};


instance DIA_Addon_Snaf_HOCH(C_Info)
{
	npc = BDT_1098_Addon_Snaf;
	nr = 6;
	condition = DIA_Addon_Snaf_HOCH_Condition;
	information = DIA_Addon_Snaf_HOCH_Info;
	permanent = FALSE;
	description = "Я от Хуно.";
};


func int DIA_Addon_Snaf_HOCH_Condition()
{
	if(Huno_zuSnaf == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Snaf_HOCH_Info()
{
	AI_Output(other,self,"DIA_Addon_Snaf_HOCH_15_00");	//Я от Хуно.
	AI_Output(self,other,"DIA_Addon_Snaf_HOCH_01_01");	//Гляжу, ты нашел того, кого искал.
	AI_Output(self,other,"DIA_Addon_Snaf_HOCH_01_02");	//Поднимись наверх, тебя там ждут.
	AI_StopProcessInfos(self);
	AI_Teleport(Fisk,"BL_INN_UP_06");
	B_StartOtherRoutine(Fisk,"MEETING");
	B_GivePlayerXP(XP_Addon_Auftraggeber);
};


var int Kosten_Einmal;

instance DIA_Addon_Snaf_People(C_Info)
{
	npc = BDT_1098_Addon_Snaf;
	nr = 6;
	condition = DIA_Addon_Snaf_People_Condition;
	information = DIA_Addon_Snaf_People_Info;
	permanent = TRUE;
	description = "Что местные думают об Эстебане?";
};


func int DIA_Addon_Snaf_People_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Snaf_Attentat) && !Npc_IsDead(Esteban))
	{
		return TRUE;
	};
};

func void DIA_Addon_Snaf_People_Info()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_15_00");	//Что местные думают об Эстебане?
	AI_Output(self,other,"DIA_Addon_Snaf_People_01_01");	//Тебе следует быть более точным в своих вопросах...
	if((Kosten_Einmal == FALSE) && (MIS_SnafHammer != LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_People_01_02");	//Информация стоит денег, приятель...
		AI_Output(other,self,"DIA_Addon_Snaf_People_15_03");	//Ну, и сколько же она стоит?
		AI_Output(self,other,"DIA_Addon_Snaf_People_01_04");	//Десятка вполне сойдет.
		Snaf_Tip_Kosten = 10;
		Kosten_Einmal = TRUE;
	};
	Info_ClearChoices(DIA_Addon_Snaf_People);
	Info_AddChoice(DIA_Addon_Snaf_People,Dialog_Back,DIA_Addon_Snaf_People_BACK);
	Info_AddChoice(DIA_Addon_Snaf_People,"Пол",DIA_Addon_Snaf_People_Paul);
	Info_AddChoice(DIA_Addon_Snaf_People,"Хуно",DIA_Addon_Snaf_People_Huno);
	Info_AddChoice(DIA_Addon_Snaf_People,"Фиск",DIA_Addon_Snaf_People_Fisk);
	Info_AddChoice(DIA_Addon_Snaf_People,"Эмилио",DIA_Addon_Snaf_People_Emilio);
	if(!Npc_IsDead(Senyan))
	{
		Info_AddChoice(DIA_Addon_Snaf_People,"Сеньян",DIA_Addon_Snaf_People_Senyan);
	};
	Info_AddChoice(DIA_Addon_Snaf_People,"Леннар",DIA_Addon_Snaf_People_Lennar);
	Info_AddChoice(DIA_Addon_Snaf_People,"Финн",DIA_Addon_Snaf_People_Finn);
};

func void B_Addon_Snaf_NotEnough()
{
	AI_Output(self,other,"DIA_Addon_Snaf_NotEnough_01_00");	//Да у тебя золота не хватает, парень!
};

func void DIA_Addon_Snaf_People_BACK()
{
	Info_ClearChoices(DIA_Addon_Snaf_People);
};

func void DIA_Addon_Snaf_People_Paul()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_Paul_15_00");	//А что Пол?
	if(B_GiveInvItems(other,self,ItMi_Gold,Snaf_Tip_Kosten))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_People_Paul_01_01");	//Не думаю, что он без ума от Эстебана. Из-за того, что он работает на Хуно, в шахту ему никогда не попасть.
	}
	else
	{
		B_Addon_Snaf_NotEnough();
	};
};

func void DIA_Addon_Snaf_People_Huno()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_Huno_15_00");	//Что Хуно думает об Эстебане?
	AI_Output(self,other,"DIA_Addon_Snaf_People_Huno_01_01");	//А, Хуно! Я про него почти ничего не знаю.
	if(MIS_SnafHammer != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Snaf_People_Huno_01_02");	//(ухмыляется) Конечно, денег я за это с тебя не возьму.
	};
};

func void DIA_Addon_Snaf_People_Fisk()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_Fisk_15_00");	//А Фиск?
	if(B_GiveInvItems(other,self,ItMi_Gold,Snaf_Tip_Kosten))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_People_Fisk_01_01");	//Фиск есть Фиск. Он платит долю Эстебану и перепродает добро, которое он, в основном, получает от пиратов.
		AI_Output(self,other,"DIA_Addon_Snaf_People_Fisk_01_02");	//По мне, так он вряд ли питает добрые чувства к Эстебану.
	}
	else
	{
		B_Addon_Snaf_NotEnough();
	};
};

func void DIA_Addon_Snaf_People_Emilio()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_Emilio_15_00");	//Как Эмилио относится к Эстебану?
	if(B_GiveInvItems(other,self,ItMi_Gold,Snaf_Tip_Kosten))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_People_Emilio_01_01");	//Ну, свечку за его душу он вряд ли когда-нибудь поставит, это точно.
	}
	else
	{
		B_Addon_Snaf_NotEnough();
	};
};

func void DIA_Addon_Snaf_People_Senyan()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_Senyan_15_00");	//А Сеньян?
	if(B_GiveInvItems(other,self,ItMi_Gold,Snaf_Tip_Kosten))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_People_Senyan_01_01");	//Сеньян - один из ребят Эстебана. Довольно давно работает на него.
	}
	else
	{
		B_Addon_Snaf_NotEnough();
	};
};

func void DIA_Addon_Snaf_People_Lennar()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_Lennar_15_00");	//Какого мнения об Эстебане Леннар?
	AI_Output(self,other,"DIA_Addon_Snaf_People_Lennar_01_01");	//Насколько я могу сказать, он не имеет никакого мнения об Эстебане.
};

func void DIA_Addon_Snaf_People_Finn()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_Finn_15_00");	//А что с Финном?
	if(B_GiveInvItems(other,self,ItMi_Gold,Snaf_Tip_Kosten))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_People_Finn_01_01");	//Отличный рудокоп. Он золото носом чует.
		AI_Output(self,other,"DIA_Addon_Snaf_People_Finn_01_02");	//Эстебан высоко его за это ценит. Так что они друг с другом отлично ладят.
	}
	else
	{
		B_Addon_Snaf_NotEnough();
	};
};


instance DIA_Addon_Snaf_Himself(C_Info)
{
	npc = BDT_1098_Addon_Snaf;
	nr = 7;
	condition = DIA_Addon_Snaf_Himself_Condition;
	information = DIA_Addon_Snaf_Himself_Info;
	permanent = FALSE;
	description = "А ты? Что ты думаешь об Эстебане?";
};


func int DIA_Addon_Snaf_Himself_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Snaf_Attentat) && !Npc_IsDead(Esteban))
	{
		return TRUE;
	};
};

func void DIA_Addon_Snaf_Himself_Info()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Himself_15_00");	//А ты? Что ты думаешь об Эстебане?
	AI_Output(self,other,"DIA_Addon_Snaf_Himself_01_01");	//Я думаю, что нам не стоит о нем трепаться, а то мало ли...
};


instance DIA_Addon_Snaf_PERM(C_Info)
{
	npc = BDT_1098_Addon_Snaf;
	nr = 8;
	condition = DIA_Addon_Snaf_PERM_Condition;
	information = DIA_Addon_Snaf_PERM_Info;
	permanent = TRUE;
	description = "Как работается?";
};


func int DIA_Addon_Snaf_PERM_Condition()
{
	if(Npc_IsDead(Esteban))
	{
		return TRUE;
	};
};

func void DIA_Addon_Snaf_PERM_Info()
{
	AI_Output(other,self,"DIA_Addon_Snaf_PERM_15_00");	//Как работается?
	AI_Output(self,other,"DIA_Addon_Snaf_PERM_01_01");	//Лучше некуда! Смерть Эстебана для меня - праздник.
};

