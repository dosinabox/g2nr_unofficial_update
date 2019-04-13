
instance DIA_BullcoDJG_EXIT(C_Info)
{
	npc = DJG_701_Bullco;
	nr = 999;
	condition = DIA_BullcoDJG_EXIT_Condition;
	information = DIA_BullcoDJG_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_BullcoDJG_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BullcoDJG_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BullcoDJG_HALLO(C_Info)
{
	npc = DJG_701_Bullco;
	nr = 5;
	condition = DIA_BullcoDJG_HALLO_Condition;
	information = DIA_BullcoDJG_HALLO_Info;
	description = "В чем дело?";
};


func int DIA_BullcoDJG_HALLO_Condition()
{
	if(!Npc_IsDead(DJG_Sylvio))
	{
		return TRUE;
	};
};

func void DIA_BullcoDJG_HALLO_Info()
{
	AI_Output(other,self,"DIA_BullcoDJG_HALLO_15_00");	//В чем дело?
	AI_Output(self,other,"DIA_BullcoDJG_HALLO_06_01");	//Здесь так холодно! Не понимаю, почему Сильвио настоял, чтобы мы шли именно сюда.
	AI_Output(self,other,"DIA_BullcoDJG_HALLO_06_02");	//Здесь есть множество других мест, где можно было бы поискать!
	AI_StopProcessInfos(self);
};


instance DIA_BullcoDJG_WARTEMAL(C_Info)
{
	npc = DJG_701_Bullco;
	nr = 6;
	condition = DIA_BullcoDJG_WARTEMAL_Condition;
	information = DIA_BullcoDJG_WARTEMAL_Info;
	permanent = TRUE;
	description = "А все остальное в порядке?";
};


func int DIA_BullcoDJG_WARTEMAL_Condition()
{
	if(Npc_KnowsInfo(other,DIA_BullcoDJG_HALLO) || Npc_KnowsInfo(other,DIA_Bullco_WASNUN))
	{
		return TRUE;
	};
};

func void DIA_BullcoDJG_WARTEMAL_Info()
{
	AI_Output(other,self,"DIA_BullcoDJG_WARTEMAL_15_00");	//А все остальное в порядке?
	if(Npc_KnowsInfo(other,DIA_Bullco_WASNUN))
	{
		AI_Output(self,other,"DIA_BullcoDJG_WARTEMAL_06_01");	//Не играй у меня на нервах.
	}
	else
	{
		AI_Output(self,other,"DIA_BullcoDJG_WARTEMAL_06_02");	//Только не сейчас! Я замерзаю! Я хочу выбраться отсюда как можно быстрее.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Bullco_SYLVIODEAD(C_Info)
{
	npc = DJG_701_Bullco;
	nr = 7;
	condition = DIA_Bullco_SYLVIODEAD_Condition;
	information = DIA_Bullco_SYLVIODEAD_Info;
	important = TRUE;
};


func int DIA_Bullco_SYLVIODEAD_Condition()
{
	if(Npc_IsDead(DJG_Sylvio))
	{
		return TRUE;
	};
};

func void DIA_Bullco_SYLVIODEAD_Info()
{
	AI_Output(self,other,"DIA_Bullco_SYLVIODEAD_06_00");	//Черт. Сильвио мертв.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_Bullco_WASNUN(C_Info)
{
	npc = DJG_701_Bullco;
	nr = 8;
	condition = DIA_Bullco_WASNUN_Condition;
	information = DIA_Bullco_WASNUN_Info;
	description = "Что ты будешь делать теперь, когда Сильвио мертв?";
};


func int DIA_Bullco_WASNUN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bullco_SYLVIODEAD) && Npc_IsDead(DJG_Sylvio))
	{
		return TRUE;
	};
};

func void DIA_Bullco_WASNUN_Info()
{
	AI_Output(other,self,"DIA_Bullco_WASNUN_15_00");	//Что ты будешь делать теперь, когда Сильвио мертв?
	AI_Output(self,other,"DIA_Bullco_WASNUN_06_01");	//Понятия не имею. Думаю, нужно найти других охотников на драконов, если я еще им нужен.
	Info_AddChoice(DIA_Bullco_WASNUN,"Мне бы стоило оторвать твою голову.",DIA_Bullco_WASNUN_kopfab);
	Info_AddChoice(DIA_Bullco_WASNUN,"Ты знаешь, где остальные?",DIA_Bullco_WASNUN_woandere);
};

func void DIA_Bullco_WASNUN_woandere()
{
	AI_Output(other,self,"DIA_Bullco_WASNUN_woandere_15_00");	//Ты знаешь, где остальные?
	AI_Output(self,other,"DIA_Bullco_WASNUN_woandere_06_01");	//Думаю, да. По крайней мере, я видел одного из них у реки вон там.
	Info_AddChoice(DIA_Bullco_WASNUN,"Отведи меня к другим охотникам на драконов.",DIA_Bullco_WASNUN_woandere_zuihnen);
};

func void DIA_Bullco_WASNUN_woandere_zuihnen()
{
	AI_Output(other,self,"DIA_Bullco_WASNUN_woandere_zuihnen_15_00");	//Отведи меня к другим охотникам на драконов.
	AI_Output(self,other,"DIA_Bullco_WASNUN_woandere_zuihnen_06_01");	//Эй, я не твой лакей.
	Info_ClearChoices(DIA_Bullco_WASNUN);
	Info_AddChoice(DIA_Bullco_WASNUN,"Как знаешь.",DIA_Bullco_WASNUN_woandere_zuihnen_alleine);
	Info_AddChoice(DIA_Bullco_WASNUN,"Радуйся, если я оставлю тебя в живых.",DIA_Bullco_WASNUN_woandere_zuihnen_lebenlassen);
	Info_AddChoice(DIA_Bullco_WASNUN,"Я заплачу тебе 50 золотых за это.",DIA_Bullco_WASNUN_woandere_zuihnen_Geld);
};

func void DIA_Bullco_WASNUN_woandere_zuihnen_lebenlassen()
{
	AI_Output(other,self,"DIA_Bullco_WASNUN_woandere_zuihnen_lebenlassen_15_00");	//Радуйся, если я оставлю тебя в живых.
	AI_Output(self,other,"DIA_Bullco_WASNUN_woandere_zuihnen_lebenlassen_06_01");	//Отстань от меня!
	AI_StopProcessInfos(self);
};

func void DIA_Bullco_WASNUN_woandere_zuihnen_Geld()
{
	AI_Output(other,self,"DIA_Bullco_WASNUN_woandere_zuihnen_Geld_15_00");	//Я заплачу тебе 50 золотых за это.
	if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		AI_Output(self,other,"DIA_Bullco_WASNUN_woandere_zuihnen_Geld_06_01");	//Хорошо. Давай их сюда.
		AI_Output(self,other,"DIA_Bullco_WASNUN_woandere_zuihnen_Geld_06_02");	//Иди за мной. Я отведу тебя туда, где я последний раз видел других охотников на драконов.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"DJGVorposten");
	}
	else
	{
		AI_Output(self,other,"DIA_Bullco_WASNUN_woandere_zuihnen_Geld_06_03");	//У тебя нет 50 золотых, и я не куплюсь на эту чушь. Проваливай.
		AI_StopProcessInfos(self);
	};
};

func void DIA_Bullco_WASNUN_woandere_zuihnen_alleine()
{
	AI_Output(other,self,"DIA_Bullco_WASNUN_woandere_zuihnen_alleine_15_00");	//Как знаешь. Я сам их найду.
	AI_Output(self,other,"DIA_Bullco_WASNUN_woandere_zuihnen_alleine_06_01");	//Только не заблудись.
	AI_StopProcessInfos(self);
};

func void DIA_Bullco_WASNUN_kopfab()
{
	AI_Output(other,self,"DIA_Bullco_WASNUN_kopfab_15_00");	//Мне бы стоило оторвать твою голову.
	AI_Output(self,other,"DIA_Bullco_WASNUN_kopfab_06_01");	//Заткни свою пасть.
	Info_AddChoice(DIA_Bullco_WASNUN,"Вынимай оружие. Мы положим конец этому здесь и сейчас.",DIA_Bullco_WASNUN_kopfab_angriff);
};

func void DIA_Bullco_WASNUN_kopfab_angriff()
{
	AI_Output(other,self,"DIA_Bullco_WASNUN_kopfab_angriff_15_00");	//Вынимай оружие. Мы положим конец этому здесь и сейчас.
	AI_Output(self,other,"DIA_Bullco_WASNUN_kopfab_angriff_06_01");	//Так тому и быть.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Bullco_PICKPOCKET(C_Info)
{
	npc = DJG_701_Bullco;
	nr = 900;
	condition = DIA_Bullco_PICKPOCKET_Condition;
	information = DIA_Bullco_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Bullco_PICKPOCKET_Condition()
{
	return C_Beklauen(34,65);
};

func void DIA_Bullco_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Bullco_PICKPOCKET);
	Info_AddChoice(DIA_Bullco_PICKPOCKET,Dialog_Back,DIA_Bullco_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Bullco_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Bullco_PICKPOCKET_DoIt);
};

func void DIA_Bullco_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Bullco_PICKPOCKET);
};

func void DIA_Bullco_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Bullco_PICKPOCKET);
};

