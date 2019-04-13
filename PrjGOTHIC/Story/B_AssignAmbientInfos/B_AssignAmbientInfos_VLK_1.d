
instance DIA_VLK_1_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_VLK_1_EXIT_Condition;
	information = DIA_VLK_1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_VLK_1_EXIT_Condition()
{
	return TRUE;
};

func void DIA_VLK_1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VLK_1_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_VLK_1_JOIN_Condition;
	information = DIA_VLK_1_JOIN_Info;
	permanent = TRUE;
	description = "Как мне стать гражданином этого города?";
};


func int DIA_VLK_1_JOIN_Condition()
{
	if((hero.guild == GIL_NONE) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_VLK_1_JOIN_Info()
{
	AI_Output(other,self,"DIA_VLK_1_JOIN_15_00");	//Как мне стать гражданином этого города?
	AI_Output(self,other,"DIA_VLK_1_JOIN_01_01");	//Найди себе приличную работу! Все, у кого есть занятие в Хоринисе, считаются гражданами города.
};


instance DIA_VLK_1_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_VLK_1_PEOPLE_Condition;
	information = DIA_VLK_1_PEOPLE_Info;
	permanent = TRUE;
	description = "А кто здесь самые влиятельные горожане?";
};


func int DIA_VLK_1_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_VLK_1_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_VLK_1_PEOPLE_15_00");	//А кто здесь самые влиятельные горожане?
	AI_Output(self,other,"DIA_VLK_1_PEOPLE_01_01");	//(смеется) До последнего времени ими были губернатор и судья. Но затем пришли паладины и захватили всю власть в городе.
	AI_Output(self,other,"DIA_VLK_1_PEOPLE_01_02");	//Их возглавляет лорд Хаген. Он теперь новый губернатор, не больше и не меньше.
	AI_Output(self,other,"DIA_VLK_1_PEOPLE_01_03");	//Лорд Андрэ - его правая рука. Он возглавляет городскую стражу, а также действует в качестве судьи.
	AI_Output(self,other,"DIA_VLK_1_PEOPLE_01_04");	//Если против кого-то выдвинуто обвинение, этот человек должен предстать перед лордом Андрэ.
};


instance DIA_VLK_1_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_VLK_1_LOCATION_Condition;
	information = DIA_VLK_1_LOCATION_Info;
	permanent = TRUE;
	description = "Что интересного есть в городе?";
};


func int DIA_VLK_1_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_VLK_1_LOCATION_Info()
{
	AI_Output(other,self,"DIA_VLK_1_LOCATION_15_00");	//Что интересного есть в городе?
	AI_Output(self,other,"DIA_VLK_1_LOCATION_01_01");	//Здесь ты можешь купить почти все, что только можно представить. Либо у торговцев на рынке, либо в нижней части города.
	AI_Output(self,other,"DIA_VLK_1_LOCATION_01_02");	//Но почти все, что стоит покупать, стоит недешево.
	AI_Output(self,other,"DIA_VLK_1_LOCATION_01_03");	//Если у тебя недостаточно денег, тогда, возможно, ростовщик Лемар сможет помочь тебе. Его дом находится в самом начале портового квартала, если идти из нижней части города.
};


instance DIA_VLK_1_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_VLK_1_STANDARD_Condition;
	information = DIA_VLK_1_STANDARD_Info;
	permanent = TRUE;
	description = "Что нового?";
};


func int DIA_VLK_1_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_VLK_1_STANDARD_Info()
{
	AI_Output(other,self,"DIA_VLK_1_STANDARD_15_00");	//Что новенького?
	if(Kapitel == 1)
	{
		AI_Output(self,other,"DIA_VLK_1_STANDARD_01_01");	//С тех пор как Барьер рухнул, открытая торговля с крупным землевладельцем неожиданно прекратилась. Кто знает, что он замышляет. Все это дурно пахнет.
	};
	if(Kapitel == 2)
	{
		AI_Output(self,other,"DIA_VLK_1_STANDARD_01_02");	//Онар зашел слишком далеко. Он все еще не поставляет продовольствие в город. Если ополчение не вмешается, другие фермеры скоро тоже будут делать все, что захотят.
	};
	if(Kapitel == 3)
	{
		AI_Output(self,other,"DIA_VLK_1_STANDARD_01_03");	//Я слышал, что бандиты объединились с магами. Грозные черные маги в черных рясах. Могу поклясться, что прошлой ночью я видел одного из них в городе.
	};
	if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_VLK_1_STANDARD_01_04");	//Я слышал, что некоторые из наемников Онара отправились охотиться на драконов. Ну, по крайней мере, они занялись хоть чем-то полезным!
	};
	if(Kapitel >= 5)
	{
		AI_Output(self,other,"DIA_VLK_1_STANDARD_01_05");	//Говорят, что драконы уничтожены! Лорд Хаген собирает своих людей, чтобы изгнать последних тварей из Долины Рудников.
	};
};

func void B_AssignAmbientInfos_VLK_1(var C_Npc slf)
{
	dia_vlk_1_exit.npc = Hlp_GetInstanceID(slf);
	dia_vlk_1_join.npc = Hlp_GetInstanceID(slf);
	dia_vlk_1_people.npc = Hlp_GetInstanceID(slf);
	dia_vlk_1_location.npc = Hlp_GetInstanceID(slf);
	dia_vlk_1_standard.npc = Hlp_GetInstanceID(slf);
};

