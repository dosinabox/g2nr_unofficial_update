
instance DIA_Addon_Huno_EXIT(C_Info)
{
	npc = BDT_1099_Addon_Huno;
	nr = 999;
	condition = DIA_Addon_Huno_EXIT_Condition;
	information = DIA_Addon_Huno_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Huno_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Huno_EXIT_Info()
{
	B_EquipTrader(self);
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Huno_PICKPOCKET(C_Info)
{
	npc = BDT_1099_Addon_Huno;
	nr = 900;
	condition = DIA_Addon_Huno_PICKPOCKET_Condition;
	information = DIA_Addon_Huno_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_100;
};


func int DIA_Addon_Huno_PICKPOCKET_Condition()
{
	return C_Beklauen(85,102);
};

func void DIA_Addon_Huno_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Huno_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Huno_PICKPOCKET,Dialog_Back,DIA_Addon_Huno_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Huno_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Huno_PICKPOCKET_DoIt);
};

func void DIA_Addon_Huno_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Huno_PICKPOCKET);
};

func void DIA_Addon_Huno_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Huno_PICKPOCKET);
};


instance DIA_Addon_Huno_Abwimmeln(C_Info)
{
	npc = BDT_1099_Addon_Huno;
	nr = 1;
	condition = DIA_Addon_Huno_Abwimmeln_Condition;
	information = DIA_Addon_Huno_Abwimmeln_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Huno_Abwimmeln_Condition()
{
	if(Huno_MEGA_Angepisst == TRUE)
	{
		return TRUE;
	};
	if((Huno_zuSnaf == TRUE) && !Npc_KnowsInfo(other,DIA_Addon_Fisk_Meeting) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Addon_Huno_Abwimmeln_Info()
{
	if(Huno_MEGA_Angepisst == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Huno_Abwimmeln_06_00");	//Какого черта тебе здесь нужно? Проваливай!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Huno_Abwimmeln_06_01");	//Чего же ты ждешь? Ну-ка, двинул в таверну!
	};
	AI_StopProcessInfos(self);
};


var int Knows_Flucht;
var int Huno_Angepisst;

instance DIA_Addon_Huno_Hi(C_Info)
{
	npc = BDT_1099_Addon_Huno;
	nr = 1;
	condition = DIA_Addon_Huno_Hi_Condition;
	information = DIA_Addon_Huno_Hi_Info;
	permanent = FALSE;
	description = "Я гляжу, ты в своем деле собаку съел.";
};


func int DIA_Addon_Huno_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Huno_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_Huno_Hi_15_00");	//Я гляжу, ты в своем деле собаку съел.
	AI_Output(self,other,"DIA_Addon_Huno_Hi_06_01");	//И не одну. Сталь принес?
	AI_Output(other,self,"DIA_Addon_Huno_Hi_15_02");	//Сталь? Кажется, ты меня с кем-то спутал...
	AI_Output(self,other,"DIA_Addon_Huno_Hi_06_03");	//Хм... Мы нигде раньше не пересекались?
	Info_ClearChoices(DIA_Addon_Huno_Hi);
	Info_AddChoice(DIA_Addon_Huno_Hi,"Ну да. В Старом Лагере.",DIA_Addon_Huno_Hi_JA);
	Info_AddChoice(DIA_Addon_Huno_Hi,"Я думаю, нет. Нет, не пересекались.",DIA_Addon_Huno_Hi_NO);
	Log_CreateTopic(Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry(Topic_Addon_BDT_Trader,"Хуно продает изделия из металла.");
};

func void DIA_Addon_Huno_Hi_JA()
{
	AI_Output(other,self,"DIA_Addon_Huno_Hi_JA_15_00");	//Ну да. В Старом Лагере.
	AI_Output(self,other,"DIA_Addon_Huno_Hi_JA_06_01");	//Старый Лагерь... да... ты тот любопытный паренек... Я думал, ты помер.
	AI_Output(other,self,"DIA_Addon_Huno_Hi_JA_15_02");	//Все так думают. Еще есть выжившие?
	AI_Output(self,other,"DIA_Addon_Huno_Hi_JA_06_03");	//Немного. Некоторые последовали за Вороном, как и я. Для многих других Старый Лагерь стал братской могилой.
	Info_ClearChoices(DIA_Addon_Huno_Hi);
	Knows_Flucht = TRUE;
};

func void DIA_Addon_Huno_Hi_NO()
{
	AI_Output(other,self,"DIA_Addon_Huno_Hi_NO_15_00");	//Я думаю, нет. Нет, не пересекались.
	AI_Output(self,other,"DIA_Addon_Huno_Hi_NO_06_01");	//Хм... Память у меня дырявая... Ну да ладно.
	Info_ClearChoices(DIA_Addon_Huno_Hi);
};


instance DIA_Addon_Huno_Blitz(C_Info)
{
	npc = BDT_1099_Addon_Huno;
	nr = 2;
	condition = DIA_Addon_Huno_Blitz_Condition;
	information = DIA_Addon_Huno_Blitz_Info;
	permanent = FALSE;
	description = "Скажи, как ты спасся?";
};


func int DIA_Addon_Huno_Blitz_Condition()
{
	if((Knows_Flucht == TRUE) && (Huno_Angepisst == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Huno_Blitz_Info()
{
	AI_Output(other,self,"DIA_Addon_Huno_Blitz_15_00");	//Скажи, как ты спасся?
	AI_Output(self,other,"DIA_Addon_Huno_Blitz_06_01");	//Ну, как только Барьера не стало, случился приличный переполох.
	AI_Output(self,other,"DIA_Addon_Huno_Blitz_06_02");	//Кто-то прятался, кто-то бежал, а кто-то грабил все подряд.
	AI_Output(other,self,"DIA_Addon_Huno_Blitz_15_03");	//А ты что делал?
	AI_Output(self,other,"DIA_Addon_Huno_Blitz_06_04");	//Я только собирался покинуть лагерь, как случилась эта яркая вспышка, ну и мои глаза чуть не выпрыгнули от боли.
	AI_Output(self,other,"DIA_Addon_Huno_Blitz_06_05");	//Что же ты думаешь? В меня угодило этой чертовой молнией! До сих пор кажется, что я слышу этот треск.
	AI_Output(self,other,"DIA_Addon_Huno_Blitz_06_06");	//Позже мне сказали, что меня нашел Торус. Он-то и забрал меня с собой.
};


var int Huno_ArmorPerm;

instance DIA_Addon_Huno_Armor(C_Info)
{
	npc = BDT_1099_Addon_Huno;
	nr = 3;
	condition = DIA_Addon_Huno_Armor_Condition;
	information = DIA_Addon_Huno_Armor_Info;
	permanent = TRUE;
	description = "Мне бы доспехи получше.";
};


func int DIA_Addon_Huno_Armor_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Huno_Hi) && (Huno_ArmorPerm == FALSE) && (Huno_Angepisst == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Huno_Armor_Info()
{
	Info_ClearChoices(DIA_Addon_Huno_Armor);
	AI_Output(other,self,"DIA_Addon_Huno_Armor_15_00");	//Мне бы доспехи получше.
	if(Huno_ArmorCheap == FALSE)
	{
		if(!Npc_IsDead(Esteban))
		{
			AI_Output(self,other,"DIA_Addon_Huno_Armor_06_01");	//Могу предложить эти. Дорого? Не меня вини, а Эстебана.
			AI_Output(self,other,"DIA_Addon_Huno_Armor_06_02");	//Проклятый шакал дерет всю свою долю с каждых доспехов, что я продаю.
		};
		BDT_Armor_H_Value = 2100;
		Info_AddChoice(DIA_Addon_Huno_Armor,Dialog_Back,DIA_Addon_Huno_Armor_BACK);
		Info_AddChoice(DIA_Addon_Huno_Armor,"Купить тяжелые доспехи бандита. Защита: 50/50/15/0. (2100 золотых)",DIA_Addon_Huno_Armor_BUY);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Huno_Armor_15_03");	//Фиск сказал, что я могу рассчитывать на скидку.
		AI_Output(self,other,"DIA_Addon_Huno_Armor_06_04");	//Фиск, говоришь? Хм, ну, я ему и в самом деле должен. Ладно, будет тебе скидка.
		BDT_Armor_H_Value = 1000;
		Info_AddChoice(DIA_Addon_Huno_Armor,Dialog_Back,DIA_Addon_Huno_Armor_BACK);
		Info_AddChoice(DIA_Addon_Huno_Armor,"Купить тяжелые доспехи бандита. Защита: 50/50/15/0. (1000 золотых)",DIA_Addon_Huno_Armor_BUY);
	};
};

func void DIA_Addon_Huno_Armor_BACK()
{
	Info_ClearChoices(DIA_Addon_Huno_Armor);
};

func void DIA_Addon_Huno_Armor_BUY()
{
	AI_Output(other,self,"DIA_Addon_Huno_Armor_Buy_15_00");	//Хорошо, я беру доспехи.
	if(B_GiveInvItems(other,self,ItMi_Gold,BDT_Armor_H_Value))
	{
		AI_Output(self,other,"DIA_Addon_Huno_Armor_Buy_06_01");	//Отлично.
		AI_PrintScreen("Тяжелые доспехи бандита получено",-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
		CreateInvItem(hero,ITAR_BDT_H);
		AI_EquipArmor(hero,ITAR_BDT_H);
		Huno_ArmorPerm = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Huno_Armor_Buy_06_02");	//Без золота даже не рассчитывай.
	};
	/*if(BDT_Armor_H_Value < 2100)
	{
		Huno_ArmorPerm = TRUE;
	};*/
	Info_ClearChoices(DIA_Addon_Huno_Armor);
};


instance DIA_Addon_Huno_Attentat(C_Info)
{
	npc = BDT_1099_Addon_Huno;
	nr = 4;
	condition = DIA_Addon_Huno_Attentat_Condition;
	information = DIA_Addon_Huno_Attentat_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_ATTENTAT_DESCRIPTION2;
};


func int DIA_Addon_Huno_Attentat_Condition()
{
	if(MIS_Judas == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Huno_Attentat_Info()
{
	B_Say(other,self,"$ATTENTAT_ADDON_DESCRIPTION2");
	AI_Output(self,other,"DIA_Addon_Huno_Attentat_06_00");	//(подозрительно) Что тебе от меня нужно?
	AI_Output(other,self,"DIA_Addon_Huno_Attentat_15_01");	//Ничего особенного. Просто подумал, а вдруг ты знаешь, кто стоит за нападением.
	AI_Output(self,other,"DIA_Addon_Huno_Attentat_06_02");	//А с чего ты взял, что я должен знать?
	AI_Output(other,self,"DIA_Addon_Huno_Attentat_15_03");	//Ну, скажем, интуиция.
	AI_Output(self,other,"DIA_Addon_Huno_Attentat_06_04");	//Я ничего об этом не знаю и знать не хочу!
};


var int Huno_nochmal;
var int Huno_SomeThings_PERM;
var int Huno_Counter;

func void B_Addon_Huno_Stress()
{
	AI_Output(self,other,"DIA_Addon_Huno_Stress_06_00");	//(вздыхает) А теперь послушай меня. Двигал бы ты свою задницу отсюда, пока я ее не порвал.
	Huno_Angepisst = TRUE;
};


instance DIA_Addon_Huno_SomeThings(C_Info)
{
	npc = BDT_1099_Addon_Huno;
	nr = 4;
	condition = DIA_Addon_Huno_SomeThings_Condition;
	information = DIA_Addon_Huno_SomeThings_Info;
	permanent = TRUE;
	description = "Я слышал о тебе пару-тройку слухов.";
};


func int DIA_Addon_Huno_SomeThings_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Huno_Attentat) && (Huno_SomeThings_PERM == FALSE) && ((Finn_TellAll == TRUE) || (Paul_TellAll == TRUE) || (Emilio_TellAll == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Huno_SomeThings_Info()
{
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_15_00");	//Я слышал о тебе пару-тройку слухов.
	if(Huno_nochmal == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_01");	//Ну?
		Huno_nochmal = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_02");	//Опять? (угрожающе) Надеюсь, оно того стоит?
	};
	Huno_Counter = 0;
	if(Finn_TellAll == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Huno_SomeThings_15_03");	//Я слышал, что тебя не было на месте во время нападения!
		AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_04");	//(подозрительно) Что еще?
		Huno_Counter += 1;
	};
	if(Paul_TellAll == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Huno_SomeThings_15_05");	//Пол утверждает, что ты ненавидишь Эстебана.
		AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_06");	//(подозрительно) Продолжай...
		Huno_Counter += 1;
	};
	if(Emilio_TellAll == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Huno_SomeThings_15_07");	//Эмилио сболтнул твое имя! Ты знаешь что-то о нападении, только не хочешь говорить!
		AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_08");	//(спокойно) Значит, ты болтал со стариком Эмилио?
		if(Huno_Counter > 0)
		{
			AI_Output(other,self,"DIA_Addon_Huno_SomeThings_15_09");	//Он далеко не единственный, кто подозревает тебя!
			AI_PlayAni(self,"T_SEARCH");
			AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_10");	//А это что еще значит?
			Huno_SomeThings_PERM = TRUE;
			Info_ClearChoices(DIA_Addon_Huno_SomeThings);
			Info_AddChoice(DIA_Addon_Huno_SomeThings,"Я хочу встать на твою сторону, Хуно!",DIA_Addon_Huno_SomeThings_Contra);
			Info_AddChoice(DIA_Addon_Huno_SomeThings,"Если ты организовал нападение, ты за это поплатишься!",DIA_Addon_Huno_SomeThings_Pro);
			B_LogEntry(Topic_Addon_Esteban,"Похоже, я взял Хуно за задницу.");
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_11");	//(угрожающе) Может, мне тоже стоит с ним поболтать? Уверен, что смогу переубедить старика.
			B_Addon_Huno_Stress();
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Huno_SomeThings_15_12");	//Ну, собственно, это все...
		B_Addon_Huno_Stress();
		AI_StopProcessInfos(self);
	};
};

func void DIA_Addon_Huno_SomeThings_Pro()
{
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_Pro_15_00");	//Если ты организовал нападение, ты за это поплатишься!
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Pro_06_01");	//(раздраженно) Ты в самом деле такой идиот, или только кажешься? Думаешь, что сможешь подлизаться к Эстебану?
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Pro_06_02");	//Пошел вон отсюда!
	Huno_MEGA_Angepisst = TRUE;
	Info_ClearChoices(DIA_Addon_Huno_SomeThings);
	AI_StopProcessInfos(self);
};

func void DIA_Addon_Huno_SomeThings_Contra()
{
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_Contra_15_00");	//Я хочу встать на твою сторону, Хуно!
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Contra_06_01");	//Против Эстебана? Ну что ж, докажи.
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Contra_06_02");	//Я заждался партии стали от пиратов.
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Contra_06_03");	//Я подозреваю, что Эстебан приложил к этому руку. Хочет продать мне ее втридорога.
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Contra_06_04");	//Конечно, он не один в этом участвовал. Пара бандитов на болоте также в этом замешаны. Эстебан им платит.
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_Contra_15_05");	//Откуда ты знаешь?
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Contra_06_06");	//Что у трезвого вора на уме, у пьяного бандита - на языке...
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_Contra_15_07");	//А как звать этого пьяного бандита?
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Contra_06_08");	//Его имя тебя не касается. Но вот кто тебе в самом деле нужен, так это Хуан. Я не видел его в лагере довольно долго.
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Contra_06_09");	//Глянь на болоте. Он скорее всего там.
	MIS_Huno_Stahl = LOG_Running;
	Huno_Angepisst = FALSE;
	Log_CreateTopic(Topic_Addon_Huno,LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Huno,LOG_Running);
	B_LogEntry(Topic_Addon_Huno,"Хуно ждет посылку со сталью, которую ему должны были доставить от пиратов. Он думает, что ее украл для Эстебана человек по имени Хуан. Он прячется на болотах.");
	Info_ClearChoices(DIA_Addon_Huno_SomeThings);
	Info_AddChoice(DIA_Addon_Huno_SomeThings,"Скажи мне сначала, кто стоял за атакой!",DIA_Addon_Huno_SomeThings_TellMeNow);
	Info_AddChoice(DIA_Addon_Huno_SomeThings,"Хорошо, я займусь этим.",DIA_Addon_Huno_SomeThings_Mission);
};

func void DIA_Addon_Huno_SomeThings_Mission()
{
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_Mission_15_00");	//Хорошо, я займусь этим.
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Mission_06_01");	//Хорошо. Посмотрим, стоит ли тебе доверять.
	Info_ClearChoices(DIA_Addon_Huno_SomeThings);
	AI_StopProcessInfos(self);
};

func void DIA_Addon_Huno_SomeThings_TellMeNow()
{
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_TellMeNow_15_00");	//Скажи мне сначала, кто стоял за атакой!
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_TellMeNow_06_01");	//Нет. Ты хороший парень, конечно, но я тебе не доверяю.
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_TellMeNow_15_02");	//Слушай, либо ты мне говоришь, кто это был, либо мне придется доложить нашему общему другу - Эстебану.
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_TellMeNow_15_03");	//Выбирай.
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_TellMeNow_06_04");	//(вздыхает) Ладно. Я организую встречу. Но только так, как я этого хочу, понял?
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_TellMeNow_06_05");	//Иди в таверну и поговори с хозяином. Он скажет, что делать дальше.
	Huno_zuSnaf = TRUE;
	Info_ClearChoices(DIA_Addon_Huno_SomeThings);
	AI_StopProcessInfos(self);
	B_LogEntry(Topic_Addon_Esteban,"Хуно сказал, что я должен поговорить со Снафом.");
};


instance DIA_Addon_Huno_Paket(C_Info)
{
	npc = BDT_1099_Addon_Huno;
	nr = 3;
	condition = DIA_Addon_Huno_Paket_Condition;
	information = DIA_Addon_Huno_Paket_Info;
	permanent = FALSE;
	description = "Вот твоя сталь.";
};


func int DIA_Addon_Huno_Paket_Condition()
{
	if((MIS_Huno_Stahl == LOG_Running) && Npc_HasItems(other,ItMi_Addon_Steel_Paket))
	{
		return TRUE;
	};
};

func void DIA_Addon_Huno_Paket_Info()
{
	AI_Output(other,self,"DIA_Addon_Huno_Paket_15_00");	//Вот твоя сталь.
	B_GiveInvItems(other,self,ItMi_Addon_Steel_Paket,1);
	Npc_RemoveInvItem(self,ItMi_Addon_Steel_Paket);
	AI_Output(self,other,"DIA_Addon_Huno_Paket_06_01");	//А Хуан? Он там был?
	AI_Output(other,self,"DIA_Addon_Huno_Paket_15_02");	//Был, как же еще.
	AI_Output(self,other,"DIA_Addon_Huno_Paket_06_03");	//Я так и знал. Крыса Эстебан стоял за всем этим.
	if(Huno_zuSnaf == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Huno_Paket_06_04");	//А ты неплох. Надо сказать, я не ожидал.
		AI_Output(self,other,"DIA_Addon_Huno_Paket_06_05");	//Вот, возьми это. Небольшая награда.
		B_GiveInvItems(self,other,ItMi_Gold,200);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Huno_Paket_15_06");	//А теперь давай поговорим о нашем договоре.
		AI_Output(self,other,"DIA_Addon_Huno_Paket_06_07");	//Нужный тебе человек ждет тебя в таверне. Поговори с хозяином.
		Huno_zuSnaf = TRUE;
	};
	B_LogEntry(Topic_Addon_Esteban,"Хуно сказал, что я должен поговорить со Снафом.");
	MIS_Huno_Stahl = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_HunoStahl);
};


instance DIA_Addon_Huno_Trade(C_Info)
{
	npc = BDT_1099_Addon_Huno;
	nr = 888;
	condition = DIA_Addon_Huno_Trade_Condition;
	information = DIA_Addon_Huno_Trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE_v3;
};


func int DIA_Addon_Huno_Trade_Condition()
{
	if(Huno_Angepisst == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Huno_Trade_Info()
{
	if(Huno_flag == TRUE)
	{
		B_ClearSmithInv(self);
		if(Huno_swordraws > 0)
		{
			CreateInvItems(self,ItMiSwordraw,Huno_swordraws);
		};
		Huno_flag = FALSE;
	};
	B_Say(other,self,"$TRADE_3");
	B_GiveTradeInv(self);
	Trade_IsActive = TRUE;
};

