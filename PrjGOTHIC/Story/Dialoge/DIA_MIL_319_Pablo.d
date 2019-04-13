
instance DIA_Pablo_EXIT(C_Info)
{
	npc = MIL_319_Pablo;
	nr = 999;
	condition = DIA_Pablo_EXIT_Condition;
	information = DIA_Pablo_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Pablo_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Pablo_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Pablo_PICKPOCKET(C_Info)
{
	npc = MIL_319_Pablo;
	nr = 900;
	condition = DIA_Pablo_PICKPOCKET_Condition;
	information = DIA_Pablo_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(Украсть этот ключ легче легкого)";
};


func int DIA_Pablo_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_HasItems(self,ItKe_City_Tower_01) >= 1) && (other.attribute[ATR_DEXTERITY] >= (20 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Pablo_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Pablo_PICKPOCKET);
	Info_AddChoice(DIA_Pablo_PICKPOCKET,Dialog_Back,DIA_Pablo_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Pablo_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Pablo_PICKPOCKET_DoIt);
};

func void DIA_Pablo_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 20)
	{
		B_GiveInvItems(self,other,ItKe_City_Tower_01,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Pablo_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void DIA_Pablo_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Pablo_PICKPOCKET);
};


var int Pablo_belogen;

instance DIA_Pablo_WANTED(C_Info)
{
	npc = MIL_319_Pablo;
	nr = 1;
	condition = DIA_Pablo_WANTED_Condition;
	information = DIA_Pablo_WANTED_Info;
	important = TRUE;
};


func int DIA_Pablo_WANTED_Condition()
{
	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Pablo_WANTED_Info()
{
	AI_Output(self,other,"DIA_Pablo_WANTED_12_00");	//Эй, ты, подожди - мне кажется, я тебя знаю.
	AI_Output(other,self,"DIA_Pablo_WANTED_15_01");	//Что тебе нужно?
	AI_Output(self,other,"DIA_Pablo_WANTED_12_02");	//Я где-то уже видел твое лицо ... ах - точно!
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Pablo_WANTED_12_03");	//Вот - мы нашли этот листок у одного из бандитов, на которых наткнулись несколько дней назад - рисунок очень похож на тебя.
	B_GiveInvItems(self,other,ItWr_Poster_MIS,1);
	AI_Output(self,other,"DIA_Pablo_WANTED_12_04");	//По-видимому, эти парни искали тебя.
	Info_ClearChoices(DIA_Pablo_WANTED);
	Info_AddChoice(DIA_Pablo_WANTED,"Нет, боюсь, что ты ошибаешься.",DIA_Pablo_WANTED_NOTHING);
	Info_AddChoice(DIA_Pablo_WANTED,"Хм, я сам бы об этом никогда не догадался.",DIA_Pablo_WANTED_IRONY);
};

func void DIA_Pablo_WANTED_NOTHING()
{
	AI_Output(other,self,"DIA_Pablo_WANTED_NOTHING_15_00");	//Нет, боюсь, что ты ошибаешься. Со мной все в порядке ...
	AI_Output(self,other,"DIA_Pablo_WANTED_NOTHING_12_01");	//Как скажешь, чужеземец.
	AI_Output(self,other,"DIA_Pablo_Add_12_00");	//Но если это все же ТВОЯ физиономия - и если у тебя возникнут проблемы - постарайся решать их за городом. Здесь и без того трудностей хватает.
	AI_Output(self,other,"DIA_Pablo_WANTED_NOTHING_12_03");	//А чужаки, которые приносят в город проблемы, долго здесь не задерживаются - надеюсь, я ясно выразился.
	Pablo_belogen = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Pablo_WANTED_IRONY()
{
	AI_Output(other,self,"DIA_Pablo_WANTED_IRONY_15_00");	//Хм, я сам бы об этом никогда не догадался.
	AI_Output(self,other,"DIA_Pablo_WANTED_IRONY_12_01");	//Очень смешно ... что этим парням было нужно от тебя?
	AI_Output(other,self,"DIA_Pablo_Add_15_01");	//Спроси их сам. Они ведь сидят у вас за решеткой, разве нет?
	AI_Output(self,other,"DIA_Pablo_WANTED_IRONY_12_03");	//Нет - они мертвы.
	AI_Output(other,self,"DIA_Pablo_WANTED_IRONY_15_04");	//Ну, тогда мы никогда этого не узнаем.
	AI_Output(self,other,"DIA_Pablo_Add_12_02");	//Если у тебя какие-то проблемы - иди и поговори с лордом Андрэ. Возможно, он сможет помочь. Ты найдешь его в казармах.
	AI_StopProcessInfos(self);
};


instance DIA_Pablo_Banditen(C_Info)
{
	npc = MIL_319_Pablo;
	nr = 3;
	condition = DIA_Pablo_Banditen_Condition;
	information = DIA_Pablo_Banditen_Info;
	permanent = FALSE;
	description = "Что ты знаешь об этих бандитах?";
};


func int DIA_Pablo_Banditen_Condition()
{
	return TRUE;
};

func void DIA_Pablo_Banditen_Info()
{
	AI_Output(other,self,"DIA_Pablo_Add_15_03");	//Что ты знаешь об этих бандитах?
	AI_Output(self,other,"DIA_Pablo_Add_12_04");	//Все они пришли из этой чертовой колонии. Но затем разделились на несколько групп.
	AI_Output(self,other,"DIA_Pablo_Add_12_05");	//Часть из них устроила себе логово в горах, а другие присоединились к Онару, лендлорду.
	AI_Output(self,other,"DIA_Pablo_Add_12_06");	//Но больше всего проблем доставляют бандиты около города.
	AI_Output(self,other,"DIA_Pablo_Add_12_07");	//Вот почему ни один из торговцев даже носа не высовывает за городские ворота.
};


instance DIA_Pablo_HakonBandits(C_Info)
{
	npc = MIL_319_Pablo;
	nr = 3;
	condition = DIA_Pablo_HakonBandits_Condition;
	information = DIA_Pablo_HakonBandits_Info;
	permanent = FALSE;
	description = "Что ты знаешь о бандитах, ограбивших торговца Хакона?";
};


func int DIA_Pablo_HakonBandits_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Hakon_Miliz) && Npc_KnowsInfo(other,DIA_Pablo_Banditen))
	{
		return TRUE;
	};
};

func void DIA_Pablo_HakonBandits_Info()
{
	AI_Output(other,self,"DIA_Pablo_Add_15_20");	//Что ты знаешь о бандитах, ограбивших торговца Хакона?
	AI_Output(self,other,"DIA_Pablo_Add_12_21");	//Ох, ЭТО дело... Не напоминай мне ...
	AI_Output(self,other,"DIA_Pablo_Add_12_22");	//Насколько я знаю, именно они ответственны за большинство нападений на торговцев.
	AI_Output(self,other,"DIA_Pablo_Banditen_12_01");	//Эти крысы уползли в свою нору и больше не высовываются оттуда.
	AI_Output(self,other,"DIA_Pablo_Banditen_12_02");	//Как-то, нам даже удалось выследить их и погнаться за ними. Но нам пришлось прервать погоню в лесу у города.
	AI_Output(self,other,"DIA_Pablo_Banditen_12_03");	//Там бродит слишком много всяких зверей и это слишком опасно.
	B_LogEntry(TOPIC_HakonBanditen,"Бандиты, ограбившие Хакона, скрываются где-то в лесу неподалеку от города.");
	if(Pablo_AndreMelden == FALSE)
	{
		AI_Output(self,other,"DIA_Pablo_Add_12_23");	//Но есть еще кое-что ...
		AI_Output(self,other,"DIA_Pablo_Banditen_12_04");	//Часть украденных товаров всплыла в Хоринисе.
		AI_Output(other,self,"DIA_Pablo_Banditen_15_05");	//Это означает, что они имеют возможность контрабандой доставлять товары в город и продавать их ...
		AI_Output(self,other,"DIA_Pablo_Banditen_12_06");	//Да, мы подозреваем, что у них есть свой человек в городе. Но нам пока не удалось поймать его.
		AI_Output(self,other,"DIA_Pablo_Banditen_12_07");	//Если тебе удастся выяснить что-нибудь об этом деле, помни, что Лорд Андрэ назначил награду за голову этого скупщика краденного.
		B_LogEntry(TOPIC_HakonBanditen,"Эти бандиты, вероятно, состоят в сговоре с кем-то из городских дельцов. Лорд Андре назначил награду за голову этого дельца.");
	};
};


instance DIA_Pablo_MyBandits(C_Info)
{
	npc = MIL_319_Pablo;
	nr = 4;
	condition = DIA_Pablo_MyBandits_Condition;
	information = DIA_Pablo_MyBandits_Info;
	permanent = FALSE;
	description = "А откуда пришли бандиты, у которых нашли листок с моим изображением?";
};


func int DIA_Pablo_MyBandits_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Pablo_Banditen) && Npc_KnowsInfo(other,DIA_Pablo_WANTED))
	{
		return TRUE;
	};
};

func void DIA_Pablo_MyBandits_Info()
{
	AI_Output(other,self,"DIA_Pablo_Add_15_08");	//А откуда пришли бандиты, у которых нашли листок с моим изображением?
	if(Pablo_belogen == TRUE)
	{
		AI_Output(self,other,"DIA_Pablo_Add_12_09");	//А-ГА! Так это все же ТВОЯ физиономия там. А почему ты сразу это не признал, а?
		AI_Output(self,other,"DIA_Pablo_Add_12_10");	//(требовательно) За что тебя разыскивают?
		AI_Output(other,self,"DIA_Pablo_Add_15_11");	//Я не знаю - честно!
		AI_Output(self,other,"DIA_Pablo_Add_12_12");	//Да, да. Конечно. Я хочу, чтобы ты кое-что понял. Если бы я думал, что ты был сообщником этих бандитов, ты бы уже отдыхал за решеткой.
		AI_Output(self,other,"DIA_Pablo_Add_12_13");	//Но се же, мне лучше доложить об этом инциденте лорду Андрэ ...
		Pablo_AndreMelden = TRUE;
		AI_Output(self,other,"DIA_Pablo_Add_12_14");	//Но - отвечая на твой вопрос ...
	};
	AI_Output(self,other,"DIA_Pablo_Add_12_15");	//Мы нашли их неподалеку от поместья лендлорда.
	AI_Output(self,other,"DIA_Pablo_Add_12_16");	//Но они были не похожи на людей Онара.
	AI_Output(self,other,"DIA_Pablo_Add_12_17");	//Я думаю, они были частью банды, которая засела в горах около фермы Онара.
	AI_Output(self,other,"DIA_Pablo_Add_12_18");	//Но если ты захочешь отправиться туда, позволь мне тебя предупредить. Эти головорезы могут сделать котлету из кого угодно!
	AI_Output(other,self,"DIA_Pablo_Add_15_19");	//Я запомню это.
};


instance DIA_Pablo_Perm(C_Info)
{
	npc = MIL_319_Pablo;
	nr = 1;
	condition = DIA_Pablo_Perm_Condition;
	information = DIA_Pablo_Perm_Info;
	permanent = TRUE;
	description = "Как ситуация?";
};


func int DIA_Pablo_Perm_Condition()
{
	return TRUE;
};

func void DIA_Pablo_Perm_Info()
{
	AI_Output(other,self,"DIA_Pablo_Perm_15_00");	//Как обстановка?
	if(Kapitel == 3)
	{
		if(MIS_RescueBennet != LOG_SUCCESS)
		{
			if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
			{
				AI_Output(self,other,"DIA_Pablo_Perm_12_01");	//Я всегда говорил, что этим наемникам нельзя доверять.
				AI_Output(self,other,"DIA_Pablo_Perm_12_02");	//Пришло время преподать этому сброду урок. Беннет не мог провернуть все это в одиночку.
			}
			else if(hero.guild == GIL_KDF)
			{
				AI_Output(self,other,"DIA_Pablo_Perm_12_03");	//Я глубоко потрясен убийством достопочтенного паладина Лотара.
				AI_Output(self,other,"DIA_Pablo_Perm_12_04");	//Но я знаю, что церковь подберет справедливое наказание для этого злодей.
			}
			else
			{
				AI_Output(self,other,"DIA_Pablo_Perm_12_05");	//Что ты тут ошиваешься? Если ты собираешься освободить своего дружка наемника, лучше тебе забыть об этом.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Pablo_Perm_12_06");	//Это тревожит меня. Теперь они пытаются стравить нас друг с другом.
			AI_Output(self,other,"DIA_Pablo_Perm_12_07");	//Если бы тебе не удалось найти настоящего убийцу, оркам даже не пришлось бы ничего делать.
		};
	}
	else if(Kapitel == 5)
	{
		AI_Output(self,other,"DIA_Pablo_Perm_12_08");	//Я не знаю, что будет с нами, если паладины уйдут отсюда.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Pablo_Perm_12_09");	//Ты можешь рассчитывать на нас, мы сделаем все возможное, чтобы этот город не превратился в притон для бандитов.
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Pablo_Perm_12_10");	//Постарайся вести себя как подобает. Мы глаз не спускаем с таких как ты.
	}
	else
	{
		AI_Output(self,other,"DIA_Pablo_Perm_12_11");	//Пока все спокойно. Только бандиты у города доставляют нам небольшие проблемы.
	};
};

