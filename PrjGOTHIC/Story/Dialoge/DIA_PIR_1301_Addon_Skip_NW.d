
instance DIA_Addon_Skip_NW_EXIT(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 999;
	condition = DIA_Addon_Skip_NW_EXIT_Condition;
	information = DIA_Addon_Skip_NW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Skip_NW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Skip_NW_EXIT_Info()
{
	AI_StopProcessInfos(self);
	PlayerTalkedToSkipNW = TRUE;
};


instance DIA_Addon_Skip_NW_Hallo(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 1;
	condition = DIA_Addon_Skip_NW_Hallo_Condition;
	information = DIA_Addon_Skip_NW_Hallo_Info;
	important = TRUE;
};


func int DIA_Addon_Skip_NW_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Addon_Skip_NW_Hallo_Info()
{
	AI_Output(self,other,"DIA_Addon_Skip_NW_Hallo_08_00");	//Ну наконец-то! Сколько тебя можно ждать?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Hallo_08_01");	//(удивленно) Минуточку, ты же не торговец из города, верно?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Hallo_08_02");	//А где Бальтрам?
};


instance DIA_Addon_Skip_NW_WerBistDu(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 5;
	condition = DIA_Addon_Skip_NW_WerBistDu_Condition;
	information = DIA_Addon_Skip_NW_WerBistDu_Info;
	description = "Кто ты?";
};


func int DIA_Addon_Skip_NW_WerBistDu_Condition()
{
	return TRUE;
};

func void DIA_Addon_Skip_NW_WerBistDu_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_WerBistDu_15_00");	//Ты кто такой?
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_08_01");	//Не знаю, почему это должно тебя касаться. Но если уж тебе так интересно, то меня зовут Скип. Тебе знакомо это имя?
	AI_Output(other,self,"DIA_Addon_Skip_NW_WerBistDu_15_02");	//Как-как тебя зовут?
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_08_03");	//Неужели ты никогда не слышал о Скипе? Ты что, вырос на необитаемом острове, приятель?
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_08_04");	//Я - один из самых опасных преступников Хориниса. Вместе со своими ребятами я наводил ужас на моряков, ходящих в этих водах.
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_08_05");	//Да нет, ты должен был обо мне слышать.
	Info_ClearChoices(DIA_Addon_Skip_NW_WerBistDu);
	Info_AddChoice(DIA_Addon_Skip_NW_WerBistDu,"Ты пират?",DIA_Addon_Skip_NW_WerBistDu_pirat);
	Info_AddChoice(DIA_Addon_Skip_NW_WerBistDu,"Я должен тебя знать?",DIA_Addon_Skip_NW_WerBistDu_keineAhnung);
	Info_AddChoice(DIA_Addon_Skip_NW_WerBistDu,"Ну конечно! Теперь я вспоминаю!",DIA_Addon_Skip_NW_WerBistDu_ja);
};

func void DIA_Addon_Skip_NW_WerBistDu_ja()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_WerBistDu_ja_15_00");	//Ну конечно! Теперь я вспоминаю!
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_ja_08_01");	//Правда? Ты действительно обо мне слышал?
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_ja_08_02");	//А я-то думал вернуться в город.
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_ja_08_03");	//Хорошо, что я этого не сделал.
	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
	{
		AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_ja_08_04");	//Меня бы сразу же бросили за решетку.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_ja_08_05");	//Кстати, ты же не арестовывать меня пришел?
		AI_Output(other,self,"DIA_Addon_Skip_NW_WerBistDu_ja_15_06");	//Ну-у...
		AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_ja_08_07");	//Это в твоих же интересах. Свяжись со стариком Скипом - и ты мертвец.
	};
	Info_ClearChoices(DIA_Addon_Skip_NW_WerBistDu);
};

func void DIA_Addon_Skip_NW_WerBistDu_keineAhnung()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_WerBistDu_keineAhnung_15_00");	//Я должен тебя знать?
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_keineAhnung_08_01");	//Следи за своим языком, приятель, иначе старику Скипу придется тебя проучить.
	Info_ClearChoices(DIA_Addon_Skip_NW_WerBistDu);
};

func void DIA_Addon_Skip_NW_WerBistDu_pirat()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_WerBistDu_pirat_15_00");	//Ты пират?
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_pirat_08_01");	//Да, черт возьми. Это же очевидно. Пират, и причем знаменитый.
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_pirat_08_02");	//Но сейчас мне так скучно, что я готов сожрать свою лодку.
	Info_ClearChoices(DIA_Addon_Skip_NW_WerBistDu);
};


instance DIA_Addon_Skip_NW_Baltram(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 5;
	condition = DIA_Addon_Skip_NW_Baltram_Condition;
	information = DIA_Addon_Skip_NW_Baltram_Info;
	description = "Бальтрам? Ты ждешь торговца?";
};


func int DIA_Addon_Skip_NW_Baltram_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_NW_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_NW_Baltram_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_Baltram_15_00");	//Бальтрам? Ты ждешь торговца?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Baltram_08_01");	//Догадливый паренек.
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		B_TurnToNpc(self,other);
	};
	AI_Output(self,other,"DIA_Addon_Skip_NW_Baltram_08_02");	//Я же только что сам об этом сказал.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Baltram_08_03");	//Этот никчемный торговец всяким хламом, похоже, забыл про нашу встречу.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Baltram_08_04");	//Если бы я только мог до него добраться...
	Log_CreateTopic(TOPIC_Addon_BaltramSkipTrade,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BaltramSkipTrade,LOG_Running);
	B_LogEntry(TOPIC_Addon_BaltramSkipTrade,"Пират Скип сообщил мне, что городской торговец Бальтрам сотрудничает с пиратами.");
	SCKnowsBaltramAsPirateTrader = TRUE;
};


instance DIA_Addon_Skip_BaltramPaket(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 5;
	condition = DIA_Addon_Skip_BaltramPaket_Condition;
	information = DIA_Addon_Skip_BaltramPaket_Info;
	description = "У меня для тебя посылка от Бальтрама.";
};


func int DIA_Addon_Skip_BaltramPaket_Condition()
{
	if((MIS_Addon_Baltram_Paket4Skip == LOG_Running) && Npc_HasItems(other,ItMi_Packet_Baltram4Skip_Addon))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_BaltramPaket_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_BaltramPaket_15_00");	//У меня для тебя посылка от Бальтрама.
	AI_Output(self,other,"DIA_Addon_Skip_BaltramPaket_08_01");	//Что? Он послал ко мне мальчика на побегушках?
	AI_Output(self,other,"DIA_Addon_Skip_BaltramPaket_08_02");	//Думаю, он просто боится со мной встречаться. Что еще ожидать от этого жалкого скряги?
	B_GiveInvItems(other,self,ItMi_Packet_Baltram4Skip_Addon,1);
	AI_Output(other,self,"DIA_Addon_Skip_BaltramPaket_15_03");	//Он сказал, что ему нужны три бутылки рома.
	AI_Output(self,other,"DIA_Addon_Skip_BaltramPaket_08_04");	//(смеется) Ну конечно! Сначала он заставляет меня ждать, потом не приходит на встречу, и у него еще хватает наглости чего-то требовать.
	AI_Output(self,other,"DIA_Addon_Skip_BaltramPaket_08_05");	//Вот, передай ему две бутылки. Хватит с него.
	CreateInvItems(self,ItFo_Addon_Rum,2);
	B_GiveInvItems(self,other,ItFo_Addon_Rum,2);
	B_GivePlayerXP(XP_Addon_Skip_BaltramPaket);
	B_LogEntry(TOPIC_Addon_BaltramSkipTrade,LogText_Addon_SkipsRumToBaltram);
	Skip_Rum4Baltram = TRUE;
};


instance DIA_Addon_Skip_NW_Woher(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 5;
	condition = DIA_Addon_Skip_NW_Woher_Condition;
	information = DIA_Addon_Skip_NW_Woher_Info;
	description = "Откуда ты?";
};


func int DIA_Addon_Skip_NW_Woher_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_NW_WerBistDu))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_NW_Woher_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_Woher_15_00");	//Откуда ты приплыл?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Woher_08_01");	//Ты хочешь знать, где наше убежище?
	if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Addon_Skip_NW_Woher_08_02");	//Это последнее, что я сказал бы солдату ополчения.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_NW_Woher_08_03");	//С таким же успехом я могу сам пойти и сдаться ополчению.
	};
	AI_Output(self,other,"DIA_Addon_Skip_NW_Woher_08_04");	//А если ты вдруг захочешь навестить нас, это все равно тебе не поможет.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Woher_08_05");	//Остров Хоринис довольно велик и никто и никогда не попадет туда, куда добрались мы. Если, конечно, они не наймут корабль.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Woher_08_06");	//Потом еще нужно будет пробраться через скалы, а там никто не пройдет, не зная секретного прохода.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Woher_08_07");	//Дорогу знают только два человека, а ты не похож ни на одного из них.
};


instance DIA_Addon_Skip_SCSawGreg(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 5;
	condition = DIA_Addon_Skip_SCSawGreg_Condition;
	information = DIA_Addon_Skip_SCSawGreg_Info;
	description = "Ты не знаешь никого с повязкой на глазу?";
};


func int DIA_Addon_Skip_SCSawGreg_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_NW_Woher) && (SC_KnowsConnectionSkipGreg == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_SCSawGreg_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_SCSawGreg_15_00");	//Ты не знаешь никого с повязкой на глазу?
	AI_Output(self,other,"DIA_Addon_Skip_SCSawGreg_08_01");	//Я знаю много людей, у которых повязка на глазу.
	AI_Output(other,self,"DIA_Addon_Skip_SCSawGreg_15_02");	//Кое-кто путешествует по землям Хориниса и, похоже, неплохо знает тебя.
	AI_Output(self,other,"DIA_Addon_Skip_SCSawGreg_08_03");	//Мне никто не приходит в голову. Я не имею никаких дел с людьми, живущими на суше.
	AI_Output(other,self,"DIA_Addon_Skip_SCSawGreg_15_04");	//Но...
	AI_Output(self,other,"DIA_Addon_Skip_SCSawGreg_08_05");	//Прекрати, мне это не интересно.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Addon_Skip_NW_MissingPeople(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 2;
	condition = DIA_Addon_Skip_NW_MissingPeople_Condition;
	information = DIA_Addon_Skip_NW_MissingPeople_Info;
	description = "Пропало много людей.";
};


func int DIA_Addon_Skip_NW_MissingPeople_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_NW_Woher) && (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_NW_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_MissingPeople_15_00");	//Пропало много людей. И все улики указывают на то, что ты замешан в этом деле.
	AI_Output(self,other,"DIA_Addon_Skip_NW_MissingPeople_08_01");	//Эээ... проклятье, это не то, что ты думаешь.
	AI_Output(self,other,"DIA_Addon_Skip_NW_MissingPeople_08_02");	//Я что, похож на работорговца? Нет, я всего лишь занимаюсь перевозкой товаров. Что это за товары и откуда они берутся - меня совершенно не касается.
	AI_Output(self,other,"DIA_Addon_Skip_NW_MissingPeople_08_03");	//Мы перевозим различные товары для этих свиней.
	AI_Output(self,other,"DIA_Addon_Skip_NW_MissingPeople_08_04");	//Сначала это были обычные товары. Ну, иногда, может быть, немного контрабанды.
	AI_Output(self,other,"DIA_Addon_Skip_NW_MissingPeople_08_05");	//Но потом они стали похищать жителей города. Я не имею ни малейшего представления, что они собирались с ними делать.
	AI_Output(self,other,"DIA_Addon_Skip_NW_MissingPeople_08_06");	//Мы всего лишь перевозили их.
};


instance DIA_Addon_Skip_NW_Dexter(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 2;
	condition = DIA_Addon_Skip_NW_Dexter_Condition;
	information = DIA_Addon_Skip_NW_Dexter_Info;
	description = "О ком ты говоришь?";
};


func int DIA_Addon_Skip_NW_Dexter_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_NW_MissingPeople))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_NW_Dexter_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_Dexter_15_00");	//О ком ты говоришь?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Dexter_08_01");	//О бандитах, конечно. О ком же еще? Мерзкие отбросы, которые хозяйничают по всему острову.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Dexter_08_02");	//И не только здесь, а по всему Хоринису.
};

func void B_Skip_SaysDextersName()
{
	AI_Output(self,other,"DIA_Addon_Skip_SaysDextersName_08_00");	//Я вспомнил, как зовут главаря! Декстер. Да, они звали его Декстер.
	Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_WhoStolePeople,"Людей похищают по приказу предводителя бандитов Декстера. Найти Декстера можно к югу от фермы Онара.");
	SC_KnowsDexterAsKidnapper = TRUE;
	Ranger_SCKnowsDexter = TRUE;
};


instance DIA_Addon_Skip_NW_Name(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 2;
	condition = DIA_Addon_Skip_NW_Name_Condition;
	information = DIA_Addon_Skip_NW_Name_Info;
	description = "Отговорка 'бандиты' меня не устраивает. Мне нужно имя...";
};


func int DIA_Addon_Skip_NW_Name_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_NW_Dexter) && (SCKnowsMissingPeopleAreInAddonWorld == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_NW_Name_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_Name_15_00");	//Отговорка 'бандиты' меня не устраивает. Мне нужно имя...
	AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_01");	//Имя? Ты хочешь узнать, кто является предводителем бандитов? Черт, как же звали этого ублюдка...
	AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_02");	//Ммм. Никак не могу вспомнить его имя. Хоть ты тресни.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_03");	//Но я могу показать тебе, где найти человека, который является главарем банды в этой части Хориниса.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_04");	//У тебя есть карта?
	if(Npc_HasItems(other,ItWr_Map_NewWorld) == FALSE)
	{
		if((Npc_HasItems(other,ItWr_Map_NewWorld_Ornaments_Addon) == TRUE) || (Npc_HasItems(other,ItWr_Map_Shrine_MIS) == TRUE) || (Npc_HasItems(other,ItWr_Map_Caves_MIS) == TRUE))
		{
			AI_Output(other,self,"DIA_Addon_Skip_NW_Name_15_05");	//Да, есть.
			AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_06");	//Но кто-то уже исписал ее. Зачем портить ее еще больше?
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Skip_NW_Name_15_07");	//Нет.
		};
		AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_08");	//В таком случае я опишу тебе это место.
		AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_09");	//Далеко на востоке отсюда находится очень большая ферма. Фермера, кажется, зовут Онар.
		AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_10");	//Он владеет обширными землями. К югу от его полей находится небольшая крепость на высокой скале.
		AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_11");	//Там ты и найдешь того, кто тебе нужен.
		B_Skip_SaysDextersName();
	};
};


instance DIA_Addon_Skip_NW_Landkarte(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 5;
	condition = DIA_Addon_Skip_NW_Landkarte_Condition;
	information = DIA_Addon_Skip_NW_Landkarte_Info;
	description = "Вот. У меня есть карта Хориниса.";
};


func int DIA_Addon_Skip_NW_Landkarte_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_NW_Name) && Npc_HasItems(other,ItWr_Map_NewWorld) && (SCKnowsMissingPeopleAreInAddonWorld == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_NW_Landkarte_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_Landkarte_15_00");	//Вот. У меня есть карта Хориниса.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Landkarte_08_01");	//Хорошо. Дай я нарисую тебе его местоположение.
	B_GiveInvItems(other,self,ItWr_Map_NewWorld,1);
	B_Skip_SaysDextersName();
	AI_Output(self,other,"DIA_Addon_Skip_NW_Landkarte_08_02");	//Держи карту.
	Npc_RemoveInvItems(self,ItWr_Map_NewWorld,1);
	CreateInvItems(self,ItWr_Map_NewWorld_Dexter,1);
	B_GiveInvItems(self,other,ItWr_Map_NewWorld_Dexter,1);
};


instance DIA_Addon_Skip_NW_Wohin(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 99;
	condition = DIA_Addon_Skip_NW_Wohin_Condition;
	information = DIA_Addon_Skip_NW_Wohin_Info;
	permanent = TRUE;
	description = "Куда вы отвозили этих людей?";
};


func int DIA_Addon_Skip_NW_Wohin_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_NW_Woher) && Npc_KnowsInfo(other,DIA_Addon_Skip_NW_MissingPeople))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_NW_Wohin_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_Wohin_15_00");	//Куда вы отвозили этих людей?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Wohin_08_01");	//Я уже сказал тебе, я не собираюсь рассказывать, где находится наш порт.
};

