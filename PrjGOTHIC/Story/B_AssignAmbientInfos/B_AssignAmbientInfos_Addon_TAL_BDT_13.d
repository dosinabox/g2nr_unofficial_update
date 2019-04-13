
instance DIA_Addon_TAL_BDT_13_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_Addon_TAL_BDT_13_EXIT_Condition;
	information = DIA_Addon_TAL_BDT_13_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_TAL_BDT_13_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_TAL_BDT_13_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_TAL_BDT_13_Hi(C_Info)
{
	nr = 2;
	condition = DIA_Addon_TAL_BDT_13_Hi_Condition;
	information = DIA_Addon_TAL_BDT_13_Hi_Info;
	permanent = TRUE;
	description = "Как дела?";
};


func int DIA_Addon_TAL_BDT_13_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_TAL_BDT_13_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_TAL_BDT_13_Hi_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Addon_TAL_BDT_13_Hi_13_01");	//Или тебя съест монстр... или тебя съест монстр...
	AI_Output(self,other,"DIA_Addon_TAL_BDT_13_Hi_13_02");	//Это болото станет нам могилой...
};


instance DIA_Addon_TAL_BDT_13_Tal(C_Info)
{
	nr = 3;
	condition = DIA_Addon_TAL_BDT_13_Tal_Condition;
	information = DIA_Addon_TAL_BDT_13_Tal_Info;
	permanent = TRUE;
	description = "Что ты знаешь про эту долину?";
};


func int DIA_Addon_TAL_BDT_13_Tal_Condition()
{
	return TRUE;
};

func void DIA_Addon_TAL_BDT_13_Tal_Info()
{
	AI_Output(other,self,"DIA_Addon_TAL_BDT_13_Tal_15_00");	//Что ты знаешь про эту долину?
	AI_Output(self,other,"DIA_Addon_TAL_BDT_13_Tal_13_01");	//Здесь множество вещей, оставшихся с древних времен. Ворон велел нам собирать их все.
	AI_Output(self,other,"DIA_Addon_TAL_BDT_13_Tal_13_02");	//Не знаю, зачем они ему нужны, но ни один нормальный человек не будет рисковать собственной жизнью за несколько старых камней...
};


instance DIA_Addon_TAL_BDT_13_News(C_Info)
{
	nr = 4;
	condition = DIA_Addon_TAL_BDT_13_News_Condition;
	information = DIA_Addon_TAL_BDT_13_News_Info;
	permanent = TRUE;
	description = "Есть какие-нибудь новости?";
};


func int DIA_Addon_TAL_BDT_13_News_Condition()
{
	return TRUE;
};

func void DIA_Addon_TAL_BDT_13_News_Info()
{
	AI_Output(other,self,"DIA_Addon_TAL_BDT_13_News_15_00");	//Есть какие-нибудь новости?
	AI_Output(self,other,"DIA_Addon_TAL_BDT_13_News_13_01");	//Мы действительно довели этих пиратов.
	AI_Output(self,other,"DIA_Addon_TAL_BDT_13_News_13_02");	//Они привозили нам пленников, но ни разу не получили и монеты. Ничего удивительного, что они разозлились.
	if(BDT_13_einmal == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_TAL_BDT_13_News_13_03");	//Но что они могут сделать? Напасть на лагерь? (смеется) ХА-ХА.
		BDT_13_einmal = TRUE;
	};
};

func void B_AssignAmbientInfos_Addon_TAL_BDT_13(var C_Npc slf)
{
	DIA_Addon_TAL_BDT_13_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_TAL_BDT_13_Hi.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_TAL_BDT_13_Tal.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_TAL_BDT_13_News.npc = Hlp_GetInstanceID(slf);
};

