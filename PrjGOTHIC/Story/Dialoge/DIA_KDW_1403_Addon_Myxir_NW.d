
instance DIA_Addon_Myxir_EXIT(C_Info)
{
	npc = KDW_1403_Addon_Myxir_NW;
	nr = 999;
	condition = DIA_Addon_Myxir_EXIT_Condition;
	information = DIA_Addon_Myxir_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Myxir_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Myxir_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Myxir_Hallo(C_Info)
{
	npc = KDW_1403_Addon_Myxir_NW;
	nr = 5;
	condition = DIA_Addon_Myxir_Hallo_Condition;
	information = DIA_Addon_Myxir_Hallo_Info;
	description = "Все в порядке?";
};


func int DIA_Addon_Myxir_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Addon_Myxir_Hallo_Info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_Hallo_15_00");	//Все в порядке?
	AI_Output(self,other,"DIA_Addon_Myxir_Hallo_12_01");	//Заявиться сюда было с твоей стороны очень смелым поступком.
};


instance DIA_Addon_Myxir_WasMachstDu(C_Info)
{
	npc = KDW_1403_Addon_Myxir_NW;
	nr = 5;
	condition = DIA_Addon_Myxir_WasMachstDu_Condition;
	information = DIA_Addon_Myxir_WasMachstDu_Info;
	description = "Чем ты здесь занимаешься?";
};


func int DIA_Addon_Myxir_WasMachstDu_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Myxir_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_WasMachstDu_Info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_WasMachstDu_15_00");	//Чем ты здесь занимаешься?
	AI_Output(self,other,"DIA_Addon_Myxir_WasMachstDu_12_01");	//Я изучаю язык зодчих.
	AI_Output(self,other,"DIA_Addon_Myxir_WasMachstDu_12_02");	//Язык - это ключ к тому, чтобы понять этих людей.
	AI_Output(self,other,"DIA_Addon_Myxir_WasMachstDu_12_03");	//Каждый из нас должен выучить этот язык, иначе экспедиция закончится, даже не начавшись.
	AI_Output(self,other,"DIA_Addon_Myxir_WasMachstDu_12_04");	//Зодчие выбивали свои тексты на каменных табличках. К сожалению, многие из них давно разбиты или украдены.
};


instance DIA_Addon_Myxir_Steintafeln(C_Info)
{
	npc = KDW_1403_Addon_Myxir_NW;
	nr = 5;
	condition = DIA_Addon_Myxir_Steintafeln_Condition;
	information = DIA_Addon_Myxir_Steintafeln_Info;
	description = "Что же можно узнать из этих табличек?";
};


func int DIA_Addon_Myxir_Steintafeln_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Myxir_WasMachstDu))
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_Steintafeln_Info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_Steintafeln_15_00");	//Что же можно узнать из этих табличек?
	AI_Output(self,other,"DIA_Addon_Myxir_Steintafeln_12_01");	//На них записаны знания древнего народа.
	AI_Output(self,other,"DIA_Addon_Myxir_Steintafeln_12_02");	//Некоторые из них волшебным образом увеличивают магические или боевые способности.
	AI_Output(self,other,"DIA_Addon_Myxir_Steintafeln_12_03");	//Для тех, кто способен их прочесть, они являются настоящим сокровищем.
	if(TOPIC_End_Stoneplates == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_Stoneplates,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_Stoneplates,LOG_Running);
	};
	B_LogEntry(TOPIC_Addon_Stoneplates,"На каменных табличках записаны древние знания зодчих. Некоторые из них могут волшебным образом увеличить познания в области сражений или магии. Однако их нужно еще суметь прочитать.");
};


instance DIA_Addon_Myxir_WillYouTeachMe(C_Info)
{
	npc = KDW_1403_Addon_Myxir_NW;
	nr = 10;
	condition = DIA_Addon_Myxir_WillYouTeachMe_Condition;
	information = DIA_Addon_Myxir_WillYouTeachMe_Info;
	description = "Ты можешь научить меня языку зодчих?";
};


func int DIA_Addon_Myxir_WillYouTeachMe_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Myxir_WasMachstDu))
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_WillYouTeachMe_Info()
{
	B_Myxir_WillYouTeachMe();
};

