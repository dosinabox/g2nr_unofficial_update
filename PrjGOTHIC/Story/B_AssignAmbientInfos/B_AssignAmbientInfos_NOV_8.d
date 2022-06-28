
instance DIA_NOV_8_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_NOV_8_EXIT_Condition;
	information = DIA_NOV_8_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_NOV_8_EXIT_Condition()
{
	return TRUE;
};

func void DIA_NOV_8_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


var int Feger3_Permanent;

instance DIA_NOV_8_Fegen(C_Info)
{
	nr = 2;
	condition = DIA_NOV_8_Fegen_Condition;
	information = DIA_NOV_8_Fegen_Info;
	permanent = TRUE;
	description = "Мне нужна помощь, чтобы подмести кельи послушников.";
};


func int DIA_NOV_8_Fegen_Condition()
{
	if((MIS_ParlanFegen == LOG_Running) && (NOV_Helfer < 4))
	{
		if(Kapitel == 1)
		{
			return TRUE;
		};
		if(GuildlessMode == TRUE)
		{
			return TRUE;
		};
	};
};

func void DIA_NOV_8_Fegen_Info()
{
	AI_Output(other,self,"DIA_NOV_8_Fegen_15_00");	//Мне нужна помощь, чтобы подмести кельи послушников.
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Feger3))
	{
		if(Feger3_Permanent == FALSE)
		{
			AI_Output(self,other,"DIA_NOV_8_Fegen_08_01");	//Ох, парень. Ты только недавно появился здесь и уже заставляешь других делать свою работу?
			AI_Output(self,other,"DIA_NOV_8_Fegen_08_02");	//Не расстраивайся, у меня были такие же проблемы, когда я пришел сюда. Поэтому я помогу тебе. Было бы смешно, если бы мы не справились с этим.
			NOV_Helfer += 1;
			Feger3_Permanent = TRUE;
			B_GivePlayerXP(XP_Feger);
			AI_StopProcessInfos(self);
			Npc_ExchangeRoutine(self,"FEGEN");
			B_LogEntry(Topic_ParlanFegen,"Я нашел послушника, желающего помочь мне подметать комнаты.");
		}
		else
		{
			AI_Output(self,other,"DIA_NOV_8_Fegen_08_03");	//Брат, я понимаю твое состояние. И я уже сказал тебе, что помогу тебе. Именно этим я и занимаюсь.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_NOV_8_Fegen_08_04");	//Эй, я был бы не против, но я очень занят.
	};
};


instance DIA_NOV_8_Wurst(C_Info)
{
	nr = 3;
	condition = DIA_NOV_8_Wurst_Condition;
	information = DIA_NOV_8_Wurst_Info;
	permanent = TRUE;
	description = "Как насчет вкусной бараньей колбасы?";
};


func int DIA_NOV_8_Wurst_Condition()
{
	if(C_CanFeedNOV(self))
	{
		return TRUE;
	};
};

func void DIA_NOV_8_Wurst_Info()
{
	AI_Output(other,self,"DIA_NOV_8_Wurst_15_00");	//Как насчет вкусной бараньей колбасы?
	AI_Output(self,other,"DIA_NOV_8_Wurst_08_01");	//Не надейся, не откажусь. Спасибо - это именно то, что мне было нужно.
	B_FeedNOV(self);
};


instance DIA_NOV_8_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_NOV_8_JOIN_Condition;
	information = DIA_NOV_8_JOIN_Info;
	permanent = TRUE;
	description = "Как мне стать магом?";
};


func int DIA_NOV_8_JOIN_Condition()
{
	if(hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void DIA_NOV_8_JOIN_Info()
{
	AI_Output(other,self,"DIA_NOV_8_JOIN_15_00");	//Как мне стать магом?
	AI_Output(self,other,"DIA_NOV_8_JOIN_08_01");	//Ты станешь Избранным Инноса, только когда высшие маги Огня позволят это.
	AI_Output(self,other,"DIA_NOV_8_JOIN_08_02");	//Послушникам запрещено изучать рунную магию, а старые писания можно почитать только с разрешения магов.
};


instance DIA_NOV_8_PEOPLE(C_Info)
{
	nr = 5;
	condition = DIA_NOV_8_PEOPLE_Condition;
	information = DIA_NOV_8_PEOPLE_Info;
	permanent = TRUE;
	description = "Кто управляет монастырем?";
};


func int DIA_NOV_8_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_NOV_8_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_NOV_8_PEOPLE_15_00");	//Кто управляет монастырем?
	AI_Output(self,other,"DIA_NOV_8_PEOPLE_08_01");	//Высший Совет. Он состоит из трех самых сильных магов нашего ордена. Днем они находятся в церкви.
	AI_Output(self,other,"DIA_NOV_8_PEOPLE_08_02");	//Избранные Инноса - все маги. Иннос дал им этот дар, чтобы они могли претворять в жизнь его волю на земле.
};


instance DIA_NOV_8_LOCATION(C_Info)
{
	nr = 6;
	condition = DIA_NOV_8_LOCATION_Condition;
	information = DIA_NOV_8_LOCATION_Info;
	permanent = TRUE;
	description = "Расскажи мне об этом монастыре.";
};


func int DIA_NOV_8_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_NOV_8_LOCATION_Info()
{
	AI_Output(other,self,"DIA_NOV_8_LOCATION_15_00");	//Расскажи мне об этом монастыре.
	AI_Output(self,other,"DIA_NOV_8_LOCATION_08_01");	//Он очень древний. Его история восходит к временам Робара Первого.
	AI_Output(self,other,"DIA_NOV_8_LOCATION_08_02");	//Под этим монастырем находятся катакомбы. Они простираются далеко вглубь горы.
};


instance DIA_NOV_8_STANDARD(C_Info)
{
	nr = 10;
	condition = DIA_NOV_8_STANDARD_Condition;
	information = DIA_NOV_8_STANDARD_Info;
	permanent = TRUE;
	description = "Есть что-нибудь новенькое?";
};


func int DIA_NOV_8_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_NOV_8_STANDARD_Info()
{
	AI_Output(other,self,"DIA_NOV_8_STANDARD_15_00");	//Есть что-нибудь новенькое?
	if(Kapitel == 1)
	{
		if(other.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_NOV_8_STANDARD_08_01");	//Можно сказать и так. Уже более ста лет ни один послушник не попадал так быстро в Круг Огня.
			AI_Output(self,other,"DIA_NOV_8_STANDARD_08_02");	//Надеюсь, что я тоже когда-нибудь удостоюсь этой чести. Я готов усердно трудиться ради этого.
		}
		else
		{
			AI_Output(self,other,"DIA_NOV_8_STANDARD_08_03");	//Паладины прибыли на Хоринис совсем недавно. Один из них находится здесь, в монастыре, и проводит время в молитвах.
		};
	}
	else if(Kapitel < 4)
	{
		if((Pedro_Traitor == TRUE) && (MIS_NovizenChase != LOG_SUCCESS))
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_08_04");	//Я все еще не могу поверить в это. Один из нас предал монастырь и украл Глаз Инноса.
			AI_Output(self,other,"DIA_NOV_3_STANDARD_08_05");	//От нашего труда зависит благополучие братства, но мы еще слишком слабы. Вот почему Белиару удалось перетянуть одного из нас на свою сторону.
		}
		else if(MIS_NovizenChase == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_08_06");	//Слава Инносу, мы смогли вырвать Глаз из лап врага.
			AI_Output(self,other,"DIA_NOV_3_STANDARD_08_07");	//Твое мужество может послужить примером для многих отчаявшихся душ и помочь им выжить в эти темные времена.
		}
		else if(MIS_OLDWORLD == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_NOV_8_STANDARD_08_08");	//Я слышал о драконах и об армии Зла. Да пребудет с нами Иннос!
		}
		else
		{
			AI_Output(self,other,"DIA_NOV_8_STANDARD_08_09");	//Высший Совет очень обеспокоен ситуацией, в которую попали наши паладины. Вот уже долгое время нет никаких известий из Долины Рудников.
		};
	}
	else if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_NOV_8_STANDARD_08_10");	//Нет. И я благодарю нашего Владыку за это. С Глазом Инноса мы сможем уничтожить драконов!
	}
	else
	{
		AI_Output(self,other,"DIA_NOV_8_STANDARD_08_11");	//Да. Мы добились победы над драконами! Иннос показал нам, что никогда не стоит опускать руки. Надежда есть всегда.
		AI_Output(self,other,"DIA_NOV_8_STANDARD_08_12");	//Осталось еще немало теней, и нам придется зажечь много огней, чтобы изгнать их.
	};
};

func void B_AssignAmbientInfos_NOV_8(var C_Npc slf)
{
	dia_nov_8_exit.npc = Hlp_GetInstanceID(slf);
	dia_nov_8_join.npc = Hlp_GetInstanceID(slf);
	dia_nov_8_people.npc = Hlp_GetInstanceID(slf);
	dia_nov_8_location.npc = Hlp_GetInstanceID(slf);
	dia_nov_8_standard.npc = Hlp_GetInstanceID(slf);
	DIA_NOV_8_Fegen.npc = Hlp_GetInstanceID(slf);
	DIA_NOV_8_Wurst.npc = Hlp_GetInstanceID(slf);
};

