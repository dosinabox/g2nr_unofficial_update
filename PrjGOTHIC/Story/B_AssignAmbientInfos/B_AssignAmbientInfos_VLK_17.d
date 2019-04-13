
instance DIA_VLK_17_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_VLK_17_EXIT_Condition;
	information = DIA_VLK_17_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_VLK_17_EXIT_Condition()
{
	return TRUE;
};

func void DIA_VLK_17_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VLK_17_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_VLK_17_JOIN_Condition;
	information = DIA_VLK_17_JOIN_Info;
	permanent = TRUE;
	description = "Что нужно для того, чтобы стать гражданином этого города?";
};


func int DIA_VLK_17_JOIN_Condition()
{
	if((hero.guild == GIL_NONE) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_VLK_17_JOIN_Info()
{
	AI_Output(other,self,"DIA_VLK_17_JOIN_15_00");	//Что нужно для того, чтобы стать гражданином этого города?
	AI_Output(self,other,"DIA_VLK_17_JOIN_17_01");	//Мастера-ремесленники из нижней части города имеют очень большое влияние здесь, в Хоринисе. Тебе стоит поговорить с одним из них.
};


instance DIA_VLK_17_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_VLK_17_PEOPLE_Condition;
	information = DIA_VLK_17_PEOPLE_Info;
	permanent = TRUE;
	description = "А кто имеет наибольшее влияние в этом городе?";
};


func int DIA_VLK_17_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_VLK_17_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_VLK_17_PEOPLE_15_00");	//А кто имеет наибольшее влияние в этом городе?
	AI_Output(self,other,"DIA_VLK_17_PEOPLE_17_01");	//С тех пор, как в город пришли паладины, они взяли в свои руки всю власть.
	AI_Output(self,other,"DIA_VLK_17_PEOPLE_17_02");	//Лорд Андрэ представляет закон. Ты найдешь его в казармах.
	AI_Output(self,other,"DIA_VLK_17_PEOPLE_17_03");	//Но тебе нужно идти к нему, только если ты нарушил закон или хочешь вступить в ополчение.
};


instance DIA_VLK_17_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_VLK_17_LOCATION_Condition;
	information = DIA_VLK_17_LOCATION_Info;
	permanent = TRUE;
	description = "В Хоринисе есть интересные места?";
};


func int DIA_VLK_17_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_VLK_17_LOCATION_Info()
{
	AI_Output(other,self,"DIA_VLK_17_LOCATION_15_00");	//В Хоринисе есть интересные места?
	AI_Output(self,other,"DIA_VLK_17_LOCATION_17_01");	//(смеется) Вероятно, тебе лучше спросить об этом мужчин. Если тебе нужны развлечения, попытай счастья в порту.
	AI_Output(self,other,"DIA_VLK_17_LOCATION_17_02");	//Но если ты хочешь что-нибудь купить, иди на рыночную площадь у восточных ворот, или в нижнюю часть города.
};


instance DIA_VLK_17_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_VLK_17_STANDARD_Condition;
	information = DIA_VLK_17_STANDARD_Info;
	permanent = TRUE;
	description = "Что нового?";
};


func int DIA_VLK_17_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_VLK_17_STANDARD_Info()
{
	AI_Output(other,self,"DIA_VLK_17_STANDARD_15_00");	//Что новенького?
	if((Kapitel == 1) || (Kapitel == 2))
	{
		AI_Output(self,other,"DIA_VLK_17_STANDARD_17_01");	//Интересно, зачем сюда прибыли паладины? Они заняли городскую ратушу, казармы и гавань, но пока не сделали ровным счетом ничего.
		AI_Output(self,other,"DIA_VLK_17_STANDARD_17_02");	//Если бы они прибыли сюда защищать нас от орков или бандитов, они бы давным-давно расправились с ними. Должно быть, у них какая-то другая причина...
	};
	if(Kapitel == 3)
	{
		AI_Output(self,other,"DIA_VLK_17_STANDARD_17_03");	//Я только что поняла, что делают здесь паладины. Это все из-за руды. Уж лучше бы они вместо этого защищали город.
	};
	if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_VLK_17_STANDARD_17_04");	//Надеюсь, эти слухи о драконах окажутся правдой. Тогда лорду Хагену придется что-то предпринять. Не может же он вот так просто отдать нас на съедение драконам.
	};
	if(Kapitel == 5)
	{
		AI_Output(self,other,"DIA_VLK_17_STANDARD_17_05");	//Теперь, когда все драконы мертвы, паладины быстро расправятся с оставшимся сбродом.
	};
};

func void B_AssignAmbientInfos_VLK_17(var C_Npc slf)
{
	dia_vlk_17_exit.npc = Hlp_GetInstanceID(slf);
	dia_vlk_17_join.npc = Hlp_GetInstanceID(slf);
	dia_vlk_17_people.npc = Hlp_GetInstanceID(slf);
	dia_vlk_17_location.npc = Hlp_GetInstanceID(slf);
	dia_vlk_17_standard.npc = Hlp_GetInstanceID(slf);
};

