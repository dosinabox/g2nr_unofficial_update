
instance DIA_Addon_Riordian_ADW_EXIT(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 999;
	condition = DIA_Addon_Riordian_ADW_EXIT_Condition;
	information = DIA_Addon_Riordian_ADW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Riordian_ADW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Riordian_ADW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Riordian_HelloADW(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_HelloADW_Condition;
	information = DIA_Addon_Riordian_HelloADW_Info;
	description = "Ты ожидал увидеть здесь ТАКОЕ?";
};


func int DIA_Addon_Riordian_HelloADW_Condition()
{
	return TRUE;
};

func void DIA_Addon_Riordian_HelloADW_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_HelloADW_15_00");	//Ты ожидал увидеть здесь ТАКОЕ?
	AI_Output(self,other,"DIA_Addon_Riordian_HelloADW_10_01");	//Нет, вовсе нет. Я поражен тем, какие размеры должен был иметь этот город.
	AI_Output(self,other,"DIA_Addon_Riordian_HelloADW_10_02");	//Большинство зданий погребено под камнем и землей, но те руины, что избежали этой участи, разбросаны по всей долине.
	AI_Output(self,other,"DIA_Addon_Riordian_HelloADW_10_03");	//Здесь, должно быть, жили тысячи человек.
};


instance DIA_Addon_Riordian_WhatToFind(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_WhatToFind_Condition;
	information = DIA_Addon_Riordian_WhatToFind_Info;
	description = "Что вы здесь уже обнаружили?";
};


func int DIA_Addon_Riordian_WhatToFind_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Riordian_HelloADW))
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_WhatToFind_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_WhatToFind_15_00");	//Что вы здесь уже обнаружили?
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_01");	//На востоке раскинулось огромное болото, на котором находится большая крепость.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_02");	//Насколько мы поняли, в ней обосновались бандиты.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_03");	//На твоем месте я бы туда не ходил. Там повсюду сторожевые посты и охранники.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_04");	//Держись от болота подальше, пока не наберешься опыта... или не найдешь способ обмануть бандитов.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_05");	//На западе располагается пиратский лагерь.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_06");	//Я точно не уверен, но по-моему, пираты нас тоже уже заметили.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_07");	//Впрочем, их, похоже, не очень-то беспокоит наше присутствие.
};


instance DIA_Addon_Riordian_Gegend(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_Gegend_Condition;
	information = DIA_Addon_Riordian_Gegend_Info;
	permanent = TRUE;
	description = "Расскажи мне об этой местности побольше.";
};


func int DIA_Addon_Riordian_Gegend_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Riordian_WhatToFind) && (Saturas_RiesenPlan == FALSE))
	{
		return TRUE;
	};
};


var int DIA_Addon_Riordian_Gegend_Info_OneTime;

func void DIA_Addon_Riordian_Gegend_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_15_00");	//Расскажи мне об этой местности побольше.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_10_01");	//Что ты хочешь узнать?
	Info_ClearChoices(DIA_Addon_Riordian_Gegend);
	Info_AddChoice(DIA_Addon_Riordian_Gegend,Dialog_Back,DIA_Addon_Riordian_Gegend_Back);
	if((DIA_Addon_Riordian_Gegend_Info_OneTime == FALSE) && (Npc_HasItems(other,ItWr_Map_AddonWorld) == FALSE))
	{
		Info_AddChoice(DIA_Addon_Riordian_Gegend,"Существует ли карта этой местности?",DIA_Addon_Riordian_Gegend_map);
		DIA_Addon_Riordian_Gegend_Info_OneTime = TRUE;
	};
	Info_AddChoice(DIA_Addon_Riordian_Gegend,"Где вы заметили пиратов?",DIA_Addon_Riordian_Gegend_Piraten);
	Info_AddChoice(DIA_Addon_Riordian_Gegend,"Напомни, где обосновались бандиты?",DIA_Addon_Riordian_Gegend_bandits);
	Info_AddChoice(DIA_Addon_Riordian_Gegend,"Вы уже побывали на западе?",DIA_Addon_Riordian_Gegend_west);
	Info_AddChoice(DIA_Addon_Riordian_Gegend,"Что я найду на востоке?",DIA_Addon_Riordian_Gegend_ost);
	Info_AddChoice(DIA_Addon_Riordian_Gegend,"Что расположено на юге?",DIA_Addon_Riordian_Gegend_sued);
	Info_AddChoice(DIA_Addon_Riordian_Gegend,"Что находится на севере?",DIA_Addon_Riordian_Gegend_nord);
};

func void DIA_Addon_Riordian_Gegend_Back()
{
	Info_ClearChoices(DIA_Addon_Riordian_Gegend);
};

func void DIA_Addon_Riordian_Gegend_map()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_map_15_00");	//Существует ли карта этой местности?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_map_10_01");	//Да, Кронос уже нарисовал карту. Обратись к нему.
};

func void DIA_Addon_Riordian_Gegend_bandits()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_bandits_15_00");	//Напомни, где обосновались бандиты?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_bandits_10_01");	//Их крепость и сторожевые посты находятся на востоке.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_bandits_10_02");	//Чтобы добраться до крепости, тебе придется пересечь болото.
};

func void DIA_Addon_Riordian_Gegend_Piraten()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_Piraten_15_00");	//Где вы заметили пиратов?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_Piraten_10_01");	//На западе. Некоторые пираты подходили к этому месту довольно близко.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_Piraten_10_02");	//Думаю, они охотились.
};

func void DIA_Addon_Riordian_Gegend_nord()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_nord_15_00");	//Что находится на севере?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_nord_10_01");	//Если верить записям зодчих, там расположено большое ущелье, окруженное скалами.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_nord_10_02");	//Ландшафт там составляют песок и растрескавшаяся от засухи земля.
};

func void DIA_Addon_Riordian_Gegend_sued()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_sued_15_00");	//Что расположено на юге?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_sued_10_01");	//Местность на юге очень труднопроходимая.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_sued_10_02");	//Ты найдешь там тропинки-серпантины, водопады и скалы причудливых форм.
};

func void DIA_Addon_Riordian_Gegend_ost()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_ost_15_00");	//Что я найду на востоке?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_ost_10_01");	//Огромное болото. Эта местность очень опасна.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_ost_10_02");	//Там можно встретить не только бандитов, но и чрезвычайно опасных животных.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_ost_10_03");	//Будь осторожнее.
};


var int DIA_Addon_Riordian_Gegend_west_OneTime;

func void DIA_Addon_Riordian_Gegend_west()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_west_15_00");	//Вы уже побывали на западе?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_west_10_01");	//Еще нет. Но мы знаем, что там находится берег моря.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_west_10_02");	//Видимо, на этом берегу устроили свой лагерь пираты.
	if((DIA_Addon_Riordian_Gegend_west_OneTime == FALSE) && Npc_HasItems(VLK_4304_Addon_William,ITWr_Addon_William_01))
	{
		AI_Output(self,other,"DIA_Addon_Riordian_Gegend_west_10_03");	//На востоке, недалеко отсюда, мы нашли тело рыбака.
		AI_Output(self,other,"DIA_Addon_Riordian_Gegend_west_10_04");	//Тебе стоит на него взглянуть.
		B_LogEntry(TOPIC_Addon_MissingPeople,LogText_Addon_WilliamLeiche);
		DIA_Addon_Riordian_Gegend_west_OneTime = TRUE;
	};
};


instance DIA_Addon_Riordian_HousesOfRulers(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_HousesOfRulers_Condition;
	information = DIA_Addon_Riordian_HousesOfRulers_Info;
	description = "Меня послал Сатурас. Я должен исследовать пять дворцов Яркендара.";
};


func int DIA_Addon_Riordian_HousesOfRulers_Condition()
{
	if(MIS_Saturas_LookingForHousesOfRulers == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_HousesOfRulers_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_HousesOfRulers_15_00");	//Меня послал Сатурас. Я должен исследовать пять дворцов Яркендара.
	AI_Output(self,other,"DIA_Addon_Riordian_HousesOfRulers_10_01");	//На то, чтобы найти сведения об их местонахождении в записях зодчих, мне понадобилось приличное количество времени.
	AI_Output(self,other,"DIA_Addon_Riordian_HousesOfRulers_10_02");	//Но зато теперь я могу дать тебе точную информацию.
	MIS_Riordian_HousesOfRulers = LOG_Running;
};


instance DIA_Addon_Riordian_WhereAreHouses(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_WhereAreHouses_Condition;
	information = DIA_Addon_Riordian_WhereAreHouses_Info;
	description = "Где находятся пять дворцов?";
};


func int DIA_Addon_Riordian_WhereAreHouses_Condition()
{
	if((MIS_Riordian_HousesOfRulers == LOG_Running) && (Saturas_SCBroughtAllToken == FALSE))
	{
		return TRUE;
	};
};


var int B_WhreAreHousesOfRulersOneTime;

func void B_WhreAreHousesOfRulers()
{
	AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_00");	//Дворец ученых - это огромная библиотека. Она находится далеко на севере.
	AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_01");	//Дворец воинов расположен на востоке. Он представляет из себя крепость, окруженную скалами.
	AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_02");	//Дворцы жрецов и стражей мертвых расположены недалеко друг от друга. Ты найдешь их на юго-западе.
	AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_03");	//А дворец-госпиталь целителей должен быть где-то на юго-востоке.
	if(B_WhreAreHousesOfRulersOneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_04");	//Если эти дворцы еще сохранились, ты узнаешь их по особой манере постройки.
		B_WhreAreHousesOfRulersOneTime = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_05");	//Все дворцы строились на возвышениях. К украшенному колоннами входу в каждый из них вела крутая лестница.
	if(B_WhreAreHousesOfRulersOneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_06");	//Надеюсь, тебе это поможет.
	};
	Log_CreateTopic(TOPIC_Addon_HousesOfRulers,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_HousesOfRulers,LOG_Running);
	B_LogEntry(TOPIC_Addon_HousesOfRulers,"Замок ученых - это огромная библиотека. Она находится где-то на севере.");
	Log_AddEntry(TOPIC_Addon_HousesOfRulers,"Замок воинов - это окруженная скалами крепость на востоке.");
	Log_AddEntry(TOPIC_Addon_HousesOfRulers,"Замки жрецов и стражей мертвых находятся недалеко друг от друга. Я смогу найти их на юго-западе.");
	Log_AddEntry(TOPIC_Addon_HousesOfRulers,"Дворец-госпиталь целителей находится на юго-востоке.");
};

func void DIA_Addon_Riordian_WhereAreHouses_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_WhereAreHouses_15_00");	//Где находятся пять дворцов?
	B_WhreAreHousesOfRulers();
};


instance DIA_Addon_Riordian_FoundHouse(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_FoundHouse_Condition;
	information = DIA_Addon_Riordian_FoundHouse_Info;
	permanent = TRUE;
	description = "Насчет дворцов...";
};


func int DIA_Addon_Riordian_FoundHouse_Condition()
{
	if((MIS_Riordian_HousesOfRulers == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_Riordian_WhereAreHouses) && (RiordianHousesFoundCount < 5))
	{
		return TRUE;
	};
};



var int foundhouseinfo[6];
const int Library = 1;
const int heiler = 2;
const int Warrior = 3;
const int Priest = 4;
const int Totenw = 5;
var int RiordianHouseNeuigkeit;
var int RiordianHousesFoundCount;

func void DIA_Addon_Riordian_FoundHouse_Info()
{
	var int RiordianHouseXPs;
	RiordianHouseNeuigkeit = 0;
	AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_00");	//Насчет дворцов...
	AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_01");	//Да?
	if((SC_COMESINTO_CANYONLIBRARY_FUNC_OneTime == TRUE) && (FOUNDHOUSEINFO[1] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_02");	//Библиотекой ученых, похоже, заинтересовались орки.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_03");	//Ты полагаешь, что они способны прочитать записи на древнем языке?
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_04");	//Нет, я так не думаю, но кто знает...
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_05");	//Ладно, в любом случае, тебе лучше от них избавиться.
		FOUNDHOUSEINFO[1] = TRUE;
		RiordianHouseNeuigkeit = RiordianHouseNeuigkeit + 1;
		Log_CreateTopic(TOPIC_Addon_CanyonOrcs,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_CanyonOrcs,LOG_Running);
		B_LogEntry(TOPIC_Addon_CanyonOrcs,"Маг воды Риордан будет доволен, если я очищу каньон от орков.");
	};
	if((Npc_IsDead(Stoneguardian_Heiler) || Npc_HasItems(other,ItMi_Addon_Stone_04) || (Saturas_SCFound_ItMi_Addon_Stone_04 == TRUE)) && (FOUNDHOUSEINFO[2] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_06");	//Дворец целителей находится в центре болота. Его охраняют каменные стражи.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_07");	//Значит, он все еще стоит?
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_08");	//Да, но неизвестно, сколько это еще продлится...
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_09");	//Мне больно видеть разрушение древних строений, свидетелей прошлого...
		FOUNDHOUSEINFO[2] = TRUE;
		RiordianHouseNeuigkeit = RiordianHouseNeuigkeit + 1;
	};
	if((RavenIsInTempel == TRUE) && (FOUNDHOUSEINFO[3] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_10");	//Во дворце воинов поселился Ворон.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_11");	//(цинично) Он сделал хороший выбор.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_12");	//Это самая неприступная крепость во всей долине.
		FOUNDHOUSEINFO[3] = TRUE;
		RiordianHouseNeuigkeit = RiordianHouseNeuigkeit + 1;
	};
	if((Npc_IsDead(Minecrawler_Priest) || Npc_HasItems(other,ItMi_Addon_Stone_03) || (Saturas_SCFound_ItMi_Addon_Stone_03 == TRUE)) && (FOUNDHOUSEINFO[4] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_13");	//Во дворце жрецов было множество краулеров...
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_14");	//Но ведь эти животные встречаются здесь очень редко, верно?
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_15");	//Да, ты прав.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_16");	//Странные вещи здесь творятся...
		FOUNDHOUSEINFO[4] = TRUE;
		RiordianHouseNeuigkeit = RiordianHouseNeuigkeit + 1;
	};
	if((Npc_IsDead(MayaZombie04_Totenw) || Npc_HasItems(other,ItMi_Addon_Stone_02) || (Saturas_SCFound_ItMi_Addon_Stone_02 == TRUE)) && (FOUNDHOUSEINFO[5] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_17");	//Дом стражей мертвых защищают силы зла.
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_18");	//Я раньше никогда не встречал такое количество зомби в одном месте.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_19");	//Какая печальная судьба! Стражи мертвых пали жертвой своих же способностей.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_20");	//Их тесная связь с миром мертвых сослужила им злую службу. Надеюсь, ты освободил их от страданий.
		FOUNDHOUSEINFO[5] = TRUE;
		RiordianHouseNeuigkeit = RiordianHouseNeuigkeit + 1;
	};
	if(RiordianHouseNeuigkeit > 0)
	{
		RiordianHouseXPs = XP_Addon_Riordian_FoundHouse * RiordianHouseNeuigkeit;
		B_GivePlayerXP(RiordianHouseXPs);
		RiordianHousesFoundCount = RiordianHousesFoundCount + RiordianHouseNeuigkeit;
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_21");	//Напомни мне, где они находятся?
		B_WhreAreHousesOfRulers();
	};
};


instance DIA_Addon_Riordian_OrksWeg(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_OrksWeg_Condition;
	information = DIA_Addon_Riordian_OrksWeg_Info;
	description = "Скоро орки потеряют интерес к этой местности.";
};


func int DIA_Addon_Riordian_OrksWeg_Condition()
{
	if(Npc_IsDead(OrcShaman_Sit_CanyonLibraryKey) && (FOUNDHOUSEINFO[1] == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_OrksWeg_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_OrksWeg_15_00");	//Скоро орки потеряют интерес к этой местности.
	AI_Output(self,other,"DIA_Addon_Riordian_OrksWeg_10_01");	//Почему ты так считаешь?
	if(OrcShaman_Sit_CanyonLibraryKey.aivar[AIV_KilledByPlayer] == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Riordian_OrksWeg_15_02");	//Я убил их командира.
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Riordian_OrksWeg_15_03");	//Их предводитель мертв.
	};
	AI_Output(self,other,"DIA_Addon_Riordian_OrksWeg_10_04");	//Будем надеяться, ты прав.
	AI_Output(self,other,"DIA_Addon_Riordian_OrksWeg_10_05");	//Нам сейчас не нужны лишние заботы.
	TOPIC_END_CanyonOrcs = TRUE;
	B_GivePlayerXP(XP_Addon_Riordian_OrksWeg);
};


instance DIA_Addon_Riordian_FoundAllHouses(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_FoundAllHouses_Condition;
	information = DIA_Addon_Riordian_FoundAllHouses_Info;
	description = "Я нашел все дворцы.";
};


func int DIA_Addon_Riordian_FoundAllHouses_Condition()
{
	if((RiordianHousesFoundCount >= 5) && (MIS_Riordian_HousesOfRulers == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_FoundAllHouses_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_FoundAllHouses_15_00");	//Я нашел все дворцы.
	AI_Output(self,other,"DIA_Addon_Riordian_FoundAllHouses_10_01");	//Они все находились там, где я указал?
	AI_Output(other,self,"DIA_Addon_Riordian_FoundAllHouses_15_02");	//Ну... более-менее.
	AI_Output(self,other,"DIA_Addon_Riordian_FoundAllHouses_10_03");	//Отлично! Значит, моя работа была не напрасной.
	AI_Output(self,other,"DIA_Addon_Riordian_FoundAllHouses_10_04");	//Благодарю тебя.
	MIS_Riordian_HousesOfRulers = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_FoundAllHouses);
};


instance DIA_Addon_Riordian_ADW_PreTeach(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_ADW_PreTeach_Condition;
	information = DIA_Addon_Riordian_ADW_PreTeach_Info;
	description = "Ты можешь меня чему-нибудь научить?";
};


func int DIA_Addon_Riordian_ADW_PreTeach_Condition()
{
	return TRUE;
};

func void DIA_Addon_Riordian_ADW_PreTeach_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_ADW_PreTeach_15_00");	//Ты можешь меня чему-нибудь научить?
	AI_Output(self,other,"DIA_Addon_Riordian_ADW_PreTeach_10_01");	//Да, я могу обучить тебя искусству алхимии.
	if(Npc_HasItems(other,ItAm_Addon_WispDetector) && (DIA_Addon_Riordian_Teach_NoPerm == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Riordian_ADW_PreTeach_10_02");	//А еще я могу показать тебе, как научить твой огонек искать различные предметы.
		Log_CreateTopic(TOPIC_Addon_KDWTeacher,LOG_NOTE);
		Log_AddEntry(TOPIC_Addon_KDWTeacher,LogText_Addon_RiordianTeach);
	};
	Log_CreateTopic(TOPIC_Addon_KDWTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_Addon_KDWTeacher,LogText_Addon_RiordianTeachAlchemy);
	Riordian_ADW_ADDON_TeachWisp = TRUE;
	Riordian_ADW_ADDON_TeachAlchemy = TRUE;
};


instance DIA_Addon_Riordian_ADW_Teach(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 90;
	condition = DIA_Addon_Riordian_ADW_Teach_Condition;
	information = DIA_Addon_Riordian_ADW_Teach_Info;
	permanent = TRUE;
	description = "Покажи мне, как тренировать моего блуждающего огонька.";
};


var int DIA_Addon_Riordian_ADW_Teach_NoPerm;

func int DIA_Addon_Riordian_ADW_Teach_Condition()
{
	if((DIA_Addon_Riordian_ADW_Teach_NoPerm == FALSE) && (DIA_Addon_Riordian_Teach_NoPerm == FALSE) && (Riordian_ADW_ADDON_TeachWisp == TRUE) && Npc_HasItems(other,ItAm_Addon_WispDetector))
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_ADW_Teach_Info()
{
	B_DIA_Addon_Riordian_Teach_15_00();
	if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NF] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FF] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NONE] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_RUNE] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_MAGIC] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FOOD] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_POTIONS] == FALSE))
	{
		Info_ClearChoices(DIA_Addon_Riordian_ADW_Teach);
		Info_AddChoice(DIA_Addon_Riordian_ADW_Teach,Dialog_Back,DIA_Addon_Riordian_ADW_Teach_BACK);
		B_DIA_Addon_Riordian_Teach_10_01();
		if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FF] == FALSE)
		{
			Info_AddChoice(DIA_Addon_Riordian_ADW_Teach,B_BuildLearnString(NAME_ADDON_WISPSKILL_FF,B_GetLearnCostTalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_FF)),DIA_Addon_Riordian_ADW_Teach_WISPSKILL_FF);
		};
		if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NONE] == FALSE)
		{
			Info_AddChoice(DIA_Addon_Riordian_ADW_Teach,B_BuildLearnString(NAME_ADDON_WISPSKILL_NONE,B_GetLearnCostTalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_NONE)),DIA_Addon_Riordian_ADW_Teach_WISPSKILL_NONE);
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_RUNE] == FALSE) && (WISPSKILL_LEVEL >= 2))
		{
			Info_AddChoice(DIA_Addon_Riordian_ADW_Teach,B_BuildLearnString(NAME_ADDON_WISPSKILL_RUNE,B_GetLearnCostTalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_RUNE)),DIA_Addon_Riordian_ADW_Teach_WISPSKILL_RUNE);
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_MAGIC] == FALSE) && (WISPSKILL_LEVEL >= 2))
		{
			Info_AddChoice(DIA_Addon_Riordian_ADW_Teach,B_BuildLearnString(NAME_ADDON_WISPSKILL_MAGIC,B_GetLearnCostTalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_MAGIC)),DIA_Addon_Riordian_ADW_Teach_WISPSKILL_MAGIC);
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FOOD] == FALSE) && (WISPSKILL_LEVEL >= 3))
		{
			Info_AddChoice(DIA_Addon_Riordian_ADW_Teach,B_BuildLearnString(NAME_ADDON_WISPSKILL_FOOD,B_GetLearnCostTalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_FOOD)),DIA_Addon_Riordian_ADW_Teach_WISPSKILL_FOOD);
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_POTIONS] == FALSE) && (WISPSKILL_LEVEL >= 3))
		{
			Info_AddChoice(DIA_Addon_Riordian_ADW_Teach,B_BuildLearnString(NAME_ADDON_WISPSKILL_POTIONS,B_GetLearnCostTalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_POTIONS)),DIA_Addon_Riordian_ADW_Teach_WISPSKILL_POTIONS);
		};
	}
	else
	{
		B_DIA_Addon_Riordian_Teach_10_08();
		DIA_Addon_Riordian_ADW_Teach_NoPerm = TRUE;
	};
};

func void DIA_Addon_Riordian_ADW_Teach_WISPSKILL_X()
{
	B_DIA_Addon_Riordian_Teach_WISPSKILL_X_10_00();
};

func void DIA_Addon_Riordian_ADW_Teach_BACK()
{
	Info_ClearChoices(DIA_Addon_Riordian_ADW_Teach);
};

func void DIA_Addon_Riordian_ADW_Teach_WISPSKILL_FF()
{
	if(B_TeachPlayerTalentWispDetector(self,other,WISPSKILL_FF))
	{
		if(WISPSKILL_LEVEL < 2)
		{
			WISPSKILL_LEVEL = 2;
		};
		DIA_Addon_Riordian_ADW_Teach_WISPSKILL_X();
	};
	Info_ClearChoices(DIA_Addon_Riordian_ADW_Teach);
};

func void DIA_Addon_Riordian_ADW_Teach_WISPSKILL_NONE()
{
	if(B_TeachPlayerTalentWispDetector(self,other,WISPSKILL_NONE))
	{
		if(WISPSKILL_LEVEL < 2)
		{
			WISPSKILL_LEVEL = 2;
		};
		DIA_Addon_Riordian_ADW_Teach_WISPSKILL_X();
	};
	Info_ClearChoices(DIA_Addon_Riordian_ADW_Teach);
};

func void DIA_Addon_Riordian_ADW_Teach_WISPSKILL_RUNE()
{
	if(B_TeachPlayerTalentWispDetector(self,other,WISPSKILL_RUNE))
	{
		if(WISPSKILL_LEVEL < 3)
		{
			WISPSKILL_LEVEL = 3;
		};
		DIA_Addon_Riordian_ADW_Teach_WISPSKILL_X();
	};
	Info_ClearChoices(DIA_Addon_Riordian_ADW_Teach);
};

func void DIA_Addon_Riordian_ADW_Teach_WISPSKILL_MAGIC()
{
	if(B_TeachPlayerTalentWispDetector(self,other,WISPSKILL_MAGIC))
	{
		if(WISPSKILL_LEVEL < 3)
		{
			WISPSKILL_LEVEL = 3;
		};
		DIA_Addon_Riordian_ADW_Teach_WISPSKILL_X();
	};
	Info_ClearChoices(DIA_Addon_Riordian_ADW_Teach);
};

func void DIA_Addon_Riordian_ADW_Teach_WISPSKILL_FOOD()
{
	if(B_TeachPlayerTalentWispDetector(self,other,WISPSKILL_FOOD))
	{
		DIA_Addon_Riordian_ADW_Teach_WISPSKILL_X();
	};
	Info_ClearChoices(DIA_Addon_Riordian_ADW_Teach);
};

func void DIA_Addon_Riordian_ADW_Teach_WISPSKILL_POTIONS()
{
	if(B_TeachPlayerTalentWispDetector(self,other,WISPSKILL_POTIONS))
	{
		DIA_Addon_Riordian_ADW_Teach_WISPSKILL_X();
	};
	Info_ClearChoices(DIA_Addon_Riordian_ADW_Teach);
};


instance DIA_Riordian_ADW_TeachAlchemy(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 2;
	condition = DIA_Riordian_ADW_TeachAlchemy_Condition;
	information = DIA_Riordian_ADW_TeachAlchemy_Info;
	permanent = TRUE;
	description = "Научи меня смешивать зелья.";
};


var int DIA_Riordian_ADW_TeachAlchemy_permanent;

func int DIA_Riordian_ADW_TeachAlchemy_Condition()
{
	if((DIA_Riordian_ADW_TeachAlchemy_permanent == FALSE) && (Riordian_ADW_ADDON_TeachAlchemy == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Riordian_ADW_TeachAlchemy_Info()
{
	var int talente;
	talente = 0;
	AI_Output(other,self,"DIA_Addon_Riordian_ADW_TeachAlchemy_15_00");	//Научи меня смешивать зелья.
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE))
	{
		Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
		Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy,Dialog_Back,DIA_Riordian_ADW_TeachAlchemy_BACK);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy,B_BuildLearnString("Лечебная эссенция",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_01)),DIA_Riordian_ADW_TeachAlchemy_Health_01);
		talente = talente + 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE))
	{
		Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy,B_BuildLearnString("Лечебный экстракт",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_02)),DIA_Riordian_ADW_TeachAlchemy_Health_02);
		talente = talente + 1;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy,B_BuildLearnString("Эссенция маны",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_01)),DIA_Riordian_ADW_TeachAlchemy_Mana_01);
		talente = talente + 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE))
	{
		Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy,B_BuildLearnString("Экстракт маны",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_02)),DIA_Riordian_ADW_TeachAlchemy_Mana_02);
		talente = talente + 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE))
	{
		Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy,B_BuildLearnString("Эликсир маны",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_03)),DIA_Riordian_ADW_TeachAlchemy_Mana_03);
		talente = talente + 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE))
	{
		Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy,B_BuildLearnString("Эликсир духа",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_Mana)),DIA_Riordian_ADW_TeachAlchemy_Perm_Mana);
		talente = talente + 1;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE)
	{
		Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy,B_BuildLearnString("Эликсир ловкости",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_DEX)),DIA_Riordian_ADW_TeachAlchemy_Perm_DEX);
		talente = talente + 1;
	};
	if(talente > 0)
	{
		if(Alchemy_Explain != TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_01");	//Магические зелья изготавливаются на алхимическом столе. Мы установили такой стол в одном из зданий наверху.
			AI_Output(self,other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_02");	//Тебе понадобится пустая колба, ингредиенты и, конечно, знание рецепта зелья.
			AI_Output(self,other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_03");	//Рецептам ты можешь научиться у меня. Все остальное тебе придется добыть самому.
			Alchemy_Explain = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_04");	//Какой рецепт ты хочешь выучить?
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_05");	//Я уже научил тебя всему, что знал сам.
		DIA_Riordian_ADW_TeachAlchemy_permanent = TRUE;
	};
};

func void DIA_Riordian_ADW_TeachAlchemy_BACK()
{
	Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
};

func void DIA_Riordian_ADW_TeachAlchemy_Health_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_01);
	Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
};

func void DIA_Riordian_ADW_TeachAlchemy_Health_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_02);
	Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
};

func void DIA_Riordian_ADW_TeachAlchemy_Mana_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_01);
	Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
};

func void DIA_Riordian_ADW_TeachAlchemy_Mana_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_02);
	Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
};

func void DIA_Riordian_ADW_TeachAlchemy_Mana_03()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_03);
	Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
};

func void DIA_Riordian_ADW_TeachAlchemy_Perm_Mana()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Mana);
	Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
};

func void DIA_Riordian_ADW_TeachAlchemy_Perm_DEX()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_DEX);
	Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
};

