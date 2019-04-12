
instance DIA_Dragon_Fire_Island_Exit(C_Info)
{
	npc = Dragon_Fire_Island;
	nr = 999;
	condition = DIA_Dragon_Fire_Island_Exit_Condition;
	information = DIA_Dragon_Fire_Island_Exit_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dragon_Fire_Island_Exit_Condition()
{
	if(DragonTalk_Exit_Free == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Dragon_Fire_Island_Exit_Info()
{
	AI_StopProcessInfos(self);
	DragonTalk_Exit_Free = FALSE;
	self.flags = 0;
};


instance DIA_Dragon_Fire_Island_Hello(C_Info)
{
	npc = Dragon_Fire_Island;
	nr = 5;
	condition = DIA_Dragon_Fire_Island_Hello_Condition;
	information = DIA_Dragon_Fire_Island_Hello_Info;
	important = TRUE;
};


func int DIA_Dragon_Fire_Island_Hello_Condition()
{
	if(Npc_HasItems(other,ItMi_InnosEye_MIS) >= 1)
	{
		return TRUE;
	};
};

func void DIA_Dragon_Fire_Island_Hello_Info()
{
	AI_Output(self,other,"DIA_Dragon_Fire_Island_Hello_20_00");	//Стой, человек. Все мои чувства говорят мне, что убийца моей плоти и крови стоит передо мной.
	AI_Output(other,self,"DIA_Dragon_Fire_Island_Hello_15_01");	//Да? Кого ты назвал убийцей, ты, порождение ада?
	if((hero.guild == GIL_DJG) && (DragonEggCounter >= 7))
	{
		AI_Output(self,other,"DIA_Dragon_Fire_Island_Hello_20_02");	//Тебе недостаточно того, что ты уничтожил почти всех наших отпрысков?
	};
	AI_Output(self,other,"DIA_Dragon_Fire_Island_Hello_20_03");	//На твоей совести также мой брат Феоматар, и ты заплатишь за это.
	if((hero.guild == GIL_DJG) && (DragonEggCounter >= 7))
	{
		AI_Output(other,self,"DIA_Dragon_Fire_Island_Hello_15_04");	//Я также собираюсь добраться до остальных из вашего проклятого племени.
		AI_Output(self,other,"DIA_Dragon_Fire_Island_Hello_20_05");	//Ах-х. Я с огромным удовольствием сожгу тебя заживо.
	};
	AI_Output(other,self,"DIA_Dragon_Fire_Island_Hello_15_06");	//Хватит попусту сотрясать воздух. Давай перейдем к делу.
	AI_Output(self,other,"DIA_Dragon_Fire_Island_Hello_20_07");	//Ты зашел слишком далеко, жалкий человечишка, но тебе не уйти отсюда живым.
	Npc_RemoveInvItems(other,ItMi_InnosEye_MIS,1);
	CreateInvItems(other,ItMi_InnosEye_Discharged_Mis,1);
	AI_StopProcessInfos(self);
	B_LogEntry(TOPIC_HallenVonIrdorath,"Еще один огненный дракон. Я уже по горло сыт этими тварями. Мне всего лишь нужно перебраться через пропасть, что лежит за этим огненным драконом.");
	DragonTalk_Exit_Free = FALSE;
	self.flags = 0;
};

