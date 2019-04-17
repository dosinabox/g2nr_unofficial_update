
instance DIA_Garvell_EXIT(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 999;
	condition = DIA_Garvell_EXIT_Condition;
	information = DIA_Garvell_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Garvell_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Garvell_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Garvell_PICKPOCKET(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 900;
	condition = DIA_Garvell_PICKPOCKET_Condition;
	information = DIA_Garvell_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Garvell_PICKPOCKET_Condition()
{
//	return C_StealItems(10,Hlp_GetInstanceID(ItSe_GoldPocket25),1);
	if(Npc_HasItems(self,ItSe_GoldPocket25))
	{
		return C_StealItem(10,Hlp_GetInstanceID(ItMi_Pocket));
	}
	else
	{
		return FALSE;
	};
};

func void DIA_Garvell_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Garvell_PICKPOCKET);
	Info_AddChoice(DIA_Garvell_PICKPOCKET,Dialog_Back,DIA_Garvell_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Garvell_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Garvell_PICKPOCKET_DoIt);
};

func void DIA_Garvell_PICKPOCKET_DoIt()
{
//	B_StealItems(10,Hlp_GetInstanceID(ItSe_GoldPocket25),1);
	B_StealItem(10,Hlp_GetInstanceID(ItSe_GoldPocket25));
	Info_ClearChoices(DIA_Garvell_PICKPOCKET);
};

func void DIA_Garvell_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Garvell_PICKPOCKET);
};


instance DIA_Garvell_GREET(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 2;
	condition = DIA_Garvell_GREET_Condition;
	information = DIA_Garvell_GREET_Info;
	description = "Что ты делаешь здесь?";
};


func int DIA_Garvell_GREET_Condition()
{
	if(Wld_IsTime(5,0,19,10))
	{
		return TRUE;
	};
};

func void DIA_Garvell_GREET_Info()
{
	AI_Output(other,self,"DIA_Garvell_GREET_15_00");	//Что ты делаешь здесь?
	AI_Output(self,other,"DIA_Garvell_GREET_04_01");	//Я строю корабль, потому что я хочу убраться отсюда - и чем быстрее, тем лучше.
	AI_Output(self,other,"DIA_Garvell_GREET_04_02");	//Но судя по тому, как идет работа, этот корабль никогда не будет закончен.
};


instance DIA_Garvell_eilig(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 2;
	condition = DIA_Garvell_eilig_Condition;
	information = DIA_Garvell_eilig_Info;
	description = "Почему ты так торопишься?";
};


func int DIA_Garvell_eilig_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Garvell_GREET))
	{
		return TRUE;
	};
};

func void DIA_Garvell_eilig_Info()
{
	AI_Output(other,self,"DIA_Garvell_eilig_15_00");	//Почему ты так торопишься?
	AI_Output(self,other,"DIA_Garvell_eilig_04_01");	//Скоро придут орки и сожгут город дотла.
	AI_Output(other,self,"DIA_Garvell_eilig_15_02");	//Почему ты так думаешь?
	AI_Output(self,other,"DIA_Garvell_eilig_04_03");	//Парень, ты видишь, что паладины теперь повсюду? Почему, как ты думаешь, они здесь?
	AI_Output(self,other,"DIA_Garvell_eilig_04_04");	//Я скажу тебе. Они здесь, потому что скоро на нас нападут орки. А это не доставит нам радости.
};


instance DIA_Garvell_Schiff(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 99;
	condition = DIA_Garvell_Schiff_Condition;
	information = DIA_Garvell_Schiff_Info;
	description = "Почему ты не можешь закончить корабль?";
};


func int DIA_Garvell_Schiff_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Garvell_GREET))
	{
		return TRUE;
	};
};

func void DIA_Garvell_Schiff_Info()
{
	AI_Output(other,self,"DIA_Garvell_Schiff_15_00");	//Почему ты не можешь закончить корабль?
	AI_Output(self,other,"DIA_Garvell_Schiff_04_01");	//Ох, у нас тысячи проблем. Остов пока еще не очень стабилен и не хватает досок на обшивку.
	AI_Output(self,other,"DIA_Garvell_Schiff_04_02");	//У меня почти не осталось средств на покупку материалов, а последняя партия вся была поедена жучком.
	AI_Output(self,other,"DIA_Garvell_Schiff_04_03");	//Мои парни работают не очень эффективно. Один хочет построить быстрый корабль, а другого волнует только резная фигура, которая будет установлена на носу судна.
	AI_Output(self,other,"DIA_Garvell_Schiff_04_04");	//Как будто нам больше нечем заняться!
	if(MissingPeopleReturnedHome == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Garvell_Schiff_04_00");	//К тому же один из моих парней просто перестал приходить на работу. Я начинаю опасаться, что это еще сильнее задержит постройку.
	};
};


instance DIA_Addon_Garvell_MissingPeople(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 5;
	condition = DIA_Addon_Garvell_MissingPeople_Condition;
	information = DIA_Addon_Garvell_MissingPeople_Info;
	description = "У тебя пропал рабочий?";
};


func int DIA_Addon_Garvell_MissingPeople_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Garvell_Schiff) && (MissingPeopleReturnedHome == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garvell_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Garvell_MissingPeople_15_00");	//У тебя пропал рабочий?
	AI_Output(self,other,"DIA_Addon_Garvell_MissingPeople_04_01");	//Да. Его звали Монти. Он как будто растворился в воздухе.
	AI_Output(self,other,"DIA_Addon_Garvell_MissingPeople_04_02");	//Эта ленивая свинья, наверное, прохлаждается сейчас на какой-нибудь ферме. Не надо было платить ему аванс.
	AI_Output(other,self,"DIA_Addon_Garvell_MissingPeople_wo_15_00");	//Когда в последний раз ты видел Монти?
	AI_Output(self,other,"DIA_Addon_Garvell_MissingPeople_wo_04_01");	//(сердито) Первый раз он не потрудился прийти на работу два дня назад.
	Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_MissingPeople,"Гарвелл жалуется на своего работника Монти, который не вышел на работу несколько дней назад. Гарвелл думает, что Монти сбежал к фермерам.");
};

instance DIA_Addon_Garvell_MissingPeopleMore(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 5;
	condition = DIA_Addon_Garvell_MissingPeopleMore_Condition;
	information = DIA_Addon_Garvell_MissingPeopleMore_Info;
	description = "Я слышал, что пропадали и другие люди.";
};


func int DIA_Addon_Garvell_MissingPeopleMore_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Garvell_MissingPeople) && (MissingPeopleReturnedHome == FALSE) && (SC_HearedAboutMissingPeople == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garvell_MissingPeopleMore_Info()
{
	AI_Output(other,self,"DIA_Addon_Garvell_MissingPeople_more_15_00");	//Я слышал, что пропадали и другие люди.
	AI_Output(self,other,"DIA_Addon_Garvell_MissingPeople_more_04_01");	//О чем я и говорю! Плохие времена настали...
	AI_Output(self,other,"DIA_Addon_Garvell_MissingPeople_more_04_02");	//Рыбак Фарим рассказывал мне похожую историю. Пропал его приятель Вильям.
	AI_Output(self,other,"DIA_Addon_Garvell_MissingPeople_more_04_03");	//Я уверен, что за всем этим стоят орки.
	SCKnowsFarimAsWilliamsFriend = TRUE;
	Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_WhoStolePeople,"Похоже, рыбак Фарим что-то знает об исчезновении своего друга Вильяма.");
	if(!Npc_KnowsInfo(other,DIA_Addon_Farim_William))
	{
		Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
		B_LogEntry(TOPIC_Addon_MissingPeople,LogText_Addon_WilliamMissing);
	};
	Info_ClearChoices(DIA_Addon_Garvell_MissingPeopleMore);
	Info_AddChoice(DIA_Addon_Garvell_MissingPeopleMore,Dialog_Back,DIA_Addon_Garvell_MissingPeopleMore_BACK);
	Info_AddChoice(DIA_Addon_Garvell_MissingPeopleMore,"Где мне найти этого Фарима?",DIA_Addon_Garvell_MissingPeopleMore_Farim);
};

func void DIA_Addon_Garvell_MissingPeopleMore_BACK()
{
	Info_ClearChoices(DIA_Addon_Garvell_MissingPeopleMore);
};

func void DIA_Addon_Garvell_MissingPeopleMore_Farim()
{
	AI_Output(other,self,"DIA_Addon_Garvell_MissingPeople_Farim_15_00");	//Где мне найти этого Фарима?
	AI_Output(self,other,"DIA_Addon_Garvell_MissingPeople_Farim_04_01");	//Он рыбак. Думаю, ты найдешь его рядом со складом запасов паладинов. Но я не уверен.
	B_LogEntry(TOPIC_Addon_WhoStolePeople,"Хижина Фарима находится неподалеку от склада запасов паладинов.");
};

instance DIA_Garvell_ReturnMonty(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 99;
	condition = DIA_Garvell_ReturnMonty_Condition;
	information = DIA_Garvell_ReturnMonty_Info;
	description = "Как продвигаются дела?";
};


func int DIA_Garvell_ReturnMonty_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Garvell_Schiff) && (MissingPeopleReturnedHome == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Garvell_ReturnMonty_Info()
{
	AI_Output(other,self,"DIA_Addon_Garvell_ReturnMonty_15_00");	//Как продвигаются дела?
	if(!Npc_IsDead(Monty_NW))
	{
		AI_Output(self,other,"DIA_Addon_Garvell_ReturnMonty_04_01");	//Монти вернулся! Сейчас он изучает чертежи.
		AI_Output(self,other,"DIA_Addon_Garvell_ReturnMonty_04_02");	//Может быть, теперь нам и удастся построить корабль...
		B_GivePlayerXP(XP_Ambient);
	}
	else if(MIS_Garvell_Infos == LOG_Running)
	{
		AI_Output(self,other,"DIA_Garvell_Add_04_00");	//Я должен знать, сколько у меня осталось времени на постройку судна.	
	}
	else if(MIS_Garvell_Infos == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Garvell_Success_04_00");	//Спасибо за информацию. Судя по всему, у нас сколько угодно времени на постройку судна.
	}
	else
	{
		AI_Output(self,other,"DIA_Garvell_Schiff_04_01");	//Ох, у нас тысячи проблем. Остов пока еще не очень стабилен и не хватает досок на обшивку.
	};
};


instance DIA_Garvell_MISSION(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 2;
	condition = DIA_Garvell_MISSION_Condition;
	information = DIA_Garvell_MISSION_Info;
	permanent = FALSE;
	description = "Могу я чем-нибудь помочь?";
};


func int DIA_Garvell_MISSION_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Garvell_eilig) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Garvell_MISSION_Info()
{
	AI_Output(other,self,"DIA_Garvell_MISSION_15_00");	//Могу я чем-нибудь помочь?
	AI_Output(self,other,"DIA_Garvell_MISSION_04_01");	//Да, можешь. Выясни, что планируют паладины. Я хочу знать, зачем они здесь.
	AI_Output(self,other,"DIA_Garvell_MISSION_04_02");	//И я должен знать, действительно ли орки собираются напасть на нас и как далеко от города они находятся.
	AI_Output(self,other,"DIA_Garvell_MISSION_04_03");	//Одного из этих отродий видели совсем неподалеку от города.
	AI_Output(self,other,"DIA_Garvell_MISSION_04_04");	//Просто сообщай мне всю информацию, что раздобудешь.
	AI_Output(self,other,"DIA_Garvell_Add_04_00");	//Я должен знать, сколько у меня осталось времени на постройку судна.
	MIS_Garvell_Infos = LOG_Running;
	Knows_Ork = TRUE;
	Log_CreateTopic(TOPIC_Garvell,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Garvell,LOG_Running);
	B_LogEntry(TOPIC_Garvell,"Гарвелл хочет получить информацию об орках и о цели прибытия паладинов.");
};

func void B_GarvellGivePlayerXP()
{
	if(Kapitel == 1)
	{
		B_GivePlayerXP(100);
	}
	else if(Kapitel == 2)
	{
		B_GivePlayerXP(75);
	}
	else if(Kapitel == 3)
	{
		B_GivePlayerXP(50);
	}
	else
	{
		B_GivePlayerXP(25);
	};
};

func void B_GarvellWeiter()
{
	AI_Output(self,other,"DIA_Garvell_Weiter_04_00");	//Хорошо. Если еще что-нибудь выяснишь, дай мне знать.
};

func void B_GarvellSuccess()
{
	AI_Output(self,other,"DIA_Garvell_Success_04_00");	//Спасибо за информацию. Судя по всему, у нас сколько угодно времени на постройку судна.
	MIS_Garvell_Infos = LOG_SUCCESS;
	B_CheckLog();
};


instance DIA_Garvell_Orks(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 3;
	condition = DIA_Garvell_Orks_Condition;
	information = DIA_Garvell_Orks_Info;
	permanent = FALSE;
	description = "У меня есть информация об орках.";
};


func int DIA_Garvell_Orks_Condition()
{
	if((MIS_Garvell_Infos == LOG_Running) && ((RangarToldAboutPaladins == TRUE) || Npc_KnowsInfo(other,DIA_Garond_NeedProof)))
	{
		return TRUE;
	};
};

func void DIA_Garvell_Orks_Info()
{
	AI_Output(other,self,"DIA_Garvell_Orks_15_00");	//У меня есть информация об орках.
	AI_Output(self,other,"DIA_Garvell_Orks_04_01");	//Выкладывай.
	AI_Output(other,self,"DIA_Garvell_Orks_15_02");	//Они застряли в Долине Рудников, и, похоже, они собираются остаться там.
	AI_Output(other,self,"DIA_Garvell_Orks_15_03");	//Чтобы здесь было безопасно, паладины охраняют Проход.
	Tell_Garvell += 1;
	B_GarvellGivePlayerXP();
	if(Tell_Garvell >= 3)
	{
		B_GarvellSuccess();
	}
	else
	{
		B_GarvellWeiter();
	};
};


instance DIA_Garvell_Paladine(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 2;
	condition = DIA_Garvell_Paladine_Condition;
	information = DIA_Garvell_Paladine_Info;
	permanent = FALSE;
	description = "Я знаю, зачем паладины здесь.";
};


func int DIA_Garvell_Paladine_Condition()
{
	if((MIS_Garvell_Infos == LOG_Running) && (KnowsPaladins_Ore == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Garvell_Paladine_Info()
{
	AI_Output(other,self,"DIA_Garvell_Paladine_15_00");	//Я знаю, зачем паладины здесь.
	AI_Output(self,other,"DIA_Garvell_Paladine_04_01");	//Правда? Скажи мне!
	AI_Output(other,self,"DIA_Garvell_Paladine_15_02");	//Паладины здесь, чтобы добывать магическую руду в Долине Рудников, а не потому, что они ожидают нападения орков на город.
	AI_Output(other,self,"DIA_Garvell_Paladine_15_03");	//Как только они добудут руду, они вернутся на материк.
	Tell_Garvell += 1;
	B_GarvellGivePlayerXP();
	if(Tell_Garvell >= 3)
	{
		B_GarvellSuccess();
	}
	else
	{
		B_GarvellWeiter();
	};
};


instance DIA_Garvell_City(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 4;
	condition = DIA_Garvell_City_Condition;
	information = DIA_Garvell_City_Info;
	permanent = FALSE;
	description = "Что касается орка около города...";
};


func int DIA_Garvell_City_Condition()
{
	if((MIS_Garvell_Infos == LOG_Running) && ((RangarToldAboutOrc == TRUE) || Npc_IsDead(CityOrc)))
	{
		return TRUE;
	};
};

func void DIA_Garvell_City_Info()
{
	AI_Output(other,self,"DIA_Garvell_City_15_00");	//Что касается орка около города...
	AI_Output(self,other,"DIA_Garvell_City_04_01");	//Дааа?
	if(Npc_IsDead(CityOrc))
	{
		AI_Output(other,self,"DIA_Lobart_VINOTOT_15_01");	//Он мертв.
	}
	else
	{
		AI_Output(other,self,"DIA_Garvell_City_15_02");	//Не волнуйся насчет него. Городская стража позаботится о нем.
	};
	Tell_Garvell += 1;
	B_GarvellGivePlayerXP();
	if(Tell_Garvell >= 3)
	{
		B_GarvellSuccess();
	}
	else
	{
		B_GarvellWeiter();
	};
};


instance DIA_Garvell_Perm(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 13;
	condition = DIA_Garvell_Perm_Condition;
	information = DIA_Garvell_Perm_Info;
	permanent = TRUE;
	description = "Что происходит в гавани?";
};


func int DIA_Garvell_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Garvell_MISSION))
	{
		return TRUE;
	};
};

func void DIA_Garvell_Perm_Info()
{
	AI_Output(other,self,"DIA_Garvell_Perm_15_00");	//Что происходит в гавани?
	if(MIS_Garvell_Infos != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Garvell_Perm_04_01");	//Орки дышат нам в спину, а ты спрашиваешь о гавани?
		AI_Output(other,self,"DIA_Garvell_Perm_15_02");	//Я только хотел...
		AI_Output(self,other,"DIA_Garvell_Perm_04_03");	//Самая большая проблема в том, что в гавани недостаточно кораблей, чтобы вывезти нас отсюда.
		AI_Output(self,other,"DIA_Garvell_Perm_04_04");	//Если честно, здесь всего один корабль, и он принадлежит паладинам. А они уж точно не позволят нам воспользоваться им.
	}
	else
	{
		AI_Output(self,other,"DIA_Garvell_Perm_04_05");	//Оглянись вокруг, здесь давно уже ничего не происходит.
	};
};

