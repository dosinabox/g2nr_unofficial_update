
instance DIA_Dragomir_EXIT(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 999;
	condition = DIA_Dragomir_EXIT_Condition;
	information = DIA_Dragomir_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dragomir_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Dragomir_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Dragomir_Hello(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 1;
	condition = DIA_Dragomir_Hello_Condition;
	information = DIA_Dragomir_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dragomir_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Dragomir_Hello_Info()
{
	AI_Output(self,other,"DIA_Dragomir_Hello_12_00");	//Путешествуешь так далеко от дома?
	AI_Output(self,other,"DIA_Dragomir_Hello_12_01");	//Здесь тебе не помещает осторожность, особенно когда ты совсем один.
};


instance DIA_Dragomir_OutHere(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 2;
	condition = DIA_Dragomir_OutHere_Condition;
	information = DIA_Dragomir_OutHere_Info;
	permanent = FALSE;
	description = "Что ты делаешь здесь?";
};


func int DIA_Dragomir_OutHere_Condition()
{
	return TRUE;
};

func void DIA_Dragomir_OutHere_Info()
{
	AI_Output(other,self,"DIA_Dragomir_OutHere_15_00");	//Что ты делаешь здесь?
	AI_Output(self,other,"DIA_Dragomir_OutHere_12_01");	//Ну, ночлег в таверне слишком дорог для меня, вот почему я и живу здесь.
	AI_Output(self,other,"DIA_Dragomir_OutHere_12_02");	//Предыдущим хозяевам этого места, похоже, оно больше не понадобится.
};


instance DIA_Dragomir_Settlers(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 2;
	condition = DIA_Dragomir_Settlers_Condition;
	information = DIA_Dragomir_Settlers_Info;
	permanent = FALSE;
	description = "А кто жил в этом лагере?";
};


func int DIA_Dragomir_Settlers_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dragomir_OutHere))
	{
		return TRUE;
	};
};

func void DIA_Dragomir_Settlers_Info()
{
	AI_Output(other,self,"DIA_Dragomir_Settlers_15_00");	//А кто жил в этом лагере?
	AI_Output(self,other,"DIA_Dragomir_Settlers_12_01");	//Понятия не имею. Наверное, какие-нибудь охотники. Я полагаю, они решили, что здесь стало слишком опасно.
};


instance DIA_Dragomir_Dangerous(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 2;
	condition = DIA_Dragomir_Dangerous_Condition;
	information = DIA_Dragomir_Dangerous_Info;
	permanent = FALSE;
	description = "А разве здесь не опасно?";
};


func int DIA_Dragomir_Dangerous_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dragomir_OutHere))
	{
		return TRUE;
	};
};

func void DIA_Dragomir_Dangerous_Info()
{
	AI_Output(other,self,"DIA_Dragomir_Dangerous_15_00");	//А разве здесь не опасно?
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_01");	//Ну... Не очень, если ты можешь постоять за себя. Мой арбалет уже неоднократно спасал меня.
	AI_Output(other,self,"DIA_Dragomir_Dangerous_15_02");	//Хм. Он не такой уж большой.
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_03");	//Но смертоносный, если ты знаешь, как обращаться с ним. Да, у меня был арбалет побольше. Но, к сожалению, я потерял его.
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_04");	//Я забрел слишком далеко на север, в горы. Там находится большой каменный круг с жертвенным алтарем.
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_05");	//Пока я охотился там на падальщиков, из леса выбежали эти чертовы скелеты и напали на меня.
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_06");	//Мне пришлось бежать со всех ног.
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_07");	//А когда я бежал, арбалет выскользнул из моей руки. Я думаю, он все еще лежит там, у этого странного круга на севере.
	Log_CreateTopic(TOPIC_DragomirsArmbrust,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DragomirsArmbrust,LOG_Running);
	B_LogEntry(TOPIC_DragomirsArmbrust,"Драгомир потерял свой арбалет в странном каменном круге, находящемся высоко в северных горах.");
	MIS_DragomirsArmbrust = LOG_Running;
};


instance DIA_Dragomir_Armbrust(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 2;
	condition = DIA_Dragomir_Armbrust_Condition;
	information = DIA_Dragomir_Armbrust_Info;
	permanent = FALSE;
	description = "Вот. Я нашел твой арбалет.";
};


func int DIA_Dragomir_Armbrust_Condition()
{
	if((MIS_DragomirsArmbrust == LOG_Running) && Npc_HasItems(other,ItRw_DragomirsArmbrust_MIS))
	{
		return TRUE;
	};
};

func void DIA_Dragomir_Armbrust_Info()
{
	AI_Output(other,self,"DIA_Dragomir_Armbrust_15_00");	//Вот. Я нашел твой арбалет.
	B_GiveInvItems(other,self,ItRw_DragomirsArmbrust_MIS,1);
	AI_Output(self,other,"DIA_Dragomir_Armbrust_12_01");	//Точно, это мой арбалет. Только не говори мне, что ты ходил к этому каменному кругу?
	AI_Output(other,self,"DIA_Dragomir_Armbrust_15_02");	//А что в этом такого?
	AI_Output(self,other,"DIA_Dragomir_Armbrust_12_03");	//Это было очень безрассудно с твоей стороны. Но все равно, спасибо.
	AI_Output(self,other,"DIA_Dragomir_Armbrust_12_04");	//Естественно, я готов заплатить за эту твою услугу. Надеюсь, этого будет достаточно.
	CreateInvItems(self,ItMi_Gold,150);
	B_GiveInvItems(self,other,ItMi_Gold,150);
	MIS_DragomirsArmbrust = LOG_SUCCESS;
	B_GivePlayerXP(XP_DragomirsArmbrust);
};


var int Dragomir_TeachPlayer;
const int Dragomir_TeachingCost = 150;

instance DIA_Dragomir_Learn(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 2;
	condition = DIA_Dragomir_Learn_Condition;
	information = DIA_Dragomir_Learn_Info;
	permanent = TRUE;
	description = "Ты можешь научить меня чему-нибудь?";
};


func int DIA_Dragomir_Learn_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dragomir_Dangerous) && (Dragomir_TeachPlayer == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Dragomir_Learn_Info()
{
	AI_Output(other,self,"DIA_Dragomir_Learn_15_00");	//Ты можешь научить меня чему-нибудь?
	if(other.attribute[ATR_DEXTERITY] < 30)
	{
		AI_Output(self,other,"DIA_Dragomir_Learn_12_01");	//Прежде, чем я смогу научить тебя чему-нибудь, ты должен повысить свою ловкость.
	}
	else
	{
		AI_Output(self,other,"DIA_Dragomir_Learn_12_02");	//Если ты можешь заплатить. Как я уже говорил, я сейчас немного стеснен в средствах.
		AI_Output(other,self,"DIA_Dragomir_Learn_15_03");	//Сколько ты хочешь?
		B_Say_Gold(self,other,Dragomir_TeachingCost);
		Info_ClearChoices(DIA_Dragomir_Learn);
		Info_AddChoice(DIA_Dragomir_Learn,"Может быть, позже.",DIA_Dragomir_Learn_Later);
		if(Npc_HasItems(other,ItMi_Gold) >= Dragomir_TeachingCost)
		{
			Info_AddChoice(DIA_Dragomir_Learn,"Вот твое золото.",DIA_Dragomir_Learn_Here);
		};
	};
};

func void DIA_Dragomir_Learn_Later()
{
	AI_Output(other,self,"DIA_Dragomir_Learn_Later_15_00");	//Возможно, позже.
	Info_ClearChoices(DIA_Dragomir_Learn);
};

func void DIA_Dragomir_Learn_Here()
{
	AI_Output(other,self,"DIA_Dragomir_Learn_Here_15_00");	//Вот твое золото.
	B_GiveInvItems(other,self,ItMi_Gold,Dragomir_TeachingCost);
	AI_Output(self,other,"DIA_Dragomir_Learn_Here_12_01");	//Хорошо, мы можем начать хоть сейчас.
	Dragomir_TeachPlayer = TRUE;
	Info_ClearChoices(DIA_Dragomir_Learn);
};


var int DIA_Dragomir_Teach_permanent;

instance DIA_Dragomir_Teach(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 2;
	condition = DIA_Dragomir_Teach_Condition;
	information = DIA_Dragomir_Teach_Info;
	permanent = TRUE;
	description = "Научи меня чему-нибудь.";
};


func int DIA_Dragomir_Teach_Condition()
{
	if((Dragomir_TeachPlayer == TRUE) && (DIA_Dragomir_Teach_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Dragomir_Teach_Info()
{
	AI_Output(other,self,"DIA_Dragomir_Teach_15_00");	//Научи меня чему-нибудь.
	Info_ClearChoices(DIA_Dragomir_Teach);
	Info_AddChoice(DIA_Dragomir_Teach,Dialog_Back,DIA_Dragomir_Teach_Back);
	Info_AddChoice(DIA_Dragomir_Teach,B_BuildLearnString(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Dragomir_Teach_1H_1);
	Info_AddChoice(DIA_Dragomir_Teach,B_BuildLearnString(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1) * 5),DIA_Dragomir_Teach_1H_5);
};

func void DIA_Dragomir_Teach_Back()
{
	if(other.HitChance[NPC_TALENT_CROSSBOW] >= 75)
	{
		AI_Output(self,other,"DIA_Dragomir_Teach_12_00");	//Я больше ничему не могу научить тебя. Тебе стоит поискать другого учителя.
		DIA_Dragomir_Teach_permanent = TRUE;
	};
	Info_ClearChoices(DIA_Dragomir_Teach);
};

func void DIA_Dragomir_Teach_1H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,1,75);
	Info_ClearChoices(DIA_Dragomir_Teach);
	Info_AddChoice(DIA_Dragomir_Teach,Dialog_Back,DIA_Dragomir_Teach_Back);
	Info_AddChoice(DIA_Dragomir_Teach,B_BuildLearnString(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Dragomir_Teach_1H_1);
	Info_AddChoice(DIA_Dragomir_Teach,B_BuildLearnString(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1) * 5),DIA_Dragomir_Teach_1H_5);
};

func void DIA_Dragomir_Teach_1H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,5,75);
	Info_ClearChoices(DIA_Dragomir_Teach);
	Info_AddChoice(DIA_Dragomir_Teach,Dialog_Back,DIA_Dragomir_Teach_Back);
	Info_AddChoice(DIA_Dragomir_Teach,B_BuildLearnString(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Dragomir_Teach_1H_1);
	Info_AddChoice(DIA_Dragomir_Teach,B_BuildLearnString(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1) * 5),DIA_Dragomir_Teach_1H_5);
};


instance DIA_Dragomir_PICKPOCKET(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 900;
	condition = DIA_Dragomir_PICKPOCKET_Condition;
	information = DIA_Dragomir_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Dragomir_PICKPOCKET_Condition()
{
	return C_Beklauen(47,70);
};

func void DIA_Dragomir_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Dragomir_PICKPOCKET);
	Info_AddChoice(DIA_Dragomir_PICKPOCKET,Dialog_Back,DIA_Dragomir_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Dragomir_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Dragomir_PICKPOCKET_DoIt);
};

func void DIA_Dragomir_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Dragomir_PICKPOCKET);
};

func void DIA_Dragomir_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Dragomir_PICKPOCKET);
};

