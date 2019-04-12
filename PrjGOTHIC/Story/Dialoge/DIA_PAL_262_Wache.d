
instance DIA_PAL_262_EXIT(C_Info)
{
	npc = PAL_262_Wache;
	nr = 999;
	condition = DIA_PAL_262_EXIT_Condition;
	information = DIA_PAL_262_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_PAL_262_EXIT_Condition()
{
	return TRUE;
};

func void DIA_PAL_262_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_262_GREET(C_Info)
{
	npc = PAL_262_Wache;
	nr = 2;
	condition = DIA_PAL_262_GREET_Condition;
	information = DIA_PAL_262_GREET_Info;
	important = TRUE;
};


func int DIA_PAL_262_GREET_Condition()
{
	return TRUE;
};

func void DIA_PAL_262_GREET_Info()
{
	AI_Output(self,other,"DIA_PAL_262_GREET_10_00");	//Стой - ты кто такой?
	AI_Output(other,self,"DIA_PAL_262_GREET_15_01");	//Вопрос не в том, кто я такой, а откуда я пришел. А пришел я через Проход.
	AI_Output(other,self,"DIA_PAL_262_GREET_15_02");	//Ты все еще хочешь остановить меня, или, может, я все же пройду?
	AI_Output(self,other,"DIA_PAL_262_GREET_10_03");	//Ну, откуда же я мог знать? Конечно же, ты можешь пройти.
	AI_StopProcessInfos(self);
};


instance DIA_Wache_PERM(C_Info)
{
	npc = PAL_262_Wache;
	nr = 3;
	condition = DIA_Wache_PERM_Condition;
	information = DIA_Wache_PERM_Info;
	permanent = TRUE;
	description = "Кто командует здесь?";
};


func int DIA_Wache_PERM_Condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_262_greet))
	{
		return TRUE;
	};
};

func void DIA_Wache_PERM_Info()
{
	AI_Output(other,self,"DIA_Addon_Wache_PERM_15_00");	//Кто здесь главный?
	AI_Output(self,other,"DIA_Addon_Wache_PERM_10_01");	//Наш командир Гаронд и два его советника - Орик и Парсиваль.
	AI_Output(self,other,"DIA_Addon_Wache_PERM_10_02");	//Проходи внутрь. В дневное время ты можешь найти их в тронном зале на первом этаже.
};

