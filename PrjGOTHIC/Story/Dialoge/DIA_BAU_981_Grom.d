
instance DIA_Grom_EXIT(C_Info)
{
	npc = BAU_981_Grom;
	nr = 999;
	condition = DIA_Grom_EXIT_Condition;
	information = DIA_Grom_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Grom_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Grom_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Grom_HALLO(C_Info)
{
	npc = BAU_981_Grom;
	nr = 3;
	condition = DIA_Grom_HALLO_Condition;
	information = DIA_Grom_HALLO_Info;
	description = "Все в порядке?";
};


func int DIA_Grom_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Grom_HALLO_Info()
{
	AI_Output(other,self,"DIA_Grom_HALLO_15_00");	//Все в порядке?
	AI_Output(self,other,"DIA_Grom_HALLO_08_01");	//Ах, незнакомый странник. Я очень занят. Что ты хочешь?
//	Info_ClearChoices(DIA_Grom_HALLO);
//	Info_AddChoice(DIA_Grom_HALLO,"На что интересное стоит обратить внимание здесь?",DIA_Grom_HALLO_waszusehen);
//	Info_AddChoice(DIA_Grom_HALLO,"Чем ты занимаешься здесь?",DIA_Grom_HALLO_was);
};

/*func void DIA_Grom_HALLO_waszusehen()
{
	AI_Output(other,self,"DIA_Grom_HALLO_waszusehen_15_00");	//На что интересное стоит обратить внимание здесь?
	AI_Output(self,other,"DIA_Grom_HALLO_waszusehen_08_01");	//Интересное - это хорошо сказано. Если ты углубишься в здешний лес, то наткнешься на очень злобных парней.
	AI_Output(self,other,"DIA_Grom_HALLO_waszusehen_08_02");	//Они около десяти футов высотой, волосатые и в очень дурном расположении духа. Так что лучше не ходи туда, если не считаешь, что достаточно силен.
};

func void DIA_Grom_HALLO_was()
{
	AI_Output(other,self,"DIA_Grom_HALLO_was_15_00");	//Чем ты занимаешься здесь?
	AI_Output(self,other,"DIA_Grom_HALLO_was_08_01");	//Ну, чем обычно занимаются дровосеки и охотники?
	Info_AddChoice(DIA_Grom_HALLO,Dialog_Back,DIA_Grom_HALLO_BACK);
};

func void DIA_Grom_HALLO_BACK()
{
	Info_ClearChoices(DIA_Grom_HALLO);
};
*/
instance DIA_Grom_HALLO2(C_Info)
{
	npc = BAU_981_Grom;
	nr = 4;
	condition = DIA_Grom_HALLO2_Condition;
	information = DIA_Grom_HALLO2_Info;
	description = "Чем ты занимаешься здесь?";
};


func int DIA_Grom_HALLO2_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Grom_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Grom_HALLO2_Info()
{
	AI_Output(other,self,"DIA_Grom_HALLO_was_15_00");	//Чем ты занимаешься здесь?
	AI_Output(self,other,"DIA_Grom_HALLO_was_08_01");	//Ну, чем обычно занимаются дровосеки и охотники?
};

instance DIA_Grom_HALLO3(C_Info)
{
	npc = BAU_981_Grom;
	nr = 11;
	condition = DIA_Grom_HALLO3_Condition;
	information = DIA_Grom_HALLO3_Info;
	description = "На что интересное стоит обратить внимание здесь?";
};


func int DIA_Grom_HALLO3_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Grom_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Grom_HALLO3_Info()
{
	AI_Output(other,self,"DIA_Grom_HALLO_waszusehen_15_00");	//На что интересное стоит обратить внимание здесь?
	AI_Output(self,other,"DIA_Grom_HALLO_waszusehen_08_01");	//Интересное - это хорошо сказано. Если ты углубишься в здешний лес, то наткнешься на очень злобных парней.
	AI_Output(self,other,"DIA_Grom_HALLO_waszusehen_08_02");	//Они около десяти футов высотой, волосатые и в очень дурном расположении духа. Так что лучше не ходи туда, если не считаешь, что достаточно силен.
};

instance DIA_Grom_AskTeacher(C_Info)
{
	npc = BAU_981_Grom;
	nr = 10;
	condition = DIA_Grom_AskTeacher_Condition;
	information = DIA_Grom_AskTeacher_Info;
	description = "Ты можешь научить меня охотиться?";
};


func int DIA_Grom_AskTeacher_Condition()
{
//	if(Npc_KnowsInfo(other,DIA_Grom_HALLO))
	if(Npc_KnowsInfo(other,DIA_Grom_HALLO2))
	{
		return TRUE;
	};
};

func void DIA_Grom_AskTeacher_Info()
{
	AI_Output(other,self,"DIA_Grom_AskTeacher_15_00");	//Ты можешь научить меня охотиться?
	AI_Output(self,other,"DIA_Grom_AskTeacher_08_01");	//Конечно. Но сначала принеси мне приличной еды. Я умираю от голода.
	AI_Output(self,other,"DIA_Grom_AskTeacher_08_02");	//Я хочу бутыль молока, буханку хлеба и жирный окорок. И тогда я научу тебя всему, что сам знаю.
	Log_CreateTopic(TOPIC_GromAskTeacher,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GromAskTeacher,LOG_Running);
	B_LogEntry(TOPIC_GromAskTeacher,"Охотник Гром научит меня всему, что знает, если я принесу ему бутылку молока, буханку хлеба и окорок.");
};


instance DIA_Grom_PayTeacher(C_Info)
{
	npc = BAU_981_Grom;
	nr = 11;
	condition = DIA_Grom_PayTeacher_Condition;
	information = DIA_Grom_PayTeacher_Info;
	description = "Вот еда, как ты просил.";
};


func int DIA_Grom_PayTeacher_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Grom_AskTeacher) && Npc_HasItems(other,ItFo_Milk) && Npc_HasItems(other,ItFo_Bread) && Npc_HasItems(other,ItFo_Bacon))
	{
		return TRUE;
	};
};

func void DIA_Grom_PayTeacher_Info()
{
	AI_Output(other,self,"DIA_Grom_PayTeacher_15_00");	//Вот еда, как ты просил.
	Npc_RemoveInvItem(other,ItFo_Milk);
	Npc_RemoveInvItem(other,ItFo_Bread);
	Npc_RemoveInvItem(other,ItFo_Bacon);
	CreateInvItem(self,ItFo_Milk);
	CreateInvItem(self,ItFo_Bread);
	CreateInvItem(self,ItFo_Bacon);
	AI_PrintScreen("Молоко отдано",-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
	AI_PrintScreen("Хлеб отдано",-1,40,FONT_ScreenSmall,2);
	AI_PrintScreen("Окорок отдано",-1,43,FONT_ScreenSmall,2);
	AI_Output(self,other,"DIA_Grom_PayTeacher_08_01");	//Фантастика. И что теперь?
	Grom_TeachAnimalTrophy = TRUE;
	B_GivePlayerXP(XP_Ambient);
	Log_CreateTopic(TOPIC_OutTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_OutTeacher,"Гром может обучить меня добывать трофеи животных.");
};


instance DIA_Grom_TEACHHUNTING(C_Info)
{
	npc = BAU_981_Grom;
	nr = 12;
	condition = DIA_Grom_TEACHHUNTING_Condition;
	information = DIA_Grom_TEACHHUNTING_Info;
	permanent = TRUE;
	description = "Научи меня охотиться.";
};


func int DIA_Grom_TEACHHUNTING_Condition()
{
	if(Grom_TeachAnimalTrophy == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Grom_TEACHHUNTING_Info()
{
	AI_Output(other,self,"DIA_Grom_TEACHHUNTING_15_00");	//Научи меня охотиться.
	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Heart] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] == FALSE))
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_08_01");	//Что ты хочешь узнать?
		Info_AddChoice(DIA_Grom_TEACHHUNTING,Dialog_Back,DIA_Grom_TEACHHUNTING_BACK);
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
		{
			Info_AddChoice(DIA_Grom_TEACHHUNTING,B_BuildLearnString(NAME_TROPHY_Fur,B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALFUR,TROPHY_Fur)),DIA_Grom_TEACHHUNTING_Fur);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE)
		{
			Info_AddChoice(DIA_Grom_TEACHHUNTING,B_BuildLearnString(NAME_TROPHY_Teeth,B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Teeth)),DIA_Grom_TEACHHUNTING_Teeth);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Heart] == FALSE)
		{
			Info_AddChoice(DIA_Grom_TEACHHUNTING,B_BuildLearnString(NAME_TROPHY_Heart,B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Heart)),DIA_Grom_TEACHHUNTING_Heart);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] == FALSE)
		{
			Info_AddChoice(DIA_Grom_TEACHHUNTING,B_BuildLearnString(NAME_TROPHY_Mandibles,B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Mandibles)),DIA_Grom_TEACHHUNTING_Mandibles);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] == FALSE)
		{
			Info_AddChoice(DIA_Grom_TEACHHUNTING,B_BuildLearnString(NAME_TROPHY_ShadowHorn,B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_ShadowHorn)),DIA_Grom_TEACHHUNTING_ShadowHorn);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_08_02");	//Мне нечему учить тебя. Ты и так уже все знаешь.
	};
};

func void DIA_Grom_TEACHHUNTING_BACK()
{
	Info_ClearChoices(DIA_Grom_TEACHHUNTING);
};

func void DIA_Grom_TEACHHUNTING_Fur()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Fur))
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_Fur_08_00");	//Сделай разрез вдоль ноги животного, чтобы ты смог снять с него шкуру. Снимай ее с зада наперед, а не наоборот.
	};
	Info_ClearChoices(DIA_Grom_TEACHHUNTING);
};

func void DIA_Grom_TEACHHUNTING_Teeth()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Teeth))
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_Teeth_08_00");	//Челюсть животного нужно вынимать осторожно, чтобы не разломить ее, когда она отделяется от черепа.
	};
	Info_ClearChoices(DIA_Grom_TEACHHUNTING);
};

func void DIA_Grom_TEACHHUNTING_Heart()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Heart))
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_Heart_08_00");	//Ты можешь вырезать сердце животного, сделав глубокий разрез в его грудной клетке. Но обычно это имеет смысл только в случае особых животных или магических существ.
	};
	Info_ClearChoices(DIA_Grom_TEACHHUNTING);
};

func void DIA_Grom_TEACHHUNTING_Mandibles()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Mandibles))
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_Mandibles_08_00");	//Мандибулы краулера или полевого хищника нужно отделять при помощи очень прочного металлического рычага. Они очень глубоко сидят в черепе этих животных.
	};
	Info_ClearChoices(DIA_Grom_TEACHHUNTING);
};

func void DIA_Grom_TEACHHUNTING_ShadowHorn()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_ShadowHorn))
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_ShadowHorn_08_00");	//Чтобы отделить рог мракориса, надави на него всем своим весом, подрезая при этом основание острым ножом.
	};
	Info_ClearChoices(DIA_Grom_TEACHHUNTING);
};

