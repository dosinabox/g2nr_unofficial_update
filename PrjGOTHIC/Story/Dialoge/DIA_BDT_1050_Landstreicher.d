
instance DIA_Landstreicher_EXIT(C_Info)
{
	npc = BDT_1050_Landstreicher;
	nr = 999;
	condition = DIA_Landstreicher_EXIT_Condition;
	information = DIA_Landstreicher_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Landstreicher_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Landstreicher_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Landstreicher_HALLO(C_Info)
{
	npc = BDT_1050_Landstreicher;
	nr = 5;
	condition = DIA_Landstreicher_HALLO_Condition;
	information = DIA_Landstreicher_HALLO_Info;
	important = TRUE;
};


func int DIA_Landstreicher_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Landstreicher_HALLO_Info()
{
	AI_Output(self,other,"DIA_Landstreicher_HALLO_09_00");	//Что происходит?
	AI_Output(other,self,"DIA_Landstreicher_HALLO_15_01");	//Что ты имеешь в виду?
	AI_Output(self,other,"DIA_Landstreicher_HALLO_09_02");	//Ты уже второй здесь, кто несется, как будто ужаленный кровавой мухой.
	Info_ClearChoices(DIA_Landstreicher_HALLO);
	Info_AddChoice(DIA_Landstreicher_HALLO,"Мне нужно идти.",DIA_Landstreicher_HALLO_weg);
	Info_AddChoice(DIA_Landstreicher_HALLO,"А куда первый побежал?",DIA_Landstreicher_HALLO_wo);
	Info_AddChoice(DIA_Landstreicher_HALLO,"Что это за парень?",DIA_Landstreicher_HALLO_wer);
};

func void DIA_Landstreicher_HALLO_wo()
{
	AI_Output(other,self,"DIA_Landstreicher_HALLO_wo_15_00");	//А куда первый побежал?
	AI_Output(self,other,"DIA_Landstreicher_HALLO_wo_09_01");	//Вон туда. Бежал, это еще мягко сказано.
};

func void DIA_Landstreicher_HALLO_wer()
{
	AI_Output(other,self,"DIA_Landstreicher_HALLO_wer_15_00");	//А кто это был?
	AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_09_01");	//Он был похож на одного из этих головастых послушников из монастыря.
	AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_09_02");	//Можешь говорить, что угодно, но, по-моему, у этих парней не все в порядке с головой.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_09_03");	//Только посмотри на их дурацкое одеяние. Я бы не хотел быть пойманным на улице ночью в такой одежке. (смеется)
		Info_AddChoice(DIA_Landstreicher_HALLO,"Попридержи язык. Я сам был послушником в монастыре.",DIA_Landstreicher_HALLO_wer_vorsicht);
	};
};

func void DIA_Landstreicher_HALLO_wer_vorsicht()
{
	AI_Output(other,self,"DIA_Landstreicher_HALLO_wer_vorsicht_15_00");	//Попридержи язык. Я сам был послушником в монастыре.
	AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_vorsicht_09_01");	//(смеется) Ах ты, бедняга. Это объясняет кое-что.
	AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_vorsicht_09_02");	//Ничего личного. Ступай с богом. Ты занятой человек, не буду задерживать тебя.
	Info_AddChoice(DIA_Landstreicher_HALLO,"Кто-нибудь должен поучить тебя хорошим манерам.",DIA_Landstreicher_HALLO_wer_vorsicht_Manieren);
};

func void DIA_Landstreicher_HALLO_wer_vorsicht_Manieren()
{
	AI_Output(other,self,"DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_15_00");	//Кто-нибудь должен поучить тебя хорошим манерам.
	AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_09_01");	//Ладно, не обижайся. Но если ты так уж хочешь сразиться, то давай.
	AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_09_02");	//Покажи мне, на что вы, послушники, способны.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Landstreicher_HALLO_weg()
{
	AI_Output(other,self,"DIA_Landstreicher_HALLO_weg_15_00");	//Мне нужно идти.
	AI_Output(self,other,"DIA_Landstreicher_HALLO_weg_09_01");	//Хе. Нет проблем.
	AI_StopProcessInfos(self);
};


instance DIA_Landstreicher_WASMACHSTDU(C_Info)
{
	npc = BDT_1050_Landstreicher;
	nr = 6;
	condition = DIA_Landstreicher_WASMACHSTDU_Condition;
	information = DIA_Landstreicher_WASMACHSTDU_Info;
	permanent = TRUE;
	description = "Что ты делаешь здесь?";
};


func int DIA_Landstreicher_WASMACHSTDU_Condition()
{
	return TRUE;
};

func void DIA_Landstreicher_WASMACHSTDU_Info()
{
	AI_Output(other,self,"DIA_Landstreicher_WASMACHSTDU_15_00");	//Что ты делаешь здесь?
	if(Npc_KnowsInfo(other,DIA_Landstreicher_HALLO))
	{
		AI_Output(self,other,"DIA_Landstreicher_WASMACHSTDU_09_01");	//Ты задаешь слишком много вопросов, молокосос.
	};
	AI_Output(self,other,"DIA_Landstreicher_WASMACHSTDU_09_02");	//Назови пещеру гоблинов, в которой мы ползали вместе, и я расскажу тебе все свои тайны.
	AI_Output(self,other,"DIA_Landstreicher_WASMACHSTDU_09_03");	//А в противном случае, это не твое дело.
	AI_StopProcessInfos(self);
};

