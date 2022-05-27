
instance DIA_Niclas_EXIT(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 999;
	condition = DIA_Niclas_EXIT_Condition;
	information = DIA_Niclas_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Niclas_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Niclas_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Niclas_Hello(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 1;
	condition = DIA_Niclas_Hello_Condition;
	information = DIA_Niclas_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Niclas_Hello_Condition()
{
	return TRUE;
};

func void DIA_Niclas_Hello_Info()
{
	AI_Output(self,other,"DIA_Niclas_Hello_03_00");	//Ты тоже сбежал?
	AI_Output(other,self,"DIA_Niclas_Hello_15_01");	//С чего ты взял это?
	AI_Output(self,other,"DIA_Niclas_Hello_03_02");	//Зачем ты зашел в такую даль один? Здесь НИЧЕГО нет.
};


instance DIA_Niclas_HaveALook(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 1;
	condition = DIA_Niclas_HaveALook_Condition;
	information = DIA_Niclas_HaveALook_Info;
	permanent = FALSE;
	description = "Я просто брожу, любуюсь природой.";
};


func int DIA_Niclas_HaveALook_Condition()
{
	return TRUE;
};

func void DIA_Niclas_HaveALook_Info()
{
	AI_Output(other,self,"DIA_Niclas_HaveALook_15_00");	//Я просто брожу, любуюсь природой.
	AI_Output(self,other,"DIA_Niclas_HaveALook_03_01");	//Хорошо, будь моим гостем. Хочешь кусок мяса?
//	CreateInvItems(self,ItFoMutton,1);
	CreateInvItems(self,ItFo_NiclasBacon,1);
	Info_ClearChoices(DIA_Niclas_HaveALook);
	Info_AddChoice(DIA_Niclas_HaveALook,"Нет, спасибо.",DIA_Niclas_HaveALook_No);
	Info_AddChoice(DIA_Niclas_HaveALook,"Да, спасибо.",DIA_Niclas_HaveALook_Yes);
};

func void DIA_Niclas_HaveALook_No()
{
	AI_Output(other,self,"DIA_Niclas_HaveALook_No_15_00");	//Нет, спасибо.
	AI_Output(self,other,"DIA_Niclas_HaveALook_No_03_01");	//Как хочешь. Надеюсь, ты не будешь против, если я поем.
//	B_UseItem(self,ItFoMutton);
	B_UseItem(self,ItFo_NiclasBacon);
	Info_ClearChoices(DIA_Niclas_HaveALook);
};

func void DIA_Niclas_HaveALook_Yes()
{
	AI_Output(other,self,"DIA_Niclas_HaveALook_Yes_15_00");	//Да, спасибо.
	AI_Output(self,other,"DIA_Niclas_HaveALook_Yes_03_01");	//Держи, вкуснейшая нога крысокрота. Приготовлена по моему собственному рецепту.
//	B_GiveInvItems(self,other,ItFoMutton,1);
	B_GiveInvItems(self,other,ItFo_NiclasBacon,1);
	Info_ClearChoices(DIA_Niclas_HaveALook);
};


instance DIA_Niclas_WhyHere(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 2;
	condition = DIA_Niclas_WhyHere_Condition;
	information = DIA_Niclas_WhyHere_Info;
	permanent = FALSE;
	description = "А ты что здесь делаешь?";
};


func int DIA_Niclas_WhyHere_Condition()
{
	return TRUE;
};

func void DIA_Niclas_WhyHere_Info()
{
	AI_Output(other,self,"DIA_Niclas_WhyHere_15_00");	//А ты что здесь делаешь?
	AI_Output(self,other,"DIA_Niclas_WhyHere_03_01");	//Здесь мне спокойнее. Я всегда чувствую себя неуютно в городе.
};


instance DIA_Niclas_ShouldntWork(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 2;
	condition = DIA_Niclas_ShouldntWork_Condition;
	information = DIA_Niclas_ShouldntWork_Info;
	permanent = FALSE;
	description = "Разве тебе не нужно работать?";
};


func int DIA_Niclas_ShouldntWork_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Niclas_WhyHere))
	{
		return TRUE;
	};
};

func void DIA_Niclas_ShouldntWork_Info()
{
	AI_Output(other,self,"DIA_Niclas_ShouldntWork_15_00");	//Разве тебе не нужно работать?
	AI_Output(self,other,"DIA_Niclas_ShouldntWork_03_01");	//Все, что мне нужно, я могу добыть сам. Я сам вырезаю стрелы, а природа снабжает меня мясом.
	AI_Output(other,self,"DIA_Niclas_ShouldntWork_15_02");	//Так ты охотник.
	AI_Output(self,other,"DIA_Niclas_ShouldntWork_03_03");	//Да, если тебе нравится это слово. Но я охочусь только для пропитания, а не чтобы заработать денег.
};


instance DIA_Niclas_CanTeachMe(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 2;
	condition = DIA_Niclas_CanTeachMe_Condition;
	information = DIA_Niclas_CanTeachMe_Info;
	permanent = FALSE;
	description = "В таком случае, я уверен, что ты можешь научить меня чему-нибудь.";
};


func int DIA_Niclas_CanTeachMe_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Niclas_ShouldntWork))
	{
		return TRUE;
	};
};

func void DIA_Niclas_CanTeachMe_Info()
{
	AI_Output(other,self,"DIA_Niclas_CanTeachMe_15_00");	//В таком случае, я уверен, что ты можешь научить меня чему-нибудь.
	AI_Output(self,other,"DIA_Niclas_CanTeachMe_03_01");	//Почему бы и нет. Я могу показать тебе, как правильно держать лук.
	Log_CreateTopic(TOPIC_OutTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_OutTeacher,"Никлас может обучить меня искусству стрельбы из лука.");
};


var int DIA_Niclas_Teacher_permanent;
var int DIA_Niclas_TeachState_Bow;

func void B_BuildLearnDialog_Niclas()
{
	if(VisibleTalentValue(NPC_TALENT_BOW) < TeachLimit_Bow_Niclas)
	{
		Info_ClearChoices(DIA_Niclas_Teach);
		Info_AddChoice(DIA_Niclas_Teach,Dialog_Back,DIA_Niclas_Teach_Back);
		Info_AddChoice(DIA_Niclas_Teach,B_BuildLearnString(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Niclas_Teach_BOW_1);
		Info_AddChoice(DIA_Niclas_Teach,B_BuildLearnString(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),DIA_Niclas_Teach_BOW_5);
	}
	else
	{
		if(RealTalentValue(NPC_TALENT_BOW) >= TeachLimit_Bow_Niclas)
		{
			DIA_Niclas_Teacher_permanent = TRUE;
		};
		PrintScreen(ConcatStrings(PRINT_NoLearnMAXReached,IntToString(TeachLimit_Bow_Niclas)),-1,53,FONT_Screen,2);
		if(DIA_Niclas_TeachState_Bow == FALSE)
		{
			AI_Output(self,other,"DIA_Niclas_Teach_03_00");	//Мне нечему больше учить тебя.
		}
		else
		{
			AI_Output(self,other,"DIA_Niclas_Teach_03_01");	//Я научил тебя всему, что мог. Теперь тебе лучше поискать другого учителя.
		};
		AI_StopProcessInfos(self);
	};
};

instance DIA_Niclas_Teach(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 2;
	condition = DIA_Niclas_Teach_Condition;
	information = DIA_Niclas_Teach_Info;
	permanent = TRUE;
	description = "Покажи мне, как правильно держать лук.";
};


func int DIA_Niclas_Teach_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Niclas_CanTeachMe) && (DIA_Niclas_Teacher_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Niclas_Teach_Info()
{
	AI_Output(other,self,"DIA_Niclas_Teach_15_00");	//Покажи мне, как правильно держать лук.
	B_BuildLearnDialog_Niclas();
};

func void DIA_Niclas_Teach_Back()
{
	Info_ClearChoices(DIA_Niclas_Teach);
};

func void DIA_Niclas_Teach_BOW_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,1,TeachLimit_Bow_Niclas))
	{
		DIA_Niclas_TeachState_Bow = TRUE;
		B_BuildLearnDialog_Niclas();
	};
};

func void DIA_Niclas_Teach_BOW_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,5,TeachLimit_Bow_Niclas))
	{
		DIA_Niclas_TeachState_Bow = TRUE;
		B_BuildLearnDialog_Niclas();
	};
};

