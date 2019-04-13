
instance DIA_Addon_Rhademes_EXIT(C_Info)
{
	npc = NONE_ADDON_112_Rhademes;
	nr = 999;
	condition = DIA_Addon_Rhademes_EXIT_Condition;
	information = DIA_Addon_Rhademes_EXIT_Info;
	permanent = TRUE;
	description = "Я сам найду путь туда! (КОНЕЦ)";
};


func int DIA_Addon_Rhademes_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Rhademes_EXIT_Info()
{
	AI_Output(other,self,"DIA_Addon_Rhademes_EXIT_15_00");	//Я сам найду путь!
	AI_Output(self,other,"DIA_Addon_Rhademes_EXIT_03_01");	//Как пожелаешь...
	AI_StopProcessInfos(self);
};


var int Rhademes_Understood;

instance DIA_Addon_Rhademes_First(C_Info)
{
	npc = NONE_ADDON_112_Rhademes;
	nr = 1;
	condition = DIA_Addon_Rhademes_First_Condition;
	information = DIA_Addon_Rhademes_First_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Rhademes_First_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Rhademes_Understood == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Rhademes_First_Info()
{
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Rhademes_First_03_00");	//Мой дух был заперт здесь целую вечность.
		AI_Output(self,other,"DIA_Addon_Rhademes_First_03_01");	//Теперь я наконец-то свободен. У меча новый хозяин!
		AI_Output(self,other,"DIA_Addon_Rhademes_First_03_02");	//Проход в последний зал открыт.
		AI_Output(other,self,"DIA_Addon_Rhademes_First_15_03");	//Но ворота закрыты!
		AI_Output(self,other,"DIA_Addon_Rhademes_First_03_04");	//Эти ворота не ведут в последний зал.
		AI_Output(self,other,"DIA_Addon_Rhademes_First_03_05");	//Они ведут в небольшой вестибюль.
		AI_Output(self,other,"DIA_Addon_Rhademes_First_03_06");	//Владелец меча... закрыл их за собой.
		Rhademes_Understood = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Rhademes_First_03_07");	//Ганима эн кандра Аданос?
		B_Say(other,self,"$CANTUNDERSTANDTHIS");
		AI_Output(self,other,"DIA_Addon_Rhademes_First_03_08");	//Бенгла антани!
		AI_StopProcessInfos(self);
	};
};


instance DIA_Addon_Rhademes_Pforte(C_Info)
{
	npc = NONE_ADDON_112_Rhademes;
	nr = 2;
	condition = DIA_Addon_Rhademes_Pforte_Condition;
	information = DIA_Addon_Rhademes_Pforte_Info;
	permanent = FALSE;
	description = "Как открыть ворота?";
};


func int DIA_Addon_Rhademes_Pforte_Condition()
{
	return TRUE;
};

func void DIA_Addon_Rhademes_Pforte_Info()
{
	AI_Output(other,self,"DIA_Addon_Rhademes_Pforte_15_00");	//Как открыть ворота?
	AI_Output(self,other,"DIA_Addon_Rhademes_Pforte_03_01");	//Потяни... за один из рычагов.
	AI_Output(other,self,"DIA_Addon_Rhademes_Pforte_15_02");	//Любой?
	AI_Output(self,other,"DIA_Addon_Rhademes_Pforte_03_03");	//Да. Любой из них открывает ворота.
};


instance DIA_Addon_Rhademes_Hebel(C_Info)
{
	npc = NONE_ADDON_112_Rhademes;
	nr = 3;
	condition = DIA_Addon_Rhademes_Hebel_Condition;
	information = DIA_Addon_Rhademes_Hebel_Info;
	permanent = FALSE;
	description = "Но не все активируют ловушку, верно?";
};


func int DIA_Addon_Rhademes_Hebel_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Rhademes_Pforte) && !Npc_KnowsInfo(other,DIA_Addon_Rhademes_DeinVater))
	{
		return TRUE;
	};
};

func void DIA_Addon_Rhademes_Hebel_Info()
{
	AI_Output(other,self,"DIA_Addon_Rhademes_Hebel_15_00");	//Но не все активируют ловушку, верно?
	AI_Output(self,other,"DIA_Addon_Rhademes_Hebel_03_01");	//Все!
};


instance DIA_Addon_Rhademes_DontBelieve(C_Info)
{
	npc = NONE_ADDON_112_Rhademes;
	nr = 4;
	condition = DIA_Addon_Rhademes_DontBelieve_Condition;
	information = DIA_Addon_Rhademes_DontBelieve_Info;
	permanent = FALSE;
	description = "Я не верю тебе!";
};


func int DIA_Addon_Rhademes_DontBelieve_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Rhademes_Pforte) && !Npc_KnowsInfo(other,DIA_Addon_Rhademes_DeinVater))
	{
		return TRUE;
	};
};

func void DIA_Addon_Rhademes_DontBelieve_Info()
{
	AI_Output(other,self,"DIA_Addon_Rhademes_DontBelieve_15_00");	//Я не верю тебе!
	AI_Output(self,other,"DIA_Addon_Rhademes_DontBelieve_03_01");	//И все же я говорю правду.
};


instance DIA_Addon_Rhademes_DeinVater(C_Info)
{
	npc = NONE_ADDON_112_Rhademes;
	nr = 5;
	condition = DIA_Addon_Rhademes_DeinVater_Condition;
	information = DIA_Addon_Rhademes_DeinVater_Info;
	permanent = FALSE;
	description = "Твой отец создал эту ловушку. Откуда тебе знать, как она работает?!";
};


func int DIA_Addon_Rhademes_DeinVater_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Rhademes_Pforte) && (Npc_HasItems(other,ItMi_Addon_Stone_04) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Rhademes_DeinVater_Info()
{
	AI_Output(other,self,"DIA_Addon_Rhademes_DeinVater_15_00");	//Твой отец создал эту ловушку. Откуда тебе знать, как она работает?!
	AI_Output(self,other,"DIA_Addon_Rhademes_DeinVater_03_01");	//Куарходрон! Я все еще помню стук молотков... на другой стороне ворот... спустя столько времени...
	AI_Output(self,other,"DIA_Addon_Rhademes_DeinVater_03_02");	//Меч... отомстил мне... за то, что я не справился...
	AI_Output(other,self,"DIA_Addon_Rhademes_DeinVater_15_03");	//Ты помнишь, какой из рычагов - правильный?
	AI_Output(self,other,"DIA_Addon_Rhademes_DeinVater_03_04");	//Я давно все забыл.
	Info_ClearChoices(DIA_Addon_Rhademes_DeinVater);
	Info_AddChoice(DIA_Addon_Rhademes_DeinVater,"Тогда попробуй догадаться!",DIA_Addon_Rhademes_DeinVater_Guess);
	Info_AddChoice(DIA_Addon_Rhademes_DeinVater,"Вспоминай!",DIA_Addon_Rhademes_DeinVater_Remember);
	Info_AddChoice(DIA_Addon_Rhademes_DeinVater,"Думай!",DIA_Addon_Rhademes_DeinVater_Think);
};


var int Rhademes_fertig;

func void B_Addon_Rhademes_Lever(var int Choice)
{
	AI_Output(self,other,"DIA_Addon_Rhademes_Lever_03_00");	//Это было так давно...
	AI_StopProcessInfos(self);
	if(Choice <= 1)
	{
		AI_GotoWP(self,"ADW_ADANOSTEMPEL_RHADEMES_04");
	}
	else if(Choice == 2)
	{
		AI_GotoWP(self,"ADW_ADANOSTEMPEL_RHADEMES_04");
	}
	else
	{
		AI_GotoWP(self,"ADW_ADANOSTEMPEL_RHADEMES_04");
	};
	AI_UseMob(self,"LEVER",1);
	Rhademes_fertig = TRUE;
};

func void DIA_Addon_Rhademes_DeinVater_Think()
{
	AI_Output(other,self,"DIA_Addon_Rhademes_DeinVater_Think_15_00");	//Думай!
	B_Addon_Rhademes_Lever(1);
};

func void DIA_Addon_Rhademes_DeinVater_Remember()
{
	AI_Output(other,self,"DIA_Addon_Rhademes_DeinVater_Remember_15_00");	//Вспоминай!
	B_Addon_Rhademes_Lever(2);
};

func void DIA_Addon_Rhademes_DeinVater_Guess()
{
	AI_Output(other,self,"DIA_Addon_Rhademes_DeinVater_Guess_15_00");	//Тогда попробуй догадаться!
	B_Addon_Rhademes_Lever(3);
};


instance DIA_Addon_Rhademes_PERM(C_Info)
{
	npc = NONE_ADDON_112_Rhademes;
	nr = 2;
	condition = DIA_Addon_Rhademes_PERM_Condition;
	information = DIA_Addon_Rhademes_PERM_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Rhademes_PERM_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Rhademes_fertig == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Rhademes_PERM_Info()
{
	AI_Output(self,other,"DIA_Addon_Rhademes_PERM_03_00");	//Если ты обладаешь силой... утопи ее... в глубинах моря...
	SC_TookRhademesTrap = TRUE;
	SC_TalkedToRhademAfter = TRUE;
	AI_StopProcessInfos(self);
};

