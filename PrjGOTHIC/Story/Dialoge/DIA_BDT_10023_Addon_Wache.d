
instance DIA_Addon_10023_Wache_EXIT(C_Info)
{
	npc = BDT_10023_Addon_Wache;
	nr = 999;
	condition = DIA_Addon_10023_Wache_EXIT_Condition;
	information = DIA_Addon_10023_Wache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_10023_Wache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_10023_Wache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_10023_Wache_Hi(C_Info)
{
	npc = BDT_10023_Addon_Wache;
	nr = 2;
	condition = DIA_Addon_10023_Wache_Hi_Condition;
	information = DIA_Addon_10023_Wache_Hi_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_10023_Wache_Hi_Condition()
{
	if(Npc_GetDistToNpc(self,other) <= 300)
	{
		return TRUE;
	};
};

func void DIA_Addon_10023_Wache_Hi_Info()
{
	AI_Output(self,other,"DIA_Addon_10023_Wache_Hi_11_00");	//Эй, куда ты идешь? Ты хочешь попасть в тот проход?
	AI_Output(other,self,"DIA_Addon_10023_Wache_Hi_15_01");	//Ну да, а почему бы нет?
	AI_Output(self,other,"DIA_Addon_10023_Wache_Hi_11_02");	//Там еще группа рабов. Я не возражаю, чтобы ты туда шел, но не надо их избивать до такого состояния, чтобы они не могли работать.
	AI_Output(self,other,"DIA_Addon_10023_Wache_Hi_11_03");	//В конце концов, мы не хотим, чтобы они просто так сидели. Они должны добывать золото.
	AI_Output(other,self,"DIA_Addon_10023_Wache_Hi_15_04");	//Ясно. А кто это приказал?
	AI_Output(self,other,"DIA_Addon_10023_Wache_Hi_11_05");	//Это прямой приказ Бладвина.
	AI_Output(other,self,"DIA_Addon_10023_Wache_Hi_15_06");	//А я думал, здесь командует Ворон.
	AI_Output(self,other,"DIA_Addon_10023_Wache_Hi_11_07");	//Верно - но рабы ему больше не нужны, он отдал их Бладвину.
	Pardos.attribute[ATR_HITPOINTS] = 70;
	B_LogEntry(TOPIC_Addon_Sklaven,"Ворону больше не нужны рабы. Теперь они принадлежат Бладвину.");
};


var int PrisonGuard_Rules;

instance DIA_Addon_10023_Wache_go(C_Info)
{
	npc = BDT_10023_Addon_Wache;
	nr = 99;
	condition = DIA_Addon_10023_Wache_go_Condition;
	information = DIA_Addon_10023_Wache_go_Info;
	permanent = TRUE;
	description = "Отпусти их!";
};


func int DIA_Addon_10023_Wache_go_Condition()
{
	return TRUE;
};

func void DIA_Addon_10023_Wache_go_Info()
{
	AI_Output(other,self,"DIA_Addon_10023_Wache_go_15_00");	//Отпусти их!
	if(PrisonGuard_Rules == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_10023_Wache_go_11_01");	//Слушай. Здесь командует Бладвин. Рабы принадлежат ему, так что только у него есть право отпустить их.
		AI_Output(self,other,"DIA_Addon_10023_Wache_go_11_02");	//Ну, еще у Торуса есть возможность замолвить словечко. А ты?
		PrisonGuard_Rules = TRUE;
		B_LogEntry(TOPIC_Addon_Sklaven,"Право освободить рабов есть только у Бладвина и Торуса.");
	};
	AI_Output(self,other,"DIA_Addon_10023_Wache_go_11_03");	//У тебя есть какое-то право на это?
	Info_ClearChoices(DIA_Addon_10023_Wache_go);
	Info_AddChoice(DIA_Addon_10023_Wache_go,Dialog_Back,DIA_Addon_10023_Wache_go_BACK);
	if(Npc_KnowsInfo(other,DIA_Addon_Thorus_Answer))
	{
		Info_AddChoice(DIA_Addon_10023_Wache_go,"Я поговорил с Торусом.",DIA_Addon_10023_Wache_go_Thorus);
	}
	else if(Npc_IsDead(Bloodwyn) && (Npc_HasItems(other,ItMi_Addon_Bloodwyn_Kopf) >= 1))
	{
		Info_AddChoice(DIA_Addon_10023_Wache_go,"(показать голову Бладвина)",DIA_Addon_10023_Wache_go_Blood);
	}
	else
	{
		Info_AddChoice(DIA_Addon_10023_Wache_go,"Я решаю, КТО идет в шахту.",DIA_Addon_10023_Wache_go_WER);
	};
};

func void DIA_Addon_10023_Wache_go_BACK()
{
	Info_ClearChoices(DIA_Addon_10023_Wache_go);
};

func void DIA_Addon_10023_Wache_go_WER()
{
	AI_Output(other,self,"DIA_Addon_10023_Wache_go_WER_15_00");	//Я решаю, КТО идет в шахту.
	AI_Output(self,other,"DIA_Addon_10023_Wache_go_WER_11_01");	//Ты делаешь работу Эстебана. Таким образом, у тебя нет НИКАКОГО права вмешиваться. Свободен.
	Info_ClearChoices(DIA_Addon_10023_Wache_go);
};


var int Wache_einmal;

func void DIA_Addon_10023_Wache_go_Blood()
{
	AI_Output(other,self,"DIA_Addon_10023_Wache_go_Blood_15_00");	//Вот. Этого достаточно?
	AI_Output(self,other,"DIA_Addon_10023_Wache_go_Blood_11_01");	//(резко) Убери. Я даже видеть этого не хочу.
	AI_Output(other,self,"DIA_Addon_10023_Wache_go_Blood_15_02");	//Лучше бы тебе отпустить рабов СЕЙЧАС ЖЕ.
	AI_Output(self,other,"DIA_Addon_10023_Wache_go_Blood_11_03");	//Погоди минутку. Бладвин - не единственный, кто здесь решает. Пока у меня не будет приказа от Торуса, я никого не отпущу.
	if(Npc_KnowsInfo(other,DIA_Addon_Thorus_Answer))
	{
		Info_ClearChoices(DIA_Addon_10023_Wache_go);
		Info_AddChoice(DIA_Addon_10023_Wache_go,"Я поговорил с Торусом.",DIA_Addon_10023_Wache_go_Thorus);
	}
	else
	{
		if(Wache_einmal == FALSE)
		{
			AI_Output(other,self,"DIA_Addon_10023_Wache_go_Blood_15_04");	//Но ты только что сказал, что рабы принадлежат Бладвину.
			AI_Output(self,other,"DIA_Addon_10023_Wache_go_Blood_11_05");	//Да, но я также сказал, что никого не отпущу без приказа от Торуса.
			AI_Output(other,self,"DIA_Addon_10023_Wache_go_Blood_15_06");	//Ты из тех ребят, кто не может даже помочиться без приказа?
			Wache_einmal = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_10023_Wache_go_Blood_11_07");	//Я же тебе сказал...
			AI_Output(other,self,"DIA_Addon_10023_Wache_go_Blood_15_08");	//...хватит, дальше я знаю.
		};
		Info_ClearChoices(DIA_Addon_10023_Wache_go);
	};
};

func void DIA_Addon_10023_Wache_go_Thorus()
{
	AI_Output(other,self,"DIA_Addon_10023_Wache_go_Thorus_15_00");	//Я поговорил с Торусом. Он приказал отпустить рабов.
	AI_Output(self,other,"DIA_Addon_10023_Wache_go_Thorus_11_01");	//Ну, если Торус приказал. Но я спрашиваю себя, зачем ему это могло понадобиться...
	AI_Output(other,self,"DIA_Addon_10023_Wache_go_Thorus_15_02");	//...кажется, тебе не платят за то, чтобы ты задавал вопросы.
	AI_Output(self,other,"DIA_Addon_10023_Wache_go_Thorus_11_03");	//Ладно, ладно. Я теперь здесь, как понятно, не нужен, так что я пойду съем кусочек мяса.
	Ready_Togo = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"SOUP");
};

