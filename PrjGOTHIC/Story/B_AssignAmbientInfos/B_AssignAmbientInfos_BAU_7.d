
instance DIA_BAU_7_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_BAU_7_EXIT_Condition;
	information = DIA_BAU_7_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_BAU_7_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BAU_7_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BAU_7_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_BAU_7_JOIN_Condition;
	information = DIA_BAU_7_JOIN_Info;
	permanent = TRUE;
	description = "Что ты знаешь о наемниках?";
};


func int DIA_BAU_7_JOIN_Condition()
{
	if(Kapitel == 1)
	{
		return TRUE;
	};
};

func void DIA_BAU_7_JOIN_Info()
{
	AI_Output(other,self,"DIA_BAU_7_JOIN_15_00");	//Что ты знаешь о наемниках?
	AI_Output(self,other,"DIA_BAU_7_JOIN_07_01");	//Онар нанял их для защиты своей фермы.
	AI_Output(self,other,"DIA_BAU_7_JOIN_07_02");	//Большинство их них ведут себя так, как будто эта ферма принадлежит им. Но все же они защищают нас.
};


instance DIA_BAU_7_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_BAU_7_PEOPLE_Condition;
	information = DIA_BAU_7_PEOPLE_Info;
	permanent = TRUE;
	description = "Кто командует здесь?";
};


func int DIA_BAU_7_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_BAU_7_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_BAU_7_PEOPLE_15_00");	//Кто здесь главный?
	AI_Output(self,other,"DIA_BAU_7_PEOPLE_07_01");	//Эта большая ферма принадлежит Онару. Мелкие фермы вокруг тоже. Но он сдает их в аренду.
};


instance DIA_BAU_7_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_BAU_7_LOCATION_Condition;
	information = DIA_BAU_7_LOCATION_Info;
	permanent = TRUE;
	description = "Расскажи мне подробнее здешних местах.";
};


func int DIA_BAU_7_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_BAU_7_LOCATION_Info()
{
	AI_Output(other,self,"DIA_BAU_7_LOCATION_15_00");	//Расскажи мне подробнее здешних местах.
	AI_Output(self,other,"DIA_BAU_7_LOCATION_07_01");	//Эта большая ферма на востоке долины принадлежит Онару. Ферма Секоба находится к северу.
	AI_Output(self,other,"DIA_BAU_7_LOCATION_07_02");	//А ферма Бенгара  - на высокогорье к юго-западу. Ты можешь попасть туда из долины. К ней ведет большая каменная лестница.
};


instance DIA_BAU_7_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_BAU_7_STANDARD_Condition;
	information = DIA_BAU_7_STANDARD_Info;
	permanent = TRUE;
	description = "Что нового?";
};


func int DIA_BAU_7_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_BAU_7_STANDARD_Info()
{
	AI_Output(other,self,"DIA_BAU_7_STANDARD_15_00");	//Что новенького?
	if(Kapitel == 1)
	{
		AI_Output(self,other,"DIA_BAU_7_STANDARD_07_01");	//Мы объявили независимость - мы больше не платим налоги городу. Король все равно ничего не делает для нас. С нас хватит!
	};
	if(Kapitel == 2)
	{
		AI_Output(self,other,"DIA_BAU_7_STANDARD_07_02");	//Сейчас мне нечего рассказать тебе.
	};
	if(Kapitel == 3)
	{
		AI_Output(self,other,"DIA_BAU_7_STANDARD_07_03");	//Все только и говорят о драконах! Король всегда найдет способ выжать побольше денег из простых людей.
	};
	if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_BAU_7_STANDARD_07_04");	//Будь осторожен: последнее время через проход толпами валят темные личности и различные дикие животные.
	};
	if(Kapitel >= 5)
	{
		AI_Output(self,other,"DIA_BAU_7_STANDARD_07_05");	//Теперь, когда драконы уничтожены, паладины снизошли до того, чтобы выползти из города. Опять они начнут тут командовать.
	};
};

func void B_AssignAmbientInfos_BAU_7(var C_Npc slf)
{
	dia_bau_7_exit.npc = Hlp_GetInstanceID(slf);
	dia_bau_7_join.npc = Hlp_GetInstanceID(slf);
	dia_bau_7_people.npc = Hlp_GetInstanceID(slf);
	dia_bau_7_location.npc = Hlp_GetInstanceID(slf);
	dia_bau_7_standard.npc = Hlp_GetInstanceID(slf);
};

