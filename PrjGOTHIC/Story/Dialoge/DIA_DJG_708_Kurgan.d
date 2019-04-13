
instance DIA_Kurgan_EXIT(C_Info)
{
	npc = DJG_708_Kurgan;
	nr = 999;
	condition = DIA_Kurgan_EXIT_Condition;
	information = DIA_Kurgan_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Kurgan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Kurgan_EXIT_Info()
{
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(Biff,400);
};


instance DIA_Kurgan_HELLO(C_Info)
{
	npc = DJG_708_Kurgan;
	condition = DIA_Kurgan_HELLO_Condition;
	information = DIA_Kurgan_HELLO_Info;
	important = TRUE;
};


func int DIA_Kurgan_HELLO_Condition()
{
	return TRUE;
};

func void DIA_Kurgan_HELLO_Info()
{
	AI_Output(self,other,"DIA_Kurgan_HELLO_01_00");	//Эй, ты! Смотри, куда идешь!
	AI_Output(other,self,"DIA_Kurgan_HELLO_15_01");	//Что ты этим хочешь сказать?
	AI_Output(self,other,"DIA_Kurgan_HELLO_01_02");	//Я хочу сказать, что пребывание здесь может не очень хорошо сказаться на твоем здоровье. Это место просто кишит орками и монстрами.
	AI_Output(self,other,"DIA_Kurgan_HELLO_01_03");	//Не говоря уже о драконах. Это просто дружеское предупреждение.
	B_LogEntry(TOPIC_Dragonhunter,"У входа в Долину рудников мне встретилась группа охотников на драконов. Эти парни хорошо вооружены, но, боюсь, это не произведет особого впечатления на драконов.");
};


instance DIA_Kurgan_ELSE(C_Info)
{
	npc = DJG_708_Kurgan;
	condition = DIA_Kurgan_ELSE_Condition;
	information = DIA_Kurgan_ELSE_Info;
	description = "Ты можешь сказать мне что-нибудь, чего я еще не знаю?";
};


func int DIA_Kurgan_ELSE_Condition()
{
	return TRUE;
};

func void DIA_Kurgan_ELSE_Info()
{
	AI_Output(other,self,"DIA_Kurgan_ELSE_15_00");	//Ты можешь сказать мне что-нибудь, чего я еще не знаю?
	AI_Output(self,other,"DIA_Kurgan_ELSE_01_01");	//Я могу дать тебе добрый совет, причем бесплатно.
	AI_Output(self,other,"DIA_Kurgan_ELSE_01_02");	//Нам здесь не нужны трусы, которые падают в обморок, как только почувствуют даже слабый запах дракона.
	AI_Output(self,other,"DIA_Kurgan_ELSE_01_03");	//Возвращайся домой, это работа для настоящих мужчин.
};


instance DIA_Kurgan_Leader(C_Info)
{
	npc = DJG_708_Kurgan;
	condition = DIA_Kurgan_Leader_Condition;
	information = DIA_Kurgan_Leader_Info;
	description = "Ты что здесь, за главного?";
};


func int DIA_Kurgan_Leader_Condition()
{
	return TRUE;
};

func void DIA_Kurgan_Leader_Info()
{
	AI_Output(other,self,"DIA_Kurgan_Leader_15_00");	//Ты что здесь, за главного?
	AI_Output(self,other,"DIA_Kurgan_Leader_01_01");	//Я что, похож на главного? Конечно нет. Нам здесь не нужны важничающие кретины, раздающие приказы.
	AI_Output(self,other,"DIA_Kurgan_Leader_01_02");	//Когда Сильвио попытался вести себя как командир, мы показали ему и его парням, что мы думаем об этом.
	AI_Output(self,other,"DIA_Kurgan_Leader_01_03");	//Произошла небольшая стычка. И в конце концов им пришлось убраться.
	AI_Output(self,other,"DIA_Kurgan_Leader_01_04");	//Надеюсь, Сильвио найдет свой конец в кастрюле какого-нибудь орка.
};


instance DIA_Kurgan_KillDragon(C_Info)
{
	npc = DJG_708_Kurgan;
	condition = DIA_Kurgan_KillDragon_Condition;
	information = DIA_Kurgan_KillDragon_Info;
	description = "Так вы хотите убить драконов?";
};


func int DIA_Kurgan_KillDragon_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Kurgan_Leader))
	{
		return TRUE;
	};
};


var int Kurgan_KillDragon_Day;

func void DIA_Kurgan_KillDragon_Info()
{
	AI_Output(other,self,"DIA_Kurgan_KillDragon_15_00");	//(издеваясь) Так вы хотите убить драконов?
	AI_Output(self,other,"DIA_Kurgan_KillDragon_01_01");	//Надо же, какой догадливый. А ты хоть знаешь, как можно завалить дракона?
	AI_Output(self,other,"DIA_Kurgan_KillDragon_01_02");	//Ты думаешь, он будет спокойно сидеть на месте, когда ты будешь рубить его голову?
	AI_Output(self,other,"DIA_Kurgan_KillDragon_01_03");	//Такие дела требуют тщательного планирования и решительных действий.
	AI_Output(other,self,"DIA_Kurgan_KillDragon_15_04");	//Понимаю. И как вы собираетесь справиться с драконами?
	AI_Output(self,other,"DIA_Kurgan_KillDragon_01_05");	//Сначала мы должны выяснить, где они скрываются.
	AI_Output(self,other,"DIA_Kurgan_KillDragon_01_06");	//Только тогда можно будет подумать о лучшем способе атаковать их.
	Kurgan_KillDragon_Day = Wld_GetDay();
	Info_AddChoice(DIA_Kurgan_KillDragon,"К сожалению, мне нужно идти.",DIA_Kurgan_KillDragon_weg);
	Info_AddChoice(DIA_Kurgan_KillDragon,"Как вы собираетесь пройти мимо орков?",DIA_Kurgan_KillDragon_orks);
	Info_AddChoice(DIA_Kurgan_KillDragon,"Мне кажется, вы не способны найти даже слепую овцу.",DIA_Kurgan_KillDragon_spott);
};

func void DIA_Kurgan_KillDragon_spott()
{
	AI_Output(other,self,"DIA_Kurgan_KillDragon_spott_15_00");	//Мне кажется, вы не способны найти даже слепую овцу.
	AI_Output(self,other,"DIA_Kurgan_KillDragon_spott_01_01");	//Что? Ты хочешь схлопотать по своей тупой физиономии?
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Kurgan_KillDragon_orks()
{
	AI_Output(other,self,"DIA_Kurgan_KillDragon_orks_15_00");	//Как вы собираетесь пройти мимо орков?
	AI_Output(self,other,"DIA_Kurgan_KillDragon_orks_01_01");	//Мы рассмотрим этот вопрос позже.
};

func void DIA_Kurgan_KillDragon_weg()
{
	AI_Output(other,self,"DIA_Kurgan_KillDragon_weg_15_00");	//Мне бы очень хотелось посмотреть, как вы будете делать это, но, к сожалению, мне нужно идти.
	AI_Output(self,other,"DIA_Kurgan_KillDragon_weg_01_01");	//Возвращайся назад, через проход. В противном случае ты рискуешь лишиться руки или ноги.
	AI_StopProcessInfos(self);
};


instance DIA_Kurgan_SEENDRAGON(C_Info)
{
	npc = DJG_708_Kurgan;
	condition = DIA_Kurgan_SEENDRAGON_Condition;
	information = DIA_Kurgan_SEENDRAGON_Info;
	permanent = TRUE;
	description = "Ты еще не видел дракона?";
};


func int DIA_Kurgan_SEENDRAGON_Condition()
{
	if(Kurgan_KillDragon_Day <= (Wld_GetDay() - 2))
	{
		return TRUE;
	};
};

func void DIA_Kurgan_SEENDRAGON_Info()
{
	AI_Output(other,self,"DIA_Kurgan_SEENDRAGON_15_00");	//Ты еще не видел дракона?
	AI_Output(self,other,"DIA_Kurgan_SEENDRAGON_01_01");	//Пока нет. Но эта тварь не может скрываться вечно.
};


instance DIA_Kurgan_AllDragonsDead(C_Info)
{
	npc = DJG_708_Kurgan;
	nr = 5;
	condition = DIA_Kurgan_AllDragonsDead_Condition;
	information = DIA_Kurgan_AllDragonsDead_Info;
	permanent = FALSE;
	description = "Драконы мертвы.";
};


func int DIA_Kurgan_AllDragonsDead_Condition()
{
	if(MIS_AllDragonsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Kurgan_AllDragonsDead_Info()
{
	AI_Output(other,self,"DIA_Kurgan_AllDragonsDead_15_00");	//Драконы мертвы.
	AI_Output(self,other,"DIA_Kurgan_AllDragonsDead_01_01");	//Ха! И кто, интересно, убил их? Паладины?
	AI_Output(other,self,"DIA_Kurgan_AllDragonsDead_15_02");	//Я.
	AI_Output(self,other,"DIA_Kurgan_AllDragonsDead_01_03");	//(смеется) Ха. Ты даже сам в это не веришь. Хватит нести чушь.
};


instance DIA_Kurgan_PICKPOCKET(C_Info)
{
	npc = DJG_708_Kurgan;
	nr = 900;
	condition = DIA_Kurgan_PICKPOCKET_Condition;
	information = DIA_Kurgan_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Kurgan_PICKPOCKET_Condition()
{
	return C_Beklauen(34,120);
};

func void DIA_Kurgan_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Kurgan_PICKPOCKET);
	Info_AddChoice(DIA_Kurgan_PICKPOCKET,Dialog_Back,DIA_Kurgan_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Kurgan_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Kurgan_PICKPOCKET_DoIt);
};

func void DIA_Kurgan_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Kurgan_PICKPOCKET);
};

func void DIA_Kurgan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Kurgan_PICKPOCKET);
};

