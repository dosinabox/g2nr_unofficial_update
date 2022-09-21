
instance DIA_1017_BANDIT_EXIT(C_Info)
{
	npc = BDT_1024_MalethsBandit;
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
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
	self.aivar[AIV_IgnoresArmor] = TRUE;
	//ch1
	if(!Npc_IsDead(BDT_1001_Bandit_L)) //уникальный в мире
	{
		BDT_1001_Bandit_L.aivar[AIV_IgnoresArmor] = TRUE;
		B_Attack(BDT_1001_Bandit_L,other,AR_SuddenEnemyInferno,1);
	};
	if(!Npc_IsDead(BDT_1017_Bandit_L)) //уникальный неиспользуемый
	{
		BDT_1017_Bandit_L.aivar[AIV_IgnoresArmor] = TRUE;
		B_Attack(BDT_1017_Bandit_L,other,AR_SuddenEnemyInferno,1);
	};
	if(!Npc_IsDead(BDT_1012_Bandit_L)) //новый
	{
		BDT_1012_Bandit_L.aivar[AIV_IgnoresArmor] = TRUE;
		B_Attack(BDT_1012_Bandit_L,other,AR_SuddenEnemyInferno,1);
	};
	if(!Npc_IsDead(BDT_1018_Bandit_L)) //новый
	{
		BDT_1018_Bandit_L.aivar[AIV_IgnoresArmor] = TRUE;
		B_Attack(BDT_1018_Bandit_L,other,AR_SuddenEnemyInferno,1);
	};
	//ch3
	if(!Npc_IsDead(BDT_1004_Bandit_M)) //уникальный в мире
	{
		BDT_1004_Bandit_M.aivar[AIV_IgnoresArmor] = TRUE;
		B_Attack(BDT_1004_Bandit_M,other,AR_SuddenEnemyInferno,1);
	};
	if(!Npc_IsDead(BDT_1006_Bandit_H)) //уникальный в мире
	{
		BDT_1006_Bandit_H.aivar[AIV_IgnoresArmor] = TRUE;
	};
	if(!Npc_IsDead(BDT_1007_Bandit_H)) //уникальный в мире
	{
		BDT_1007_Bandit_H.aivar[AIV_IgnoresArmor] = TRUE;
	};
	if(!Npc_IsDead(BDT_1008_Bandit_H)) //уникальный в мире
	{
		BDT_1008_Bandit_H.aivar[AIV_IgnoresArmor] = TRUE;
		B_Attack(BDT_1008_Bandit_H,other,AR_SuddenEnemyInferno,1);
	};
	if(!Npc_IsDead(BDT_1016_Bandit_M)) //уникальный неиспользуемый
	{
		BDT_1016_Bandit_M.aivar[AIV_IgnoresArmor] = TRUE;
		B_Attack(BDT_1016_Bandit_M,other,AR_SuddenEnemyInferno,1);
	};
};


instance DIA_1017_BANDIT_AMBUSH(C_Info)
{
	npc = BDT_1024_MalethsBandit;
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
	AI_Output(self,other,"DIA_Canthar_Hallo_09_00");	//Посмотрите, кто у нас здесь!
	B_ReadFakeItem(self,other,Fakeheroface,1);
	B_Say(self,other,"$IGETYOUSTILL");
	AI_Output(other,self,"DIA_Attila_Willkommen_15_01");	//Кто ты и что тебе нужно от меня?
	AI_Output(self,other,"DIA_Addon_Dexter_Hallo_09_06");	//Мне? Абсолютно ничего. Но мой хозяин просто дьявольски жаждет твоей смерти.
	AI_Output(other,self,"DIA_Attila_Hallo_Warum_15_00");	//Почему ты хочешь убить меня?
	AI_Output(self,other,"DIA_Dexter_Hallo_09_05");	//Когда я пытался выбраться из Долины Рудников, солдаты обнаружили меня и устроили мне ловушку.
	AI_Output(self,other,"DIA_Dexter_Hallo_09_06");	//Я уже думал, что мне конец, но неожиданно эта... фигура... появилась во тьме.
	AI_Output(self,other,"DIA_Dexter_Hallo_09_07");	//На нем была черная ряса с капюшоном, нависавшим над его лицом. И он заговорил голосом, лишь отдаленно напоминающим человеческий.
	AI_Output(self,other,"DIA_Dexter_Hallo_09_08");	//Он предложил мне свою помощь. Он вывел меня из Долины и предложил тысячу золотых за твою голову.
	AI_Output(self,other,"DIA_Dexter_Hallo_09_09");	//Эй, а что мне было делать? Если бы я отказался, он убил бы меня!
	AI_Output(other,self,"DIA_Dexter_Wo_15_00");	//Где мне найти этого человека?
	AI_Output(self,other,"DIA_Dexter_Wo_09_02");	//Этот парень здесь, и он не один. Их тут много, они повсюду! И они ищут тебя.
	AI_Output(self,other,"DIA_Dexter_Kill_09_00");	//Я предупредил тебя. Если я не убью тебя, они убьют меня. Так что ты не оставляешь мне выбора.
};

