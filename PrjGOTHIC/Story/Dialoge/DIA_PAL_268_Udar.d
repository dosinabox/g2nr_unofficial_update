
instance DIA_Udar_EXIT(C_Info)
{
	npc = PAL_268_Udar;
	nr = 999;
	condition = DIA_Udar_EXIT_Condition;
	information = DIA_Udar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Udar_EXIT_Condition()
{
	if(Kapitel < 4)
	{
		return TRUE;
	};
};

func void DIA_Udar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Udar_Hello(C_Info)
{
	npc = PAL_268_Udar;
	nr = 2;
	condition = DIA_Udar_Hello_Condition;
	information = DIA_Udar_Hello_Info;
	important = TRUE;
};


func int DIA_Udar_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE) && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DIA_Udar_Hello_Info()
{
	AI_Output(self,other,"DIA_Udar_Hello_09_00");	//Тебе крупно повезло, когда ты пробирался сюда. Я чуть не застрелил тебя.
	AI_Output(other,self,"DIA_Udar_Hello_15_01");	//Тогда, наверное, я должен радоваться, что у тебя такой острый глаз.
	AI_Output(self,other,"DIA_Udar_Hello_09_02");	//Не стоит трепаться попусту. Поговори с Сенгратом, если тебе что-нибудь нужно.
	AI_StopProcessInfos(self);
};


instance DIA_Udar_YouAreBest(C_Info)
{
	npc = PAL_268_Udar;
	nr = 3;
	condition = DIA_Udar_YouAreBest_Condition;
	information = DIA_Udar_YouAreBest_Info;
	permanent = FALSE;
	description = "Я слышал, что ты ЛУЧШИЙ арбалетчик ...";
};


func int DIA_Udar_YouAreBest_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Keroloth_Udar))
	{
		return 1;
	};
};

func void DIA_Udar_YouAreBest_Info()
{
	AI_Output(other,self,"DIA_Udar_YouAreBest_15_00");	//Я слышал, что ты ЛУЧШИЙ арбалетчик во всей округе.
	AI_Output(self,other,"DIA_Udar_YouAreBest_09_01");	//Ну, если так говорят, возможно, это правда. Что тебе нужно?
};


instance DIA_Udar_TeachMe(C_Info)
{
	npc = PAL_268_Udar;
	nr = 3;
	condition = DIA_Udar_TeachMe_Condition;
	information = DIA_Udar_TeachME_Info;
	permanent = FALSE;
	description = "Научи меня стрелять из арбалета.";
};


func int DIA_Udar_TeachMe_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Udar_YouAreBest) && (Udar_TeachPlayer != TRUE))
	{
		return 1;
	};
};

func void DIA_Udar_TeachME_Info()
{
	AI_Output(other,self,"DIA_Udar_Teacher_15_00");	//Научи меня стрелять из арбалета.
	AI_Output(self,other,"DIA_Udar_Teacher_09_01");	//Убирайся! Вокруг замка бегает достаточно мишеней, на которых можно потренироваться.
};


instance DIA_Udar_ImGood(C_Info)
{
	npc = PAL_268_Udar;
	nr = 3;
	condition = DIA_Udar_ImGood_Condition;
	information = DIA_Udar_ImGood_Info;
	permanent = FALSE;
	description = "Самый великий арбалетчик - я.";
};


func int DIA_Udar_ImGood_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Udar_YouAreBest))
	{
		return 1;
	};
};

func void DIA_Udar_ImGood_Info()
{
	AI_Output(other,self,"DIA_Udar_ImGood_15_00");	//Самый великий арбалетчик - я.
	AI_Output(self,other,"DIA_Udar_ImGood_09_01");	//(смеется) Да, ты прав!
	AI_Output(self,other,"DIA_Udar_ImGood_09_02");	//Что ж, если ты хочешь поучиться, я могу помочь.
	Udar_TeachPlayer = TRUE;
	B_LogEntry(TOPIC_Teacher_OC,"Удар может обучить меня искусству стрельбы из арбалета.");
};


instance DIA_Udar_Teach(C_Info)
{
	npc = PAL_268_Udar;
	nr = 3;
	condition = DIA_Udar_Teach_Condition;
	information = DIA_Udar_Teach_Info;
	permanent = TRUE;
	description = "Я хочу поучиться у тебя.";
};


func int DIA_Udar_Teach_Condition()
{
	if(Udar_TeachPlayer == TRUE)
	{
		return 1;
	};
};

func void DIA_Udar_Teach_Info()
{
	AI_Output(other,self,"DIA_Udar_Teach_15_00");	//Я хочу поучиться у тебя.
	AI_Output(self,other,"DIA_Udar_Teach_09_01");	//Ладно, давай!
	Info_ClearChoices(DIA_Udar_Teach);
	Info_AddChoice(DIA_Udar_Teach,Dialog_Back,DIA_Udar_Teach_Back);
	Info_AddChoice(DIA_Udar_Teach,B_BuildLearnString(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Udar_Teach_CROSSBOW_1);
	Info_AddChoice(DIA_Udar_Teach,B_BuildLearnString(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Udar_Teach_CROSSBOW_5);
};

func void DIA_Udar_Teach_Back()
{
	Info_ClearChoices(DIA_Udar_Teach);
};

func void B_Udar_TeachNoMore1()
{
	AI_Output(self,other,"B_Udar_TeachNoMore1_09_00");	//Ты уже знаешь основы - на большее у нас нет времени.
};

func void B_Udar_TeachNoMore2()
{
	AI_Output(self,other,"B_Udar_TeachNoMore2_09_00");	//Чтобы улучшить владение этим оружием, тебе лучше поискать более подходящего учителя.
};

func void DIA_Udar_Teach_CROSSBOW_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,1,60);
	if(other.HitChance[NPC_TALENT_CROSSBOW] >= 60)
	{
		B_Udar_TeachNoMore1();
		if(Npc_GetTalentSkill(other,NPC_TALENT_CROSSBOW) == 1)
		{
			B_Udar_TeachNoMore2();
		};
	};
	Info_AddChoice(DIA_Udar_Teach,B_BuildLearnString(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Udar_Teach_CROSSBOW_1);
};

func void DIA_Udar_Teach_CROSSBOW_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,5,60);
	if(other.HitChance[NPC_TALENT_CROSSBOW] >= 60)
	{
		B_Udar_TeachNoMore1();
		if(Npc_GetTalentSkill(other,NPC_TALENT_CROSSBOW) == 1)
		{
			B_Udar_TeachNoMore2();
		};
	};
	Info_AddChoice(DIA_Udar_Teach,B_BuildLearnString(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Udar_Teach_CROSSBOW_5);
};


instance DIA_Udar_Perm(C_Info)
{
	npc = PAL_268_Udar;
	nr = 11;
	condition = DIA_Udar_Perm_Condition;
	information = DIA_Udar_Perm_Info;
	permanent = FALSE;
	description = "Как дела в замке?";
};


func int DIA_Udar_Perm_Condition()
{
	if(Kapitel <= 3)
	{
		return TRUE;
	};
};

func void DIA_Udar_Perm_Info()
{
	AI_Output(other,self,"DIA_Udar_Perm_15_00");	//Как дела в замке?
	AI_Output(self,other,"DIA_Udar_Perm_09_01");	//Некоторые из наших парней посвящают себя тренировкам, но, в принципе, все мы просто ждем, когда что-нибудь произойдет.
	AI_Output(self,other,"DIA_Udar_Perm_09_02");	//Эта неопределенность изматывает. Такова стратегия этих чертовых орков. Они будут выжидать, пока наше терпение не лопнет.
};


instance DIA_Udar_Ring(C_Info)
{
	npc = PAL_268_Udar;
	nr = 11;
	condition = DIA_Udar_Ring_Condition;
	information = DIA_Udar_Ring_Info;
	permanent = FALSE;
	description = "Вот, я принес тебе кольцо Тенгрона ...";
};


func int DIA_Udar_Ring_Condition()
{
	if(Npc_HasItems(other,ItRi_Tengron) >= 1)
	{
		return TRUE;
	};
};

func void DIA_Udar_Ring_Info()
{
	AI_Output(other,self,"DIA_Udar_Ring_15_00");	//Вот, я принес тебе кольцо Тенгрона. Оно будет защищать тебя. Тенгрон говорит, что он когда-нибудь вернется и заберет это кольцо назад.
	AI_Output(self,other,"DIA_Udar_Ring_09_01");	//Что? Да ты знаешь, что это за кольцо? Он получил эту награду за мужество, проявленное в бою.
	AI_Output(self,other,"DIA_Udar_Ring_09_02");	//Говоришь, что он хочет забрать его назад? Если такова воля Инноса, так и будет. Если такова воля Инноса...
	B_GiveInvItems(other,self,ItRi_Tengron,1);
	TengronRing = TRUE;
	B_GivePlayerXP(XP_TengronRing);
};


instance DIA_Udar_KAP4_EXIT(C_Info)
{
	npc = PAL_268_Udar;
	nr = 999;
	condition = DIA_Udar_KAP4_EXIT_Condition;
	information = DIA_Udar_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Udar_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Udar_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Udar_Kap4WiederDa(C_Info)
{
	npc = PAL_268_Udar;
	nr = 40;
	condition = DIA_Udar_Kap4WiederDa_Condition;
	information = DIA_Udar_Kap4WiederDa_Info;
	important = TRUE;
};


func int DIA_Udar_Kap4WiederDa_Condition()
{
	if(Kapitel >= 4)
	{
		return TRUE;
	};
};

func void DIA_Udar_Kap4WiederDa_Info()
{
	AI_Output(self,other,"DIA_Udar_Kap4WiederDa_09_00");	//Хорошо, что ты пришел. Здесь творится сущий ад.
	if(hero.guild != GIL_DJG)
	{
		AI_Output(other,self,"DIA_Udar_Kap4WiederDa_15_01");	//Что случилось?
		AI_Output(self,other,"DIA_Udar_Kap4WiederDa_09_02");	//Охотники на драконов ошиваются по всему замку и бахвалятся, что могут решить проблему с драконами.
		AI_Output(self,other,"DIA_Udar_Kap4WiederDa_09_03");	//Но я скажу тебе - судя по тому, как они выглядят, они не в состоянии убить даже старого больного снеппера.
	};
	AI_Output(self,other,"DIA_Udar_Kap4WiederDa_09_04");	//Многие из нас уже отчаялись и уже не верят, что нам удастся выбраться отсюда живыми.
};


instance DIA_Udar_Sengrath(C_Info)
{
	npc = PAL_268_Udar;
	nr = 41;
	condition = DIA_Udar_Sengrath_Condition;
	information = DIA_Udar_Sengrath_Info;
	description = "По-моему, вы вдвоем стояли здесь на часах?";
};


func int DIA_Udar_Sengrath_Condition()
{
	if((Kapitel >= 4) && Npc_KnowsInfo(other,DIA_Udar_Kap4WiederDa) && (Sengrath_Missing == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Udar_Sengrath_Info()
{
	AI_Output(other,self,"DIA_Udar_Sengrath_15_00");	//По-моему, вы вдвоем стояли здесь на часах?
	AI_Output(self,other,"DIA_Udar_Sengrath_09_01");	//Теперь нет. Сенграт стоял у края стены и заснул.
	AI_Output(self,other,"DIA_Udar_Sengrath_09_02");	//Он выронил свой арбалет, и тот упал вниз.
	AI_Output(self,other,"DIA_Udar_Sengrath_09_03");	//Мы видели, как один из орков схватил его и растворился в темноте.
	AI_Output(self,other,"DIA_Udar_Sengrath_09_04");	//Сенграт проснулся и побежал в ночь по направлению к частоколу орков. С тех пор его никто не видел.
	AI_Output(self,other,"DIA_Udar_Sengrath_09_05");	//Да пребудет с нами Иннос!
	Log_CreateTopic(TOPIC_Sengrath_Missing,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Sengrath_Missing,LOG_Running);
	B_LogEntry(TOPIC_Sengrath_Missing,"Удар, гвардеец замка, скучает по своему приятелю Сенграту. Последний раз он видел его как-то поздно ночью, тот направлялся к забору орков, чтобы вернуть свой арбалет.");
};


instance DIA_Udar_SENGRATHGEFUNDEN(C_Info)
{
	npc = PAL_268_Udar;
	nr = 42;
	condition = DIA_Udar_SENGRATHGEFUNDEN_Condition;
	information = DIA_Udar_SENGRATHGEFUNDEN_Info;
	description = "Я нашел Сенграта.";
};


func int DIA_Udar_SENGRATHGEFUNDEN_Condition()
{
	if((Kapitel >= 4) && Npc_KnowsInfo(other,DIA_Udar_Sengrath) && Npc_HasItems(other,ItRw_SengrathsArmbrust_MIS))
	{
		return TRUE;
	};
};

func void DIA_Udar_SENGRATHGEFUNDEN_Info()
{
	AI_Output(other,self,"DIA_Udar_SENGRATHGEFUNDEN_15_00");	//Я нашел Сенграта.
	AI_Output(self,other,"DIA_Udar_SENGRATHGEFUNDEN_09_01");	//Да? И где же он?
	AI_Output(other,self,"DIA_Udar_SENGRATHGEFUNDEN_15_02");	//Он мертв. Вот его арбалет. Он был при нем.
	AI_Output(self,other,"DIA_Udar_SENGRATHGEFUNDEN_09_03");	//Должно быть, он смог вернуть свой арбалет, но орки все же прикончили его.
	AI_Output(self,other,"DIA_Udar_SENGRATHGEFUNDEN_09_04");	//Чертов дурак. Я знал, что так будет. Мы все тут погибнем.
	TOPIC_END_Sengrath_Missing = TRUE;
	B_GivePlayerXP(XP_SengrathFound);
};


instance DIA_Udar_BADFEELING(C_Info)
{
	npc = PAL_268_Udar;
	nr = 50;
	condition = DIA_Udar_BADFEELING_Condition;
	information = DIA_Udar_BADFEELING_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Udar_BADFEELING_Condition()
{
	if((Npc_RefuseTalk(self) == FALSE) && Npc_IsInState(self,ZS_Talk) && Npc_KnowsInfo(other,DIA_Udar_SENGRATHGEFUNDEN) && (Kapitel >= 4))
	{
		return TRUE;
	};
};

func void DIA_Udar_BADFEELING_Info()
{
	if(MIS_OCGateOpen == TRUE)
	{
		AI_Output(self,other,"DIA_Udar_BADFEELING_09_00");	//Еще одна такая неподготовленная атака и нам конец.
	}
	else if(MIS_AllDragonsDead == TRUE)
	{
		AI_Output(self,other,"DIA_Udar_BADFEELING_09_01");	//Орки очень нервничают. Что-то очень напугало их. Я чувствую это.
	}
	else
	{
		AI_Output(self,other,"DIA_Udar_BADFEELING_09_02");	//Мне очень не нравится все это.
	};
	Npc_SetRefuseTalk(self,30);
};


instance DIA_Udar_KAP5_EXIT(C_Info)
{
	npc = PAL_268_Udar;
	nr = 999;
	condition = DIA_Udar_KAP5_EXIT_Condition;
	information = DIA_Udar_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Udar_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Udar_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Udar_KAP6_EXIT(C_Info)
{
	npc = PAL_268_Udar;
	nr = 999;
	condition = DIA_Udar_KAP6_EXIT_Condition;
	information = DIA_Udar_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Udar_KAP6_EXIT_Condition()
{
	if(Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Udar_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Udar_PICKPOCKET(C_Info)
{
	npc = PAL_268_Udar;
	nr = 900;
	condition = DIA_Udar_PICKPOCKET_Condition;
	information = DIA_Udar_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Udar_PICKPOCKET_Condition()
{
	return C_Beklauen(20,15);
};

func void DIA_Udar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Udar_PICKPOCKET);
	Info_AddChoice(DIA_Udar_PICKPOCKET,Dialog_Back,DIA_Udar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Udar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Udar_PICKPOCKET_DoIt);
};

func void DIA_Udar_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Udar_PICKPOCKET);
};

func void DIA_Udar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Udar_PICKPOCKET);
};

