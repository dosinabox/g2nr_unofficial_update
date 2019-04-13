
instance DIA_Tandor_EXIT(C_Info)
{
	npc = PAL_260_Tandor;
	nr = 999;
	condition = DIA_Tandor_EXIT_Condition;
	information = DIA_Tandor_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Tandor_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Tandor_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Tandor_Hallo(C_Info)
{
	npc = PAL_260_Tandor;
	nr = 2;
	condition = DIA_Tandor_Hallo_Condition;
	information = DIA_Tandor_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Tandor_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Tandor_Hallo_Info()
{
	AI_Output(self,other,"DIA_Tandor_Hallo_08_00");	//Ты пришел через Проход? Это хорошо. Мы уже потеряли там много хороших людей.
	AI_Output(self,other,"DIA_Tandor_Hallo_08_01");	//Я хорошо знаю, каково там - я служил в разведотряде некоторое время.
	AI_Output(self,other,"DIA_Tandor_Hallo_08_02");	//У тебя есть оружие? Если тебе нужно хорошее оружие, обратись ко мне.
	Log_CreateTopic(TOPIC_Trader_OC,LOG_NOTE);
	B_LogEntry(TOPIC_Trader_OC,"Тандор торгует оружием в замке.");
};


instance DIA_Tandor_Trupp(C_Info)
{
	npc = PAL_260_Tandor;
	nr = 2;
	condition = DIA_Tandor_Trupp_Condition;
	information = DIA_Tandor_Trupp_Info;
	permanent = FALSE;
	description = "Что стало с этим отрядом?";
};


func int DIA_Tandor_Trupp_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Tandor_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Tandor_Trupp_Info()
{
	AI_Output(other,self,"DIA_Tandor_Trupp_15_00");	//Что стало с этим отрядом?
	AI_Output(self,other,"DIA_Tandor_Trupp_08_01");	//Мы проводили разведку местности и собирались продвинуться к побережью. Мы разбили лагерь в пещере.
	AI_Output(self,other,"DIA_Tandor_Trupp_08_02");	//Но поздно ночью пришли орки. Они осветили склон факелами и обнаружили нас.
	AI_Output(self,other,"DIA_Tandor_Trupp_08_03");	//Мы попытались скрыться, но я единственный, кому удалось пробиться к своим...
	AI_Output(self,other,"DIA_Tandor_Trupp_08_04");	//Вскоре после этого орки возвели огромный частокол, и нам пришлось отступить в замок.
};


instance DIA_Tandor_Trade(C_Info)
{
	npc = PAL_260_Tandor;
	nr = 900;
	condition = DIA_Tandor_Trade_Condition;
	information = DIA_Tandor_Trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Покажи мне свои товары.";
};


func int DIA_Tandor_Trade_Condition()
{
	return TRUE;
};

func void DIA_Tandor_Trade_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other,self,"DIA_Tandor_Trade_15_00");	//Покажи мне свои товары.
};


instance DIA_Tandor_Equipment(C_Info)
{
	npc = PAL_260_Tandor;
	nr = 3;
	condition = DIA_Tandor_Equipment_Condition;
	information = DIA_Tandor_Equipment_Info;
	description = "Меня послал Гаронд - мне нужно снаряжение.";
};


func int DIA_Tandor_Equipment_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Garond_Equipment) && (other.guild == GIL_MIL) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_Tandor_Equipment_Info()
{
	AI_Output(other,self,"DIA_Tandor_Equipment_15_00");	//Меня послал Гаронд - мне нужно снаряжение.
	AI_Output(self,other,"DIA_Tandor_Equipment_08_01");	//Для ближнего или дальнего боя?
	Info_ClearChoices(DIA_Tandor_Equipment);
	Info_AddChoice(DIA_Tandor_Equipment,"Для ближнего боя.",DIA_Tandor_Equipment_Nah);
	Info_AddChoice(DIA_Tandor_Equipment,"Для дальнего боя.",DIA_Tandor_Equipment_Fern);
};

func void DIA_Tandor_Equipment_Nah()
{
	AI_Output(other,self,"DIA_Tandor_Equipment_Nah_15_00");	//Для ближнего боя.
	AI_Output(self,other,"DIA_Tandor_Equipment_Nah_08_01");	//Одноручное иди двуручное?
	Info_ClearChoices(DIA_Tandor_Equipment);
	Info_AddChoice(DIA_Tandor_Equipment,"Одноручное.",DIA_Tandor_Equipment_Ein);
	Info_AddChoice(DIA_Tandor_Equipment,"Двуручное.",DIA_Tandor_Equipment_Zwei);
};

func void DIA_Tandor_Equipment_Fern()
{
	AI_Output(other,self,"DIA_Tandor_Equipment_Fern_15_00");	//Для дальнего боя.
	AI_Output(self,other,"DIA_Tandor_Equipment_Fern_08_01");	//Лук или арбалет?
	Info_ClearChoices(DIA_Tandor_Equipment);
	Info_AddChoice(DIA_Tandor_Equipment,"Лук.",DIA_Tandor_Equipment_Bow);
	Info_AddChoice(DIA_Tandor_Equipment,"Арбалет.",DIA_Tandor_Equipment_Crossbow);
};

func void DIA_Tandor_Equipment_Ein()
{
	AI_Output(other,self,"DIA_Tandor_Equipment_Ein_15_00");	//Одноручное.
	AI_Output(self,other,"DIA_Tandor_Equipment_Ein_08_01");	//Тогда возьми этот дробитель камней. Это хорошее оружие.
	B_GiveInvItems(self,other,ItMw_Steinbrecher,1);
	Info_ClearChoices(DIA_Tandor_Equipment);
};

func void DIA_Tandor_Equipment_Zwei()
{
	AI_Output(other,self,"DIA_Tandor_Equipment_Zwei_15_00");	//Двуручное.
	AI_Output(self,other,"DIA_Tandor_Equipment_Zwei_08_01");	//Тебе понравится этот двуручник.
	B_GiveInvItems(self,other,ItMw_Zweihaender1,1);
	Info_ClearChoices(DIA_Tandor_Equipment);
};

func void DIA_Tandor_Equipment_Bow()
{
	AI_Output(other,self,"DIA_Tandor_Equipment_Bow_15_00");	//Лук.
	AI_Output(self,other,"DIA_Tandor_Equipment_Bow_08_01");	//Этот охотничий лук как нельзя лучше подойдет тебе. Я также дам тебе колчан стрел.
	B_GiveInvItems(self,other,ItRw_Bow_L_03,1);
	B_GiveInvItems(self,other,ItRw_Arrow,50);
	Info_ClearChoices(DIA_Tandor_Equipment);
};

func void DIA_Tandor_Equipment_Crossbow()
{
	AI_Output(other,self,"DIA_Tandor_Equipment_Crossbow_15_00");	//Арбалет.
	AI_Output(self,other,"DIA_Tandor_Equipment_Crossbow_08_01");	//Тогда возьми этот легкий арбалет. И болты к нему в придачу.
	B_GiveInvItems(self,other,ItRw_Crossbow_L_02,1);
	B_GiveInvItems(self,other,ItRw_Bolt,50);
	Info_ClearChoices(DIA_Tandor_Equipment);
};


instance DIA_Tandor_KAP3_EXIT(C_Info)
{
	npc = PAL_260_Tandor;
	nr = 999;
	condition = DIA_Tandor_KAP3_EXIT_Condition;
	information = DIA_Tandor_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Tandor_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Tandor_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Tandor_KAP4_EXIT(C_Info)
{
	npc = PAL_260_Tandor;
	nr = 999;
	condition = DIA_Tandor_KAP4_EXIT_Condition;
	information = DIA_Tandor_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Tandor_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Tandor_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Tandor_News(C_Info)
{
	npc = PAL_260_Tandor;
	nr = 40;
	condition = DIA_Tandor_News_Condition;
	information = DIA_Tandor_News_Info;
	permanent = TRUE;
	description = "Есть какие-нибудь новости?";
};


func int DIA_Tandor_News_Condition()
{
	if((Kapitel == 4) && Npc_KnowsInfo(hero,DIA_Tandor_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Tandor_News_Info()
{
	AI_Output(other,self,"DIA_Tandor_News_15_00");	//Есть какие-нибудь новости?
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Tandor_News_08_01");	//Единственная новость за последнее время - то, что вы, охотники на драконов, появились здесь.
	}
	else
	{
		AI_Output(self,other,"DIA_Tandor_News_08_02");	//Сюда прибыли охотники на драконов.
		AI_Output(self,other,"DIA_Tandor_News_08_03");	//Похоже, это крепкие ублюдки. Надеюсь, это действительно так, иначе вряд ли им удастся выжить здесь.
	};
};


instance DIA_Tandor_KAP5_EXIT(C_Info)
{
	npc = PAL_260_Tandor;
	nr = 999;
	condition = DIA_Tandor_KAP5_EXIT_Condition;
	information = DIA_Tandor_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Tandor_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Tandor_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Tandor_WASISTLOS(C_Info)
{
	npc = PAL_260_Tandor;
	nr = 51;
	condition = DIA_Tandor_WASISTLOS_Condition;
	information = DIA_Tandor_WASISTLOS_Info;
	permanent = TRUE;
	description = "Что-то ты не весел.";
};


func int DIA_Tandor_WASISTLOS_Condition()
{
	if((Kapitel == 5) && Npc_KnowsInfo(hero,DIA_Tandor_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Tandor_WASISTLOS_Info()
{
	AI_Output(other,self,"DIA_Tandor_WASISTLOS_15_00");	//Что-то ты не весел.
	if(MIS_OCGateOpen == TRUE)
	{
		AI_Output(self,other,"DIA_Tandor_WASISTLOS_08_01");	//Орки валят толпами. Скоро нам всем настанет конец.
	}
	else
	{
		AI_Output(self,other,"DIA_Tandor_WASISTLOS_08_02");	//Запасы продовольствия кончаются. Мы голодаем.
	};
};


instance DIA_Tandor_KAP6_EXIT(C_Info)
{
	npc = PAL_260_Tandor;
	nr = 999;
	condition = DIA_Tandor_KAP6_EXIT_Condition;
	information = DIA_Tandor_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Tandor_KAP6_EXIT_Condition()
{
	if(Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Tandor_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Tandor_PICKPOCKET(C_Info)
{
	npc = PAL_260_Tandor;
	nr = 900;
	condition = DIA_Tandor_PICKPOCKET_Condition;
	information = DIA_Tandor_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Tandor_PICKPOCKET_Condition()
{
	return C_Beklauen(47,90);
};

func void DIA_Tandor_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Tandor_PICKPOCKET);
	Info_AddChoice(DIA_Tandor_PICKPOCKET,Dialog_Back,DIA_Tandor_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Tandor_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Tandor_PICKPOCKET_DoIt);
};

func void DIA_Tandor_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Tandor_PICKPOCKET);
};

func void DIA_Tandor_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Tandor_PICKPOCKET);
};

