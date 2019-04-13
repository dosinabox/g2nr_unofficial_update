
instance DIA_GornOW_EXIT(C_Info)
{
	npc = PC_Fighter_OW;
	nr = 999;
	condition = DIA_GornOW_EXIT_Condition;
	information = DIA_GornOW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_GornOW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_GornOW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GornOW_Hello(C_Info)
{
	npc = PC_Fighter_OW;
	nr = 2;
	condition = DIA_GornOW_Hello_Condition;
	information = DIA_GornOW_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_GornOW_Hello_Condition()
{
	return TRUE;
};

func void DIA_GornOW_Hello_Info()
{
	var C_Npc Milten;
	Milten = Hlp_GetNpc(PC_Mage_OW);
	AI_Output(other,self,"DIA_GornOW_Hello_15_00");	//Хватит бездельничать здесь - ты свободен!
	AI_Output(self,other,"DIA_GornOW_Hello_12_01");	//Да уж. Давно пора было вытащить меня отсюда.
	AI_Output(self,other,"DIA_GornOW_Hello_12_02");	//Но я совсем не ожидал, что это будешь ты, впрочем. Я чертовски рад видеть тебя.
	AI_Output(other,self,"DIA_GornOW_Hello_15_03");	//(ухмыляется) Гаронд говорит, что ты ешь слишком много и он больше не может себе позволить кормить тебя.
	AI_Output(self,other,"DIA_GornOW_Hello_12_04");	//Раз уж ты упомянул об этом, я бы не отказался от пары кружек пива. Но нужно выбираться отсюда. Эта камера мне уже порядком надоела.
	if(other.guild == GIL_SLD)
	{
		AI_Output(self,other,"DIA_GornOW_Add_12_00");	//Подожди, у меня есть кое-что, что могло бы пригодиться тебе.
		AI_Output(self,other,"DIA_GornOW_Add_12_01");	//Я нашел эти доспехи здесь, в камере. Наверное, их спрятал какой-то заключенный.
		B_GiveInvItems(self,other,itar_sld_M,1);
		AI_Output(self,other,"DIA_GornOW_Add_12_02");	//Для меня они слишком малы, но тебе могут подойти ...
		AI_Output(other,self,"DIA_GornOW_Add_15_03");	//Спасибо! Увидимся у Милтена ...
	}
	else
	{
		AI_Output(other,self,"DIA_GornOW_Hello_15_05");	//Ладно, увидимся у Милтена.
	};
	AI_Output(self,other,"DIA_GornOW_Hello_12_06");	//Конечно.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FREE");
	B_StartOtherRoutine(Milten,"GORNFREE");
	MIS_RescueGorn = LOG_SUCCESS;
	B_GivePlayerXP(XP_RescueGorn);
};


instance DIA_GornOW_MetMilten(C_Info)
{
	npc = PC_Fighter_OW;
	nr = 2;
	condition = DIA_GornOW_MetMilten_Condition;
	information = DIA_GornOW_MetMilten_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_GornOW_MetMilten_Condition()
{
	if((MIS_RescueGorn == LOG_SUCCESS) && (Npc_GetDistToWP(self,"OC_MAGE_LIBRARY_IN") <= 500) && Npc_IsInState(self,ZS_Talk) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_GornOW_MetMilten_Info()
{
	AI_Output(self,other,"DIA_GornOW_MetMilten_12_00");	//Послушай - мне здесь уже порядком надоело. Я думаю, нужно выбираться из этой долины.
	AI_Output(self,other,"DIA_GornOW_MetMilten_12_01");	//Как ты прошел через проход?
	AI_Output(other,self,"DIA_GornOW_MetMilten_15_02");	//Там есть путь через заброшенную шахту.
	AI_Output(self,other,"DIA_GornOW_MetMilten_12_03");	//Хорошо. Я выжду нужный момент и уберусь отсюда.
	if(other.guild != GIL_SLD)
	{
		AI_Output(other,self,"DIA_GornOW_MetMilten_15_04");	//А куда ты пойдешь?
		AI_Output(self,other,"DIA_GornOW_MetMilten_12_05");	//Я слышал, Ли еще жив. Я хочу опять присоединиться к нему.
	}
	else
	{
		AI_Output(other,self,"DIA_GornOW_MetMilten_15_06");	//Тогда иди на ферму Онара. Ли и его парни сейчас там. Ему всегда нужны парни вроде тебя.
		AI_Output(self,other,"DIA_GornOW_MetMilten_12_07");	//Так и сделаю. Схожу, проверю, как они там.
	};
};


instance DIA_GornOW_SeeYou(C_Info)
{
	npc = PC_Fighter_OW;
	nr = 900;
	condition = DIA_GornOW_SeeYou_Condition;
	information = DIA_GornOW_Seeyou_Info;
	permanent = TRUE;
	description = "Еще увидимся.";
};


func int DIA_GornOW_SeeYou_Condition()
{
	if(Npc_KnowsInfo(other,DIA_GornOW_MetMilten) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_GornOW_Seeyou_Info()
{
	AI_Output(other,self,"DIA_GornOW_SeeYou_15_00");	//Еще увидимся.
	AI_Output(self,other,"DIA_GornOW_SeeYou_12_01");	//Это точно.
	AI_StopProcessInfos(self);
};

