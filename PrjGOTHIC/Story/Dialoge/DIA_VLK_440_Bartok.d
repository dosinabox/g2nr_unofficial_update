
instance DIA_Bartok_EXIT(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 999;
	condition = DIA_Bartok_EXIT_Condition;
	information = DIA_Bartok_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bartok_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Bartok_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Bartok_PICKPOCKET(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 900;
	condition = DIA_Bartok_PICKPOCKET_Condition;
	information = DIA_Bartok_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(Украсть его колчан со стрелами будет просто)";
};


func int DIA_Bartok_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_HasItems(self,ItRw_Arrow) >= 40) && (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Bartok_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Bartok_PICKPOCKET);
	Info_AddChoice(DIA_Bartok_PICKPOCKET,Dialog_Back,DIA_Bartok_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Bartok_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Bartok_PICKPOCKET_DoIt);
};

func void DIA_Bartok_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 30)
	{
		B_GiveInvItems(self,other,ItRw_Arrow,40);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Bartok_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void DIA_Bartok_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Bartok_PICKPOCKET);
};


instance DIA_Bartok_Hallo(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 1;
	condition = DIA_Bartok_Hallo_Condition;
	information = DIA_Bartok_Hallo_Info;
	permanent = FALSE;
	description = "Как дела?";
};


func int DIA_Bartok_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Bartok_Hallo_Info()
{
	AI_Output(other,self,"DIA_Bartok_Hello_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Bartok_Hello_04_01");	//Ты ведь нездешний, да? Ничего - я тоже.
	AI_Output(other,self,"DIA_Bartok_Hello_15_02");	//А откуда ты пришел?
	AI_Output(self,other,"DIA_Bartok_Hello_04_03");	//Из леса, я там охотился на падальщиков и волков вместе с другими охотниками.
	AI_Output(self,other,"DIA_Bartok_Hello_04_04");	//Но я бросил это занятие. Настали опасные времена. Повсюду шатается всякий сброд...
};


instance DIA_Bartok_Jaeger(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 2;
	condition = DIA_Bartok_Jaeger_Condition;
	information = DIA_Bartok_Jaeger_Info;
	permanent = FALSE;
	description = "Где мне найти других охотников?";
};


func int DIA_Bartok_Jaeger_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bartok_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Bartok_Jaeger_Info()
{
	AI_Output(other,self,"DIA_Bartok_Jager_15_00");	//Где мне найти других охотников?
	AI_Output(self,other,"DIA_Bartok_Jager_04_01");	//У нас был лагерь около таверны, на полпути к ферме Онара.
	AI_Output(self,other,"DIA_Bartok_Jager_04_02");	//Но я не знаю, остался ли там кто еще.
	AI_Output(self,other,"DIA_Addon_Bartok_Jager_04_00");	//Нас в городе было двое. До недавнего времени.
	AI_Output(self,other,"DIA_Addon_Bartok_Jager_04_01");	//Со мной был мой друг Трокар, превосходный охотник.
};


instance DIA_Addon_Bartok_MissingPeople(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 5;
	condition = DIA_Addon_Bartok_MissingPeople_Condition;
	information = DIA_Addon_Bartok_MissingPeople_Info;
	description = "А где Трокар сейчас?";
};


func int DIA_Addon_Bartok_MissingPeople_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bartok_Jaeger))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bartok_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Bartok_MissingPeople_15_00");	//А где Трокар сейчас?
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_04_01");	//Это очень необычная история.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_04_02");	//Несколько дней назад мы выпивали в таверне Корагона и разговаривали об охоте.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_04_03");	//Не спрашивай меня, что было дальше. К тому времени я уже изрядно накачался.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_04_04");	//Я помню, как Трокар говорил что-то о том, что собирается добыть несколько косяков из болотной травы. С тех пор я его не видел.
	MIS_Bartok_MissingTrokar = LOG_Running;
	Info_ClearChoices(DIA_Addon_Bartok_MissingPeople);
	Info_AddChoice(DIA_Addon_Bartok_MissingPeople,"А ты не искал его?",DIA_Addon_Bartok_MissingPeople_such);
	Info_AddChoice(DIA_Addon_Bartok_MissingPeople,"А где можно найти косяк из болотной травы?",DIA_Addon_Bartok_MissingPeople_wo);
};

func void DIA_Addon_Bartok_MissingPeople_wo()
{
	AI_Output(other,self,"DIA_Addon_Bartok_MissingPeople_wo_15_00");	//А где можно найти косяк из болотной травы?
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_wo_04_01");	//Здесь, в порту. По крайней мере, мне так говорили.
};

func void DIA_Addon_Bartok_MissingPeople_such()
{
	AI_Output(other,self,"DIA_Addon_Bartok_MissingPeople_such_15_00");	//А ты не искал его?
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_such_04_01");	//Нет. Но я сообщил об этом ополчению.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_such_04_02");	//Они его пока не нашли.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_such_04_03");	//Надеюсь, его не сожрали волки или еще кто-нибудь похуже.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_such_04_04");	//Я боюсь, что однажды на охоте я найду его изуродованный труп.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_such_04_05");	//Я этого не вынесу.
};


instance DIA_Bartok_Bosper(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 3;
	condition = DIA_Bartok_Bosper_Condition;
	information = DIA_Bartok_Bosper_Info;
	permanent = FALSE;
	description = "Боспер говорит, что ты работал на него...";
};


func int DIA_Bartok_Bosper_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bosper_Bartok) && Npc_KnowsInfo(other,DIA_Bartok_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Bartok_Bosper_Info()
{
	AI_Output(other,self,"DIA_Bartok_Bosper_15_00");	//Боспер говорит, что ты работал на него...
	AI_Output(self,other,"DIA_Bartok_Bosper_04_01");	//Да, было дело. Но его интересовали только эти чертовы шкуры.
	AI_Output(self,other,"DIA_Bartok_Bosper_04_02");	//Я говорил ему, как опасно стало охотиться. Но он не хотел ничего слушать.
	AI_Output(self,other,"DIA_Bartok_Bosper_04_03");	//Правда, платил он хорошо - грех жаловаться.
	AI_Output(other,self,"DIA_Bartok_Bosper_15_04");	//Ты можешь рассказать что-нибудь о нем?
	AI_Output(self,other,"DIA_Bartok_Bosper_04_05");	//(смеется) У Боспера недавно украли лук. Прямо средь бела дня.
	AI_Output(self,other,"DIA_Bartok_Bosper_04_06");	//Кто-то вломился в его лавку, схватил лук и был таков.
	AI_Output(self,other,"DIA_Bartok_Bosper_04_07");	//Воры наглеют прямо на глазах!
	if(MIS_Bosper_Bogen != LOG_SUCCESS)
	{
		MIS_Bosper_Bogen = LOG_Running;
	};
};


instance DIA_Bartok_WannaLearn(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 4;
	condition = DIA_Bartok_WannaLearn_Condition;
	information = DIA_Bartok_WannaLearn_Info;
	permanent = FALSE;
	description = "Ты можешь научить меня охотиться?";
};


func int DIA_Bartok_WannaLearn_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bartok_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Bartok_WannaLearn_Info()
{
	AI_Output(other,self,"DIA_Bartok_WannaLearn_15_00");	//Ты можешь научить меня охотиться?
	AI_Output(self,other,"DIA_Bartok_WannaLearn_04_01");	//Я могу научить тебя красться и правильно держать лук.
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		AI_Output(self,other,"DIA_Bartok_WannaLearn_04_02");	//Если ты хочешь научиться снимать шкуры с животных - иди к Босперу. Это он научил меня.
	};
	Bartok_TeachPlayer = TRUE;
	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_CityTeacher,"Барток может обучить меня красться и стрельбе из лука.");
};


instance DIA_Bartok_TeachSneak(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 4;
	condition = DIA_Bartok_TeachSneak_Condition;
	information = DIA_Bartok_TeachSneak_Info;
	permanent = TRUE;
	description = B_BuildLearnString("Научи меня красться!",B_GetLearnCostTalent(other,NPC_TALENT_SNEAK,1));
};


func int DIA_Bartok_TeachSneak_Condition()
{
	if((Bartok_TeachPlayer == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == 0))
	{
		return TRUE;
	};
};

func void DIA_Bartok_TeachSneak_Info()
{
	AI_Output(other,self,"DIA_Bartok_TeachSneak_15_00");	//Научи меня красться!
	if(B_TeachThiefTalent(self,other,NPC_TALENT_SNEAK))
	{
		AI_Output(self,other,"DIA_Bartok_TeachSneak_04_01");	//Хорошо - сначала ты должен научиться правильно распределять свой вес.
		AI_Output(self,other,"DIA_Bartok_TeachSneak_04_02");	//Для этого согни ноги в коленях и старайся всегда опускать ногу на пятку.
		AI_Output(self,other,"DIA_Bartok_TeachSneak_04_03");	//Все нагрузка должна приходиться на опорную ногу, пока другая нога не будет твердо стоять на земле.
		AI_Output(self,other,"DIA_Bartok_TeachSneak_04_04");	//К большинству зверей невозможно подкрасться, если только они не спят. Они просто учуют тебя.
		AI_Output(self,other,"DIA_Bartok_TeachSneak_04_05");	//Так что будь внимателен при охоте.
	};
};


var int Bosper_MerkeBow;

instance DIA_Bartok_Teach(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 4;
	condition = DIA_Bartok_Teach_Condition;
	information = DIA_Bartok_Teach_Info;
	permanent = TRUE;
	description = "Я хочу научиться лучше стрелять из лука!";
};


func int DIA_Bartok_Teach_Condition()
{
	if(Bartok_TeachPlayer == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Bartok_Teach_Info()
{
	AI_Output(other,self,"DIA_Bartok_TeachBow_15_00");	//Я хочу научиться лучше стрелять из лука!
	AI_Output(self,other,"DIA_Bartok_TeachBow_04_01");	//Хорошо, посмотрим, чему я могу тебя научить...
	Bosper_MerkeBow = other.HitChance[NPC_TALENT_BOW];
	Info_ClearChoices(DIA_Bartok_Teach);
	Info_AddChoice(DIA_Bartok_Teach,Dialog_Back,DIA_Bartok_Teach_Back);
	Info_AddChoice(DIA_Bartok_Teach,B_BuildLearnString(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Bartok_Teach_BOW_1);
	Info_AddChoice(DIA_Bartok_Teach,B_BuildLearnString(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),DIA_Bartok_Teach_BOW_5);
};

func void DIA_Bartok_Teach_Back()
{
	if(other.HitChance[NPC_TALENT_BOW] >= 60)
	{
		AI_Output(self,other,"DIA_Bartok_TeachBow_BACK_04_00");	//Тебе лучше поискать кого-нибудь, кто знает больше, чем я.
	}
	else if(Bosper_MerkeBow < other.HitChance[NPC_TALENT_BOW])
	{
		AI_Output(self,other,"DIA_Bartok_TeachBow_BACK_04_01");	//Хорошо, ты стал стрелять значительно лучше.
	};
	Info_ClearChoices(DIA_Bartok_Teach);
};

func void DIA_Bartok_Teach_BOW_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,1,60);
	Info_ClearChoices(DIA_Bartok_Teach);
	Info_AddChoice(DIA_Bartok_Teach,Dialog_Back,DIA_Bartok_Teach_Back);
	Info_AddChoice(DIA_Bartok_Teach,B_BuildLearnString(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Bartok_Teach_BOW_1);
	Info_AddChoice(DIA_Bartok_Teach,B_BuildLearnString(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),DIA_Bartok_Teach_BOW_5);
};

func void DIA_Bartok_Teach_BOW_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,5,60);
	Info_ClearChoices(DIA_Bartok_Teach);
	Info_AddChoice(DIA_Bartok_Teach,Dialog_Back,DIA_Bartok_Teach_Back);
	Info_AddChoice(DIA_Bartok_Teach,B_BuildLearnString(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Bartok_Teach_BOW_1);
	Info_AddChoice(DIA_Bartok_Teach,B_BuildLearnString(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),DIA_Bartok_Teach_BOW_5);
};


var int Bartok_Bereit;
var int Bartok_Later;

instance DIA_Bartok_Zusammen(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 5;
	condition = DIA_Bartok_Zusammen_Condition;
	information = DIA_Bartok_Zusammen_Info;
	permanent = TRUE;
	description = "Почему бы нам не поохотиться вместе?";
};


func int DIA_Bartok_Zusammen_Condition()
{
	if((Bartok_Bereit == FALSE) && Npc_KnowsInfo(other,DIA_Bartok_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Bartok_Zusammen_Info()
{
	if(Bartok_Later == FALSE)
	{
		AI_Output(other,self,"DIA_Bartok_Zusammen_15_00");	//Почему бы нам не поохотиться вместе?
		AI_Output(self,other,"DIA_Bartok_Zusammen_04_01");	//Хм. Вдвоем охотиться не так опасно, это точно...
		AI_Output(self,other,"DIA_Bartok_Zusammen_04_02");	//А что ты знаешь об охоте, а?
		AI_Output(self,other,"DIA_Bartok_Zusammen_04_03");	//Я имею в виду, ты знаешь, как снимать шкуры с животных?
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == TRUE)
	{
		if(Bartok_Later == TRUE)
		{
			AI_Output(self,other,"DIA_Bartok_HuntNOW_04_01");	//У тебя есть 50 монет?
		}
		else
		{
			AI_Output(other,self,"DIA_Bartok_Zusammen_15_04");	//Да.
			AI_Output(self,other,"DIA_Bartok_Zusammen_04_05");	//Хорошо, я хочу получить 50 золотых монет. А ты можешь забирать себе шкуры и продавать их Босперу.
			AI_Output(self,other,"DIA_Bartok_Zusammen_04_06");	//Это будет честно, правда?
		};
		Info_ClearChoices(DIA_Bartok_Zusammen);
		Info_AddChoice(DIA_Bartok_Zusammen,"Позже...",DIA_Bartok_Zusammen_Later);
		Info_AddChoice(DIA_Bartok_Zusammen,"Вот, держи...",DIA_Bartok_Zusammen_Pay);
	}
	else
	{
		AI_Output(other,self,"DIA_Bartok_Zusammen_15_07");	//Нет.
		AI_Output(self,other,"DIA_Bartok_Zusammen_04_08");	//Тогда овчинка выделки не стоит.
		AI_Output(self,other,"DIA_Bartok_Zusammen_04_09");	//Возвращайся, когда научишься чему-нибудь.
	};
};

func void DIA_Bartok_Zusammen_Later()
{
	AI_Output(other,self,"DIA_Bartok_HuntNOW_Later_15_00");	//Позже...
	Bartok_Later = TRUE;
	Info_ClearChoices(DIA_Bartok_Zusammen);
};

func void DIA_Bartok_Zusammen_Pay()
{
	Info_ClearChoices(DIA_Bartok_Zusammen);
	if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		AI_Output(other,self,"DIA_Bartok_HuntNOW_GO_15_00");	//Вот, держи...
		Bartok_Bereit = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bartok_HuntNOW_GO_04_03");	//Где? Не вижу! У тебя нет золота.
	};
};


var int Bartok_Los;

instance DIA_Bartok_HuntNOW(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 5;
	condition = DIA_Bartok_HuntNOW_Condition;
	information = DIA_Bartok_HuntNOW_Info;
	permanent = FALSE;
	description = "Пойдем охотиться!";
};


func int DIA_Bartok_HuntNOW_Condition()
{
	if(Bartok_Bereit == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Bartok_HuntNOW_Info()
{
	AI_Output(other,self,"DIA_Bartok_HuntNOW_15_00");	//Пойдем охотиться!
	AI_Output(self,other,"DIA_Bartok_HuntNOW_GO_04_01");	//Хорошо, пошли за мной. За южными воротами начинается лес. Там водится более чем достаточно всяких тварей.
	AI_Output(self,other,"DIA_Bartok_HuntNOW_GO_04_02");	//(себе под нос) Даже больше, чем хотелось бы...
	Bartok_Los = TRUE;
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"GUIDEMITTE");
	Wld_InsertNpc(Wolf,"NW_FARM1_CITYWALL_FOREST_02");
	Wld_InsertNpc(Wolf,"NW_FARM1_CITYWALL_FOREST_02");
	Wld_InsertNpc(Wolf,"NW_FARM1_CITYWALL_FOREST_02");
};


var int Bartok_OrkStillThere;

instance DIA_Bartok_ImWald(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 1;
	condition = DIA_Bartok_ImWald_Condition;
	information = DIA_Bartok_ImWald_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Bartok_ImWald_Condition()
{
	if((Bartok_Los == TRUE) && (Npc_GetDistToWP(self,"NW_FARM1_CITYWALL_FOREST_03") < 500))
	{
		return TRUE;
	};
};

func void DIA_Bartok_ImWald_Info()
{
	AI_Output(self,other,"DIA_Bartok_ImWald_04_00");	//Как ты думаешь, стоит нам углубиться в лес или нет?
	Info_ClearChoices(DIA_Bartok_ImWald);
	Info_AddChoice(DIA_Bartok_ImWald,"Пойдем назад!",DIA_Bartok_ImWald_NachHause);
	Info_AddChoice(DIA_Bartok_ImWald,"Стоит.",DIA_Bartok_ImWald_Weiter);
};

func void DIA_Bartok_ImWald_NachHause()
{
	AI_Output(other,self,"DIA_Bartok_ImWald_NachHause_15_00");	//Пойдем назад!
	AI_Output(self,other,"DIA_Bartok_ImWald_NachHause_04_01");	//Я тоже так думаю. А то мы так попадем прямо в объятия орка.
	Info_ClearChoices(DIA_Bartok_ImWald);
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};

func void DIA_Bartok_ImWald_Weiter()
{
	AI_Output(other,self,"DIA_Bartok_ImWald_Weiter_15_00");	//Стоит.
	AI_Output(self,other,"DIA_Bartok_ImWald_Weiter_04_01");	//Хорошо. (по себя) Будем надеяться, что нам повезет...
	if(!Npc_IsDead(CityOrc))
	{
		Bartok_OrkStillThere = TRUE;
	};
	Info_ClearChoices(DIA_Bartok_ImWald);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GUIDEENDE");
};


var int Bartok_Ende;

instance DIA_Bartok_Angekommen(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 1;
	condition = DIA_Bartok_Angekommen_Condition;
	information = DIA_Bartok_Angekommen_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Bartok_Angekommen_Condition()
{
	if((Bartok_Los == TRUE) && (Npc_GetDistToWP(self,"NW_FARM1_CITYWALL_FOREST_07") < 500))
	{
		return TRUE;
	};
};

func void DIA_Bartok_Angekommen_Info()
{
	AI_Output(self,other,"DIA_Bartok_Angekommen_04_00");	//Все! Я думаю, мне лучше вернуться в город.
	AI_Output(self,other,"DIA_Bartok_Angekommen_04_01");	//Здесь для меня слишком опасно - и даже для нас двоих.
	if(Bartok_OrkStillThere == TRUE)
	{
		B_Bartok_ShitAnOrc();
		Bartok_OrkGesagt = TRUE;
	};
	AI_Output(self,other,"DIA_Bartok_Angekommen_04_03");	//Еще увидимся!
	AI_Output(self,other,"DIA_Bartok_Angekommen_04_04");	//Ты можешь продать шкуры Босперу.
	Bartok_Ende = TRUE;
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Bartok_PERM(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 1;
	condition = DIA_Bartok_PERM_Condition;
	information = DIA_Bartok_PERM_Info;
	permanent = TRUE;
	description = "Все в порядке?";
};


func int DIA_Bartok_PERM_Condition()
{
	if(Bartok_Los == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Bartok_PERM_Info()
{
	AI_Output(other,self,"DIA_Bartok_PERM_15_00");	//Все в порядке?
	if(Bartok_Ende == TRUE)
	{
		AI_Output(self,other,"DIA_Bartok_PERM_04_01");	//Да. Но я больше не выйду из города. По крайней мере, в ближайшее время.
		if(Bartok_OrkGesagt == TRUE)
		{
			AI_Output(self,other,"DIA_Bartok_PERM_04_02");	//У меня все еще поджилки трясутся от одной мысли об этом орке.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Bartok_PERM_04_03");	//Конечно. Давая прикончим еще парочку зверей!
	};
};

