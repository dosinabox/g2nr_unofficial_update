
instance DIA_1017_BANDIT_EXIT(C_Info)
{
	npc = BDT_1017_Bandit_L;
	nr = 999;
	condition = DIA_1017_BANDIT_EXIT_Condition;
	information = DIA_1017_BANDIT_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_1017_BANDIT_EXIT_Condition()
{
	return TRUE;
};

func void DIA_1017_BANDIT_EXIT_Info()
{
	if(Npc_KnowsInfo(hero,DIA_1017_BANDIT_AMBUSH))
	{
		AI_Output(self,other,"DIA_Dexter_Kill_09_00");	//Я предупредил тебя. Если я не убью тебя, они убьют меня. Так что ты не оставляешь мне выбора.
	}
	else
	{
		B_Say(self,other,"$EnemyKilled");
	};
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
};


instance DIA_1017_BANDIT_AMBUSH(C_Info)
{
	npc = BDT_1017_Bandit_L;
	nr = 2;
	condition = DIA_1017_BANDIT_AMBUSH_Condition;
	information = DIA_1017_BANDIT_AMBUSH_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_1017_BANDIT_AMBUSH_Condition()
{
	return TRUE;
};

func void DIA_1017_BANDIT_AMBUSH_Info()
{
	B_Say(self,other,"$IGetYouStill");
	//B_Say(self,other,"$ABS_GOOD");
	//B_Say(self,other,"$ABS_GOOD");
	//B_Say(self,other,"$ABS_GOOD");
	AI_Output(other,self,"DIA_Attila_Willkommen_15_01");	//Кто ты и что тебе нужно от меня?
	B_Say(self,other,"$SpareMe");
	AI_Output(other,self,"DIA_Attila_Hallo_Auftrag_15_00");	//Кто платит тебе за это?
	AI_Output(self,other,"DIA_Dexter_Hallo_09_05");	//Когда я пытался выбраться из Долины Рудников, солдаты обнаружили меня и устроили мне ловушку.
	AI_Output(self,other,"DIA_Dexter_Hallo_09_06");	//Я уже думал, что мне конец, но неожиданно эта... фигура... появилась во тьме.
	AI_Output(self,other,"DIA_Dexter_Hallo_09_07");	//На нем была черная ряса с капюшоном, нависавшим над его лицом. И он заговорил голосом, лишь отдаленно напоминающим человеческий.
	AI_Output(self,other,"DIA_Dexter_Hallo_09_08");	//Он предложил мне свою помощь. Он вывел меня из Долины и предложил тысячу золотых за твою голову.
	AI_Output(self,other,"DIA_Dexter_Hallo_09_09");	//Эй, а что мне было делать? Если бы я отказался, он убил бы меня!
	AI_Output(other,self,"DIA_Dexter_Wo_15_00");	//Где мне найти этого человека?
	if(Kapitel < 3)
	{
		AI_Output(self,other,"DIA_Dexter_Wo_09_01");	//Я думаю, он где-то в Долине Рудников.
	}
	else
	{
		AI_Output(self,other,"DIA_Dexter_Wo_09_02");	//Этот парень здесь, и он не один. Их тут много, они повсюду! И они ищут тебя.
	};
	//AI_UseMob(self,"BENCH",-1);
};

