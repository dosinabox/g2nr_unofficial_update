
instance DIA_Addon_Cronos_ADW_EXIT(C_Info)
{
	npc = KDW_14010_Addon_Cronos_ADW;
	nr = 999;
	condition = DIA_Addon_Cronos_ADW_EXIT_Condition;
	information = DIA_Addon_Cronos_ADW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Cronos_ADW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Cronos_ADW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Cronos_ADWHello(C_Info)
{
	npc = KDW_14010_Addon_Cronos_ADW;
	nr = 1;
	condition = DIA_Addon_Cronos_ADWHello_Condition;
	information = DIA_Addon_Cronos_ADWHello_Info;
	important = TRUE;
};


func int DIA_Addon_Cronos_ADWHello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cronos_ADWHello_Info()
{
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_00");	//Рад тебя видеть. Мы уже начали бояться самого худшего.
	AI_Output(other,self,"DIA_Addon_Cronos_ADWHello_15_01");	//Ну, все прошло не так плохо. Как идут дела?
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_02");	//Местность здесь очень опасная.
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_03");	//Некоторых животных, которых мы здесь встретили, раньше никто не видел.
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_04");	//Совсем близко находится огромное болото, которое, по-видимому, разрасталось уже несколько сотен лет.
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_05");	//Не проходит ни дня, чтобы на нас не напал какой-нибудь зверь, пришедший с этого болота.
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_06");	//Так что будь осторожнее.
};


instance DIA_Addon_Cronos_WaechterADW(C_Info)
{
	npc = KDW_14010_Addon_Cronos_ADW;
	nr = 5;
	condition = DIA_Addon_Cronos_WaechterADW_Condition;
	information = DIA_Addon_Cronos_WaechterADW_Info;
	description = "Есть какие-нибудь новые сведения о каменных стражах?";
};


func int DIA_Addon_Cronos_WaechterADW_Condition()
{
	return TRUE;
};

func void DIA_Addon_Cronos_WaechterADW_Info()
{
	AI_Output(other,self,"DIA_Addon_Cronos_WaechterADW_15_00");	//Есть какие-нибудь новые сведения о каменных стражах?
	AI_Output(self,other,"DIA_Addon_Cronos_WaechterADW_04_01");	//Нам уже пришлось уничтожить несколько штук.
	AI_Output(self,other,"DIA_Addon_Cronos_WaechterADW_04_02");	//Они стоят как статуи и не шевелятся.
	AI_Output(self,other,"DIA_Addon_Cronos_WaechterADW_04_03");	//Но первое впечатление обманчиво. Если ты подойдешь слишком близко, они нападут на тебя!
	AI_Output(self,other,"DIA_Addon_Cronos_WaechterADW_04_04");	//Нет никакого сомнения, что источник их силы находится где-то здесь.
};


instance DIA_Addon_Cronos_ADW_Trade(C_Info)
{
	npc = KDW_14010_Addon_Cronos_ADW;
	nr = 99;
	condition = DIA_Addon_Cronos_ADW_Trade_Condition;
	information = DIA_Addon_Cronos_ADW_Trade_Info;
	trade = TRUE;
	permanent = TRUE;
	description = "Покажи мне свои товары.";
};


func int DIA_Addon_Cronos_ADW_Trade_Condition()
{
	return TRUE;
};


var int DIA_Addon_Cronos_ADW_Trade_OneTime;

func void DIA_Addon_Cronos_ADW_Trade_Info()
{
	B_GiveTradeInv(self);
	B_Say(other,self,"$TRADE_1");
};

