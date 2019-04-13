
instance DIA_Addon_Bloodwyn_EXIT(C_Info)
{
	npc = BDT_1085_Addon_Bloodwyn;
	nr = 999;
	condition = DIA_Addon_Bloodwyn_EXIT_Condition;
	information = DIA_Addon_Bloodwyn_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Bloodwyn_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Bloodwyn_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Bloodwyn_PICKPOCKET(C_Info)
{
	npc = BDT_1085_Addon_Bloodwyn;
	nr = 900;
	condition = DIA_Addon_Bloodwyn_PICKPOCKET_Condition;
	information = DIA_Addon_Bloodwyn_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_100;
};


func int DIA_Addon_Bloodwyn_PICKPOCKET_Condition()
{
	return C_Beklauen(90,250);
};

func void DIA_Addon_Bloodwyn_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Bloodwyn_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Bloodwyn_PICKPOCKET,Dialog_Back,DIA_Addon_Bloodwyn_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Bloodwyn_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Bloodwyn_PICKPOCKET_DoIt);
};

func void DIA_Addon_Bloodwyn_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Bloodwyn_PICKPOCKET);
};

func void DIA_Addon_Bloodwyn_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Bloodwyn_PICKPOCKET);
};


instance DIA_Addon_Bloodwyn_Dead(C_Info)
{
	npc = BDT_1085_Addon_Bloodwyn;
	nr = 2;
	condition = DIA_Addon_Bloodwyn_Dead_Condition;
	information = DIA_Addon_Bloodwyn_Dead_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Bloodwyn_Dead_Condition()
{
	if(Npc_GetDistToWP(self,"BL_RAVEN_09") <= 1000)
	{
		return TRUE;
	};
};

func void DIA_Addon_Bloodwyn_Dead_Info()
{
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Dead_04_00");	//Эй, как ты сюда попал?
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Dead_15_01");	//Через вход.
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Dead_04_02");	//Смешно... НЕНАВИЖУ шутки.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void Bloodwyn_Choices_1()
{
	Info_ClearChoices(DIA_Addon_Bloodwyn_Wait);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait,PRINT_ADDON_ENOUGHTALK,DIA_Addon_Bloodwyn_Wait_FIGHT);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait,"А я думал, я тебя прикончил.",DIA_Addon_Bloodwyn_Wait_GOOD1);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait,"Всему когда-нибудь приходит конец.",DIA_Addon_Bloodwyn_Wait_BAD1);
};

func void Bloodwyn_Choices_2()
{
	Info_ClearChoices(DIA_Addon_Bloodwyn_Wait);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait,PRINT_ADDON_ENOUGHTALK,DIA_Addon_Bloodwyn_Wait_FIGHT);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait,"А кто, по-твоему, разрушил Барьер?",DIA_Addon_Bloodwyn_Wait_GOOD2);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait,"Ты и многие другие тоже...",DIA_Addon_Bloodwyn_Wait_BAD2);
};

func void Bloodwyn_Choices_3()
{
	Info_ClearChoices(DIA_Addon_Bloodwyn_Wait);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait,PRINT_ADDON_ENOUGHTALK,DIA_Addon_Bloodwyn_Wait_FIGHT);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait,"Очевидно, у него не было времени разобраться...",DIA_Addon_Bloodwyn_Wait_GOOD3);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait,"Да, это была его самая большая ошибка...",DIA_Addon_Bloodwyn_Wait_BAD3);
};


instance DIA_Addon_Bloodwyn_Wait(C_Info)
{
	npc = BDT_1085_Addon_Bloodwyn;
	nr = 2;
	condition = DIA_Addon_Bloodwyn_Wait_Condition;
	information = DIA_Addon_Bloodwyn_Wait_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Bloodwyn_Wait_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Minecrawler_Killed >= 9))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bloodwyn_Wait_Info()
{
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Wait_04_00");	//Ты убил краулеров? Отлично. Дальше действую я. Проваливай.
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_15_01");	//Подожди минутку.
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Wait_04_02");	//Ты еще здесь?
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_15_03");	//Нам нужно кое-что выяснить.
	Info_ClearChoices(DIA_Addon_Bloodwyn_Wait);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait,PRINT_ADDON_ENOUGHTALK,DIA_Addon_Bloodwyn_Wait_FIGHT);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait,"Я ищу Ворона.",DIA_Addon_Bloodwyn_Wait_Raven);
};

func void DIA_Addon_Bloodwyn_Wait_Raven()
{
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_15_00");	//Я ищу Ворона.
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Wait_Raven_04_01");	//Так, и почему ты думаешь, что Ворон захочет говорить с тобой... погоди, ты не... Это ТЫ?
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Wait_Raven_04_02");	//Ты - тот парень, которого мы ищем все это время. Что ты здесь делаешь?! Ты же давно мертв!
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_15_03");	//Все говорят мне об этом.
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Wait_Raven_04_04");	//Эти бараны все проморгали, но от меня ты не уйдешь. На этот раз я прикончу тебя!
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_15_05");	//Как я уже сказал, ты меня не интересуешь, я ищу Ворона.
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Wait_Raven_04_06");	//Я убью тебя, я не проиграл еще ни одной схватки!
	Bloodwyn_Choices_1();
};

func void DIA_Addon_Bloodwyn_Wait_FIGHT()
{
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_FIGHT_15_00");	//Хватит трепаться. Дерись.
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Wait_Raven_FIGHT_04_01");	//(торжествующе) Все равно уже слишком поздно! Ворон уже открывает храм! Ха-ха-ха! Умри, ублюдок!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void Bloodwyn_Lach()
{
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Lach_04_00");	//ХА-ХА-ХА - я все равно убью тебя!
};

func void Bloodwyn_Wut()
{
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Wut_04_00");	//А-АХ! Ты жалкая тварь!
	self.attribute[ATR_STRENGTH] = self.attribute[ATR_STRENGTH] - 5;
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - 25;
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - 25;
};

func void Bloodwyn_Next_1()
{
	AI_Output(self,other,"DIA_Addon_Bloodwyn_SayChoice_2_04_00");	//А я пережил падение Барьера, не получив и царапины!
};

func void Bloodwyn_Next_2()
{
	AI_Output(self,other,"DIA_Addon_Bloodwyn_SayChoice_3_04_00");	//Ты не сможешь победить меня, я лучший друг Ворона! Его правая рука!
};

func void DIA_Addon_Bloodwyn_Wait_GOOD1()
{
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_GOOD1_15_00");	//А я думал, я тебя прикончил.
	Bloodwyn_Wut();
	Bloodwyn_Next_1();
	Bloodwyn_Choices_2();
};

func void DIA_Addon_Bloodwyn_Wait_BAD1()
{
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_BAD1_15_00");	//Всему когда-нибудь приходит конец.
	Bloodwyn_Lach();
	Bloodwyn_Next_1();
	Bloodwyn_Choices_2();
};

func void DIA_Addon_Bloodwyn_Wait_GOOD2()
{
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_GOOD2_15_00");	//А кто, по-твоему, разрушил Барьер?
	Bloodwyn_Wut();
	Bloodwyn_Next_2();
	Bloodwyn_Choices_3();
};

func void DIA_Addon_Bloodwyn_Wait_BAD2()
{
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_BAD2_15_00");	//Ты и многие другие тоже...
	Bloodwyn_Lach();
	Bloodwyn_Next_2();
	Bloodwyn_Choices_3();
};

func void DIA_Addon_Bloodwyn_Wait_GOOD3()
{
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_GOOD3_15_00");	//Очевидно, у него не было времени разобраться...
	Bloodwyn_Wut();
	Info_ClearChoices(DIA_Addon_Bloodwyn_Wait);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait,PRINT_ADDON_ENOUGHTALK,DIA_Addon_Bloodwyn_Wait_FIGHT);
};

func void DIA_Addon_Bloodwyn_Wait_BAD3()
{
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_BAD3_15_00");	//Да, это была его самая большая ошибка...
	Bloodwyn_Wut();
	Info_ClearChoices(DIA_Addon_Bloodwyn_Wait);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait,PRINT_ADDON_ENOUGHTALK,DIA_Addon_Bloodwyn_Wait_FIGHT);
};

